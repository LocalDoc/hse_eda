#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-plot:0.1.3": plot

#show heading: set align(center) 

= Многоклассовая классификация и категориальные признаки.

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


