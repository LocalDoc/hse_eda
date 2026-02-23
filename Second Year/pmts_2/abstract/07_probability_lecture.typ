#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-plot:0.1.3": plot

#show heading: set align(center)
= Теория вероятности и математическая статистика 
=== Лекция 7
=== Организация и характеристики выборки, выборочная функция распределения.
=== Экономика и анализ данных 
=== Фрейре Серёгина Даниэль Фабиан


#pagebreak()
#show heading: set align(left)

= Способ организации выборки. 
+ Простой случайный отбор: Каждый элемент генеральной совокупности имеет равную вероятность быть отобранным. 
+ Систематический (Простой отбор с регулярной, но несущественной для изучаемого признака процедуры): Отбор элементов из генеральной совокупности через равный интервал (шаг).  
+ Стратифицированный  отбор: Генеральная совокупность предварительно делится на однородные слои по значимому признаку, после чего из каждого слоя случайно отбираются элементы для гарантированного представительства разных групп. 
+ Комбинаторный отбор: Сочетает несколько способов отбора на разных этапах.


= Основные характеристики выборки. 

1. Вариционный ряд: $X_1 , dots,  X_n ~ F(X)$
$
  X_((1)) <= X_((2)) <= dots <= X_((n))
$

2. Выборочная функция распределения.
$
hat(F)_n(x) = 1/n sum^n_(i=1) I {X_i <=x }
$

3. Выборочные моменты. 

#set align(center)
#table(
  columns: 3, 
  fill: (col, row) => if row == 0 {rgb("#557fe649")},
  [ ], [Теоретический],[Выборочный],
  [Момент],[$
  L_k = EE(X_1^k)
  $],[$
  hat(L_k)=1/n sum^n_(i=1)X_i^k
  $],
  [Центальный момент],[$
  EE(X_1 - EE(X_1))^k
  $ ],[],
  [Среднее],[],[$
  overline(X)
  $],  
  [Дисперсия],[],[$
  S^2 = 1/n sum^n_(i=1) (X_i - overline(X))
  $],
  [Несмещенная оценка дисперсии],[],[$
  overline(sigma)^2  =1/(n-1) sum^n_(i=1)(X_i - overline(X))^2
  $],
)
#set align(left)



= Выборочная функция распределения.


#set align(center)

#image("/assets/image-41.png", width: 50%)
#set align(left)

$
  hat(F)_n(x) = 1/n sum^n_(i=1) I {X_i <=x }  
$
#set align(center)

#table(
  columns: 2,
  [$xi$],[$
  X_((1)) dots  space X_((n))$],
  [P],[$ 
         1/n quad dots quad 1/n
       $]
)
#set align(left)
$
s.t. quad EE(xi)= sum^n_(i=1) xi_((i)) dot 1/n = overline(X), space hat(L_k)= 1/n sum^n_(i=1) X^k_((i)) = 1/n sum^n_(i=1) X_i^k
$


=== Теорема 1
Пусть $X_1, ... , X_n $ выборка $~ "iid" F$, тогда: 

#let theorem_1 = $
hat(F)_n(X) stretch(->)^P_(n-> infinity)space F(X) space forall X in RR
$

#set align(center)
#block(
  fill: rgb("#ff8c003a"),
  inset: 10pt,
  width: 100%,
  theorem_1
)
#set align(left)


=== Теорема 2 (Гливенко — Кантелли)

#let Glivenko_Cantelli_theorem = $
                                   stretch(sup)_x|hat(F)_n (x) - F(x)| stretch(->)^(p)_(n -> infinity)0
                                 $

#set align(center)
#block(
  fill: rgb("#ff8c003a"),
  inset: 10pt,
  width: 100%,
  Glivenko_Cantelli_theorem
)
#set align(left)

Замечание: 

$
  stretch(sup)_x |hat(F)_n (x) - F(x)| stretch(->)^("почти наверно")_(n -> infinity)0 
$


Сформулируем свойство $hat(F)_n (x)$:


$
  & 1. quad EE (hat(F)_n (x) )= F(x)  \
  & 2. quad "Var"( hat(F)_n (x)) = (F(x) (1 - F(x)))/n  \
  & 3. quad (hat(F) (x) - F(x))/sqrt((F(x)(1-F(x)))/n) stretch(->)^d_(n-> infinity) N (0,1) quad "асимтотическое нормальность"
$



=== Теорема 3 

#let theorem_3 =$"Если" EE(X_1) < infinity:  \   
  & 1. quad E(overline(X)) = E(X_1) quad "несмещенность" \ 
  & 2. quad overline(X) stretch(->)^(p)_(n -> infinity) E(X_1) quad "ЗБЧ" , quad "состоянность" \ 
 & 3. "Если" "Var" X_1 = sigma^2 < infinity, "то " (overline(X)- mu)/(sigma/sqrt(n)) stretch(->)_( n -> infinity)^d N(0,1) 
$


#block(
  fill: rgb("#ff8c003a"),
  inset: 10pt, 
  width: 100%, 
  theorem_3
)
#set align(left)

=== Теорема 4


#let theorem_4 = $"Если" EE(|X_1|^k) < infinity: & \ 
 & 1. quad E(hat(alpha_k)) = alpha_k quad "несмещенность" \
  & 2. quad hat(alpha_k) stretch(->)^(p)_(n -> infinity) alpha_k quad "ЗБЧ" , quad "состоянность" \
  & 3. "Если" "Var" hat(alpha_k) :=  EE|X_1^k - EE(X_1)^k|^2 < infinity = sigma^2 < infinity, "то " \ & (hat(alpha_k)- alpha_k)/(sqrt("Var"(hat(alpha_k)))                                                                                                                                                                                                  q) stretch(->)_( n -> infinity)^d N(0,1)              
$


#block(
  fill: rgb("#ff8c003a"), 
  inset: 10pt, 
  theorem_4, 
  width: 100%
)
