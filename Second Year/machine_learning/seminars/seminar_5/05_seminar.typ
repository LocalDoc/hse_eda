
everything here wold 

#table(
  columns: 2, 
  [-1],[0.1],
  [-1], [0.2], 
  [+1], [0.4], 
  [+1], [0.7], 
  [+1], [0.05]
)

we are trying to built a plot with a Y axis FPR and a X axis TPR 

$
  max(hat(y_i)) < t_"max" => "FPR" = 0 , "TPR" = 0 ("everything here has a negative class")
$


$
  min(hat(y_i)) > t_"min" => "FPR" =1 , "TPR" = 1 ("everything here has a positive class")
$

As a reult we have a point in (0,0) and (1,1)


Now we have to pick predictions between 0.1 and 0.05, since we've picked those two 



#table(
  columns: 5, 
  [0.7],[0.4],[0.2],[0.1],[0.05],
  [+1],[+1],[-1],[-1],[+1],
)

we might wanna move the edge (porog) from the left side of the 0.7, to in between 0.7 and 0.4 

As a result of these changes we can say that: 

$
  "FPR" = 0, "TPR" = 1/3
$

We can plot this new point on the graph. 

Now we can take another step rightwarrd.

$
  "FPR" = 0 , "TPR" = 2/3
$

We can take another step to the right. 


$
  "FPR" = 1 , and "FPR" = 2/3
$

We take another step. 

The AUC-ROC curve would be built from (0,0) and to (1,1) and passes through all of the 
points shown previously. 

General algorithm. 

1. 
2. FPR = 0, TPR = 0
3. if TPR , TPR: 
  consider that there are m - similar objects
  - Y(i) = + 1 (FPR' = FPR, TPR' = TPR + m/l+)
  - Y(i) = -1 (FPR'= FPR + m/l , TPR' = TPR)
  consider that there are no m 
  - FPR' = FPR + m_2/l- 
  - TPR' = TPR + m_1/l+

=== We can solve 1.4

We know that: 
$
  b(x) in (0,1]
$

Open: $p(b)= 2 - 2b$, closed: $p(b) = 2b$

Now we need to calculate AUC-ROC. 

Supoose there is a porog t. 

As a result: 

$
  cases("TPR " = 1 - t^2, "FPR" = (1-t)^2) => t = 2 sqrt("FPR ") - "FPR"
$

$
  "AUC-ROC" = integral^1_0 "TPR" d "FPR" = integral^1_0 (2 sqrt(x) - x) d x  = (4/3 x^3/2 - 1/2 x^2)|^1_0  = 5/6
$

=== We can solve 1.5 


