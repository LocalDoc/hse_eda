#import "@preview/cetz:0.4.2"

#show heading: set align(center)
= Теория Вероятности и Математическая Статистика 
=== Лекция 5
=== Усеченное нормальное распределение, основные распределения используемые в статистике.
=== Экономика и Анализ Данных 
=== Фрейре Серёгина Даниэль Фабиан


#pagebreak()
#show heading: set align(left)

О любых найденных ошибках, несостыковок, и опечаток сообщять #link("https://t.me/local_dan")[мне], либи сделать merge request на #link("github.com/LocalDoc/hse_eda/tree/main/Second Year/Macroeconomics")[гит]. Я буду очень благодарен. 

*Бонусная задача: *

Необходимо найти:

$
  P("Вес" <= "Ваш вес" | "Рост" = "Ваш рост") 
$


== Усеченное нормальное распределение. 

#let note  = "Данная тема будет как дополнительная, может попаться как бонус."
#set align(left)
#block(
  fill: luma(235),
  inset: 10pt,
  note,
)
#set align(left)


Мы предпологаем что `log`дохода имеет нормальное распределение. Но есть проблема, где некоторые маргинальные cлои обшества создают срезанные хвосты (в обе стороны).

(по больше деталей потом)

=== Теорема. 

$
  xi "~" N(mu, sigma^2),\
  EE(xi|xi > a) = mu + sigma dot lambda, "где" phi, Phi,  "это плотности" "~" N(0,1) , "а"  lambda = (phi(alpha))/(1 - Phi (alpha)) , alpha = (a - mu)/(sigma) 
$

Можно обозвать $lambda$ функцией риска, обратное отношение Милса, или лямбда Хекмана. 


Они хорошо описывают риск выхода из состояния. 

$
  lambda = overbrace(phi(alpha), "вероятность некого события")/underbrace(1 - Phi (alpha), "при условии что они догли до некоторого события?")
$

*Пример:*

Есть данные на богатых американцев на 1987. Пусть, 

Богатые $= >= 100k "$" $ 

$EE("Inc" | "Inc" >= 100) = 142$

$P("Inc">= 100)=0.02$

$ln "Inc" ~ N (mu, sigma^2)$

Необходимо найти $EE("Inc")=?$. 

Мы знаем что $ln "Inc" ~ N$


Хоть это и не очень корректно, мы скажем что: 
$
  EE(ln "Inc"| "Inc" >= 100) = ln 142
$

Воспользуемся теоремой введенной на данной лекции. 

$
  ln(142) = mu + sigma (phi(alpha))/(1 - Phi(alpha)), quad  alpha = (ln 100 - mu)/sigma  , 
  \ \ 
  0.02 = P(ln "Inc" >= ln 100) = 1 - Phi (alpha) => alpha = 0.6...
$

В итоге получаем: 

$
  cases(
    ln(142) = mu + sigma dot (phi(alpha))/underbrace(1- Phi(alpha), 0.02) , 
    alpha = (ln 100 - mu)/sigma , 
    0.02  = P(ln "Inc" >= ln 100) = 1- Phi(alpha) => alpha approx 0.6
  )
$

Что в итоге дает $mu approx 23, sigma approx dots$. 

== Основные распределения используемые в статистике.


*Опр. 5.1* Хи-квадрат ($chi$).

$
   z_1, dots, z_k "н.о.р.с.в." N(0,1) ==> phi = z_1^2 + ... + z_k^2 "имеет" chi_k^2 
$

#set align(center)
#figure(
  image("/assets/image-29.png", width: 60%), 
  caption: []
)
#set align(left)

Cвойства:

1.

$
  EE (phi) = k, quad "Var" (phi) = 2k ==> phi_1 ~ chi^2_k, quad phi_2 ~ chi^2_m ==> phi_1 + phi_2 ~ chi^2_(k + m)
$

Пример: 

$
  z ~ N(0,1) ==> chi^2_1 
$


*Опр. 5.2* Распределение Стьюдента (Student's t-distribution)

$
  z_0, z_1, .. , z_k "н.о.р.с.в" N(0,1) \
  T  = (z_0)/(sqrt((z_1^2 + dots + z^2_k)/(k)))~ t_k quad ("Распределение стьюдента с k"  d.f ("degre of freedom")) \
  T = (N(0,1))/(sqrt((chi^2_k)/k)) quad "где nominator and denominator независимы"
$

#set align(center)
#figure(
  image("/assets/image-28.png", width: 60%), 
  caption: []
)
#set align(left)


Свойства: 

1. 
$
  EE(T) = 0  , quad "Var" (T) = k/(k-2) , k> 2, \ 
$

2.
$  
  t_k underparen(-->, k -> infinity) N(0,1), "где "t_1" это распределение Коши"
$


*Орп. 3* Распределение Фишера (Fisher–Snedecor distribution)


$
  phi_1 ~ chi^2_k , phi_2 ~ chi^2_m , phi_1 " и " phi_2 "незивисимы" \
  F = (phi_1/k)/(phi_2/m) ~ F_k ("Распределение Фишера с k и m" d.f.)
$

#set align(center)
#figure(
  image("/assets/image-30.png", width: 60%), 
  caption: [Where d1=k, d2=m.]
)
#set align(left)


Свойства: 

1.  
$
  T ~ t_k ==> T^2  ~ F_(1,k) 
$

2. 
$
  1/(F_(k,m)) = F_(m,k)
$