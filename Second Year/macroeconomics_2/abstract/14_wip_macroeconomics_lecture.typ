#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-plot:0.1.3": plot


#show heading: set align(center)
= Макроэкономика 
=== Лекция 14
=== Открытая экономика
=== Экономика и Анализ Данных 
=== Фрейре Серёгина Даниэль Фабиан


#pagebreak()
#show heading: set align(left)

= Откратая экономика 

=== Введение

М

#set align(center)
#table(
  columns: 3, 
   fill: (col, row) => if row == 0 {rgb("#557fe649")},
  [National economy],[interaction],[Foreign economy], 
  [],[],[],
  [],[],[]

)
#set align(left)


Output: Import
Input: Export

Капитал: Активы

=== Balance of payment (BP) 

+ Счет текущих операций (Curreny account (CA))
+ Счет твижение капитала (Capital Flow (CF))
+ Официальне резервы (Official reserves (OF))
w
*Счет текущих операций (Curreny account (CA))*
- Покупка товаров и услуг, прира ($N_X$)
- Изменение трансферных платежей. ($triangle T_R$)
- Разница между процентами выплаты. ($triangle % $)

Когда $"CA" > 0$ - избыток счета текущих операций. Когда $"CA" <0$ - дефицит CA. 

Какая интуитивная разница между CA и CF? 

CF 

#let balance_payment = $
                         "BP" := "CA" + "CF" - triangle "OR" = 0
                       $

*Плавающий валютного курса.*
 
Устанавливает рынок.
$
  triangle "OR" = 0 => "BP" := "CA" + "CF" = 0 =>" CA " = -"CF"
$

*Фиксированный валютный курс.*

Устанавливает ЦБ. 
$
  triangle "OR" != 0 => "BP" : "CA" + "CF" = triangle "OR"
$

*Прямой валютный курс*
$
  Epsilon^(f/d) - "1 единица нац. валюты в иностр. валюты." 
$

*Обратный валютный курс*
$
  Epsilon^(d/f) - "1 единица иностр. валюты в нац. валюты."
$

Замечание: Мы всегда предпологаем что национальная валюта это Российсский рубль. 


*Прямой реальный валютный курс.*
$
  epsilon^(f/d) = (p^d dot Epsilon^(f/d))/p^f
$

*Прямой обратный валютный курс.*
$
  epsilon^(d/f) = (p^d dot Epsilon^(d/f))/p^d
$

#let example = $ "McD index, price of McD in russia / conversion times price in usd  "
200/(75 dot 5.4) approx 0.49 ("rub is weaker is than the usd")
$

#block(
  fill: rgb("#577fe649"), 
  inset: 10pt, 
  example, 
  width: 100%,
)



Валютный рынок 


#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: "", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)
      plot.add(x => -x + 10, domain: (2,8), label: $X^S_("rub")$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $X^d_("rub")$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 



      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: "", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)

      }
    )
  })
)
#set align(left)

Предпосылка: 
- Предложение на валюту резиденты 
- Спрос на валюту будут держась не резиденты


Если ЦБ хочет 

#set align(center)
#canvas({
  import draw: *

  plot.plot( // currency market 
    size: (6, 6),
    
    x-label: $"rub"$,
    y-label: $Epsilon^("$"/"rub")$,

    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: 0, y-max: 10,
    legend: "east",

    {
      let domain = (0, 10)
      //default 
      plot.add(x => -x + 10, domain: (2,8), label: $X^S_("rub")$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $X^d_("rub")$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      plot.add(x => x, domain: (2,8), label: $X^d_("rub")$, style: (stroke: rgb("#938c8c")))
    }
  )
})
#set align(left)


Рассмотрим пример.

Америкацны захотели купить квартику в Москве при условии плавающиего валютного курса ($triangle "OR" = 0$)

#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: "", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)
      plot.add(x => -x + 10, domain: (2,8), label: $X^S_("rub")$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $X^d_("rub")$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 



      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: "", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)

      plot.add(x => -x + 10, domain: (2,8), label: $X^S_("$")$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $X^d_("$")$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 


      }
    )
  })
)

#set align(left)

Формально:

$
  & (0) := "CA"_0 + "CF"_0 = 0 quad (X^d_r = X^s_r) \ 
  & (0) -> (1) := ("CA"_0 + "CF"_1) > 0 quad  (X^d_r > X^d_r) \ 
  & (2) := Epsilon^(f/d) arrow.t space  stretch(=>)^("Согласно условию М-Л") space N_X arrow.b => "CA" arrow.b ==> "CA"_1 + "CF"_1 = 0  quad (X^d_r = X^s_r)\

$



=== Условие Маршала - Лернера 

Необходимо вспомнить микроэкономику. 

#set align(center)
#canvas({
  import draw: *

  plot.plot( //  rubles in microeconomics
    size: (6, 6),
    
    x-label: $Q_"rub"$,
    y-label: $P_"rub"$,

    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: 0, y-max: 10,
    legend: "east",

    {
      let domain = (0, 10)
      //default 
      plot.add(x => -x + 10, domain: (2,8), label: $X^S_("rub")$, style: (stroke: rgb("#000000")))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 


      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

    }
  )
})
#set align(left)

Рассмотрим аналогичный пример только длят


Америкацны захотели купить квартику в Москве при условии фиксированного валютного курса ($triangle "OR" = 0$)

#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: $"rub"$, y-label: $Epsilon^(f/d)$,       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "east",
      {
        let domain = (0, 10)
      plot.add(x => -x + 10, domain: (2,8), label: $X^S_("rub")$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $X^d_("rub")$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      plot.add(x => -x + 12, domain: (3,9), label: $X^S_("rub")$, style: (stroke: rgb("#ff0000")))
      plot.add(((6, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none)) 
      plot.add(((6, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none)) 


      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: "", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "east",
      {
        let domain = (0, 10)

      plot.add(x => -x + 10, domain: (2,8), label: $X^S_("$")$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $X^d_("$")$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      plot.add(x => -x + 12, domain: (3,9), label: $X^S_("$")$, style: (stroke: rgb(red)))
      plot.add(x => x - 2, domain: (3,9), label: $X^d_("$")$, style: (stroke: rgb(orange)))
      plot.add(((6, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none)) 
      }
    )
  })
)

#set align(left)

Необходимо условие того что ЦБ фиксирует курс нац валюты. 


Но теперь необходимо рассмотреть что будет если ЦБ покупает валюту и продает валюту. 

#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: $"rub"$, y-label: $Epsilon^(f/d)$,       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)
      plot.add(x => -x + 10, domain: (2,8), label: $X^S_("rub")$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $X^d_("rub")$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      plot.add(x => x - 2 , domain: (3,9), label: $X^d_("r") ("OR" arrow.t)$, style: (stroke: rgb(blue)))
      plot.add(x => x + 2 , domain: (1,7), label: $X^d_("r") ("OR" arrow.b)$, style: (stroke: rgb(green)))

      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: "$", y-label: $Epsilon^(d/f)$,       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)

      plot.add(x => -x + 10, domain: (2,8), label: $X^S_("$")$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $X^d_("$")$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 


      }
    )
  })
)

#set align(left)


Формально: 

$
  & (0) : = "CA"_0 + "CF"_0 = 0quad ()
$

Есть стерилизовонные и не стерилизовонные резервы. 

Не стерилизоанная валютная интервенция. (Приводит к изменению денежного предложения).

#set align(center)
#table(
  columns: 2, 
  [A], [П],
  [$arrow.t$ OR], [Cash $arrow.b$], 
  [$"B"_"цб"$],[RR]
)
#set align(left)

----

*Спекулативная атака.*

Возможна только при фикс нац курса, и стоимость инностр валюты занижены. 

#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: $"rub"$, y-label: $Epsilon^(f/d)$,       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)
      plot.add(x => -x + 10, domain: (2,8), label: $X^S_("rub")$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $X^d_("rub")$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 10, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 


      plot.add(x => x -2 , domain: (3,9), label: $X^d_("rub")$, style: (stroke: rgb(red)))
      plot.add(((6, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none)) 

      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: "$", y-label: $Epsilon^(d/f)$,       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)
      plot.add(x => -x + 10, domain: (2,8), label: $X^S_("$")$, style: (stroke: rgb("#000000")))
      plot.add(x => x + 2, domain: (2,7), label: $X^d_("$")$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(4, max: 6, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(6, max: 10, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((4, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      plot.add(x => -x + 12, domain: (3,9), label: $X^S_("$")$, style: (stroke: rgb(red)))
      plot.add(((5, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none)) 

      plot.add-hline(7, max: 5, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
      plot.add-vline(5, max: 7, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
      }
    )
  })
)
