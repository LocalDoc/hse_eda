import numpy as np
from abc import ABC, abstractmethod
from interfaces import LearningRateSchedule, AbstractOptimizer, LinearRegressionInterface


# ===== Learning Rate Schedules =====
class ConstantLR(LearningRateSchedule):
    def __init__(self, lr: float):
        self.lr = lr

    def get_lr(self, iteration: int) -> float:
        return self.lr


class TimeDecayLR(LearningRateSchedule):
    def __init__(self, lambda_: float = 1.0):
        self.s0 = 1
        self.p = 0.5
        self.lambda_ = lambda_

    def get_lr(self, iteration: int) -> float:
        """
        returns: float, learning rate для iteration шага обучения
        """
        return self.lambda_ * ((self.s0 / (self.s0 + iteration)) ** self.p)

# ===== Base Optimizer =====
class BaseDescent(AbstractOptimizer, ABC):
    """
    Оптимизатор, имплементирующий градиентный спуск.
    Ответственен только за имплементацию общего алгоритма спуска.
    Все его составные части (learning rate, loss function+regularization) находятся вне зоны ответственности этого класса (см. Single Responsibility Principle).
    """
    def __init__(self, 
                 lr_schedule: LearningRateSchedule = TimeDecayLR(), 
                 tolerance: float = 1e-6,
                 max_iter: int = 1000
                ):
        self.lr_schedule = lr_schedule
        self.tolerance = tolerance
        self.max_iter = max_iter

        self.iteration = 0
        self.model: LinearRegressionInterface = None

    @abstractmethod
    def _update_weights(self) -> np.ndarray:
        """
        Вычисляет обновление согласно конкретному алгоритму и обновляет веса модели, перезаписывая её атрибут.
        Не имеет прямого доступа к вычислению градиента в точке, для подсчета вызывает model.compute_gradients.

        returns: np.ndarray, w_{k+1} - w_k
        """
        pass

    def _step(self) -> np.ndarray:
        """
        Проводит один полный шаг интеративного алгоритма градиентного спуска

        returns: np.ndarray, w_{k+1} - w_k
        """
        delta = self._update_weights()
        self.iteration += 1
        return delta

    def optimize(self) -> None:
        """
        Оркестрирует весь алгоритм градиентного спуска.
        """
        self.model.loss_history = []
        initial_loss = self.model.compute_loss()
        self.model.loss_history.append(initial_loss)
        
        self.iteration = 0
        
        while self.iteration < self.max_iter:
            delta = self._step()
            
            squared_norm = np.sum(delta ** 2)
            if squared_norm < self.tolerance:
                break
            
            if np.any(np.isnan(delta)):
                break
            
            current_loss = self.model.compute_loss()
            self.model.loss_history.append(current_loss)

# ===== Specific Optimizers =====
class VanillaGradientDescent(BaseDescent):
    def _update_weights(self) -> np.ndarray:
        X_train = self.model.X_train
        y_train = self.model.y_train
        lr = self.lr_schedule.get_lr(self.iteration)
        gradient = self.model.compute_gradients(X_train, y_train)
        delta = -lr * gradient
        self.model.w = self.model.w + delta
        return delta 

class StochasticGradientDescent(BaseDescent):
    def __init__(self, *args, batch_size=32, **kwargs):
        super().__init__(*args, **kwargs)
        self.batch_size = batch_size

    def _update_weights(self) -> np.ndarray:
        X_train = self.model.X_train
        y_train = self.model.y_train
        num_objects = X_train.shape[0]

        batch_indices = np.random.randint(0, num_objects, size=self.batch_size)
        X_batch = X_train[batch_indices]
        y_batch = y_train[batch_indices]
        
        gradient = self.model.compute_gradients(X_batch, y_batch)
        lr = self.lr_schedule.get_lr(self.iteration)
        
        delta = -lr * gradient
        self.model.w = self.model.w + delta
        
        return delta

class SAGDescent(BaseDescent):
    def __init__(self, *args, batch_size=32, **kwargs):
        super().__init__(*args, **kwargs)
        self.grad_memory = None
        self.grad_sum = None
        self.batch_size = batch_size

    def _update_weights(self) -> np.ndarray:
        X_train = self.model.X_train
        y_train = self.model.y_train
        num_objects, num_features = X_train.shape

        if self.grad_memory is None:
            self.grad_memory = np.zeros((num_objects, num_features))
            self.grad_sum = np.zeros(num_features) 

        batch_indices = np.random.randint(0, num_objects, size=self.batch_size)
        X_batch = X_train[batch_indices]
        y_batch = y_train[batch_indices]

        grad_batch_new = self.model.compute_gradients(X_batch, y_batch)
        grad_batch_old = self.grad_memory[batch_indices]
        
        grad_batch_new_per_object = np.zeros((self.batch_size, num_features))
        for i, idx in enumerate(batch_indices):
            grad_batch_new_per_object[i] = self.model.compute_gradients(
                X_train[idx:idx+1], 
                y_train[idx:idx+1]
            )
        
        self.grad_memory[batch_indices] = grad_batch_new_per_object
        
        grad_diff = grad_batch_new_per_object - grad_batch_old
        self.grad_sum += np.sum(grad_diff, axis=0) / num_objects

        lr = self.lr_schedule.get_lr(self.iteration)
        
        delta = -lr * self.grad_sum
        
        self.model.w = self.model.w + delta
        
        return delta


class MomentumDescent(BaseDescent):
    def __init__(self,  *args, beta=0.9, **kwargs):
        super().__init__(*args, **kwargs)
        self.beta = beta
        self.velocity = None

    def _update_weights(self) -> np.ndarray:
        old_weights = self.model.w
        grad = self.model.compute_gradients()

        if self.velocity is None:
            self.velocity = np.zeros_like(self.model.w)

        self.velocity = self.velocity * self.beta + self.lr_schedule.get_lr(self.iteration) * grad
        self.model.w = old_weights - self.velocity

        return self.model.w - old_weights


class Adam(BaseDescent):
    def __init__(self, *args, beta1=0.9, beta2=0.999, eps=1e-8, **kwargs):
        super().__init__(*args, **kwargs)
        self.beta1 = beta1
        self.beta2 = beta2
        self.eps = eps
        self.m = None
        self.v = None

    def _update_weights(self) -> np.ndarray:
        if self.m is None: 
            self.m = np.zeros_like(self.model.w)
        if self.v is None: 
            self.v = np.zeros_like(self.model.w)

        old_weights = self.model.w.copy()

        grad = self.model.compute_gradients()

        self.m = self.beta1 * self.m + (1 - self.beta1) * grad
        self.v = self.beta2 * self.v + (1 - self.beta2) * (grad ** 2)

        t = self.iteration + 1
        m_hat = self.m / (1 - self.beta1 ** t)
        v_hat = self.v / (1 - self.beta2 ** t)

        lr = self.lr_schedule.get_lr(self.iteration)
        self.model.w = old_weights - (lr * m_hat) / (np.sqrt(v_hat) + self.eps)

        return self.model.w - old_weights

# ===== Non-iterative Algorithms ====
class AnalyticSolutionOptimizer(AbstractOptimizer):
    """
    Универсальный дамми-класс для вызова аналитических решений 
    """
    def __init__(self):
        self.model = None
    
    def optimize(self, *args, **kwargs) -> None:
        """
        Определяет аналитическое решение и назначает его весам модели.
        """
        if self.model is None:
            raise ValueError("Model is not set for AnalyticSolutionOptimizer")

        X = self.model.X_train
        y = self.model.y_train
        if X is None or y is None:
            raise ValueError("Training data (X_train, y_train) must be set on the model before calling optimize()")

        w_opt = self.model.loss_function.analytic_solution(X, y)
        self.model.w = w_opt

        try:
            loss = self.model.compute_loss(X, y)
        except Exception:
            loss = None

        if hasattr(self.model, "loss_history") and loss is not None:
            self.model.loss_history.append(loss)
