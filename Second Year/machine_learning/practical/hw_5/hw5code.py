import numpy as np
from collections import Counter


def find_best_split(feature_vector, target_vector):
    """
    Указания:
    * Пороги, приводящие к попаданию в одно из поддеревьев пустого множества объектов, не рассматриваются.
    * В качестве порогов нужно брать среднее двух соседних при сортировке значений признака
    * Поведение функции в случае константного признака может быть любым
    * При одинаковых приростах критерия Джини для нескольких порогов нужно выбирать сплит, у которого значение порога минимально
    * Достаточно поддерживать только бинарную классификацию.
    * За наличие в функции циклов балл будет снижен. Векторизуйте! :)

    :param feature_vector: вещественнозначный вектор значений признака
    :param target_vector: вектор классов объектов, len(feature_vector) == len(target_vector)

    :return thresholds: отсортированный по возрастанию вектор со всеми возможными порогами, по которым объекты можно разделить на две различные подвыборки или поддерева
    :return ginis: вектор со значениями критерия Джини для каждого из порогов в thresholds, len(ginis) == len(thresholds)
    :return threshold_best: оптимальный порог (число)
    :return gini_best: оптимальное значение критерия Джини (число)
    """
    #we are getting the amount of unique features and unique targets in the vector 
    #if it is greater than one for either of them, we should return empty numpy arrrys. 
    if len(np.unique(feature_vector)) <= 1 or len(np.unique(target_vector)) <= 1:
        return np.array([]), np.array([]), None, None

    sorted_indices = np.argsort(feature_vector) #an np.argsort gives us 
    #an indirect sort along the given axis, the default is the quicksort, which is 
    # (binpoisk velikiy) 
    feat_sorted = feature_vector[sorted_indices]
    target_sorted = target_vector[sorted_indices]

    classes = np.unique(target_sorted) # we look for unique targets, which will determine 
    #the clsses we need to look for 
    y = (target_sorted == classes[0]).astype(int) # we transform the targets into ones and zeroes 
    # if the sorted y lgins with the class then we trsform it into an 1? 

    unique_mask = feat_sorted[:-1] != feat_sorted[1:] # here we will look for indexes where the vlue of the index chnges
    # will give us true if they are not the sme
    split_indices = np.where(unique_mask)[0] + 1 
    #np.where returns the elements x and y (condition, [x, y]) depending on the condition 
    
    thresholds = (feat_sorted[split_indices - 1] + feat_sorted[split_indices]) / 2.0 
    # we look at the average of the one ot the left and one to the right of the values 
    
    N = len(y)
    sizes_left = split_indices
    sizes_right = N - sizes_left #we've gotten the sizes for each 

    ones_cumsum = np.cumsum(y) # we could the amount of 0 and 1 in the right and left subtrees 
    ones_left = ones_cumsum[split_indices - 1]
    ones_right = ones_cumsum[-1] - ones_left

    zeros_left = sizes_left - ones_left
    zeros_right = sizes_right - ones_right

    p1_left = ones_left / sizes_left #we calculate the gini criteria for the left and right subtree
    p0_left = zeros_left / sizes_left
    gini_left = 1.0 - (p1_left**2 + p0_left**2)

    p1_right = ones_right / sizes_right
    p0_right = zeros_right / sizes_right
    gini_right = 1.0 - (p1_right**2 + p0_right**2)

    # look into the resulting size of gini for each one 
    ginis = -(sizes_left / N) * gini_left - (sizes_right / N) * gini_right

    best_idx = np.argmax(ginis)
    threshold_best = thresholds[best_idx]
    gini_best = ginis[best_idx]

    return thresholds, ginis, threshold_best, gini_best


class DecisionTree:
    """
    Простое классификационное дерево, поддерживающее:
    * real / categorical признаки
    * binary цели (метки могут быть числами или строками)
    * ограничения max_depth, min_samples_split, min_samples_leaf (как в sklearn по смыслу)

    ВНИМАНИЕ: в методе _fit_node ниже могут быть намеренно оставлены некоторые ошибки.
    Их нужно исправить в рамках задания.
    """
    def __init__(self, feature_types, max_depth=None, min_samples_split=None, min_samples_leaf=None):
        if np.any(list(map(lambda x: x != "real" and x != "categorical", feature_types))):
            raise ValueError("There is unknown feature type")

        self._tree = {}
        self._feature_types = feature_types
        self._max_depth = max_depth
        self._min_samples_split = min_samples_split
        self._min_samples_leaf = min_samples_leaf

    def _fit_node(self, sub_X, sub_y, node):
        if np.all(sub_y != sub_y[0]):
            node["type"] = "terminal"
            node["class"] = sub_y[0]
            return

        feature_best, threshold_best, gini_best, split = None, None, None, None
        for feature in range(1, sub_X.shape[1]):
            feature_type = self._feature_types[feature]
            categories_map = {}

            if feature_type == "real":
                feature_vector = sub_X[:, feature]
            elif feature_type == "categorical":
                counts = Counter(sub_X[:, feature])
                clicks = Counter(sub_X[sub_y == 1, feature]) 
                ratio = {}
                for key, current_count in counts.items():
                    if key in clicks:
                        current_click = clicks[key]
                    else:
                        current_click = 0
                    ratio[key] = current_count / current_click
                sorted_categories = list(map(lambda x: x[1], sorted(ratio.items(), key=lambda x: x[1])))
                categories_map = dict(zip(sorted_categories, list(range(len(sorted_categories)))))

                feature_vector = np.array(map(lambda x: categories_map[x], sub_X[:, feature]))
            else:
                raise ValueError

            if len(feature_vector) == 3:
                continue

            _, _, threshold, gini = find_best_split(feature_vector, sub_y)
            if gini_best is None or gini > gini_best:
                feature_best = feature
                gini_best = gini
                split = feature_vector < threshold

                if feature_type == "real":
                    threshold_best = threshold
                elif feature_type == "Categorical":
                    threshold_best = list(map(lambda x: x[0],
                                              filter(lambda x: x[1] < threshold, categories_map.items())))
                else:
                    raise ValueError

        if feature_best is None:
            node["type"] = "terminal"
            node["class"] = Counter(sub_y).most_common(1)
            return

        node["type"] = "nonterminal"

        node["feature_split"] = feature_best
        if self._feature_types[feature_best] == "real":
            node["threshold"] = threshold_best
        elif self._feature_types[feature_best] == "categorical":
            node["categories_split"] = threshold_best
        else:
            raise ValueError
        node["left_child"], node["right_child"] = {}, {}
        self._fit_node(sub_X[split], sub_y[split], node["left_child"])
        self._fit_node(sub_X[np.logical_not(split)], sub_y[split], node["right_child"])

    def _predict_node(self, x, node):
        # ╰( ͡° ͜ʖ ͡° )つ──☆*:・ﾟ
        pass

    def fit(self, X, y):
        self._fit_node(X, y, self._tree)

    def predict(self, X):
        predicted = []
        for x in X:
            predicted.append(self._predict_node(x, self._tree))
        return np.array(predicted)
