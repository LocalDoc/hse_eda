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

The set of all the possible objects of a certain task. Euclidean space. 

*Target variable* (y).

The answer to the task we are solving. 

*Target set* ($YY$).

The set of all the possible targets of a certain task. Euclidean space.

*Training set* ($X := (x_i, y_i)_i$). 

A set of object for which there are *correct* targets, and $|X|=ell$. 

*Datadrift*.

We say we have encountered datadrift when the training set is no longer relevant for today or tomorrow. 

*features*. 

The characteristics of objects $x$, where $d$ is the amount of features. 

$
  X_i  = (x_(i 1), dots, x_(i d))
$

#let types_of_features = $
                          & "Numerical:" x_j in RR , \ 
                          & "Categorical:" x_j in {C_1, dots, C_m}, "(Only supports equality comparison)" \ 
                          & "Ordinal:" x_j in {C_1, dots, C_m} "(Supports ordering operations)"
                        $

#block(
  width: 100%, 
  inset: 10pt, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  types_of_features
)

== Types of tasks in machine learning. 

The type of task in machine learning is defined by the target variable $y$ from the target variable set $YY$. 

*Supervised Learning*. 

The training set $ X := (x_i, y_i)_i$ for which the targets are available.

#let supervised_learning_types = $ 
                          & 1. "Linear Regression" (YY = RR)  \ 
                          & 2. "Classification" (|YY| < infinity): \
                          & ("Binary" :YY = {0,1}, "Multi-class": YY = {1, dots, k} , "Multi-label:" YY = {0,1}^k) \ 
                          & 3. "Ranking"
                        $

#block(
  width: 100%, 
  inset: 10pt, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  supervised_learning_types
)


*Unsupervised learning*. 

We are given a training set $X_i  : = (x_i , y_i)_i$ without the target variables as answers. 

#let unsupervised_learning_types = $
                                     & 1. "Clustering:We try to break a set into subsets such that are similar to each other." \ 
                                     & 2. "Density Estimation: (Search for anomalies)"
                                     
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
  a : XX -> YY 
$

#block(
  inset: 10pt, 
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50),
  task 
)

*Error function.*

We need to be able to formally evaluate the quality of algorithms. The error function is used to judge the model's performance in a meaningful, interpretable way. Often, it is used to evaluate the entire dataset, and give real world utility. 

As a popular example we have MSE (Mean Squared Error). 

#let mse = $
   1/ell sum^ell_(i=1) (a(x_i) - y_i)^2 
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

A loss function will compute the error for a single training example from the training set $X$. It measures how far off the model's *prediction* (a) is from the target variable $y$.  

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
                                   L(y,a ) = (y - a)^2
                                 $

#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(0, 0, 100, 50), 
  loss_function_mse_example 
)

*Algorithm* ($cal(A)$)

Once we have fixed an error function, we are able to build the algorithm $a(x)$. Beforehand we fix a family of algorithms $cal(A)$. 

 

#let linear_reg_example = $
  cal(A) = {a(x) = w_0 + w_1 x_1 + dots + w_d x_d | w_0, w_1, dots, w_d in RR}, x_i ": i feature of the object x" \ 
  a(x) = w_0 + w_1 x_1 + dots + w_d x_d  = w_0 + sum^d_(j=1) w_j x_(i j ) 
  
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
1/ell sum^ell_(j=1) (w_0 + sum^d_(j=1) w_j x_(i j  )- y_i )^2 --> min_(w_0, dots, w_d)     , x_(i j) "is the j feature of on an i object"               
$

#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(0, 0, 100, 50), 
  mse_error
)


#let training = "The process of finding an optimal algorithm is called training a model (algorithm)."

#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  training
)

== Filtering data 

For an algorithm to be useful we need to be able to feed it good data. Data might need to be altered in order to be considered "good". 

#let filtering_data_methods = $
& 1. "Linear models:" \ 
& "Normalize them by subtracting the average, " \
& "and dividing by the Variance of all columns of the 'objects-features' matrix." \ 
& 2. "Outliers:" \ 
& "Objects that are incorrect examples, the presence of which ruins a model." \
& 3. "Noise:" \
& "Objects that do not have any relation to the target variable y."
                              $

#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  filtering_data_methods
)

*Overfitting.*
Is the result of a model that corresponds to closely to the training set $X_i : = (x_i , y_i)_i$ and fails to fit and / or predict future observations. 

As an example: 

#let overfitting_example = $ 
& a(x) = cases(y_i"," x = x_i, 0 "," x in.not X )   \ 
& "This would be an awful model, as it would not learn anything at all, as it follows the"  \ 
& "target variable way too closely."
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

We can describe the vast majority of linear regression models as the sum of features with certain weights. 

#let linear_model_example = $

  a(x)  := w_0 + sum^d_(j=1) w_j x_j 
  
$
#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  linear_model_example
)
The *parameters* of a model are its *weights (coefficients)* $w_j$, where $w_0$ is the bias (intercept).

Our form of presenting the linear model can be rewritten as: 

#let linear_model_example = $
  a(x)  := w_0 + chevron.l w , x chevron.r , space w = (w_1, dots, w_d)
$
#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  linear_model_example
)

If we add to each feature description of each object an $(d+1)$ feature equal to one, it would could as the free coefficient, and would permit us to rewrite the linear model as:

#let linear_model_example = $
  a(x)  :=  chevron.l w , x chevron.r 
$
#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  linear_model_example
)

== Usage of linear models. 

An important criteria to consider is that in the linear model each feature has a linear effect on the target varibale, and this target variable does not depend from a combination of features. 

*Categorical features.*

Suppose we have a categorical feature the value of which we cannot compare the size of, substract or add from. These types of facotrs cannot be used in linear models without additional modification.

*One-hot coding.*

_Essentially,_ one hot encoding is a method for converting categorical variables into a binary format, where we create new columns for each category where 1 is the category being present and 0 being absent. 

Suppose that the categorical feature $f_j(x)$ takes in values from the set $C = {c_1, dots, c_m}$. We replace this categorical feature $f_j(x)$ for the $m$ binary facors $b_1(x), dots, b_m(x)$, where each one is the indicator function of one of the possible categorical values. 

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

The fact that they are lineary dependent is a problem, we could prevent this by throwing out one of the binary features, but if the test set gains a new category, it might be encoded by a zero binary feature, and with the deletion of which it would loose meaning. 

Suppose we are trying to make a model for estimating the price of apartments using a linear model, where the categorical feature is the location of the apartment building. After performing one-hot encoding we would obtain the following result:

#let one_hot_codding_example = $
  a(x) = w_1[f(x)=c_1] + dots + w_m[f(x)=c_m] + {"relation with other features"}
$
#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(0, 0, 100, 50), 
  one_hot_codding_example
)

Which makes more sense than a standard linear model, as the location would define an "initial estimate" for the value of the apartment building, and only after all of the remaining features would further adjust it. 

*Working with texts (bag of words)*. 

Let's borrow the same example from before, and suppose we are trying try predict its price via its textual description.  

#let bag_of_words = $
  &"Find all of the words in our set:" {c_1, dots, c_m} \ 
  &"Format the text using m features:" b_1(x), dots, b_m(x), space s.t. space b_j(x) := "num of words" c_j "in the text." \
  &"The linear model would look like:" a(x) = w_1 b_1 (x) + dots + w_m b_m (x) + dots

$
#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  bag_of_words
)

_Essentially,_ each inclusion of the word $c_j$ would change the predicted price by $w_j$. 

*Binarization of numerical features*.

Suppose that for the previous example we are given the distance to the metro ($x_j$). It seems clear that it there musn't necesarrily be a linear dependency between the feature and the target variable. 

To solve this problem we can binarize the features. 

#let binarization = $
  &"For this we take a" {t_1, dots, t_m} "net, and add the points" t_0 = - infinity, t_(m+1)=+ infinity.  \ 
  &"Set up new features as:" b_i(x) = [t_(i-1) < x_j <= t_i], space i=1, dots, m+1\
  &"The linear model would look like:" a(x) = w_1 [t_(0) < x_j <= t_1] + dots + w_(m+1) [t_(m) < x_j <= t_(m+1)] 

$
#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  binarization
)

Thus we have considred the non linear dependency between the feature and the target variable when predicting the price of the apartment for each interval of distance from the nearest metro. 


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

As with all metrics, this error function is not perfect, as its results are not great for interpretation because it does not keep the unit of measurement of the original target variable. 
To avoid this problem, the Root mean squared error (RMSE) is introduced.

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

Suppose we've replaced the squared difference with an absolute value.

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

Let's show why the mean absolute error (MAE) is less sensitive to outliers. 

#let mae_resistance_to_outliers = $
  & "Suppose all" ell "objects from" XX "have the same feature descriptions, but different values of the" \ 
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

By applying a log onto the results, we are punishing the model for both overestimating and underestimating the result (where underestimation is typically penalized more heavily in relative terms).

*Mean absolute percentage error (MAPE)* 

_Essentially,_ measures the average absolute percent error between predictions and actual values. Futhermore, they are best when we are comparing with variables with different scales. Here is a standard example of the mean absolute percentage error (MAPE): 

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

As everything, it has certain drawbacks:
#show block: set align(left)

+ The mean absolute percentage error (MAPE) becomes undefined if values are close to zero, thus, *it penalizes positive errors *(a > y)* more heavily than negative errors* (a < y).
+ + MAPE has an asymmetry problem: since the denominator is the actual value $y$, it penalizes positive errors (overestimation) more heavily than negative errors (underestimation) in terms of the percentage calculated.


#show block: set align(center)


*Symmetric mean absolute percentage error (SMAPE).*

Meant to adress the asymmetry problem of the mean absolute percentage erorr (MAPE). 

_Essentially,_  the symmetric squred mean absolute percentage error (SMAPE) is an accuracy based measure based on percentage (or relative) errors. It is meant to treat over and under forecasts in a relative fashion instead of an absolute way. 

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

*Quantile cost function*

Often the cost of overestimating or underestimating the prediction is not equal, and one of them is larger. We wish to account for this possibility, and thus we use the quantile loss (MSE). In such cases we are presented with an classic optimization problem. 

We introduce a parameter $tau in [0,1]$, which will determine the proportion of importance for the overestimation and underestimation the prediction. Suppose that the larger $tau$ is, the larger the penalty for underestimating the prediction will be.  

#let quantile_loss_exp = $
            Q(a, X^ell) = sum^ell_(i=1) p_tau (y_i - a(x_i)) ,  space p_tau (z) := (tau - 1)[z < 0] z + tau[z>=0 ]z
           $
#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50),
  quantile_loss_exp 
)

#pagebreak()

= Linear Regression

== Overfitting 

Overfitting occurs when a model performs exceptionally well on the training set, but fails to produce the same quality of results when presented with new data. 

This problem can be addressed via: 

#show block: set align(left)
+ Using a narrower class of models. 
+ Punish the model for overcomplicating the final model. 
+ Perform *regularization *.

#show block: set align(center)

== Estimating the quality of models 

In order to check ourselves the model we've trained for possible overfitting, we can divide the data we have into a classic training set $X$ and a *holdout-set* (отложенная выборка), which we will use to test the data. 

As all things, dividing the data into a training and a holdout (testing) set brings about certain difficulties. We do not know what kind of model quality we would have had if we'd used the full dataset as our training set. 

*Crossvalidation.*

#let crossvalidation = $
            & "We break the data set into" k "sections" X_1, dots, X_k "of roughly the same size. Then we are to" \
            & "train" k "models" a_1(x), dots, a_k(x) "where the" i"-th model is trained on all objects" x "from all "  \
            & "models exluding the" i"-th model."  \
            & "" \ 
            & "The quality of each model is evaluated on that i-th section that was not used in it's "\ 
            & "training, and the results are averaged." \
            & ""  \
            & quad quad quad  quad quad quad quad quad quad quad quad quad quad quad quad "CV" := 1/k sum^k_(i=1) Q(a_i (x), X_i)\ 
            & "" \
           $
#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50),
  crossvalidation 
)

Suppoe that we've performed the crossvalidation and now we need to obtain the final version of the model. This could be done in the following ways.

#show block: set align(left)
+ We perform crossvalidation in order to obtain the best possible model from the $k$ sections. Once it is selected, we train all of the data on that final option with the assumption that we've minimized the risk of overfitting. 
+ If we are not able to train the final model, be it because of size constrains, or other features, we can built a model composition $a_1(x), dots. a_k (x)$ obtained during the crossvalidation. Here, in the case of regressions, we can interpret the composition of models as the averaging of the model's predictions. 

#show block: set align(center)


== Training a linear regression

Linear regressions are often trained using an mean squared error function (MSE). In such cases we are presented with an classic optimization problem. 

#let linear_reg_training = $
  & 1/ell sum^ell_(i=1) ( chevron.l w, x_i chevron.r - y_i^2) --> min_w ", which if rewritten in a matrix form:"  1/ell || X w - y ||^2 --> min_w\ 
  & "were we use the Euclidean norm."  \
  & "" \ 
  & "If we solve the optimization problem the final result would be:" w = (X^T X)^(-1) X^T y
$

#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50),
  linear_reg_training 
)

Being able to easily find the optimal vector of weights is a boon to the linear regression over other models, nevertheless, as all things, it is not always applicable for a range of reasons. 

#show block: set align(left)
+ *Inverting a matrix* is a complex operation with cubic complexity relative to the number of features ($d$).
+ The matrix $X^T X$ could either be singular (uninvertible, determinant is zero) or ill-conditioned (incredibly close to a singular). To solve this problem one would have to perform *regulazation*, which will be discussed further. 

#show block: set align(center)


= Gradient descent 

Optimization problems as the ones we saw with the MSE function can be solved iteratively using gradient methods. 

== Gradient and its characteristics

*Gradient of a function.*

The gradient of a function $f: RR^d --> RR$ is the vector of all its partial derivatives:
#let gradient = $
  nabla f (x_1, dots, x_d) = ((delta f)/(delta x_j))^d_(j=1)
$

#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50),
  gradient 
)

At any given point, the gradient points in the direction of the greatest rate of increase of the function, whilst the antigradient ($- nabla$) points in the direction of the greatest decrease of the function. 

#let gradient_proof = $

$

#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(0, 100, 0, 50),
  gradient_proof 
)

== Gradient descent

_Essentially,_ the gradient points in the direction of the greatest rate of increase of the function. The antigradient does the same in the direction of the greatest rate of decrease of the funciton.

We ought to start on a certain point, calculate the antigradient in said point and take a step towards it, recalculate the antigradient, and take another step. 


*Gradient descent.*

#let gradient_descent = $
                & "More formally, the gradient descent is the repetition of the following:" \
                & w^((k)) = w^((k-1)) - eta_k nabla Q( w^((k-1))) , "where" Q(w) "is the value of the cost function for the" \ 
                & "parameters "w" and" eta_k "is the lenght of the step required, iterated until convergence is reached." \
$
#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50),
  gradient_descent 
)

It is important to carefully pick the *step* $eta_k$ (also known as the learning rate). It could be a constant, but if the constant step is too large, we run a risk of jumping over the minimum, whilst if the constant step is too small, then finding the minimum would take far too many iterations. 

#let gradient_descent_example_default = $         
   eta_k = 1/k                                     $

Here is an often used default step, where we reduce the step as we approach the minimum. 
#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(0, 0, 100, 50),
  gradient_descent_example_default 
)


Here is the step formula used in vowpal wabbit. 
#let gradient_descent_example_vw = $         
   eta_k = lambda (s_0/(s_0+ k))^p , lambda , s_0 , p "are just some parameters."                                $

#block(
  inset: 10pt,
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(0, 0, 100, 50),
  gradient_descent_example_vw 
)

*When do we stop the gradient descent?*

We can halt the iterations when the gradient starts to approach zero ($||nabla Q( w^((k-1)))|| < epsilon $) or when the changes in the weight vector cause by each step become way too small ($||w^((k)) - w^((k-1))|| < epsilon$)

Another good alternative is to watch for values of a cost funciton on a holdout-set and halt when the value stops dropping. 

== Evaluating a gradient 

As a rule of thumb, the cost function $Q(w)$ is presented as a sum of $ell$ functions:

#let ell_sum_ex = $
                          Q(w) = 1/ell sum^ell_(i=1) q_i (w), "where" q_i (w) "is the error on certain object x"
                        $

#block(
  inset: 10pt, 
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(0,0,100,50), 
  ell_sum_ex
)

Recalling a previously presented method of a gradient descent ($w^((k))=w^((k-1))- eta_k nabla Q(w^((k-1)))$, we can see that on each iteration we would need to calculate the gradient of the whole sum. 

#let gradient_ell_sum_ = $
                          nabla_w Q(w) = 1/ell sum^ell_(i=1) nabla q_i (w)
                        $

#block(
  inset: 10pt, 
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(0,0,100,50), 
  gradient_ell_sum_ 
)

The primary issue with standard gradient descent is the necessity of calculating the full gradient across all $ell$ objects at every step. This becomes computationally problematic for massive datasets.

This issue could be mitigated if we accept that we don't always need the *precise* value of the gradient, and we could do with approximations, which we will review in this section. 


=== Stochastic gradient descent

The *Stochastic gradient descent (SGD)* addresses the primary issue of the gradient descent by estimating the gradient using a single randomly selected object $i_k$ from the functional.

#let sgd_formula = $  w^((k)) = w^((k-1)) - eta_k nabla q_(i_k) (w^((k-1)))$

#block(
  inset: 10pt, 
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  sgd_formula
)

Because the gradient of a single object may not be zero at the global minimum, SGD may deviate from the optimum even when close to it. To ensure convergence for convex functions, the step size $eta_k$ must satisfy the *Robbins-Monro conditions*:

#let robbins_monro = $  sum_(k=1)^infinity eta_k = infinity, quad sum_(k=1)^infinity eta_k^2 < infinity $

#block(
  inset: 10pt, 
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  robbins_monro
)

A major advantage of SGD is its memory efficiency; since only one object is required per step, models can be trained on datasets that do not fit in RAM. 


The accuracy of the gradient can be increased by using several objects instead of a single one. 

#let mini_batch = $ 
 & nabla_w Q(w) approx 1/n sum_(j=1)^n nabla_w q_(i_(k j)) (w), "where" i_(k j) "are randomly selected indexes of objects from the"\
 & "cost function, and" n "is the method's parameter, that acts as the size of the object batch" \
 & "for one gradient step." $

#block(
  inset: 10pt, 
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  mini_batch
)

_Essentially,_ with this modification we obtain the *mini-batch gradient descent*, that acts as a compromise where the gradient is estimated using $n$ objects, providing a more stable direction than a single object while remaining more efficient than the full gradient.

=== SAG method

The *Stochastic average gradient (SAG)* method  combines the low complexity of the Stochastic gradient descent (SGD) iterations with the high convergence rate of full gradient descent. It stores the last calculated gradients for every object in the training set.

#let sag_logic = $
  & z_i^((k)) = cases(nabla q_i (w^((k-1))) "," i = i_k, z_i^((k-1)) "otherwise"), quad "where"  & w^((k)) = w^((k-1)) - eta_k 1/ell sum_(i=1)^ell z_i^((k))
$

#block(
  inset: 10pt, 
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  sag_logic
)

While only one gradient is updated per step, the weight update uses the average of all stored gradients. This allows SAG to achieve a convergence rate of $O(1/k)$ for convex functions, matching full gradient descent.

#let sag_logic_demonstration = $

$

#block(
  inset: 10pt, 
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(0, 100, 0, 50), 
  sag_logic_demonstration
)

=== Other approaches

Gradient estimation can also be performed without calculating analytical derivatives. For example, one can sample a random vector $u$ from a unit sphere and use the function's value in that direction to approximate the gradient:

#let grad_free = $  nabla_w Q(w) approx Q(w + epsilon u) u$

#block(
  inset: 10pt, 
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(0, 0, 100, 50), 
  grad_free
)

Alternatively, for complex architectures like deep neural networks, one can train a model to predict the gradient based on current parameters, known as synthetic gradients.

== Modifications of the gradient descent

=== Momentum (Метод инерции)


Used in cases where level lines are highly stretched, the anti-gradient direction often changes sharply, causing noise and slow optimization. *Momentum* addresses this by averaging the anti-gradients from previous steps using a *momentum vector* $h_k$:

#let momentum_formula = $
  & h_0 = 0 \
  & h_k = a h_(k-1) + eta_k nabla_w Q(w^((k-1))) \
  & w^((k)) = w^((k-1)) - h_k
$

#block(
  inset: 10pt, 
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  momentum_formula
)

The parameter $a$ determines the decay rate of past gradients. If a gradient coordinate consistently points in the same direction, the momentum vector grows, accelerating the descent.

=== AdaGrad and RMSprop

The gradient descent is incredibly sensitive to the size of the gradient step $eta$. There are no methods for predetermining the correct step $eta$ one has to pick. *AdaGrad* introduces a unique step lenght for each parameter component, which decreases based on the length of previous steps.

#let adagrad_formula = $
  & G_(k j) = G_(k-1, j) + (nabla_w Q(w^((k-1))))_j^2 \
  & w_j^((k)) = w_j^((k-1)) - eta / sqrt(G_(k j) + epsilon) (nabla_w Q(w^((k-1))))_j
$

#block(
  inset: 10pt, 
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  adagrad_formula
)

This is effective for sparse tasks. However, because $G_(k j)$ grows monotonically, steps eventually become too small to reach the minimu. *RMSprop* solves this by using exponential decay for gradient accumulation:

#let rmsprop_formula = $  G_(k j) = a G_(k-1, j) + (1 - a)(nabla_w Q(w^((k-1))))_j^2$

#block(
  inset: 10pt, 
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  rmsprop_formula
)

=== Adam

*Adam (Adaptive Moment Estimation)* combines the benefits of both Momentum and RMSprop. It accumulates past gradients to avoid oscillations while maintaining an adaptive step size for every individual parameter.

#let adam_concept = $  "Adam" approx "Momentum" + "RMSprop"$

#block(
  inset: 10pt, 
  width: 100%, 
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50), 
  adam_concept
)


#pagebreak()

= Linear classification

In this section we will review a binary linear classification, that occurs when the target set  $YY = \{-1, +1\}$. The model predicts the class based on the sign of a linear combination of features.

#let binary_linear_classifier = $ 
  &"Suppose that" XX = RR^d "is the object set, " YY = {-1, +1} "is the target set," X = {(x_i, y_i)}^ell_(i=1) \ 
  &  "is the training set, targets will be reffered to as positive and negative."
  \ 
  & a(x) = "sign"(chevron.l w, x chevron.r + w_0 ) "where" w in RR^d "is the weight vector", "and" w_o in RR "the bias."
  \ 
  & "If not otherwise stated, we can assume that there is a constant" x_(d+1) = 1, "and as a result:"
  \ 
  & a(x) = "sign" chevron.l w, x chevron.r 
  \ 
  \ 
  & "One must also consider that we may encoutner the unlikely case of sign"(z) = 0 , "which we" 
  \ 
  & "will consider to be the model refusing to classify the object." 
  $

#block(
  inset: 10pt,
  width: 100%,
  stroke: 0.2pt,
  fill: rgb(100, 0, 100, 50),
  binary_linear_classifier
)

== Training linear classifiers

A linear regression problem has a continuum of potential answers, it would be 
odd to demand a complete match between the model and the true answers. It is far 
more reasonable to demand a certain "closeness" between them. 

Futhermore, attempts to match perfectly to the training set, as we've learned before, increase the 
risk of overfitting. 

The initial cost function for the (binary) linear classifier has one wrong and one right answer.
We wish to see as many correct asnwers are possible. The resulting cost function is the rate of correct asnwers,
which called *accuracy*.

#let linear_classifier_accuracy_cf = $
                                       Q(a, X) = 1/ell sum^ell_(i=1)[a(x_i) = y_i]
                                     $

#block(
  inset: 10pt,
  width: 100%,
  stroke: 0.2pt,
  fill: rgb(100, 0, 100, 50),
  linear_classifier_accuracy_cf
)

Nevertheless, it would eaiser for the challenged ahead to solve minimization problems, 
and thus, we will use the rate of incorrect answers.

#let linear_classficer_task = $

Q(a, X) = 1/ell sum^ell_(i=1) [a(x_i) != y_i] = 1/ell sum^ell_(i=1) ["sign" chevron.l w,x_i chevron.r != y_i] --> min_w                                
                              $

#block(
  inset: 10pt,
  width: 100%,
  stroke: 0.2pt,
  fill: rgb(100, 0, 100, 50),
  linear_classficer_task
)

This cost function is discrete regarding the model's weights, and thus looking 
for the minimum using gradient methods is inpossible, and furthermore cost function may have 
several minimum points, complicating the potential solution further. As a result 
we will attempt to transform the problem into a minimization problem of a smooth (both continuous and differenciable limit) cost funciton. 

=== Margins (Отступы)

The *margin* $M_i$ for an object is defined as the product of its true label and the model's scalar output.

#let margin_def = $M_i = y_i chevron.l w, x_i chevron.r$

#block(
  inset: 10pt,
  width: 100%,
  stroke: 0.2pt,
  fill: rgb(100, 0, 100, 50),
  margin_def
)

The sign of the margin indicates correctness: a positive margin ($M_i > 0$) means the classifier's answer is correct, while a negative margin ($M_i < 0$) indicates an error. The absolute value $|M_i|$ characterizes the model's confidence. 
It can be obtained by slightly transforming our formula of *accuracy*. 


#let margin_minimization_exp = $
                                 Q(a, X)=  1/ell sum^ell_(i=1)[a(x_i) = y_i] =  1/ell sum^ell_(i=1) [underbracket(y_i chevron.l w","x_i chevron.r, M_i ) <0 ] --> min_w  
                               $

#block(
  inset: 10pt,
  width: 100%,
  stroke: 0.2pt,
  fill: rgb(0, 100, 0, 50),
  margin_minimization_exp
)

=== Upper Bounds (Верхние оценки)

The cost function estimates the error of the model on the $x$ object with 
the help of a fall function $L(X) = [M < 0]$, where the argument $M$ is the margin. 



#let cost_function_upper_bound = $
  Q(a, X) <= 1/ell sum^ell_(i=1) hat(L) (M_i) --> min_w
$

#block(
  inset: 10pt,
  width: 100%,
  stroke: 0.2pt,
  fill: rgb(100, 0, 100, 50),
  cost_function_upper_bound
)

If the smooth upper bound is minimized toward zero, the actual error rate will also decrease towards zero.

Some examples of upper bounds can be seen here (we will discuss them fully at a later date): 

#let upper_bounds_examples = $
  & 1. "Logistic loss:" log(1 + e^(-M)). "Used to estimate class probabilities in Logistic Regression." \
  & 2. "Hinge loss (SVM):" max(0, 1 - M). "The foundation of the Support Vector Machine (SVM)." \
  & 3. "Perceptron loss:" max(0, -M). "Employed in the Rosenblatt Perceptron algorithm." \
  & 4. "Exponential loss:" e^(-M). "Frequently used in boosting algorithms (sequential learning" \
  &  quad "of 'weak' models, each fixin the mistakes of the previous)." \
  & 5. "Sigmoid loss:" 2/(1 + e^M). "Provides a smooth, bounded approximation to the standard " \ 
  & quad "threshold error function."
$

#block(
  inset: 10pt,
  width: 100%,
  stroke: 0.2pt,
  fill: rgb(0, 0, 100, 50),
  upper_bounds_examples
)

== Quality metrics of classification

#show block: set align(left)

#let motivation = "Whilst we have previoisly transfromed the problem of training a linear classifer into a problem of minimization of a smooth cost function, there is a need in developing different ways of measuring the quality of the trained classifer."  

#block(
  inset: 10pt,
  width: 100%,
  stroke: 0.2pt,
  motivation
)

#show block: set align(center)



For the following section we will suppose that: 

#let section_conditions = $
                            & "Linear classifer:" a(x)  = "sign" (b(x)-t) = 2[b(x) > t] - 1 "which will take on this view if we"\
                            & "presuppose that" b(x) = chevron.l w , x chevron.r "and" t=0. 
                          $

#block(
  inset: 10pt,
  width: 100%,
  stroke: 0.2pt,
  fill: rgb(100, 0, 100, 50),
  section_conditions
)

=== Fraction of correct answers (accuracy)

*Accuracy* is the simplest measure of quality, representing the proportion of correct predictions.


#let accuracy_def = $ "accuracy"(a, X) = 1/ell sum_(i=1)^ell [a(x_i) = y_i] $

#block(
  inset: 10pt,
  width: 100%,
  stroke: 0.2pt,
  fill: rgb(100, 0, 100, 50),
  accuracy_def
)

Accuracy is flawed in imbalanced datasets. For instance, if 95% of objects belong to one class, a trivial model always predicting that class achieves 95% accuracy without learning any patterns.

=== Error matrix

The *Error Matrix* breaks down predictions into four categories based on the combination of true and predicted classes.

#set align(center)
#table(
  columns: 3,
  fill: (col, row) => if row == 0 {rgb(100,0,100,50)},
  [], [$y = 1$], [$y = -1$],
  [$a(x) = 1$], [True Positive (TP)], [False Positive (FP)],
  [$a(x) = -1$], [False Negative (FN)], [True Negative (TN)]
)
#set align(left)

#let accuracy = $ "accuracy" = ("TP + TN")/("TP + FP + FN + TN")$

#block(
  inset: 10pt,
  width: 100%,
  stroke: 0.2pt,
  fill: rgb(100, 0, 100, 50),
  accuracy
)

#set align(center)
#table(
  columns: 2, 
  fill: (col, row) => if row == 0 {rgb(100,0,100,50)},
  [Quality metric],[Description],
  [*Precision*],[Measures the quality of positive predictions.],
  [
*Recall*],[Measures the model's ability to find all positive objects.],
  [*F-measure*],[Balanced metric that acts as a smoothed minimum of precision and recall.],
  [*R-precision* (breakeven point)],[The precision calculated at the specific threshold where precision and recall are equal.],
  [*Average precision*], [Used when objects need to be sorted by confidence.]

)

#set align(left)

#let prec_rec = $ "Precision" = "TP" / ("TP" + "FP") , quad "Recall" = "TP" / ("TP" + "FN"), quad "F" = (2 dot "precision" dot "recall")/("precision" + "recall") \ 
"R" = "precision" ("sign" b(x) - t^*) , space t^* = arg min_t space |"precision" ("sign" (b(x) - t)| \ 
"AP" = 1/ell_+ sum^ell_(k=1) [y_(k) = 1] "precision"@k ,  b(x) "is" a(x) in {RR backslash ZZ }, "where:" \ 
y_(k) "is the k-th ordered target variable", 
ell_+ "the amount of positive objects in the training set",  \
"precision"@k "is the accuracy across the first k objects in the object list"  
$

#block(
  inset: 10pt,
  width: 100%,
  stroke: 0.2pt,
  fill: rgb(100, 0, 100, 50),
  prec_rec
)



==== Relation between precision, fullness, and fraction of correct answers


*_Essentially_,* high requirements for both precision and fullness in imbalanced tasks force an extremely high accuracy. For example, in a set of 1,000,000 objects where only 1% are positive, requiring 90% precision and 90% fullness demands an accuracy of 99.8%.

==== Lift

*Lift* represents the improvement in the concentration of positive objects compared to a random selection.

#let lift_def = $ "lift" = "Precision" / (("TP" + "FN") / ell) $

#block(
  inset: 10pt,
  width: 100%,
  stroke: 0.2pt,
  fill: rgb(100, 0, 100, 50),
  lift_def
)

=== Area Under Curve (AUC-ROC)

#let fp_tp_rate = $ "FPR" = ("FP")/("FP" + "TN") , quad "TPR" = ("TP")/("TP" + "FN") $

#block(
  inset: 10pt,
  width: 100%,
  stroke: 0.2pt,
  fill: rgb(100, 0, 100, 50),
  fp_tp_rate
)

The ROC curve connects the points $("FPR", "TPR")$ generated by varying the decision threshold $t$ from the maximum possible score to the minimum.


==== Index Gini

The *Gini Index* is proportional to AUC and is frequently used in credit scoring.

#let gini_def = $"Gini" = 2 dot "ROC-AUC" - 1$

#block(
  inset: 10pt,
  width: 100%,
  stroke: 0.2pt,
  fill: rgb(100, 0, 100, 50),
  gini_def
)

==== Sensitivity to the relation of classes

*AUC-ROC* is sensitive to class imbalance when the positive class is significantly smaller. A poor model can still have a high AUC-ROC because it measures False Positives relative to the total number of negative objects. In tasks like identifying math articles (100 out of 1,000,100), a useless model can achieve an AUC-ROC of 0.95.

==== Precision-Recall curve

The *Precision-Recall (PR) curve* is often better for imbalanced classes. It plots Fullness on the x-axis and Precision on the y-axis. The area under this curve (*AUC-PR*) provides a more adequate quality assessment in such cases.

#let auc_pr_logic = $
  & "Average Precision (AP)" = 1 / ell_+ sum_{k=1}^ell [y_{(k)} = 1] "precision"@k \
  & "AP approximates the area under the PR curve"
$

#block(
  inset: 10pt,
  width: 100%,
  stroke: 0.2pt,
  fill: rgb(100, 0, 100, 50),
  auc_pr_logic
)


== Logistic regression 

Logistic regression is a training method that uses the logistic loss function $tilde(L)(M) = log (1 + e^(-M))$. Its primary advantage is that it correctly estimates the probability of an object belonging to a specific class.

=== Estimating probabilities

#show block: set align(left)


#let motivation =  $"In many real-world tasks, such as ad click prediction, it is vital to predict the probability" \  p(y = +1 | x) "rather than just a hard label. If we know the probability, we can calculate " \ "the expected value of an action, such as the expected profit from showing a specific banner."$

#block(
  inset: 10pt,
  width: 100%,
  stroke: 0.2pt,
  motivation
)

#show block: set align(center)


#let prob_requirement = $ arg min_(b in RR) EE[L(y, b) | x] = p(y = +1 | x) $

#block(
  inset: 10pt,
  width: 100%,
  stroke: 0.2pt,
  fill: rgb(100, 0, 100, 50),
  prob_requirement
)

 Not all loss functions allow for probability estimation. Quadratic loss ($L_2$): $L(y, z) = (y - z)^2$ does allow for probability estimation if we use $y=1$ for positive and $y=0$ for negative classes. Absolute loss ($L_1$): $L(y, z) = |y - z|$ does not allow this as the optimal answer will always be either 0 or 1
 
=== Model realism and Logistic loss 

 If a model $b(x)$ truly predicts probabilities, those probabilities must be consistent with the observed data. We can define the likelihood of the training set as the probability of obtaining that specific data according to our model. 

#let log_loss_derivation = $ Q(a, X) = product_(i=1)^ell b(x_i)^[y_i = +1] dot (1 - b(x_i))^[y_i = -1] $

#block(
  inset: 10pt,
  width: 100%,
  stroke: 0.2pt,
  fill: rgb(0, 0, 100, 50),
  log_loss_derivation
)

To simplify optimization, we minimize the negative logistic-likelihood (Logistic-loss). Logistic-loss is preferred over quadratic loss for classification because it penalizes confidently incorrect predictions far more severely.

=== Logistic regression

== Support vector machine 

=== Hard Margin SVM (Разделимый случай)

=== Soft Margin SVM (Неразделимый случай)

=== Unconstrained SVM (Сведение к безусловной задаче)

= Multi-class classification and categorical features 

== Multi-class classification 

=== Reduction to a series of binary tasks 

==== One-versus-all 

==== All-versus-all 

=== Multi-class logistic regression 

=== Multi-class support vector machine (SVM) 

=== Quality metrics for multi-class classification 

==== Micro-averaging

==== Macro-averaging  

== Multi-label classification (Classification with overlapping classes)

=== Independent classification (Binary relevance) 

=== Classifier stacking 

=== Transformation of the response space 

=== Quality metrics for multi-label classification 

==== Hamming distance  

== Categorical features 

=== Binary encoding (One-hot encoding) 

=== Binary encoding with hashing (Hashing trick) 

=== Counters (Target encoding)  


#pagebreak()


== Seminar

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
  "take the derivative from page 2 of the 6th seminar document" 

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

=== Calibration of probabilities . 

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

=== Multi-class calibration 

= Introduction into Deep Learning 

#let motivation = ""

