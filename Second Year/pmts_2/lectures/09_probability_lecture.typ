#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-plot:0.1.3": plot

#show heading: set align(center)

= Теория вероятности и математическая статистика 
=== Лекция 9
=== 
=== Экономика и анализ данных 
=== Фрейре Серёгина Даниэль Фабиан

#pagebreak()

missed the first 30~ minutes of the lecture 


=== Свойства ММ 
1) ПРостая реализация 
2) Состоятельность оценок (как правило)
3) Ассим. несмешенная
4) 


Пример: 

#let example = $
  X_1, dots, X_n ~ "Pois"(lambda) \ 
  underbracket(overline(x), 1/n sum X_i) = underbracket(hat(lambda), EE(X_1)) ("с пом 1-го момента")
$

#block(
  width: 100%, 
  inset: 10pt, 
  stroke: 0.2pt, 
  example
)


С второго момента: 

Нужно добавить потом. 

= Методы статист. оценивания неизвестных пар-ров распределений. 

2) Метод максимального правдоподобия. 

*Функция правдоподобия*

$
  L(x, theta) := cases(
    P(X_1 = x_1, X_2 = x_2, dots, X_n, x_n dot theta) underbracket(==> ,"в силу независимости") Pi^n_(i=1) P ( X_i = x_i, theta) ,
    f(x_1, dots, x_n dot theta) := "Обобщенная совместная плотность" underbracket(==>,"в силу независимости") Pi^n_(i=1) f(x_i, theta)
  )
$

$
  hat(theta) = arg max_theta L(x, theta) ; [L(x, theta) -> max] 
$

Пример 1: 


#let example = $
X_1 = 3/n, и x_1 = 300  "и мы знаем что" X~N(.)
$ 

#block(
  width: 100%, 
  inset: 10pt,
  stroke: 0.2pt,
  example
)


Для упрошения подсчета дифференциала мы логарифмируем максимизацию $hat(theta)$.

$
  ln ( L(X, theta)) -> max
$

Рассмотрим примерыы двух случаев. 

1. Регулярный. 

Область значений не зависит от $theta$. В таком случае: 

#let algorithm = $
  & ln L(X, theta) -> max \ 
  & 1. (delta ln L(X, theta))/(delta theta )|_(theta = hat(theta)) = 0 \
  & 2. (delta^2 ln L(X, theta))/(delta theta delta theta^T)|_(theta = hat(theta)) , " и матрица отрицательно определена"
$

#block(
  width: 100%, 
  inset: 10pt, 
  stroke: 0.2pt, 
  algorithm
)

Пример дискретный пример: 

#let example =$
                & X_1, dots, X_n ~ "Pois"(lambda) \ 
                & P(X_1 = k) = e^(- lambda) ((lambda)^k)/(k!) => P(x_i = x_i) = e^(-lambda) dot (lambda^(x_i))/(x_i !) \ 
                & L(X, theta) = product^n_(i=1) e^(- lambda) dot (lambda^(x_i))/(x_i !) \ 
                & ln L(X, theta) = sum^n_(i=1) (- lambda + X_i dot ln lambda - ln X_i !) underbracket(=)  -n lambda + ln lambda sum^n_(i=1) X_i - sum^n_(i=1) ln (X_i !) \ 
                & (delta ln (X, theta))/(delta lambda) = -n + 1/lambda sum^n_(i=1) X_i |_(lambda = hat(lambda)) = 0=> hat(lambda) = 1/n sum^n_(i=1) X_i = overline(X) \ 
                & (delta^2 ln (X, theta))/(delta lambda^2) = 1/lambda^2 sum^n_(i=1) X_i |_(lambda = hat(lambda)) < 0
              $

#block(
  width: 100%, 
  inset: 10pt, 
  stroke: 0.2pt, 
  example
)

2. Не регулярный случай: 
#let example =$
                & X_1, dots, X_n ~ U [a,b] \ 
                & f(x_1, dots, x_n) = cases(1/(b-a)^n "," x_i in [a,b], 0 "," exists x_i in.not [a, b] )  \ 
                & (1/(hat(b) - hat(a)))^n  -> max ==> cases(hat(a) = min X_i = X_((1)), hat(b) = max X_i = X_((n)) ) =>> hat(a) <= X_i <= hat(b)
              $

#block(
  inset: 10pt, 
  width: 100%, 
  stroke: 0.2pt, 
  example
)

Свойства ММП. 

#let maximum_likelyhood_estimation_properties = $
                                                  & 1. "Для регулярного случая, если ОМП" exists! u (exists! max(L(X, theta))) "то" : \
                                                  & 1.1 "Состоятельны"   \                                                 
                                                  & 1.2 "Асим. несмеш." \
                                                  & 1.3 "Асим. эффект"  \
                                                  & 1.4 "Асим. нормальны" \
                                                  & 1.5 "Инварианты" \ 
                                                  & 1.6 "Если эффективна оценка" exists, "то она совместна с ОМП"
 
                                                $

#block(
  stroke: 0.2pt,
  width: 100%, 
  inset: 10pt, 
  maximum_likelyhood_estimation_properties
)