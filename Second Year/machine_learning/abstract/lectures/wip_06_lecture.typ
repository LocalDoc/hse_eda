#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-plot:0.1.3": plot

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


= Метрики качества классификации

=== Доля верных ответов. (Accuracy)

$
  1/ell sum^ell_(i=1) [alpha(x_i) = y_i]
$

Какая тут есть проблема? 

*Дизбаланс классов.*

#set align(center)
#table(
  columns: 3 ,
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
  [$r_1, r_2$], [abs],[rel],
  [20%, 10%],[10%],[50%], 
  [50%, 25%], [25%],[50%], 
  [0.1%, 0.01%], [0.09%], [90%]
)
#set align(left)