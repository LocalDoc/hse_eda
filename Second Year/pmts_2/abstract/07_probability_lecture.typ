#import "@preview/cetz:0.4.2"

#show heading: set align(center)
= Теория вероятности и математическая статистика 
=== Лекция 7
=== Теорема Гливенко — Кантелли (и пропуск)
=== Экономика и анализ данных 
=== Фрейре Серёгина Даниэль Фабиан


#pagebreak()
#show heading: set align(left)


something something missed half the lecture 

$
  hat(F)_n(x) = 1/n sum^n_(i=1) I {X_i <=x } = 1/n F(x) (1 - F(x)) <= 1/(4n) 
$

=== Теорема Гливенко — Кантелли

#let Glivenko_Cantelli_theorem = $
                                   stretch(sup)_x|hat(F)_n (x) - F(x)| stretch(->)^(p)_(n -> infinity)0
                                 $

#set align(center)
#block(
  fill: rgb("#ff8c003a"),
  inset: 10pt,
  Glivenko_Cantelli_theorem
)
#set align(left)

Замечание: 

$
  stretch(sup)_x |hat(F)_n (x) - F(x)| stretch(->)^("почти наверно")_(n -> infinity)0 
$


Сформулируем свойство $hat(F)_n (x)$:

$
  1. quad EE (hat(F)_n (x) )= F(x)  \
  2. quad "Var"( hat(F)_n (x)) = (F(x) (1 - F(x)))/n  \
  3. quad (hat(F) (x) - F(x))/sqrt((F(x)(1-F(x)))/n) stretch(->)^d_(n-> infinity) N (0,1) quad "асимтотическое нормальность"
$



=== Теорема 3 

#let theorem_3 =$   
& "Если" EE(X_1) < infinity:  \   
  & 1. quad E(overline(X)) = E(X_1) quad "несмещенность" \ 
  & 2. quad overline(X) stretch(->)^(p)_(n -> infinity) E(X_1) quad "ЗБЧ" , quad "состоянность" \ 
 & 3. "Если" "Var" X_1 = sigma^2 < infinity, "то " (overline(X)- mu)/(sigma/sqrt(n)) stretch(->)_( n -> infinity)^d N(0,1) 
$


#block(
  fill: rgb("#ff8c003a"),
  inset: 10pt, 
  theorem_3
)
#set align(left)



=== Теорема 4

#let theorem_4 = $
 & "Если" EE(|X_1|^k) < infinity:  \ 
 & 1. quad E(hat(alpha_k)) = alpha_k quad "несмещенность" \
  & 2. quad hat(alpha_k) stretch(->)^(p)_(n -> infinity) alpha_k quad "ЗБЧ" , quad "состоянность" \
  & 3. "Если" "Var" hat(alpha_k) :=  EE|X_1^k - EE(X_1)^k|^2 < infinity = sigma^2 < infinity, "то " (hat(alpha_k)- alpha_k)/(sqrt("Var"(hat(alpha_k)))                                                                                                                                                                                                  q) stretch(->)_( n -> infinity)^d N(0,1)              
$


#block(
  fill: rgb("#ff8c003a"), 
  inset: 10pt, 
  theorem_4
)
