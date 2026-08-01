from __future__ import annotations

from collections import defaultdict
from typing import Iterable

import numpy as np
from sklearn.metrics import roc_auc_score
from scipy.optimize import minimize_scalar
from scipy.special import expit
from sklearn.tree import DecisionTreeClassifier

from tqdm.auto import tqdm
import matplotlib.pyplot as plt

from sklearn.base import ClassifierMixin


class DecisionTree:
    def __init__(self, max_depth=None, min_samples_leaf=1, l2=0.0, **kwargs):
        self.max_depth = max_depth
        self.min_samples_leaf = min_samples_leaf
        self.l2 = l2
        self.tree = None

    def fit(self, X, y):
        self.tree = self._build_tree(X, y, depth=0)
        return self

    def _build_tree(self, X, y, depth):
        if y.ndim > 1:
            grad, hess = y[:, 0], y[:, 1]
        else:
            grad, hess = y, np.ones_like(y)
            
        leaf_weight = np.sum(grad) / (np.sum(hess) + self.l2)
            
        if (self.max_depth is not None and depth >= self.max_depth) or len(grad) < 2 * self.min_samples_leaf:
            return leaf_weight
        
        split = self._find_best_split(X, grad, hess)
        if split is None:
            return leaf_weight
        
        feature_idx, threshold = split
        left_mask = X[:, feature_idx] < threshold
        right_mask = ~left_mask
        
        if np.sum(left_mask) == 0 or np.sum(right_mask) == 0:
            return leaf_weight
        
        return {
            "feature_idx": feature_idx,
            "threshold": threshold,
            "value": leaf_weight,  
            "left": self._build_tree(X[left_mask], y[left_mask], depth + 1),
            "right": self._build_tree(X[right_mask], y[right_mask], depth + 1)
        }

    def _find_best_split(self, X, grad, hess):
        best_gain = 0.0
        best_split = None
        g_sum, h_sum = np.sum(grad), np.sum(hess)
        
        for i in range(X.shape[1]):
            idx = np.argsort(X[:, i])
            s_x, s_g, s_h = X[idx, i], grad[idx], hess[idx]
            
            changes = np.where(s_x[:-1] != s_x[1:])[0]
            if len(changes) == 0:
                continue
                
            cum_g, cum_h = np.cumsum(s_g), np.cumsum(s_h)
            
            g_l, h_l = cum_g[changes], cum_h[changes]
            g_r, h_r = g_sum - g_l, h_sum - h_l
            
            valid = (h_l >= self.min_samples_leaf) & (h_r >= self.min_samples_leaf)
            if not np.any(valid): 
                continue
            
            gains = (g_l**2 / (h_l + self.l2)) + (g_r**2 / (h_r + self.l2)) - (g_sum**2 / (h_sum + self.l2))
            
            valid_gains = gains[valid]
            best_idx = np.argmax(valid_gains)
            
            if valid_gains[best_idx] > best_gain:
                best_gain = valid_gains[best_idx]
                actual_change_idx = changes[valid][best_idx]
                threshold = (s_x[actual_change_idx] + s_x[actual_change_idx + 1]) / 2.0
                best_split = (i, threshold)
                
        return best_split

    def predict(self, X):
        return np.array([self._predict_one(x, self.tree) for x in X])

    def _predict_one(self, x, node):
        if not isinstance(node, dict): return node
        return self._predict_one(x, node["left"]) if x[node["feature_idx"]] < node["threshold"] else self._predict_one(x, node["right"])


class Quantizer:
    def __init__(self, quantization_type: str | None = None, nbins: int = 255, cat_features: Iterable[int] | None = None):
        self.quantization_type = quantization_type
        self.nbins = nbins
        self.cat_features = set(cat_features) if cat_features is not None else set()
        self.bins_ = {}

    def fit(self, X: np.ndarray, y: np.ndarray | None = None) -> Quantizer:
        if self.quantization_type is None:
            return self
            
        for i in range(X.shape[1]):
            if i in self.cat_features:
                continue
                
            try:
                col = X[:, i].astype(float) 
            
            if self.quantization_type == 'uniform':
                self.bins_[i] = np.linspace(np.min(col), np.max(col), self.nbins + 1)
            elif self.quantization_type == 'quantile':
                self.bins_[i] = np.unique(np.quantile(col, np.linspace(0, 1, self.nbins + 1)))
            elif self.quantization_type == 'piecewise':
                
                dt = DecisionTreeClassifier(
                    max_leaf_nodes=self.nbins, 
                    criterion='entropy', 
                    random_state=42
                )
                dt.fit(col.reshape(-1, 1), y)
                
                thresholds = dt.tree_.threshold[dt.tree_.feature >= 0]
                
                if len(thresholds) == 0:
                    self.bins_[i] = np.linspace(np.min(col), np.max(col), self.nbins + 1)
                else:
                    borders = np.sort(np.unique(thresholds))
                    self.bins_[i] = np.concatenate([[-np.inf], borders, [np.inf]])
                
        return self

    def transform(self, X: np.ndarray) -> np.ndarray:
        if self.quantization_type is None:
            return X
            
        X_trans = X.copy()
        
        for i, bins in self.bins_.items():
            if i < X.shape[1]:
                col_float = X[:, i].astype(float)
                X_trans[:, i] = np.digitize(col_float, bins[1:-1])
                
        return X_trans


class BoostingClassifier(ClassifierMixin):
    def __init__(
        self,
        base_model_class=DecisionTree,
        base_model_params: dict | None = None,
        n_estimators: int = 20,
        learning_rate: float = 0.05,
        random_state: int | None = None,
        verbose: bool = True,
        early_stopping_rounds: int | None = 0,
        eval_metric: str | None = None,
        cat_features: Iterable[int] | None = None,
        l2: float = 0.0,
        subsample: float = 1.0,
        bagging_temperature: float = 1.0,
        bootstrap_type: str | None = 'Bernoulli',
        rsm: float = 1.0,
        quantization_type: str | None = None,
        nbins: int = 255,
        dart: bool = False,
        dropout_rate: float = 0.05,
        loss: str = 'BCE',                
        focal_gamma: float = 2.0         
    ):
        super().__init__()
        self.base_model_class = base_model_class
        self.base_model_params = {} if base_model_params is None else base_model_params
        self.n_estimators = n_estimators
        self.learning_rate = learning_rate
        self.random_state = random_state
        self.verbose = verbose
        self.early_stopping_rounds = early_stopping_rounds
        self.eval_metric = eval_metric
        self.cat_features = list(cat_features) if cat_features is not None else []
        
        self.l2 = l2
        self.subsample = subsample
        self.bagging_temperature = bagging_temperature
        self.bootstrap_type = bootstrap_type
        self.rsm = rsm
        
        self.quantization_type = quantization_type
        self.nbins = nbins
        self.quantizer_ = None
        
        self.dart = dart
        self.dropout_rate = dropout_rate
        
        self.loss = loss
        self.focal_gamma = focal_gamma
        
        self.alpha = 1.0
        self.models = []
        self.gammas = []
        self.feature_subsets_ = []
        self.history = defaultdict(list)
        self.n_estimators_built_ = 0
        self.n_features_in_ = 0 
        self.classes_ = None
        self.cat_mappings_ = {}
        self.global_target_mean_ = 0.0
        self.rng_ = np.random.default_rng(self.random_state)

    def loss_fn(self, y: np.ndarray, z: np.ndarray) -> float:
        p = expit(z)
        if self.loss == 'BCE':
            return -np.mean(y * np.log(p + 1e-15) + (1 - y) * np.log(1 - p + 1e-15))
        elif self.loss == 'Focal':
            pt = np.where(y == 1, p, 1 - p)
            return -np.mean(((1 - pt) ** self.focal_gamma) * np.log(pt + 1e-15))
        return 0.0

    def antigrad_fn(self, y: np.ndarray, z: np.ndarray) -> np.ndarray:
        p = expit(z)
        if self.loss == 'BCE':
            return y - p
        elif self.loss == 'Focal':
            pt = np.where(y == 1, p, 1 - p)
            term1 = (1 - pt) ** self.focal_gamma
            term2 = (self.focal_gamma * pt * np.log(pt + 1e-15)) / (1 - pt + 1e-15)
            return (p - y) * term1 * (1 + term2)
        return np.zeros_like(z)

    def hess_fn(self, y: np.ndarray, z: np.ndarray) -> np.ndarray:
        return np.clip(expit(z) * (1 - expit(z)), 1e-5, None)

    def _cat_fit_transform(self, X: np.ndarray, y: np.ndarray) -> np.ndarray:
        X_trans = np.zeros(X.shape, dtype=float)
        n_samples = X.shape[0]
        y_positive = (y == 1).astype(float)
        self.global_target_mean_ = np.mean(y_positive)
        
        num_cols = [c for c in range(X.shape[1]) if c not in self.cat_features]
        if num_cols:
            try:
                X_trans[:, num_cols] = X[:, num_cols].astype(float)
            except ValueError:
                for c in num_cols:
                    try:
                        X[:, c].astype(float)
            
        permutation = self.rng_.permutation(n_samples)
        inverse_permutation = np.argsort(permutation)
        X_perm, y_perm = X[permutation], y_positive[permutation]
        
        for col_idx in self.cat_features:
            col_data = X_perm[:, col_idx]
            encoded_col = np.zeros(n_samples)
            c_pos, c_tot = {}, {}
            
            for i in range(n_samples):
                val = col_data[i]
                encoded_col[i] = (c_pos.get(val, 0) + self.alpha * self.global_target_mean_) / (c_tot.get(val, 0) + self.alpha)
                c_pos[val] = c_pos.get(val, 0) + y_perm[i]
                c_tot[val] = c_tot.get(val, 0) + 1.0
                
            X_trans[:, col_idx] = encoded_col[inverse_permutation]
            unique_values = np.unique(X[:, col_idx])
            self.cat_mappings_[col_idx] = {
                val: (np.sum(y_positive[X[:, col_idx] == val]) + self.alpha * self.global_target_mean_) / 
                     (np.sum(X[:, col_idx] == val) + self.alpha) 
                for val in unique_values
            }
        return X_trans

    def _cat_transform(self, X: np.ndarray) -> np.ndarray:
        X_trans = np.zeros(X.shape, dtype=float)
        
        learned_cat_features = set(self.cat_mappings_.keys())
        
        num_cols = [c for c in range(X.shape[1]) if c not in learned_cat_features]
        if num_cols:
            try:
                X_trans[:, num_cols] = X[:, num_cols].astype(float)
            except ValueError:
                for c in num_cols:
                    try:
                        X[:, c].astype(float)
            
        for col_idx in learned_cat_features:
            if col_idx < X.shape[1]:
                X_trans[:, col_idx] = np.array([self.cat_mappings_[col_idx].get(val, self.global_target_mean_) for val in X[:, col_idx]])
                
        return X_trans

    def fit(self, X_train: np.ndarray, y_train: np.ndarray, eval_set: tuple[np.ndarray, np.ndarray] | None = None, use_best_model: bool = False) -> None:
        self.rng_ = np.random.default_rng(self.random_state)
        self.classes_ = np.unique(y_train)
        self.models = []
        self.gammas = []
        self.feature_subsets_ = []
        self.history = defaultdict(list)
        
        y_train_binary = (y_train == self.classes_[1]).astype(float)
        
        X_train_arr = np.array(X_train)
        self.quantizer_ = Quantizer(
            quantization_type=self.quantization_type, 
            nbins=self.nbins, 
            cat_features=self.cat_features
        )
        self.quantizer_.fit(X_train_arr, y_train_binary)
        X_train_quantized = self.quantizer_.transform(X_train_arr)
        
        X_train_transformed = self._cat_fit_transform(X_train_quantized, y_train_binary)
        
        n_samples, n_features = X_train_transformed.shape
        self.n_features_in_ = n_features  
        n_rsm = max(1, int(self.rsm * n_features))
        
        if eval_set:
            X_val_arr = np.array(eval_set[0])
            X_val_quantized = self.quantizer_.transform(X_val_arr)
            X_val_transformed = self._cat_transform(X_val_quantized)
            y_val_binary = (np.array(eval_set[1]).flatten() == self.classes_[1]).astype(float)
        
        train_preds = np.zeros(n_samples)
        val_preds = np.zeros(X_val_transformed.shape[0]) if eval_set else None
        
        self.tree_train_preds_ = np.zeros((self.n_estimators, n_samples))
        if eval_set:
            self.tree_val_preds_ = np.zeros((self.n_estimators, len(X_val_transformed)))
            
        best_metric, best_round, rounds = float('inf'), 0, 0
        
        for i in tqdm(range(self.n_estimators), disable=not self.verbose):
            
            if self.dart and i > 0:
                drop_mask = self.rng_.random(i) < self.dropout_rate
                drop_indices = np.where(drop_mask)[0]
                k = len(drop_indices)
            else:
                drop_indices = []
                k = 0
                
            if k > 0:
                dropped_preds = np.zeros(n_samples)
                for idx in drop_indices:
                    dropped_preds += self.learning_rate * self.gammas[idx] * self.tree_train_preds_[idx]
                mutated_preds = train_preds - dropped_preds
                
                if eval_set:
                    dropped_val_preds = np.zeros(len(X_val_transformed))
                    for idx in drop_indices:
                        dropped_val_preds += self.learning_rate * self.gammas[idx] * self.tree_val_preds_[idx]
            else:
                mutated_preds = train_preds

            anti_grad = self.antigrad_fn(y_train_binary, mutated_preds)
            base_hess = self.hess_fn(y_train_binary, mutated_preds)

            if self.bootstrap_type == 'Bernoulli':
                mask = self.rng_.random(n_samples) < self.subsample
                curr_X = X_train_transformed[mask]
                curr_grad = anti_grad[mask]
                curr_hess = base_hess[mask]
            elif self.bootstrap_type == 'Bayesian':
                u = self.rng_.uniform(1e-10, 1.0, size=n_samples)
                weights = (-np.log(u)) ** self.bagging_temperature
                curr_X = X_train_transformed
                curr_grad = anti_grad * weights
                curr_hess = base_hess * weights
            else:
                curr_X = X_train_transformed
                curr_grad = anti_grad
                curr_hess = base_hess
                
            feat_idx = self.rng_.choice(n_features, size=n_rsm, replace=False)
            self.feature_subsets_.append(feat_idx)
            curr_X_sub = curr_X[:, feat_idx]
            
            target = np.column_stack((curr_grad, curr_hess)) if self.l2 != 0.0 else curr_grad
                
            model = self.base_model_class(**self.base_model_params, l2=self.l2)
            model.fit(curr_X_sub, target)
            
            new_preds = model.predict(X_train_transformed[:, feat_idx])
            self.tree_train_preds_[i] = new_preds
            if eval_set:
                new_val_preds = model.predict(X_val_transformed[:, feat_idx])
                self.tree_val_preds_[i] = new_val_preds
            
            if self.l2 != 0.0:
                gamma = 1.0
            else:
                gamma = minimize_scalar(
                    lambda g: self.loss_fn(y_train_binary, mutated_preds + g * new_preds),
                    bounds=(0.0, 10.0), method="bounded"
                ).x
                
            if k > 0:
                gamma_new = gamma / k
                scale_factor = k / (k + 1.0)
                
                # Scale previously dropped trees
                for idx in drop_indices:
                    self.gammas[idx] *= scale_factor
                
                self.gammas.append(gamma_new)
                self.models.append(model)
                
                train_preds = train_preds - dropped_preds * (1.0 / (k + 1.0)) + self.learning_rate * gamma_new * new_preds
                if eval_set:
                    val_preds = val_preds - dropped_val_preds * (1.0 / (k + 1.0)) + self.learning_rate * gamma_new * new_val_preds
            else:
                self.gammas.append(gamma)
                self.models.append(model)
                
                train_preds += self.learning_rate * gamma * new_preds
                if eval_set:
                    val_preds += self.learning_rate * gamma * new_val_preds
            
            self.n_estimators_built_ = i + 1
            
            self.history["train_loss"].append(self.loss_fn(y_train_binary, train_preds))
            
            if eval_set:
                loss = self.loss_fn(y_val_binary, val_preds)
                self.history["val_loss"].append(loss)
                
                if loss < best_metric: 
                    best_metric, best_round, rounds = loss, i, 0
                else: 
                    rounds += 1
                if self.early_stopping_rounds and rounds >= self.early_stopping_rounds: 
                    break

        if use_best_model and eval_set:
            self.n_estimators_built_ = best_round + 1
            self.models = self.models[:self.n_estimators_built_]
            self.gammas = self.gammas[:self.n_estimators_built_]
            self.feature_subsets_ = self.feature_subsets_[:self.n_estimators_built_]

    def predict_proba(self, X: np.ndarray) -> np.ndarray:
        X_quantized = self.quantizer_.transform(np.array(X))
        X_transformed = self._cat_transform(X_quantized)
        
        predictions = np.zeros(X_transformed.shape[0])
        for i in range(self.n_estimators_built_):
            feat_idx = self.feature_subsets_[i]
            predictions += self.learning_rate * self.gammas[i] * self.models[i].predict(X_transformed[:, feat_idx])
        proba_pos = expit(predictions)
        return np.vstack((1 - proba_pos, proba_pos)).T

    def predict(self, X: np.ndarray) -> np.ndarray:
        return np.where(self.predict_proba(X)[:, 1] > 0.5, self.classes_[1], self.classes_[0])

    def score(self, X: np.ndarray, y: np.ndarray) -> float:
        y_binary = (np.array(y).flatten() == self.classes_[1]).astype(float)
        return roc_auc_score(y_binary, self.predict_proba(X)[:, 1])

    def plot_history(self, keys: str | Iterable[str]) -> None:
        if isinstance(keys, str): keys = [keys]
        plt.figure(figsize=(10, 6))
        for key in keys:
            if key in self.history: plt.plot(self.history[key], label=key)
        plt.legend()
        plt.show()

    def get_feature_importance(self, X: np.ndarray | None = None, y: np.ndarray | None = None, type="gain") -> np.ndarray:
        if X is not None:
            n_features = X.shape[1]
        elif hasattr(self, 'n_features_in_') and self.n_features_in_ > 0:
            n_features = self.n_features_in_
        else:
            n_features = max([max(sub) for sub in self.feature_subsets_]) + 1
            
        importance = np.zeros(n_features)
        
        if type == "split":
            for i in range(self.n_estimators_built_):
                model = self.models[i]
                gamma = self.gammas[i]
                subset = self.feature_subsets_[i]
                
                if hasattr(model, 'feature_importances_'):
                    tree_imp = model.feature_importances_
                else:
                    tree_imp = np.zeros(len(subset))
                    def _count_splits(node):
                        if isinstance(node, dict):
                            tree_imp[node["feature_idx"]] += 1
                            _count_splits(node["left"])
                            _count_splits(node["right"])
                    _count_splits(model.tree)
                    
                    if np.sum(tree_imp) > 0:
                        tree_imp = tree_imp / np.sum(tree_imp)
                        
                for j, feat_idx in enumerate(subset):
                    importance[feat_idx] += gamma * tree_imp[j]
                    
            if np.sum(importance) > 0:
                importance = importance / np.sum(importance)
            return importance
            
        elif type == "gain":
            X_quantized = self.quantizer_.transform(np.array(X))
            X_transformed = self._cat_transform(X_quantized)
            y_bin = (np.array(y).flatten() == self.classes_[1]).astype(float)
            
            z_current = np.zeros(len(X))
            
            for k in range(self.n_estimators_built_):
                model = self.models[k]
                gamma = self.gammas[k]
                subset = self.feature_subsets_[k]
                
                X_subset = X_transformed[:, subset]
                g_current = self.antigrad_fn(y_bin, z_current)
                
                tree_imp = np.zeros(len(subset))
                
                if hasattr(model, 'tree_') and hasattr(model, 'decision_path'):
                    node_indicator = model.decision_path(X_subset)
                    feature = model.tree_.feature
                    value = model.tree_.value.flatten()
                    
                    for i in range(len(X_subset)):
                        path = node_indicator.indices[node_indicator.indptr[i]:node_indicator.indptr[i+1]]
                        for ptr in range(len(path) - 1):
                            node_id = path[ptr]
                            next_node_id = path[ptr + 1]
                            f_idx = feature[node_id]
                            
                            if f_idx != -2: 
                                v_parent = value[node_id]
                                v_child = value[next_node_id]
                                gain = g_current[i] * gamma * (v_child - v_parent)
                                if gain > 0:
                                    tree_imp[f_idx] += gain
                                    
                else:
                    def _compute_gain(node, X_node, g_node):
                        if not isinstance(node, dict) or len(X_node) == 0:
                            return
                        
                        f_idx = node["feature_idx"]
                        threshold = node["threshold"]
                        v_parent = node["value"]
                        
                        left_mask = X_node[:, f_idx] < threshold
                        right_mask = ~left_mask
                        
                        v_left = node["left"]["value"] if isinstance(node["left"], dict) else node["left"]
                        v_right = node["right"]["value"] if isinstance(node["right"], dict) else node["right"]
                        
                        gain_left = np.sum(g_node[left_mask] * gamma * (v_left - v_parent))
                        gain_right = np.sum(g_node[right_mask] * gamma * (v_right - v_parent))
                        
                        total_gain = gain_left + gain_right
                        if total_gain > 0:
                            tree_imp[f_idx] += total_gain
                            
                        _compute_gain(node["left"], X_node[left_mask], g_node[left_mask])
                        _compute_gain(node["right"], X_node[right_mask], g_node[right_mask])

                    _compute_gain(model.tree, X_subset, g_current)
                
                for j, feat_idx in enumerate(subset):
                    importance[feat_idx] += tree_imp[j]
                    
                z_current += self.learning_rate * gamma * model.predict(X_subset)
                
            if np.sum(importance) > 0:
                importance = importance / np.sum(importance)
                
            return importance