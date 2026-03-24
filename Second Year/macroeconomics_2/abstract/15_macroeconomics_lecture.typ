#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-plot:0.1.3": plot

#show heading: set align(center)
#show block: set align(center)
= Макроэкономика 
=== Лекция 15
=== Моделирование валютного курса
=== Экономика и Анализ Данных 
=== Фрейре Серёгина Даниэль Фабиан


#pagebreak()




= Моделирование валютного курса (вне КК)

Моделирование валютного курса можно осущесвить: 

На основе соотношения цен в моровой экономики: на основе абсолютного или относительного *паритета покупательной способномсти*. 

На основе соотношения доходов нац и иностранных активов, т.е. на основе непокрытого *процентого париета*. 

На основе *равестна потоков*: Валютный курс уравнивает потоки доходов входящие в нац экономику и потоки доходов уходящие в мировую экономику. 



== На основе соотношения цен в моровой экономики.

*Закон единой цены (Law of one price - LOOP)*

Стоимоти одного товара в локальной и инностранной экономике, подсчитанные в одной валюте, равны. 


Индекс Биг-Мага:

#let example = $
                 "domestic price" dot "foreign-domestic conversion rate" = "foreign price" <=> P^d dot A^(f/d) = P^f 
               $


#block(
  fill: rgb("#577fe649"),
  inset: 10pt, 
  width: 100% ,
  stroke: 0.2pt, 
  example
)

*Абсолютный паритет покупательной способномсти (Purchasing power parity PPP).* 

Валюты двух стран обладают одинаковой покупательной спобностю т.е. реальный валютный курс равен 1. 



#let PPP = $
P^f = P^d dot E^(f/d) , quad  epsilon^(f/d) = (p^d dot E^(f/d))/p^f = 1

$

#block(
  fill:  rgb("#ff8c003a"),
  inset: 10pt, 
  width: 100%, 
  stroke: 0.2pt, 
  PPP
)

Данный метод сошелся на нет, так как нету сделок с активам, а в этом методе торговля takes center stage. 

Так-же, не учитивается неторгуемый сектор. 

Detour: 

Suppose: $G arrow.t => arrow.t p^d$

#set align(center)
#canvas({
  import draw: *

  plot.plot( //IS - LM model 
    size: (6, 6),
    
    x-label: $"Y"$,
    y-label: $"R"$,

    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: 0, y-max: 10,
    legend: "east",

    {
      let domain = (0, 10)
      //default 
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      plot.add(x => -x + 12, domain: (3,9), label: $"IS"$, style: (stroke: rgb(red)))



    }
  )
})
#set align(left)

#set align(center)
#canvas({
  import draw: *

  plot.plot( //IS - LM model 
    size: (6, 6),
    
    x-label: $"Y"$,
    y-label: $"P"$,

    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: 0, y-max: 10,
    legend: "east",

    {
      let domain = (0, 10)
      //default 
      plot.add(x => -x + 10, domain: (2,8), label: $"AD"$, style: (stroke: rgb("#000000")))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 
    }
  )
})
#set align(left)


Now if we are to explore $M arrow.t => arrow.t p^d$

#set align(center)
#canvas({
  import draw: *

  plot.plot( //IS - LM model 
    size: (6, 6),
    
    x-label: $"Y"$,
    y-label: $"R"$,

    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: 0, y-max: 10,
    legend: "east",

    {
      let domain = (0, 10)
      //default 
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"$, style: (stroke: rgb("#000000")))
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      plot.add(x => -x + 8, domain: (1,7), label: $"IS"$, style: (stroke: rgb(red)))
    


    }
  )
})
#set align(left)

#set align(center)
#canvas({
  import draw: *

  plot.plot( //IS - LM model 
    size: (6, 6),
    
    x-label: $"Y"$,
    y-label: $"P"$,

    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: 0, y-max: 10,
    legend: "east",

    {
      let domain = (0, 10)
      //default 
      plot.add(x => -x + 10, domain: (2,8), label: $"AD"$, style: (stroke: rgb("#000000")))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 
    }
  )
})
#set align(left)

As a result we are able to say:

#set align(center)
#canvas({ //currency model f/d with price 
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: $"P"^"d"$, y-label: $"p"^"f"$,       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "east",
      {
        let domain = (0, 10)
      plot.add(x => x, domain: domain, style: (stroke: black),label: $"E"_1^("f"/"d") dot p^d$)
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#938c8c"), dash: "dotted", thickness: 1pt)))
      plot.add(((4, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#938c8c"), dash: "dotted", thickness: 1pt)))
       
      plot.add(x => x * 1/2, domain: domain, style: (stroke: green),label: $"E"^("f"/"d") dot p^d$)
      plot.add(((3, 3),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))
      plot.add(((3, 1.5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))
      plot.add-vline(3, max: 3, style: (stroke: (paint: rgb("#938c8c"), dash: "dotted", thickness: 1pt)))



      
    }
    )
  })
#set align(left)

Formally: 

$
  epsilon^(f/d) = (p^d arrow.t dot E^(f/d) arrow.b)
$

Сдержив фиск политика 

#set align(center)
#canvas({ //currency model f/d with price 
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: $"P"^"d"$, y-label: $"p"^"f"$,       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "east",
      {
        let domain = (0, 10)
      plot.add(x => x, domain: domain, style: (stroke: black),label: $"E"_1^("f"/"d") dot p^d$)
      plot.add-vline(4, max: 4, style: (stroke: (paint: rgb("#938c8c"), dash: "dotted", thickness: 1pt)))
      plot.add(((4, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      plot.add-hline(4, max: 8, style: (stroke: (paint: rgb("#938c8c"), dash: "dotted", thickness: 1pt)))
       
      plot.add(x => x * 1/2, domain: domain, style: (stroke: green),label: $"E"^("f"/"d") dot p^d$)
      plot.add(((8, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
      plot.add-vline(8, max: 3, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))

      plot.add(x => x * 2, domain: domain, style: (stroke: blue),label: $"E"_3^("f"/"d") dot p^d$)
      plot.add(((2, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: blue, thickness: 2pt), fill: blue), style: (stroke: none))
      plot.add-vline(2, max: 4, style: (stroke: (paint: rgb(blue), dash: "dotted", thickness: 1pt)))


      
    }
    )
  })
#set align(left)



*Относительный паритет покупательной способномсти (Relative purchasing power parity).*


Показывает что должно произойти с валютой чтобы сохранилась некая const in: 

$
epsilon^(f/d) = (p^d dot E^(f/d))/p^f = "some const"
$

We can further what is happening by: 

$
  underbracket((d ln p^d )/(d t), pi^d + g_(E^(f/d) ) - pi^f = 0) + (d ln E^(f/d))/(d t) - (d ln p^f)/(d t) = underbracket((d ln "cosnt")/(d t) , 0)
$

Условие при котором соотношениние покупательной способоности валют двух стран остается неизменным. 

#let RPPP = $g_(E^(f/d)) = pi^f - pi^d = (E_t - E_(t-1))/E_t$

#block(
  fill:  rgb("#ff8c003a"),
  inset: 10pt, 
  width: 100%, 
  stroke: 0.2pt, 
  RPPP
)

*PPP и валютный курс.*

Для осознания изменений на валютном крсе 

#set align(center)
#canvas({ //currency model f/d with price 
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: $"P"^"f"$, y-label: $"E"^("f"/"d")$,       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "east",
      {
        let domain = (0, 10)
      plot.add(x => x, domain: domain, style: (stroke: black),label: $"E"^("f"/"d")$)
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#938c8c"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      plot.add(x => x * 1/2, domain: domain, style: (stroke: black),label: $"E"^("f"/"d")$)
      plot.add(((3, 3),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))
      plot.add(((3, 1.5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))
      plot.add-vline(3, max: 3, style: (stroke: (paint: rgb("#938c8c"), dash: "dotted", thickness: 1pt)))



      
    }
    )
  })
#set align(left)


== На основе соотношения доходов нац и иностранных активов.

Моделирование через притока и оттока капитала. 

Предпосылка: Абсолютная мобильность капитала. Всегда формируется через обратный валютный курс. 


#table(
  columns: 3, 
  fill: (col, row) => if row == 0 {rgb("#557fe649")},
  [],[Сумма в момент $t$ (rub)],[Сумма в ($t+1$) момент времени (rub)],
  [domestic economy],[$
  x
  $],[$
  x(1 + R^d)
  $],
  [foreign economy],[$
  x/(E^(d/f)_t)
  $],[$
        x (1 + R^f) dot (E_(t+1)^(d/f))/E_t^(d/f)
      $]

)

*Процентный арбираж.*

*Процентный паритет*

#let R_d = $
R^d = R^f + (E^(d/f)_(t+1) - E^(d/f)_t)/E_t^(d/f)
$

#block(
  fill:  rgb("#ff8c003a"),
  inset: 10pt, 
  width: 100%, 
  stroke: 0.2pt, 
  R_d
)

There was names that I missed here. $E_t$ has a (-) effect, $E_(t-1)$ has a (+) effect.


continue onwards (new top)

$
  R^d = R^f + (E_(t+1) - E_t)/E_t
$


*Покрытый процентный паритет.*

$
  R^d = R^f + (E^f = E_t)/E_t  
$


*Непокрытый процентный паритет.*

$
  R^d = R^f + (E^e_t_1 - E_t)/E^t
$

Данная форма неявным образом добавила предпосылку что в обеих странах "риск" равен.

Обычно мы будем работать с непокрытым процентным паритетом. 

*Непокрытый процентный паритет с перемией за риск.*

$
  R^d = R^f + (E^e_t_1 - E_t)/E^t  + rho 
$

=== Рассмотрим шоки на данной модели. 


$
  M arrow.t
$


We will use: 


$
   R^d = R^f + (E^e_t_1 - E_t)/E^t  
$

#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (5.9, 5.9),
      x-label: $M/P$, y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)

        plot.add(x => -x + 10 , domain: (2,8), label: $m^d (Y)$, style: (stroke: black))

        plot.add-hline(5, min: 0, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add-vline(5, label: $
        M^S/P
        $, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))

        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

        plot.add(((7, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
        plot.add-hline(5, min: 5, max: 7, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))



        plot.add-vline(7, label: $
        M_2^S/P
        $, style: (stroke: (paint: rgb(red), thickness: 1pt)))
        plot.add(((7, 3),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
        plot.add-hline(3, min: 0, max: 7, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))

      }
    )
  }),
  canvas({
    import draw: *
    plot.plot(
      size: (5.9, 5.9),
      x-label: "R", y-label: $"E"^(d/f)$,       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)

        plot.add(x => -x + 10 , domain: (2,8), label: $R^d$, style: (stroke: black))

        plot.add-hline(5, min: 0, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add-vline(5, label: $R_1$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))

        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

        plot.add-vline(3, label: $R_2$, style: (stroke: (paint: rgb(red), thickness: 1pt)))
        plot.add(((3, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))

        plot.add(((3, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
        plot.add-hline(7, min: 0, max: 3, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))

      }
    )
  })
)
#set align(left)

Formally:

$
  M arrow.t => ... => R arrow.b => "Income dom Aktiv" < "Income foreign aktiv in rub" => "demand for foreign Aktiv " arrow.t \ => "demand for foreign currency" => "price foreign currency" arrow.t ("price dom currency" arrow.b)
$

As a result: 

$
  E = E_3 , quad R^d = R^f + (E^e_(t+1) - E_t)/E_t
$

Now describe a change: $P arrow.t$

#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (5.9, 5.9),
      x-label: $M/P$, y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)

        plot.add(x => -x + 10 , domain: (2,8), label: $m^d (Y)$, style: (stroke: black))

        plot.add-hline(5, min: 0, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add-vline(5, label: $
        M^S/P
        $, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))

        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

        plot.add(((3, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
        plot.add-hline(5, min: 5, max: 7, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))



        plot.add-vline(3, label: $
        M_2^S/P
        $, style: (stroke: (paint: rgb(red), thickness: 1pt)))
        plot.add(((3, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))

      }
    )
  }),
  canvas({
    import draw: *
    plot.plot(
      size: (5.9, 5.9),
      x-label: "R", y-label: $"E"^(d/f)$,       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)

        plot.add(x => -x + 10 , domain: (2,8), label: $R^d$, style: (stroke: black))

        plot.add-hline(5, min: 0, max: 7, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add-vline(5, label: $R_1$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))

        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

        plot.add-vline(7, label: $R_2$, style: (stroke: (paint: rgb(red), thickness: 1pt)))
        plot.add(((7, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))

        plot.add(((7,3),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
        plot.add-hline(3, min: 0, max: 7, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))

      }
    )
  })
)
#set align(left)

As a result: $arrow.t p => E(f/d) arrow.t$

Рассмотрим финансовый рынок инностранной экономики: 

#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (5.9, 5.9),
      x-label: $M/P$, y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)

        plot.add(x => -x + 10 , domain: (2,8), label: $m^d (Y)$, style: (stroke: black))

        plot.add-hline(5, min: 0, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add-vline(5, label: $
        M^S/P
        $, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))

        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

        plot.add(x => -x + 12 , domain: (3,9), label: $m^d (Y)$, style: (stroke: red))

        plot.add(((5, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
        plot.add-hline(7, min: 0, max: 5, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))
      }
    )
  }),
  canvas({
    import draw: *
    plot.plot(
      size: (5.9, 5.9),
      x-label: "R", y-label: $"E"^(d/f)$,       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)

        plot.add(x => -x + 10 , domain: (2,8), label: $R^d$, style: (stroke: black))

        plot.add-hline(5, min: 0, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add-vline(5, label: $ R_1 $, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

        plot.add(x => -x + 12 , domain: (3,9), label: $
        R^d_2 $, style: (stroke: red))
        plot.add(((7, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))

        plot.add(((5, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
        plot.add-hline(7, min: 0, max: 5, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))

      }
    )
  })
)
#set align(left)

Now we will review what happens when there are changes in expectations. 

#set align(center)
#canvas({ //currency model f/d with price 
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: $"R"$, y-label: $"E"^("d"/"f")$,       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "east",
      {
        let domain = (0, 10)

        plot.add(x => -x + 10 , domain: (2,8), label: $ R^f + (E^e_(t+ 1) - E_t)/(E_t) $, style: (stroke: black))

        plot.add-hline(5, min: 0, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add-vline(5, label: $
        M^S/P
        $, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))

        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

        plot.add(x => -x + 12 , domain: (3,9), label: $m^d (Y)$, style: (stroke: red))

        plot.add(((5, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
        plot.add-hline(7, min: 0, max: 5, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))

  
    }
    )
  })
#set align(left)



=== True and false response template:

Write out the economic shock. ($|I'_R| arrow.t$)

Write out your objective. ($"эффект фискальной политики"$)

Describe the correct effect of the shock, formally, visually and logically and only then take a look at the statement presented before you. 

$
k_("FP")=(m^(d'_R))/((1-alpha)dot m^(d')_R) + I'_R dot m^"d'"_Y
$

When evaluating a certain policy, we should show it through the use of two separate economies. 


Supoose: $|I'_R|_A > |I'_R|_B$

#set align(center)
#grid(
  columns: (1fr, 1fr, 1fr), 
  gutter: 1em,  

  canvas({
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: "Y", y-label: "AE",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)

      plot.add(x => x, domain: domain, style: (stroke: black),label: $"AE"_f$)
      plot.add(x => x * 1/2 + 2.5, domain: domain, style: (stroke: black), label: $"AE"_(p l)$)
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#938c8c"), dash: "dotted", thickness: 1pt)))

      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: "Y", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)

        plot.add(x => -x + 10 , domain: (2,8), label: $ m^d (Y) $, style: (stroke: black))

        plot.add-hline(5, min: 0, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add-vline(5, label: $M^S/P$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))

        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: "Y", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)

      plot.add(x => -x + 10, domain: (2,8), label: $"S"_"ЦБ"$, style: (stroke: rgb("#000000")))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      }
    )
  })
)
#set align(left)

