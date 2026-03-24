#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-plot:0.1.3": plot

#show heading: set align(center)
#show block: set align(center)

#set document(
  title: [
    #text(size: 16pt, weight: "bold")[Machine Learning I Handbook]

    #text(size: 16pt)[Faculty of Computer Science]

    #text(size: 12pt)[Economics and Data Science]

    #text(size: 12pt)[Daniel Fabian Freire Serioguina]
  ],
  date: datetime.today(),
)

#title()

#set heading(numbering: "1.")
#outline(depth: 2)

#set page(numbering: "1")

#show emph: set text(purple)

#pagebreak()

= Introduction to ML 

== Basic definitions. 

*Object* (x). 

The thing we are analysing. 

*Object set* ($XX$). 

The set of all the possible objects of a certain task. Eucludic space. 

*Target varibale* (y). 

The answer to the task we are solving. 

*Target set* ($YY$). 

The set of all the possible targets of a certain task. Eucludic space. 

*Teaching set* ($X := (x_i, y_i)_i$). 

A set of object for which there are *correct* targets, and $|X|=ell$. 

*Datadrift*.

We say we have encountered datadrift when the teaching set is no longer relevant for today or tomorrow. 

*Factors*. 

The characteristics of objects $x$, where $d$ is the amount of factors. 

$
  X_i  = (x_(i 1), dots, x_(i d))
$

#let types_of_factors = $
                          & "Numerical:" x_j in RR , \ 
                          & "Categorical:" x_j in {C_1, dots, C_m}, "(Only has the comparison operation)" \ 
                          & "Ordered:" x_j in {C_1, dots. C_m} "(Only has the ordering operation)"
                        $

#block(
  width: 100%, 
  inset: 10pt, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  types_of_factors
)

== Types of tasks in machine learning. 

The type of task in machine learning is defined by the target variable $y$ from the target variable set $YY$. 

*Supervised Learning*. 

The teaching set $ X := (x_i, y_i)_i$ for which the targets are aviliable. 

#let supervised_learing_types = $ 
                          & 1. "Linear Regression" (YY = RR)  \ 
                          & 2. "Classification" (|YY| < infinity): \
                          & ("Binary" :YY = {0,1}, "Multi-class": YY = {1, dots, k} , "Multi-label:" YY = {0,1}^k
                          \ 

                          & 3. "Ranking (Ранжирование)"
                          
                         $

#block(
  width: 100%, 
  inset: 10pt, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  supervised_learing_types
)


*Unsupervised learning*. 

We are given a teaching set $X_i  : = (x_i , y_i)_i$ without the target variables as answers. 

#let unsupervised_learning_types = $
                                     & 1. "Clusterization:We try to break a set into subsets such that are similar to each other." \ 
                                     & 2. "Ozenivanie plotnoist: (Search for anomalies)"
                                     
                                   $

#block(
  width: 100%, 
  inset: 10pt, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  unsupervised_learning_types
)

*Partial Learning*
A method that combines supervised and unsupervised learning. 

== Building an algorithm (hypothesis)
The *task* that we will be solving is: 

#let task = $
  alpha : XX -> YY 
$

#block(
  inset: 10pt, 
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50),
  task 
)

*Error function.*
We need to be able to formally evaluate the quality of algorithms. 

As a popular example we have MSE (Mean Squared Error). 

#let mse = $
   1/ell sum^ell_(i=1) (alpha(x_i) - y_i)^2 
$

#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(0, 0, 100, 50), 
  mse
)

The smaller the amount of the error function, the better the algorithm. 

*Loss function*.

#let loss_function = $
                       L : YY times YY -> RR_+
                     $


#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  loss_function
)

Continuing with the exmaple from before: 

#let loss_function_mse_example = $
                                   L(y,z ) = (y - z)^2
                                 $

#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(0, 0, 100, 50), 
  loss_function_mse_example 
)

*Algorithm* ($cal(A)$)

Once we have fixed an error function, we are able to build the algorithm $alpha(x)$. Beforehand we fix a family of algorithms $cal(A)$. 

 

#let linear_reg_example = $
  cal(A) = {alpha(x) = w_0 + w_1 x_1 + dots + w_d x_d | w_0, w_1, dots, w_d in RR}, x_i ": i factor of the object x" \ 
  alpha(x) = w_0 + w_1 x_1 + dots + w_d x_d  = w_0 + sum^d_(j=1) w_j x_(i j ) 
  
$
#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(0, 0, 100, 50), 
  linear_reg_example
)


The best algorithm we are able to obtain from this is obtained through solving the following problem: 

#let mse_error = $
1/ell sum^ell_(j=1) (w_0 + sum^d_(j=1) w_j x_(i j  )- y_i )^2 --> min_(w_0, dots, w_d)     , x_(i j) "is the j factor of on an i object"               
$

#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(0, 0, 100, 50), 
  mse_error
)


#let teaching = "The process of finding an optimal algorithm is called training a model (algorithm)."

#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  teaching
)

== Filtering data 

For an algorithm to be useful we need to be able to feed it good data. Data might need to be altered in order to be considered "good". 

#let filtering_data_methods = $
                                & 1. "Linear models:" \ 
                                & "Normalize them by substracting the average, " \
                                & "and dividing by the Var of all columns of the 'objects-factors' matrix." \ 
                                & 2.  "Outlier:  " \ 
                                & "Objects that are not correct examples, & the precense of which ruins a model." \
                                & 3. "Noise:" \
                                & "Objects that do not have any relation to the target varibale y."
                              $

#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  filtering_data_methods
)

*Overfitting.*
Is the result of a model that corresponds to closely to the teaching set $X_i : = (x_i , y_i)_i$ and fails to fit and / or predict future observations. 

As an example: 

#let overfitting_example = $ 
& alpha(x) = cases(y_i"," x = x_i, 0 "," x in.not X )   \ 
& "This would be an awful model, as it would not learn anything at all,"  \ 
&  "as it follows the target way to closely."
$

#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(0, 0, 100, 50), 
  overfitting_example
)

#pagebreak()

= Linear models 


== Introducing linear models. 

*Linear models.*

We can describe the vast majority of linear regression models as the sum of factors with certain weights. 

#let linear_model_example = $

  alpha(x)  := w_0 + sum^d_(j=1) w_j x_j 
  
$
#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  linear_model_example
)
The *parameters* of a model are it's *weights (coefficients)* $w_j$, where $w_0$ is the bias (free coefficient).  

Our form of presenting the linear model can be rewritten as: 

#let linear_model_example = $
  alpha(x)  := w_0 + chevron.l w , x chevron.r , space w = (w_1, dots, w_d)
$
#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  linear_model_example
)

If we add to each factor description of each object an $(d+1)$ factor equal to one, it would could as the free coefficient, and would permit us to rewrite the linear model as:

#let linear_model_example = $
  alpha(x)  :=  chevron.l w , x chevron.r 
$
#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  linear_model_example
)

== Usage of linear models. 

An important criteria to consider is that in the linear model each factor has a linear effect on the target varibale, and this target variable does not depend from a combination of factors. 

*Categorical factors.*

Suppose we have a categorical factor the value of which we cannot compare the size of, substract or add from. These types of facotrs cannot be used in linear models without additional modification.

*One-hot coding.*

_Essentially,_ one hot encoding is a method for converting categorical variables into a binary format, where we create new columns for each category where 1 is the category being present and 0 being absent. 

Suppose that the categorical factor $f_j(x)$ takes in values from the set $C = {c_1, dots, c_m}$. We replace this categorical factor $f_j(x)$ for the $m$ binary facors $b_1(x), dots, b_m(x)$, where each one is the indicator function of one of the possible categorical values. 

#let one_hot_codding = $
  b_i (x) = [f_j(x) = c_i] , space s.t. space b_1(x) + dots + b_m (x) = 1 space ("lineary dependent")
$
#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  one_hot_codding
)

The fact that they are lineary dependent is a problem, we could prevent this by throwing out one of the binary factors, but if the test set gains a new category, it might be encoded by a zero binary factor, and with the deletion of which it would loose meaning. 

Suppose we are trying to make a model for estimating the price of apartments using a linear model, where the categorical factor is the location of the apartment building. After performing one-hot encoding we would obtain the following result:

#let one_hot_codding_example = $
  a(x) = w_1[f(x)=c_1] + dots + w_m[f(x)=c_m] + {"relation with other factors"}
$
#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(0, 0, 100, 50), 
  one_hot_codding_example
)

Which makes more sense than a standard linear model, as the location would define an "initial estimate" for the value of the apartment building, and only after all of the remaining factors would further adjust it. 

*Working with texts (bag of words)*. 

Let's borrow the same example from before, and suppose we are trying try predict its price via its textual description.  

#let bag_of_words = $
  &"Find all of the words in our set:" {c_1, dots, c_m} \ 
  &"Format the text using m factors:" b_1(x), dots, b_m(x), space s.t. space b_j(x) := "num of words" c_j "in the text." \
  &"The linear model would look like:" alpha(x) = w_1 b_1 (x) + dots + w_m b_m (x) + dots

$
#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  bag_of_words
)

_Essentially,_ each inclusion of the word $c_j$ would change the predicted price by $w_j$. 

*Binarization of numerical factors*.

Suppose that for the previous example we are given the distance to the metro ($x_j$). It seems clear that it there musn't necesarrily be a linear dependency between the factor and the target variable. 

To solve this problem we can binarize the factors. 

#let binarization = $
  &"For this we take a" {t_1, dots, t_m} "net, and add the points" t_0 = - infinity, t_(m+1)=+ infinity.  \ 
  &"Set up new factors as:" b_i(x) = [t_(i-1) < x_j <= t_i], space i=1, dots, m+1\
  &"The linear model would look like:" alpha(x) = w_1 [t_(0) < x_j <= t_1] + dots + w_(m+1) [t_(m) < x_j <= t_(m+1)] 

$
#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  binarization
)

Thus we have considred the non linear dependency between the factor and the target variable when predicting the price of the apartment for each interval of distance from the nearest metro. 


== Estimating errors in regression models 

Previously we've spoken that there is a need to properly evaluate the quality of the predictions given by a model. Suppose that $a$ is the model prediction, and $y$ is our target variable. Here we will look through several methods of evaluating the deviation of the prediction from the original answer, that we will call $L(y,a)$. 

*MSE and $R^2$*. 

The main way to evaluate the deviation of the prediction (answer) of the model $a$, and the target variable $y$. 

#let squared_difference = $
  L(y,a ) = (a-y)^2 
$
#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  squared_difference
)

*Mean Squared Error (MSE)*

The main error function based on the squared difference. 

#let mse_error = $
"MSE"(a, X) := mse
$

#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  mse_error
)

As all things, this error function is not perfect, as it's results are not great for interpretation , as it does not keep the unit of measurement of the original target variable. To avoid this problem the root squared error is introduced (RSME). 

#let rmse = $
              "RMSE"(a, X) := sqrt(mse)
            $ 

#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50),
  rmse 
)

RMSE and MSE are good for comparing two different models, for quality control when training models, but does not allow us to derive conclusions on how good our model solves a particular task. 

#let mse_fail_example = $
              & "MSE" = 10, space "would be an awful result if the target variable y would take values (0,1)." \
              & "However it would be a great result if y would take values (10000, 100000").

            $ 

#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(0, 0, 100, 50),
  mse_fail_example 
)


*Coefficient of determination $R^2$*.

_Essentially,_ the coefficient of determination $R^2$ is a normalized MSE, the closer it is to 1 the better the model is at making predictions, and the closer it is to 0, the closer it is in quality to having a constant prediction. 

#let coefficient_of_determination = $
            R^2 (a, X) = 1 - (sum^ell_(i=1)(a(x_i) - y_i)^2)/(sum^ell_(i=1) (y_i - overline(y))^2), space overline(y) = 1/ell sum^ell_(i=1) y_i                     
            $ 

#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50),
  coefficient_of_determination 
)

*Mean absolute error (MAE)*. 

Suppose we've replaced the squared difference with a module. 

#let mae_loss_function = $
             L(y,a) = |a - y|
           $

#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50),
  mae_loss_function 
)

The error function resulting from this change is the mean absolute errror (MAE) 

#let mae = $
             "MAE"(a, X) := 1/ell sum^ell_(i=1) |a(x_i) - y_i| 
           $


#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50),
  mae 
)

The mean absolute error (MAE) is not differentiable but is less sensitive to outliers that might might ruin a model in more outlier sensitive error functions such as MSE, RMSE, and coefficient of determination. 

Let's show why the mean absolute errro (MAE) is less sensitive to outliers. 

#let mae_resistance_to_outliers = $
  & "Suppose all" ell "objects from" XX "have the same factor descriptions, but different values of the" \ 
  &"target variable" y_1, dots, y_ell. "In this case the model has to give the same answer on all these" XX. \
  & "If we picked MSE as the error function, we get the following problem^:"\ 
  & mse -> min_a \ 
  & "The minimum would be obtained on the average of all the answers:" \ 
  & 1/ell sum^ell_(i=1) 2 (a - y_i) = 2/ell sum^ell_(i=1) (a - y_i) => 2/ell sum^ell_(i=1) (a - y_i)  = 0   =>sum^ell_(i=1) (a - y_i) = 0 => a = 1/ell sum^ell_(i=1) y_i \
  & a^*_("MSE") = 1/ell sum^ell_(i=1) y_i  = overline(y) \ 
  & "Thus, if even one of the answers is different from the others (is an outlier), " \
  & "the average would be greately skeweed in its direction."\
  & "Now image the exact same situation but with an MAE function." \ 
  & mae -> min_a \ 
  & 1/ell sum^ell_(i=1) |a (x_i) - y_i | underbracket(=, ell= m + k) 1/ell  (sum^m_(i = 1 ) (a- y_i) +sum^k_(i = m + 1) (y_i - a)) underbracket(=, "diff") 1/ell ( "# of"  <= (a) -  (ell - "# of" <= (a)) )  \
  & "Which can be rewritten as:" \
  & 1/ell (2 "#" <= (a) - ell ) "which when differentiable would be minimized at the change of the" \
  & "derivative's sign." \ 


  & a^*_("MAE") = "median" (y_1, dots, y_ell) 

$


#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(000, 100, 000, 50),
  mae_resistance_to_outliers 
)

*Huber loss* 

If we attempt to unite the absolute loss function and the quadratic loss function we would obtain the Huber loss function. 

#let huber_loss = $

             L_(delta) (y,a  ) := cases(1/2 (y - a)^2 "," space |y-a| < delta , delta (|y-a| -1/2 delta )"," space |y-a| >= delta)

           $
#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50),
  huber_loss 
)

The key aspect of this error function is the $delta$ parameter that regulates what we consider to be an outlier. The smaller this parameter $delta$ is, the error function will act as a quadratic one only when the difference between the answer and the target varibale is near 0 ($(a - y) approx 0$). On the other hand, if the $delta$ is greater, then the error function will act as a quadratic one even with a greater different. 

_Essentially,_ $cases(delta -> 0 ", Huber is absolute" , delta -> infinity ", Huber is quadratic" )$

One must pick the parameter $delta$ for each individual case. 

As all things though, the Huber loss function has a large problem, that being that its derivative has breaks. 

*Log-Cosh* 

The Log-Cosh function acconts for the Huber loss's problem of derivative's breaks. 

#let log_cosh = $

             L(y,a) := log cosh (a - y)

           $
#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50),
  log_cosh 
)

Similarly to the Huber error functio, for small deviations it would act as a quadratic error, and for larger 
deviations the Log-Cosh error fucntion would act as a linear one.  

*Mean squared logarithmic error (MSLE).* 

#let msle = $

             L(y,a) := (log (a + 1 ) - log(y +1 ))^2 

           $
#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50),
  msle 
)

This particular error function is used when we are faced with a task that has a nonnegative target varibale and nonnegative results of the model. 

By applying a log onto the results, we are punishing the model for overestimating and underestimating the result (where the overestimation is punished more than underestimation).  

*Mean absolute percentage error (MAPE)* 

_Essentially,_ measures the average absolute percent error between predictions and actual values. 


#let mape_exp = $
            L(y,a) := abs((y-a)/(y)) 
           $
#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50),
  mape_exp 
)

As everything, it has certain drawbacks. It becomes undefined if 
values are close to zero, penalizes positive errors (a > y) more heavily than negative errors (a < y).


*Squared mean absolute percentage error (SMAPE).*


Meant to adress the problems of the mean absolute percentage erorr (MAPE). 

_Essentially,_  the squared mean absolute percentage error (SMAPE) is an accuracy based measure based on percentage (or relative) errors. It is meant to treat over and under forecasts in a relative fashion instead of an absolute way. 

#let smape_exp = $

            L(y,a) := (abs(y-a))/(abs(y) + abs(a))/2 

           $
#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50),
  smape_exp 
)

*Quantile loss function*

#let smape_exp = $

            Q(a, X^ell) = sum^ell_(i=1) p_tau (y_i - a(x_i)) , 

           $
#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50),
  smape_exp 
)



= Linear Regression


== Overfitting 

== Estimating the quality of models 

== Training a linear regression

== Gradient descent 

=== Gradient and its characteristics

=== Gradient descent

=== Estimating a gradient 

==== Stochastic gradient descent

==== SAG method 

==== Other approaches


=== Modifications of the gradient descent

==== Momentum (Метод инерции)


==== AdaGrad and RMSprop 

==== Adam


= Linear classification

== Training linear classificators 

=== Отступы

=== Верхние оценки 

== Quality metrics of classification 

=== Fraction of correct answers 

=== Error metrix 

==== Relation between precision, fullness, and fraction of correct answers. 


==== Lift 


=== Area Under Curve (AUC)

==== Index gini 

==== Sensitibity to the relation of classes. 

==== Precision-recall curve.



= Linear classification 2: Electric Boogaloo 


== Log-regression 

=== Estimating probabilities

=== Model realism and log loss 

=== Log-regression

== Support vector machine 

=== 

===

===



#pagebreak()





=== Этапы решения задачи в ML. 

+ Постановка задачи. 
2.1. Сбор данных 

2.2. Разработка признаков. 

2.3 Подготовка данных. 

3. Выборк функции потерь. 


3

4

5

=== Линейная Классификация 

$
  YY =  {1, ..., k} = "многоклассовая классификация" \ 
  YY = {underbracket(-1, "отриц классиф."), underbracket(+1, "отриц класс")} - " бинарная классификация" \ 
  alpha (x) := "sign" chevron.l w, x chevron.r 
$

Что делать если $chevron.l w, x chevron.r = 0$?

+ фиксированный класс выдавать
+ случайный класс 
+ сказать что такого небывает 
+ отказ от классификации 


$
  alpha(x) := "sign" ( chevron.l w, x chevron.r  - t) , quad t - "giperparameter"
$

Знаем: 
$
  chevron.l w , x chevron.r - "условие ортогональности, и является уравнением гиперплоскости" , quad w - "вектор нормали"
$

there should be a reminder from linear algebra here, a graph and stuff (add later)

=== Обучение
Запишем функионал:
$
  Q(alpha, X) = 1/ell sum^ell_(i=1)  [alpha(x_i) != y_i] - "доля ошибок (error rate)"
$

Проблема тут что производная либо 0 либо отсутвует. 

$
  1/ell sum^ell_(i=1) ["sign" chevron.l w, x_i chevron.r != y_i] = 1/ell sum^ell_(i=1) [underbracket(y_i chevron.l w"," x_i chevron.r , Mu_i )< 0] -> stretch(min)_w
$


*Margin.* 

$
  Mu_i = y_i chevron.l w, x_i chevron.r - "отступ (margin)"
$

Где $"sign" Mu$ говорит о корретности классификации, и $|Mu|$ говорит об уверенности модели. 


Пока что наша функция потерь: 
$
L(Mu) = [Mu < 0] - "пороговая ф.п."
$

make a graph a bit later here 

Идея: 


$
  [mu < 0] <= stretch(L)^(tilde.rev) (mu)  - "дифф верная оценка" \ 
  0 <= 1/ell sum^ell_(i=1) [y_i chevron.l w, x_i chevron.r < 0 ] <= 1/ell sum^ell_(i=1) L^tilde.rev (y_i chevron.l , x_i chevron.r) -> stretch(min)_w
$

Можно попробовать по подбирать разные: 

+ $L_1^tilde.rev (mu)= log(1 + exp (-mu))$ log ф.п
+ $L_2^tilde.rev (mu)  = max(0, 1 - mu)$ hinge loss 
+ $L_3^tilde.rev (mu) = (arctan (-mu))/pi + 1$


Далее будем рассматривать как выбирать между верхней оценки, но пока просто представим что мы некую выбрали. 

$
  1/ell sum^ell_(i=1) L^tilde.rev (y_i chevron.l w, x_i chevron.r) + alpha R(w) -> stretch(min)_w
$


* Метрики качества классификации*

 Доля верных ответов. (Accuracy)

$
  1/ell sum^ell_(i=1) [alpha(x_i) = y_i]
$

Какая тут есть проблема? 

*Дизбаланс классов.*

#set align(center)
#table(
  columns: 3 ,
  fill: (col, row) => if row == 0 {rgb("#557fe649")},
  [class sign], [ num], [res], 
  [+1 :], [50], [$alpha(x)$ = -1],
  [-1 :], [950], [accuracy = 0.95]
)
#set align(left)




Мораль: Когда работаете с задачей классификации всегда необходимо смотреть на баланс классов. 

Далее, когда мы улучаем модель, есть два способоа измерения прироста: 

+ $|r_1 - r_2|$ 
+ $|r_1 - r_2|/|r_1| $

Рассмотрим пример: 

#set align(center)
#table(
  columns: 3, 
  fill: (col, row) => if row == 0 { rgb("#577fe649") },
  [$r_1, r_2$], [abs],[rel],
  [20%, 10%],[10%],[50%], 
  [50%, 25%], [25%],[50%], 
  [0.1%, 0.01%], [0.09%], [90%]
)
#set align(left)


6


*Многоклассовая классификация и категориальные признаки.*

Матрица ошибок. 

$
  alpha(x) = + 1 , quad alpha(x) = -1
$

#set align(center)
#table(
  columns: 4, 
  fill: (col, row) => if row == 0 {rgb("#557fe649")},
  [],[],[y = +1], [y = -1],
  [Worked],[$alpha(x) = +1$], ["True positive (TP)"], ["False positive (FP)"],
  [Did not work],[$alpha(x) = -1 $], ["False negative (FN)"], ["True negative (TN)"] 
)
#set align(left)

*Accuracy*

$
  "accuracy" = ("TP" + "TN")/("TP" + "TN" + "FP" + "FN")
$

Хорошо будет работать для балансированных классов (50-50). В противном случае делать нечего.  


*Precision. (точность)*

Насколько мы доверяем модели. 

$
  "precision"  = ("TP")/("TP" + "FP")
$


Замечание: Будем говорить что $0/0  = 1$

Можно работать с несбалансироваными классами.

*Recall. (полность).*

Насколько модель покрывает положительный класс. 

$
  "recall"  = ("TP")/("TP" + "FN")
$


Допустим: 

$
  a(x)  = +1 > y = + 1 ==> "precision" arrow.t , "recall" arrow.b
$

$
  a(x)  = +1 < y = + 1 ==> "precision" arrow.b , "recall" arrow.t
$

*Как можно балансировать между precision & recall? *

Вспомним что модель классификации выглядит как: 

$
  alpha(x) = "sign" (underbracket(b(x),"уверенность") - underbracket(t, "порог"))
$

Шаг 1. 


Отсортируем $X "по" b(x)$. 

$
  b(x) = 105, 99,overbracket(|, t), dots, 81, 73 , dots, -50, -70 => "precision" arrow.t , "recall" arrow.b\ 
  b(x) = 105, 99, dots, 81, 73, dots, overbracket(|, t), -50, -70 => "precision" arrow.b , "recall" arrow.t 

$

Обычно precision & recall балансируются выбором порога.

$
  cases(
    "precision" --> max , "recall" >= 0.9 
  ) space , quad 
  cases(
    "recall" --> max, "precision" >= 0.95
  )
$

*Как обьеденить точность (precision) и полноту (accuracy)?*

1. Среднее арифметическое. 
$
  
$

Почему это нам не подойдет? 

$
  "pr" = 0.05, "vec" = 0.9 => Alpha = 0.475 , "but" "pr" 
$

2. Минимум. 
$
  Mu = min("pr","rec")
$

$
  "pr =" 0.5 , "vec" = 0.5 "and" "pr" = 1, "vec" = 0.5 "but this model would give them same eff"
$

3. Среднее гармоническое. (F-мера)
$
 " F" : = (2"pr" dot "vec")/("pr" + "rec")
$

3.2 ($"F"_alpha"-мера"$)

$
  F_alpha = ((1 + alpha^2 ) dot "pr" dot "vec")/(alpha^2 dot "pr" + "vec") quad cases(stretch(-->)_(alpha-> 0) "pr ", stretch(-->)_(alpha-> +infinity)"rec")
$

4. Среднее геоматрическое. 

$
  "G" = sqrt("pr" dot "vec") - "ближе к ариф."
$

$
 "pr"  = 0.9 , "rec" = 0.1  ==> 
$


#let imp = $"F" < "G"$

#set align(center)
#block(
  inset: 10pt, 
  stroke: 0.1pt,
  imp
)
#set align(left)

*Отсупление.*

$
  "lift" = "pr"/(("TP" + "FN")/ell) = (overbracket("pr"))/(underbracket(ell_(+)/ell, "(1)"))
$

(1) - доля полезных звонков если звоноили случайно
(2)

В итоге, 

$
  "lift" = 1 ==>  "модель рандомна"
  "lift" < 1 ==> "worse than random"
$

#pagebreak()

5. Площади под кривыми (Метрики качесвта ранжирования).

#set align(center)
#table(
  columns: 3,
  fill: (col, row) => if row == 0 {rgb("#557fe649")},
  [b(x)], [y], [y],
  [100],[+1],[+1],
  [93],[+1],[-1],
  [91],[+1],[+1],
  [$dots$],[$dots$],[$dots$],
  [-1],[-1],[+1],
  [-2],[-1],[-1],
  [-10],[-1],[+1],
  [],[good ],[bad]
)
#set align(left)

5.1 ROC (Reversed operated characteristic) - кривая. 

#set align(center)
#table(
  columns: 4, 
  fill: (col, row) => if row == 0 {rgb("#557fe649")},
  [],[],[y = +1], [y = -1],
  [Worked],[$alpha(x) = +1$], ["True positive (TP)"], ["False positive (FP)"],
  [Did not work],[$alpha(x) = -1 $], ["False negative (FN)"], ["True negative (TN)"] 
)
#set align(left)

*False positive rate.*

$
  "FPR" = ("FP")/("FP + TN") = ("FP")/(ell_(-))
$

*True positive rate.*

$
  "TPR" = ("TP")/("TP" + "FN") = ("TP")/(ell_(+))
$

Далее перебираем все $t$, рисуем что-то что-то что-то. 

Пример 1:
Модель которая сначала ставит все положительные а потом все отрицательные.


#set align(center)
#table(
  columns: 2, 
  fill: (col, row) => if row == 0 {rgb("#557fe649")},
  [b(x)],[y], 
  [],[+1],
  [],[+1],
  [],[-1],
  [],[-1],
)
#set align(left)

$
  "AUC - ROC" = 1
$

We need the de


Пример 2: 

Рассмотрим модель которая чередует обьекты.


#set align(center)
#table(
  columns: 2, 
  fill: (col, row) => if row == 0 {rgb("#557fe649")},
  [b(x)],[y], 
  [],[+1],
  [],[-1],
  [],[+1],
  [],[-1],
)
#set align(left)

$
  "AUC - ROC" = 1/2
$

Пример 3: 
Модель которая сначала ставит все отрицательные а потом все положительный.


#set align(center)
#table(
  columns: 2, 
  fill: (col, row) => if row == 0 {rgb("#557fe649")},
  [b(x)],[y], 
  [],[-1],
  [],[-1],
  [],[+1],
)
#set align(left)

$
  "AUC - ROC" = 0
$

Показывает насколько полезная модель оказывается. 


Рассмотрим случай: 

#set align(center)
#table(
  columns: 2, 
  fill: (col, row) => if row == 0 {rgb("#557fe649")},
  [b(x)],[y], 
  [0.7],[+1],
  [0.7],[-1],
  [0.7],[-1],
)
#set align(left)

5.2 Precision-Recall (PR) кривая.

$
  "AUC - ROC", "чем больше чем лучше."
$


*Замечание 1. Индекс Джини.*

$
  "Gini" = 2 dot "AUC" dot "ROC" - 1 = 2 ("AUC" dot "ROC" - 1/2)
$

*Замечание 2.*

$"AUC" - "ROC" "может вводить в заблуждение если в выборке много  легких (обьекты с " \  mu > 0 "примеров."$

#set align(center)
#table(
  columns: 2, 
  [$b(x)$],[],
  [-1],[EDA],
  [-1],[EDA],
  [+1],[AMI],
  [+1],[AMI],
  [+1],[AMI],
  [-1],[Other],
  [-1],[Other],
)
#set align(left)

AUC-ROC не очень чуствительный к небольшому количеству серьезных FP ошибок. 

*Как это решить? *

1. AUC-ROC @ k 

2. AUC - PR 



Функция потерь в классификации.


$
  1/ell sum^(ell)_(i=1) ("sign" chevron.l w, x_i chevron.r != y_i ) <= 1/ell sum^(ell)_(i=1) L()
$


#pagebreak()

= Multi-class classification and categorical factors 

== Seminar: 

We will look at the conditions a classificator must follow so that it could be used 

=== Prediction of probabilities.

If we recall RUC-AUC, this approach, as all, has some problems. 


$
  "ROC-AUC" approx  0.8 | overbracket(0.9,+1)  overbracket(0.7,+1) overbracket(0.4,+1) overbracket(0.2,+1)    overbracket(0.1,+1)  \
 "ROC-AUC" approx  0.8 | overbracket(9,+1)  overbracket(7,+1) overbracket(4,+1) overbracket(2,+1)    overbracket(1,+1)  \
 "ROC-AUC" approx  0.8 | overbracket(-1,+1)  overbracket(-3,+1) overbracket(-6,+1) overbracket(-4,+1)    overbracket(-9,+1)  \

$



*Calibrated model.*

$
& "Suppose we are given viborka X. The model" underbracket(hat(p), "predicted probability") (x) - "is calibrated if:"\
& forall "the objects " x' in X, forall hat(p)(y =1 | x') = k, k  in [0,1], "is equal to" k dot 100% "percent really belong to the target class." \ 
& "The solution of this task depends on the Loss function L(.):" \
& arg min(hat(p) in R) EE[L(y, hat(p)(x) | x)] = p(y  = +1 | x), "where " p(y = +1 |x) "is the истинная вероятночть "
$


=== Task 1. 

Show that the MSE $L(y,hat(p)) = ([y = + 1] - hat(p))^2$ allows to predict correct probabilities. 


#let example = $
  "MSE" = ([y = + 1]= hat(p))^2 , EE("MSE"(y, hat(p)|x)) = overbracket(p(1- hat(p))^2 , y=+1) + overbracket((1-p)dot hat(p)^2, y != +1)  \ 
  "take the dericative from page 2 of the 6th seminar document" 

$

#block(
  inset: 10pt, 
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(0, 0, 100, 50),
  example
)

=== Task 2. 

Show that the MSE $L(y,hat(p)) = |[y = + 1] - hat(p)|, hat(p) in [0,1]$ allows to predict correct probabilities. 

#let example = $
  & EE("MAE") = p dot |1 - hat(p)| + (1 - p) dot |hat(p)| = p dot(1-hat(p)) + (1-p) dot hat(p) \ 
   & (delta(EE("MSE")))/delta(hat(p)) = -p + 1 -p = 1-2p => 0 = 1-2p\ 
   & "We can now check two different resulting cases:" \ 
   & 1.  p = 1/2 forall hat(p) "And as a result, the classificator is unable to predict" \
   & "the correct probability in point x."\ 
   & 2. p != 1/2 "And as a result the (0,1) interval does not contain critical points, "
$

#block(
  inset: 10pt, 
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(0, 0, 100, 50),
  example 
)

== Calibration of probabilities . 

In order to obtain a calibrated model, we can build a new model over the old model, that will take a probability (generated by the original classificator ($hat(p) (x)$)) as an input, and transforms it into the 


=== Platt Scaling (Platt calibration)


#let platt_scaling = $
  P(y=1|x) = 1/(1 + exp(a f(x) +b))
$

#block(
  inset: 10pt, 
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50),
  platt_scaling 
)

Example: 

Suppose that $hat(p) = 0.7 -> p = 0.7$ and that the probabilities are $0, 1/5, 2/5, 3/5, 4/5, 1$. 

It's all great when they are so neatly laid out, but if we are given something like 0.3845911... what should we do? 

We offered to build a distogram, and then calculate the amount that would be present in a certain class. 


From the distogram we are able to build a probabilities plot (calibration plot ) that will be located in the axis y = observations , x = probability 


Then we consider that the best option for the calibration plot is a 45 degree straight line. 

=== Isotonic regression


=== Quantile regression


=== Beta calibration

== Multi-class calibration 

