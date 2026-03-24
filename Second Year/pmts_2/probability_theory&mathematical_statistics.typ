#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-plot:0.1.3": plot

#show heading: set align(center)
#show block: set align(center)

#set document(
  title: [
    #text(size: 16pt, weight: "bold")[Probability Theory Mathematical Statistics Handbook]

    #text(size: 16pt)[Faculty of Economic Sciences]

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


= Метод максимального правдоподобия 2.0

=== Свойство инвариантности метода максимального правдоподобия (ММП). 

Пример:
#let example = $
               & "Пусть есть выборка" X_1, dots, X_n ~ Pi(lambda) \ 
               & "Было показано на прошлой лекции что по ММП:" hat(lambda)  = overline(x) \
               & "Запишем вер. того что придут все:" P(X = 0) = e^(-lambda) dot (lambda^0)/(0!) = e^lambda \ 
               & "Как можно оценить данную вероятность?" hat(P(X= 0) ) = e^(hat(-lambda)) dot (hat(lambda)^0)/(0!) = e^(hat(-lambda)) = e^(overline(-x))
               $

#block(
  width: 100%, 
  inset: 10pt,
  stroke: 0.2pt,
  fill: rgb(0,0,100,50), 
  example

)

Инвариантность говорит что мы можем так сделать. 

#let invarinat = $
                   hat(g(theta)) = g(hat(theta)) - "оценка максимального правподобия (МП) для" g(theta)
                 $

Формально, определение инвариантности: 
#block(
  width: 100%, 
  inset: 10pt,
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50),
  invarinat

)

=== Если эффективна оценка $exists$, то она совпадает с ОМП

== Информация Фишера 

=== *Информация Фишера в одном наблюдении.*

#let small_fisher_information = $
& "Supoose that:" X_1, dots, X_n ~ F(x, theta).' \
& "The fisher information of parameter" theta ", present в одном наблюдении." \ 
& i(theta) = EE [(delta (ln f))^2/delta(theta)] , "where" f "обобщенная n плотность"

$

#block(
  width: 100%, 
  inset: 10pt,
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50),
  small_fisher_information
)

=== *Информация Фишера в выборки наблюдений.*


#let large_fisher_information = $
& "Supoose that:" X_1, dots, X_n ~ F(x, theta).' \
& "The fisher information of parameter" theta ", present во всей выборки" \ 
& Iota(theta) = EE [(delta (ln L))^2/delta(theta)] = n dot i(theta),  "где" L "функция правдоподобия."

$

#block(
  width: 100%, 
  inset: 10pt,
  stroke: 0.2pt, 
  fill: rgb(100, 0, 100, 50),
  large_fisher_information
)


_*Доказать данное на бонус*_

*Утверждение.*
При некоторых условиях. 
$
  i(theta) = EE [(delta (ln f))^2/delta(theta)]  = - EE (delta^2  ln f)/(delta theta^2) 
$



#let statement_proof = $
 quad square \
  & "Fisrt direction:" \
  & EE(delta(ln f))/(delta(theta)) overbracket(=, "to be proved") 0  \ 
  & EE(delta(ln f))/(delta(theta))  = integral^infinity_(-infinity)  (delta(ln f))/(delta theta) dot f "dx"  =  integral^(infinity)_(-infinity) 1/f dot delta(f)/delta(theta) dot f "dx"  = delta/delta(theta) integral^(infinity)_(-infinity) f "dx" = 0 \
  & "Second direction:" \ 
  & integral^(infinity)_(-infinity) delta(ln f)/delta(theta) dot f  "dx" overbracket(=,"tbp") 0 \ 
  & integral^(infinity)_(-infinity) (delta^2(ln f))/delta(theta^2) dot d "dx"  + integral^(infinity)_(-infinity) delta(ln f)/delta(theta) dot delta(f)/delta(theta) "dx" = EE(((delta^2 (ln f))/delta(theta^2))) + integral^(infinity)_(-infinity) delta(ln f)/delta(theta) dot delta(f)/delta(theta) "dx" = 0 \ 
  & "incomplete to be written down later" \ 

  quad square.filled 
$


#block(
  width: 100%, 
  inset: 10pt,
  stroke: 0.2pt, 
  fill: rgb(0, 100, 0, 50),
  statement_proof
)





#let example = $
                 & X_1, dots, X_n ~ N (underbracket(mu, ?), sigma^2) \ 
                & i(u) := underbracket(EE((delta(ln f))/(delta(mu)))^2, (1)) = - underbracket(EE((delta^2 (ln f))/(delta(mu^2))),(2))  \
                & (1 ) := EE((delta(ln f))/(delta(mu)))^2 \
                &  f(x) = 1/(sqrt(2 pi)  dot sigma) dot e^(-1/2 dot ((x-u)/sigma)^2) \ 
                & ln f(x) = -1/2 ln 2 pi - ln sigma -1/2 ((x-mu)/sigma)^2  => delta(ln f(x))/delta(mu) = -1/2 dot 2 ((x-u)/sigma) dot (-1/sigma) = (x-u)/sigma^2 \
                & i(u) = EE((x-u)/sigma^2)^2 = 1/sigma^4 dot EE(x - mu)^2 = sigma^2/sigma^4 = 1/sigma^2  \ 
                & (2) := EE((delta^2 (ln f))/(delta(mu^2))) \ 
                & (delta^2 (ln f))/(delta(mu^2)) = delta/delta(mu) dot ((x-u)/sigma^2) = - 1/sigma^2
               $


  #block(
  width: 100%, 
  inset: 10pt,
  stroke: 0.2pt,
  fill: rgb(0,0,100,50), 
  example

)

Получается что информация Фишера пропорциональна обратна мат-ож. 



== Неравенство Рау-Крамера-Фреше (Критерий эффективности.)

Для регулярных (Область значений не зависит от параметра $theta$) моделей и при выполнений некоторых условий. Верно что: 


#let cramer_rau_freshe_bounnd = $
                                  "Var" (hat(theta)) >= ((1 + (delta(b(theta)))/(delta(theta)))^2)/Iota(theta) , quad b(theta) := EE(hat(theta) - theta)
                                $
#block(
  width: 100%, 
  inset: 10pt,
  stroke: 0.2pt,
  fill: rgb(100,0,50,50), 
  cramer_rau_freshe_bounnd
)


Если мы хотм сделать это для MSE. 

#let cramer_rau_freshe_bounnd_for_mse = $
                                  EE(hat(theta) - theta)^2 >= ((1 + (delta(b(theta)))/(delta(theta)))^2)/Iota(theta) + (b(theta))^2 , quad b(theta) := EE(hat(theta) - theta)
                                $
#block(
  width: 100%, 
  inset: 10pt,
  stroke: 0.2pt,
  fill: rgb(100,0,50,50), 
  cramer_rau_freshe_bounnd_for_mse
)

*Замечание.* 

Для несмешенных оценок неравенство Рао-Крамера-Фреше можно упросить: 

#let cramer_rau_freshe_bounnd_simple = $
                                  "Var"(hat(theta)) >= 1/(Iota(theta))
                                $
#block(
  width: 100%, 
  inset: 10pt,
  stroke: 0.2pt,
  fill: rgb(100,0,50,50), 
  cramer_rau_freshe_bounnd_simple
)

*Замечание.*

Как связаны Var & MSE.

#let var_mse_relation = $
                                  "MSE" := EE(hat(theta)- theta)^2 = "Var" hat(theta) + b^2 (theta)
                                $
#block(
  width: 100%, 
  inset: 10pt,
  stroke: 0.2pt,
  fill: rgb(100,0,50,50), 
  var_mse_relation
)

#let statement_proof = $
  quad square \
  &  EE(hat(theta)-theta)^2 = EE[(hat(theta)- EE(hat(theta)) )] + [EE(hat(theta)- theta)]^2 = \ 
  & = underbracket(EE(hat(theta) - EE(hat((hat(theta)))))^2, "Var"(theta) ) + b^2(theta) + 2 b (theta) dot underbracket(EE(hat(theta) - EE(hat(theta)- EE(hat(theta)))), 0) "Var"(theta) + b^2(theta) \ 
quad square.filled 
$


#block(
  width: 100%, 
  inset: 10pt,
  stroke: 0.2pt, 
  fill: rgb(0, 100, 0, 50),
  statement_proof
)

