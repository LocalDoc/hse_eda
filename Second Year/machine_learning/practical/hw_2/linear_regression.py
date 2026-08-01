import numpy as np 
from interfaces import LossFunction, LossFunctionClosedFormMixin, LinearRegressionInterface, AbstractOptimizer
from descents import AnalyticSolutionOptimizer
from typing import Dict, Type, Optional, Callable
from abc import abstractmethod, ABC



class MSELoss(LossFunction, LossFunctionClosedFormMixin):

    def __init__(self, analytic_solution_func: Callable[[np.ndarray, np.ndarray], np.ndarray] = None):

        if analytic_solution_func is None:
            self.analytic_solution_func = self._plain_analytic_solution
        else:
            self.analytic_solution_func = analytic_solution_func

        

    def loss(self, X: np.ndarray, y: np.ndarray, w: np.ndarray) -> float:
        """
        X: np.ndarray, матрица регрессоров 
        y: np.ndarray, вектор таргета
        w: np.ndarray, вектор весов

        returns: float, значение MSE на данных X,y для весов w
        """
        error = y - X @ w
        return float((1 / y.size) * np.dot(error, error))

    def gradient(self, X: np.ndarray, y: np.ndarray, w: np.ndarray) -> np.ndarray:
        """
        X: np.ndarray, матрица регрессоров 
        y: np.ndarray, вектор таргета
        w: np.ndarray, вектор весов

        returns: np.ndarray, численный градиент MSE в точке w
        """
        return (2 / len(y)) * X.T @ (X @ w - y)

    def analytic_solution(self, X: np.ndarray, y: np.ndarray) -> np.ndarray:
        """
        Возвращает решение по явной формуле (closed-form solution)

        X: np.ndarray, матрица регрессоров 
        y: np.ndarray, вектор таргета

        returns: np.ndarray, оптимальный по MSE вектор весов, вычисленный при помощи аналитического решения для данных X, y
        """
        # Функция-диспатчер в одну из истинных функций для вычисления решения по явной формуле (closed-form)
        # Необходима в связи c наличием интерфейса analytic_solution у любого лосса; 
        # self-injection даёт возможность выбирать, какое именно closed-form решение использовать
        return self.analytic_solution_func(X, y)
        
    
    @classmethod
    def _plain_analytic_solution(cls, X: np.ndarray, y: np.ndarray) -> np.ndarray:
        """
        X: np.ndarray, матрица регрессоров 
        y: np.ndarray, вектор таргета

        returns: np.ndarray, вектор весов, вычисленный при помощи классического аналитического решения
        """
        return np.linalg.inv(X.T @ X) @ X.T @ y
    
    @classmethod
    def _svd_analytic_solution(cls, X: np.ndarray, y: np.ndarray) -> np.ndarray:
        """
        X: np.ndarray, матрица регрессоров 
        y: np.ndarray, вектор таргета

        returns: np.ndarray, вектор весов, вычисленный при помощи аналитического решения на SVD
        """
        from scipy.sparse.linalg import svds

        n_objects, n_features = X.shape
        k = min(n_objects, n_features) - 1

        if (k < 1):
            return np.linalg.pinv(X) @ y 
    
        U, s, Vt = svds(X, k=k, solver='arpack', tol=1e-12, maxiter = 10000)

        idx = np.argsort(s)[::-1]
        s = s[idx]
        U = U[:, idx]
        Vt = Vt[idx, :]

        s_inv = 1.0 / s

        return Vt.T @ np.diag(s_inv) @ U.T @ y 

class L2Regularization(LossFunction):

    def __init__(self, core_loss: LossFunction, mu_rate: float = 1.0,
                 analytic_solution_func: Callable[[np.ndarray, np.ndarray], np.ndarray] = None):
        self.core_loss = core_loss
        self.mu_rate = mu_rate

        # analytic_solution_func is meant to be passed separately, 
        # as it is not linear to core solution
    

    def gradient(self, X: np.ndarray, y: np.ndarray, w: np.ndarray) -> np.ndarray:
        w_penalty = w.copy()
        w_penalty[-1] = 0.0

        return self.core_loss.gradient(X, y, w) + self.mu_rate * w_penalty
    

    def loss(self, X: np.ndarray, y: np.ndarray, w: np.ndarray) -> float:
        w_penalty = w.copy()
        w_penalty[-1] = 0.0
        return float(self.core_loss.loss(X, y, w) + (self.mu_rate / 2) * np.dot(w_penalty, w_penalty))


class LogCosh(LossFunction):
    def loss(self, X: np.ndarray, y: np.ndarray, w: np.ndarray) -> float:
        return float(np.mean(np.log(np.cosh(X @ w - y))))

    def gradient(self, X: np.ndarray, y: np.ndarray, w: np.ndarray) -> np.ndarray:
        return (1 / len(y)) * X.T @ np.tanh(X @ w - y)


class HuberLoss(LossFunction):
    def __init__(self, delta: float = 1.0):
        self.delta = delta

    def loss(self, X: np.ndarray, y: np.ndarray, w: np.ndarray) -> float:
        error = X @ w - y
        abs_error = np.abs(error)
        mask = abs_error < self.delta
        return float(np.mean(np.where(mask, 0.5 * error ** 2, self.delta * abs_error - 0.5 * self.delta ** 2)))

    def gradient(self, X: np.ndarray, y: np.ndarray, w: np.ndarray) -> np.ndarray:
        error = X @ w - y
        mask = np.abs(error) < self.delta
        return (1 / len(y)) * X.T @ np.where(mask, error, self.delta * np.sign(error))


class CustomLinearRegression(LinearRegressionInterface):
    def __init__(
        self,
        optimizer: AbstractOptimizer,
        # l2_coef: float = 0.0,
        loss_function: LossFunction = MSELoss()
    ):
        self.optimizer = optimizer
        self.optimizer.set_model(self)

        # self.l2_coef = l2_coef
        self.loss_function = loss_function
        self.loss_history = []
        self.w = None
        self.X_train = None
        self.y_train = None
        

    def predict(self, X: np.ndarray) -> np.ndarray:
        return np.atleast_2d(X) @ self.w

    def compute_gradients(self, X_batch: np.ndarray | None = None, y_batch: np.ndarray | None = None) -> np.ndarray:
        X_use = self.X_train if X_batch is None else X_batch
        y_use = self.y_train if y_batch is None else y_batch
        return self.loss_function.gradient(X_use, y_use, self.w)

    def compute_loss(self, X_batch: np.ndarray | None = None, y_batch: np.ndarray | None = None) -> float:
        X_use = self.X_train if X_batch is None else X_batch
        y_use = self.y_train if y_batch is None else y_batch
        return self.loss_function.loss(X_use, y_use, self.w)

    def fit(self, X: np.ndarray, y: np.ndarray) -> None:
        self.X_train, self.y_train = X, y
        self.w = np.zeros(X.shape[1])
        self.loss_history = []
        self.optimizer.optimize()
