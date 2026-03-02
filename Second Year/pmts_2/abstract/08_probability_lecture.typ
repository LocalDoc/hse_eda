#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-plot:0.1.3": plot

#show heading: set align(center)

= Теория вероятности и математическая статистика 
=== Лекция 8
=== Точечное оценивание
=== Экономика и анализ данных 
=== Фрейре Серёгина Даниэль Фабиан


#pagebreak()

= Точечное оценивание

Предпосылки:
Выборка $X_1, dots , X_n ~ F(x, theta)$ где $theta$ это параметр распределения. 


Но чтобы не жить радостно, можно иметь альтернативные параметры. 

$
  "Bi" (n,p ); theta = vec(n,p)
$

$
  U[a,b] ; theta = vec(a,b)
$

$
  Pi (lambda) ; theta = lambda
$

$
  N(mu, sigma^2) ; theta = vec(mu, sigma^2)
$

Область возможных значений $theta$. Как её понять? 

=== *Статистика*

Статистика $T(X)$ это любая борелевская функция от выборки. Статистика это функция от случайных величин, а значит и сама случайнная величина. 

прообраз интервала будет равен этому интервалу. (опред + пример добавить потом )


=== *Оценка*

Оценка параметра $theta$ это статистика, значение которой используют в качестве приблеженного значения $theta$. 


*Состоятельная оценка.*

Оценка T(X) называется состоятельной, если $x = vec(x_1, dots, x_n)$: 

$
  P(|T(x) - theta| >= epsilon) stretch(-->)_(n-> infinity) forall epsilon >  0  , "альтернативно " T(x) stretch(-->)^(P)_(n -> infinity) -> theta
$

Не состоятельные оценки вообще не рассматриваются. 

Пример: 

Состоятельная оценка математического ожидания. 

#let example =$
  mu ? --> overline(X) stretch(-->)^(P)_(n-> infinity) mu
$

#block(
  fill: rgb(87, 127, 230, 100),
  inset: 10pt, 
  width: 100%, 
  example
)

*Несмещенность оценки*

Оценка $T(x)$ если:

$
  EE(T(x)) = theta
$


#pagebreak()

Пример: 

Оцениваем $mu$ по $X_1, X_2, X_3, X_4$.



#set align(center)
#table(
  columns: 5, 
  fill: (col, row) => if row == {0} {rgb("#557fe649")},
  [],[$ T_1 $],[$ T_2 $],[$ T_3 $],[$ T_4 $],
  [$ T_i $ ],[$ X_1 $ ],[$ 1/2 X_1 + 1/2 X_4 $],[$ 1/4 (X_1 + dots + X_4) $],[$ 1/3 X_2 + 2/3 X_4 $],
  [$ EE(T_i) $],[$mu$],[$mu$],[$mu$],[$mu$],
  [$ "Var"(T_i) $],[$ sigma^2$],[$ 1/4 sigma^2 + 1/4 sigma^2 =  sigma^2/2 $],[ $ 5/9 sigma^2 $],[ $ 1/4 sigma^2 $]

)

#set align(left)

*Асимтотически несмешенная оценка*

Оценка $T(X)$ называется асимтотически несмешенной если:

$
  beta ( theta) stretch(-->)_(n --> infinity) 0, "где" beta(theta) := EE(T(X) -  theta)
$


Как пример: 

#let example = $
  S^2 = 1/n sum^n_(i=1) (X_i - overline(X))^2 - "смешенная, но асимтотически сем" \ 
  hat(sigma^2)  = 1/(n-1 ) sum^n_(i=1) (X_i - overline(X))^2 - "несмешенная"
$

#block(
  fill: rgb(87, 127, 230, 100),
  inset: 10pt, 
  width: 100%, 
  stroke: 0.1pt, 
  example
)

*Эффективная оценка*

Оценка $T(X)$ из класса $Kai$ называется эффективной (оптимальной, лучшей, best) в этом классе если $forall  T' (X) in Kai$ 
справедливо что:

#let effective_estimate = $
underbracket(EE((T(X)- theta)^2), "среднеквад-я ошиб. T ") <= EE((T' (X) - theta)^2,), "причем " exists theta_0 "т.ч."
EE((T(X)- theta_0))^2 < EE((T'(X)- theta_0))^2
$

#set align(center)
#block(
  fill: rgb("#ff8c003a"),
  inset: 10pt,
  width: 100%,
  stroke: 0.1pt, 
  effective_estimate
)
#set align(left)

*Замечание*

Несмещенная оценка $T(X)$ эффективна в классе несмешенных оценок, если $forall$ несмешенная $T'(X)$. 

$
  "Var"(T(X)) <= "Var" (T'(X)), "причем " exists theta_0 : "Var"(T(X)) < "Var" (T'(X))
$

*Утверждение*

Если $exists$ эффективная оценка, то она $!$ 

Рассмотрим пример: 

$
  EE(S^2) = (n-1)/n sigma^2 - "см, ас несм" , quad  EE(hat(sigma^2)) = sigma - "несм"
$


*Замечание*

Оценка $T_1(X)$ эффективнее $T_2(X)$ когда: 

$
  EE(T_1(X) - theta)^2 < EE(T_2(X) - theta)^2 
$

*Утверждение*

$overline(X) - "эффективная оценка" mu "в классе линейнх несм. оценок."$ 

$square$

$
  & 1).  "Линейность :" T(X) = a_1 X_1 + dots +a_n X_n, "где " a_1 + dots + a_n = 1   \ 
  & 2). "Несмещенность: " EE(T(X)) = mu , space a_1 mu + dots + a_n mu =  mu => a_1 + dots + a_n =1   \ 
$

$
 
  & "Var"(T(X)) = a_1^2 sigma^2 + dots + a_n^2 sigma_n^2 --> min , "т.ч" a_1 + dots _ a_n =1\
  & L = a_1^2 + sigma^2 + ... + a_n^2 sigma^2 - lambda(a_1 + dots a_n - 1) -> min \
  & (delta L)/(delta a_i) = 2 a_i sigma^2 - lambda|_(a_i = a_i^0) = 0 forall i= i, dots, n \
  & (delta L)/(delta lambda) = (a_1 + dots + a_n -1) |_(a_i^0) = 0 cases( a_i = (lambda)/(2 sigma^2), a_1 + dots + a_n = 1 ) => a_i = 1/n \
 

$

#set align(right)
$square.filled$
#set align(left)

*Утверждение*

Несмещенная оценка $T(X)$ параметра $theta$ состоятельна, если: 

$
  "Var"(T(X)) stretch(-->)_(n-> infinity) 0
$

$square$

$
  P(|T(X) - underbracket(theta, EE(T(X)))| >= epsilon ) <= ("Var" (T(X)))/(epsilon^2) stretch(-->)_(n -> infinity)
$