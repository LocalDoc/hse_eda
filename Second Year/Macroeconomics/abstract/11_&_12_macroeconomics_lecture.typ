#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-plot:0.1.3": plot

#show heading: set align(center)

= Макроэкономика 
=== Лекция 11 - 12 
=== Эффективность фискальной и монетарной политики в модели IS-LM
=== Экономика и Анализ Данных 
=== Фрейре Серёгина Даниэль Фабиан


#pagebreak()

= Эффективность фискальной политики в модели IS-LM

*Трансмиссионный механизм фискальной политики.* 

Мы будем называть трансмиссионным механизмом фискальной политики три упорядочных графика которые показывают эффекты фискальной политики. Так как фискальная политика влияет на $"AE"$ то мы будем 

#set align(center)
#grid(
  columns: (1fr, 1fr, 1fr), 
  gutter: 1em,  

  canvas({
    import draw: *
    plot.plot( // financial market  
      size: (4.9, 4.9),
      x-label: "Y", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 10, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      plot.add(x => -x + 12, domain: (3,9), label: $"IS"_2$, style: (stroke: rgb(red)))
      plot.add(((7, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
      plot.add-vline(7, max: 7, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
      plot.add-hline(7, max: 10, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))


      plot.add(((6, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
      plot.add-hline(6, min:0,  max: 10, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))
      plot.add-vline(6, max: 6, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))

      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: $"M"/"P"$, y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)
        plot.add(x => -x + 10 , domain: (2,8), label: $ m^d (Y_1) $, style: (stroke: black))
        plot.add-hline(5, min: 0, max: 10, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add-vline(5, label: $M^S/P$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))

        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

        plot.add-hline(7, max: 10, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
        plot.add(x => -x + 12 , domain: (2,8), label: $ m^d (Y_2) $, style: (stroke: red))
        plot.add(((5, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
        
        plot.add-hline(6, min:0,  max: 10, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))
        plot.add(x => -x + 11 , domain: (2,8), label: $ m^d (Y_3) $, style: (stroke: green))

      }
    )
  }),

  canvas({
    import draw: *
    plot.plot( //investment model  
      size: (4.9, 4.9),
      x-label: "I", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)
      plot.add(x => -x + 10, domain: (2,8), label: $"tbf"$, style: (stroke: rgb("#000000")))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))  
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))


      plot.add-hline(6, max: 4, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))
      plot.add(((4, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
      plot.add-vline(4, max: 6, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))
      }
    )
  })
)
#set align(left)


*Чувствительность спроса на деньги к ставке процента и эффект вытеснения.*


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
      legend: "south",
      {
        let domain = (0, 10)

        plot.add(x => -x + 10 , domain: (2,8), label: $ m^d (Y_1) $, style: (stroke: black))
        plot.add-hline(5, min: 0, max: 10, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add-vline(5, label: $M^S/P$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))

        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

        plot.add-hline(7, max: 10, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
        plot.add(x => -x + 12 , domain: (2,8), label: $ m^d (Y_2) $, style: (stroke: red))
        plot.add(((5, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
        
        plot.add-hline(6, min:0,  max: 10, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))
        plot.add(x => -x + 11 , domain: (2,8), label: $ m^d (Y_3) $, style: (stroke: green))

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
      legend: "south",
      {
        let domain = (0, 10)

      }
    )
  })
)
#set align(left)


*Чувствительность спроса на деньги к доходу и эффект вытеснения.*

#set align(center)
#grid(
  columns: (1fr, 1fr, 1fr), 
  gutter: 1em,  

  canvas({
    import draw: *
    plot.plot( // financial market  
      size: (4.9, 4.9),
      x-label: $"M"/"P"$, y-label: "R",          
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)
        plot.add(x => -x + 10 , domain: (2,8), label: $ m^d (Y_1) $, style: (stroke: black))
        plot.add-hline(5, min: 0, max: 10, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add-vline(5, label: $M^S/P$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))



      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: $"M"/"P"$, y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)
        plot.add(x => -x + 10 , domain: (2,8), label: $ m^d (Y_1) $, style: (stroke: black))
        plot.add-hline(5, min: 0, max: 10, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add-vline(5, label: $M^S/P$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))



      }
    )
  }),

  canvas({
    import draw: *
    plot.plot( //investment model  
      size: (4.9, 4.9),
      x-label: "I", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)
      plot.add(x => -x + 10, domain: (2,8), label: $"I"$, style: (stroke: rgb("#000000")))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))  
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
      }
    )
  })
)
#set align(left)


*Чувствительность инвестиций к ставке процента и эффект вытеснения.*

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
      legend: "south",
      {
        let domain = (0, 10)

        plot.add(x => -x + 10 , domain: (2,8), label: $ m^d (Y_1) $, style: (stroke: black))
        plot.add-hline(5, min: 0, max: 10, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add-vline(5, label: $M^S/P$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))

        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

        plot.add-hline(7, max: 10, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
        plot.add(x => -x + 12 , domain: (2,8), label: $ m^d (Y_2) $, style: (stroke: red))
        plot.add(((5, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
        
        plot.add-hline(6, min:0,  max: 10, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))
        plot.add(x => -x + 11 , domain: (2,8), label: $ m^d (Y_3) $, style: (stroke: green))

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
      legend: "south",
      {
        let domain = (0, 10)

      }
    )
  })
)
#set align(left)

Чтобы оценить Эффективность фискальной политики можно использовать мультипликатор фискальной политики: 

$
  k_("fp") = (m^d'_R)/((1-alpha) dot m^d'_R + I'_R dot m^d'_Y)
$

$
  triangle Y = k_("fp") dot triangle A_0 
$

Как некоторые вещи поливают на mult 
$
  |m^d'_R| arrow.t , m^d'_Y arrow.t, |I'_R| arrow.t, alpha 
$


$
  k_("fp") = (m^d'_R)/((1-alpha) dot m^d'_R + I'_R dot m^d'_Y) = 1/((1-alpha) +  I'_R dot (m^d'_Y)/(m^d'_R))
$

Как они будут реагировать на эти измененеия: 

$
  |m^d'_R| arrow.t => k_("fc") arrow.t , m^d'_Y arrow.t => k_("fc") arrow.b, |I'_R| arrow.t => k_("fc") arrow.b, alpha => k_("fc") arrow.t 
$


I
 

How did we interpret the fiscal policy in the IS-LM model? (consider that $delta G =  delta B$)

II

Теперь рассмотрим то что мо показали математически сравнив экономики А и B, такие что $|m^d'_R|_A > |m^d'_R|_B, alpha = "const"$, 

III 

+ Первый график не меняется. 
+ Второй меняется. 

$
  m^d = m^d'_Y dot Y + m^d'_R dot R\
  delta (m^d) = m^d'_Y dot delta Y + m^d'_R dot delta R ==> (delta R)/(delta(M/P))|_(m^d) = 1/(m^d'_R)
$

Проводим стимулирующ фискальную политику. 

Измененеия на денежном рынке будут проходить через одну точку, хотя и будут иметь разные наклоны в зависимости от экономики. 

$
  
  triangle Y_("kk") = 1/(1-alpha) dot triangle G , quad triangle Y_("IS-LM") = k_("fp")
$

$
  G arrow.t => Y_1 -> Y_2 => triangle Y_("kk") = 1/(1-alpha) dot triangle G => triangle Y_("kk")_A + triangle Y_("kk")_B ==> Y arrow.t => m^d (Y arrow.t) => \
  m^d (Y_1) -> m^d(Y_2) => m^d > (M^S)/P "and " D_"цб" < S_"цб" => R arrow.t => triangle R_A < triangle R_B => triangle I = I'_R dot triangle R => \
  |triangle I|_A < |triangle I|_B  => A < B => triangle Y_("IS-LM") = triangle Y_("kk") - "Экономика A B" => triangle Y_("IS_LM"_A) > triangle Y("IS_LM"_B)
$

Рассмотрим теперь такие экономики что такие что $|m^d'_Y|_A > |m^d'_R|_Y,a alpha ="const"$. 

IV 

Оценим измененеия ставки процента. 


$
  M/P = m^d'_Y dot Y + m^d'_R dot R\
  delta (M/P )= m^d'_Y dot delta Y + m^d'_R dot delta R \
  delta R = -(m^d'_Y)/(m^d'_R) dot delta Y 
$
Рассмотрим теперь такие экономики что такие что $|I'_R|_A > |I'_R|_B, alpha ="const"$. 

V


$
  G arrow.t => Y_1 -> Y_2 => triangle Y_("kk") = 1/(1-alpha) dot triangle G => triangle Y_("kk")_A + triangle Y_("kk")_B ==> Y arrow.t => m^d (Y arrow.t) => \
  m^d (Y_1) -> m^d(Y_2) => m^d > (M^S)/P "and " D_"цб" < S_"цб" => R arrow.t => triangle R_A bold(=) triangle R_B => triangle I = ("something here check later") I'_R dot triangle R => \
  |triangle I|_A > |triangle I|_B  => A > B => triangle Y_("IS-LM") = triangle Y_("kk") - "Экономика A B" => triangle Y_("IS_LM"_A) < triangle Y("IS_LM"_B)
$

Рассмотрим теперь что произойдет если будут измененеия $alpha$.Его измененеия можно изобразить через один график. 

VI

$
  triangle Y_("IS-LM") = triangle Y_("kk") - triangle Y_"Эк" = 1/(1-alpha) dot triangle G + 1/(1-alpha) dot triangle I = 1/(1-alpha) underbrace([triangle G + underbrace(triangle I, (-))], (1))
$

1. Обязан быть $>0$ чтобы фискальная политика имела некий эффект. 




$
  (1 - alpha) dot Y = A_0 + I'_R dot R \
  (1 - alpha) dot delta Y = delta A_0 + I'_R dot delta R \ 
$


VII


$
  1 -> 2 : delta R = - 1/(I'_R) dot delta G \ 
  1 -> 3 : delta Y = 1/(1-alpha) dot delta G 
$

= Эффективность монетарной политики в модели IS-LM


Мультипликатор монетарной политики. 

$
  k_"MP" = (I'_R)/(1-alpha) dot m^d'_R + I'_R dot m^d'_Y = 1/((1-alpha) dot m^d'_R/I'_R + m^d'_Y)  
$

Параметры которые на нее влияю: 

$
  |m^d'_R| arrow.t ==> k_"MP" arrow.b , quad m^d'_Y arrow.t ==> k_"MP" arrow.b , quad alpha ==> k_"MP" arrow.b, quad |I'_R| ==> k_"MP" arrow.t
$


#set align(center)
#canvas({
  import draw: *

  plot.plot( //IS - LM model 
    size: (6, 6),
    
    x-label: $"Y"$,
    y-label: $"R"$,

    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: 0, y-max: 10,
    legend: "inner-north",

    {
      let domain = (0, 10)

      plot.add(x => -x + 10, domain: (2,8), label: $"IS"$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))   

      plot.add(x => x -2 , domain: (3,9), style: (stroke: rgb(red)))
      plot.add(((5, 3),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))

      plot.add(((6, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))

    }
  )
})
#set align(left)

Формальнее: 

$
  M arrow.t ==> triangle R_"эд" dots triangle R_"эд" ==> triangle R R_"общ" (R arrow.b) ==> I (R) arrow.t ==> Y arrow.t
$


#set align(center)
#grid(
  columns: (1fr, 1fr, 1fr), 
  gutter: 1em,  

  canvas({
    import draw: *
    plot.plot( // financial market  
      size: (4.9, 4.9),
      x-label: "x", y-label: "y",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)
        plot.add(x => -x + 10 , domain: (2,8), label: $m^d (Y_0)$, style: (stroke: black))

        plot.add-hline(5, min: 0, max: 5, style: (stroke: (paint: rgb("#000000"), thickness: 0.5pt)))
        plot.add-vline(5, label: $M^S/P$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))

        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

        //red 
        plot.add-vline(7, style: (stroke: (paint: rgb(red), thickness: 1pt))) 
        plot.add(((7, 3),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none)) 

        //greeen 
        plot.add(((7, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none)) 
        plot.add(x => -x + 11 , domain: (2,8), style: (stroke: green))

      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: "x", y-label: "y",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)
      
      plot.add(x => -x + 10, domain: (2,8), label: $"tbf"$, style: (stroke: rgb("#000000")))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))   

      plot.add(((7, 3),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))   

      plot.add(((6, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))   



      }
    )
  }),

  canvas({
    import draw: *
    plot.plot( //KK model 
      size: (4.9, 4.9),
      x-label: "x", y-label: "y",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)

      plot.add(x => x, domain: domain, style: (stroke: black),label: $"AE"_f$)
      plot.add(x => x * 1/2 + 2.5, domain: domain, style: (stroke: black), label: $"AE"_(p l)$)
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))

      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      plot.add(x => x * 1/2 + 4, domain: domain, style: (stroke: red))
      plot.add(((8, 8),), mark: "o", mark-size: 6pt, mark-style: (stroke: (paint: red), fill: red), style: (stroke: none))
      plot.add-vline(8,max: 8, style: (stroke: (paint: rgb(red), thickness: 0.5pt)))




      plot.add(x => x * 1/2 + 1, domain: domain, style: (stroke: green))
      plot.add-vline(4,max: 3, style: (stroke: (paint: rgb(green), thickness: 0.5pt)))
      plot.add(((4, 3),), mark: "o", mark-size: 6pt, mark-style: (stroke: (paint: green), fill: green), style: (stroke: none))
      }
    )
  })
)
#set align(left)


Рассмотрим пример: 

При решении задач.

Предположим что: 

$
  m^d'_Y_A > m^d'_Y_B
$


#set align(center)
#grid(
  columns: (1fr, 1fr, 1fr), 
  gutter: 1em,  

  canvas({
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: "Y", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)

        plot.add(x => -x + 10 , domain: (2,8), label: $m^d (Y_0)$, style: (stroke: black))        
        plot.add-vline(5, label: $M^S/P$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 3pt, mark-style: (stroke: (paint: black), fill: black), style: (stroke: none))


        //red 
        plot.add-vline(7, style: (stroke: (paint: rgb(red), thickness: 1pt)))
        plot.add(((7, 3),), mark: "o", mark-size: 3pt, mark-style: (stroke: (paint: red), fill: red), style: (stroke: none))
        
        //green 
        plot.add(x => -x + 11 , domain: (2,8), style: (stroke: green))     
        plot.add(((7, 4),), mark: "o", mark-size: 3pt, mark-style: (stroke: (paint: green), fill: green), style: (stroke: none))

        //blue 
        plot.add(x => -x + 12 , domain: (2,8), style: (stroke: blue))       

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
      legend: "inner-north",
      {
        let domain = (0, 10)

        plot.add(x => -x + 10, domain: (2,8), label: $"tbf"$, style: (stroke: rgb("#000000")))

        plot.add(((5, 5),), mark: "o", mark-size: 3pt, mark-style: (stroke: (paint: black), fill: black), style: (stroke: none))

        plot.add(((6, 4),), mark: "o", mark-size: 3pt, mark-style: (stroke: (paint: blue ), fill: blue), style: (stroke: none))



        

      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: "AE", y-label: "Y",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)

      plot.add(x => x, domain: domain, style: (stroke: black),label: $"AE"_f$)
      plot.add(x => x * 1/2 + 2.5, domain: domain, style: (stroke: black), label: $"AE"_(p l)$)
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))

      plot.add(x => x * 1/2 + 4, domain: domain, style: (stroke: red))

      plot.add(x => x * 1/2 + 3.5, domain: domain, style: (stroke: green))

      plot.add(x => x * 1/2 + 3, domain: domain, style: (stroke: blue))
      }
    )
  })
)
#set align(left)



Выпишим эффект дохода: (Обоснование ) 

$
  ((delta M)/P) = m^d'_Y dot delta(Y) + m^d'_R dot delta(R) \ \ 
  triangle R_"LE" =  1/(m^d'_R) dot (triangle M)/ P , quad triangle R_"YE" = (-m^d'_Y)/(m^d'_R) dot triangle Y  
$

LE := Liquidity effect. 
YE := Income effect. 



Формально: 

$
  M arrow.t ==> triangle R_"LE"_A  = triangle R_"LE"_B overshell(==>, R arrow.b) I(R) arrow.t , triangle I  = I'_R dot triangle R , \ \
  triangle I_A = triangle I_B ==> triangle I = 1/1-alpha dot triangle I ==> triangle Y_A = triangle Y_B overshell(==>, Y arrow.t) ==> m^d (Y) arrow.t \ \  overshell(==>, m^d'_Y_A > m^d'_Y_B) triangle R_"YE"_A >  triangle R_"YE"_B ==> triangle R_"common"_A < triangle R_"common"_B ==>   triangle I_"com"_A < triangle I_"com"_B ==> triangle Y_"com"_A > triangle Y_"com"_B 
$



Расписать данное изменение на трех графиках невозможно (график потом)

$
  
$

$
  triangle R_"com" = triangle R_"YE" + triangle R_"YE" = 1/(m^d'_R) dot (triangle M)/P - m^d'_Y/m^d'_R dot triangle Y =  1/(m^d'_R) [(triangle M)/P - m^d'_Y dot triangle Y] 
$


#pagebreak()

Как остальные два остальные компоненты: 

(Предполагем что R уже изменилас одинаковым размером?)

$
  |I'_R| arrow.t ==> K_"MP" arrow.t
$

#set align(center)
#grid(
  columns: (1fr, 1fr, 1fr), 
  gutter: 1em,  

  canvas({
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: "Y", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)

        plot.add(x => -x + 10 , domain: (2,8), label: $m^d (Y_1)$, style: (stroke: black))        
        plot.add-vline(5, label: $M^S/P$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 3pt, mark-style: (stroke: (paint: black), fill: black), style: (stroke: none))


        //red 
        plot.add-vline(7, style: (stroke: (paint: rgb(red), thickness: 1pt)))
        plot.add(((7, 3),), mark: "o", mark-size: 3pt, mark-style: (stroke: (paint: red), fill: red), style: (stroke: none))
        
        //green 
        plot.add(x => -x + 11 , domain: (2,8), style: (stroke: green))     
        plot.add(((7, 4),), mark: "o", mark-size: 3pt, mark-style: (stroke: (paint: green), fill: green), style: (stroke: none))


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
      legend: "inner-north",
      {
        let domain = (0, 10)

        plot.add(x => -x + 10, domain: (2,8), label: $"tbf"$, style: (stroke: rgb("#000000")))
        plot.add(((5, 5),), mark: "o", mark-size: 3pt, mark-style: (stroke: (paint: black), fill: black), style: (stroke: none))


        plot.add(x => -x * 1/2  + 7.5, domain: (2,8), label: $"tbf"$, style: (stroke: rgb(red)))

        plot.add(((7, 4),), mark: "o", mark-size: 3pt, mark-style: (stroke: (paint: green), fill: green), style: (stroke: none))


      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: "AE", y-label: "Y",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)

      plot.add(x => x, domain: domain, style: (stroke: black),label: $"AE"_f$)
      plot.add(x => x * 1/2 + 2.5, domain: domain, style: (stroke: black), label: $"AE"_(p l)$)
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))

      plot.add(x => x * 1/2 + 3.3, domain: domain, style: (stroke: black))

      plot.add(x => x * 1/2 + 4, domain: domain, style: (stroke: black))



      }
    )
  })
)
#set align(left)

$
  M arrow.t ==> triangle R_"YE" dots triangle R_"YE" ==> triangle R_"com"_A = triangle R_"com"_B ==> triangle I = I'_R dot triangle R ==> triangle I_A > triangle I_B \ \
  ==> triangle Y = 1/(1-alpha) dot triangle I ==> triangle Y_A > triangle Y_B
$


Теперь будем разбираться с $alpha$. 



#set align(center)
#grid(
  columns: (1fr, 1fr, 1fr), 
  gutter: 1em,  

  canvas({
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: "Y", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)

        plot.add(x => -x + 10 , domain: (2,8), label: $m^d (Y_1)$, style: (stroke: black))        
        plot.add-vline(5, label: $M^S/P$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 3pt, mark-style: (stroke: (paint: black), fill: black), style: (stroke: none))


        //red 
        plot.add-vline(7, style: (stroke: (paint: rgb(red), thickness: 1pt)))
        plot.add(((7, 3),), mark: "o", mark-size: 3pt, mark-style: (stroke: (paint: red), fill: red), style: (stroke: none))
        
        //green 
        plot.add(x => -x + 11 , domain: (2,8), style: (stroke: green))     
        plot.add(((7, 4),), mark: "o", mark-size: 3pt, mark-style: (stroke: (paint: green), fill: green), style: (stroke: none))


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
      legend: "inner-north",
      {
        let domain = (0, 10)

        plot.add(x => -x + 10, domain: (2,8), label: $"tbf"$, style: (stroke: rgb("#000000")))
        plot.add(((5, 5),), mark: "o", mark-size: 3pt, mark-style: (stroke: (paint: black), fill: black), style: (stroke: none))


        plot.add(x => -x * 1/2  + 7.5, domain: (2,8), label: $"tbf"$, style: (stroke: rgb(red)))

        plot.add(((7, 4),), mark: "o", mark-size: 3pt, mark-style: (stroke: (paint: green), fill: green), style: (stroke: none))


      }
    )
  }),

  canvas({
    import draw: *
    plot.plot( //later later later 
      size: (4.9, 4.9),
      x-label: "AE", y-label: "Y",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)

      plot.add(x => x, domain: domain, style: (stroke: black),label: $"AE"_f$)
      plot.add(x => x * 1/2 + 2.5, domain: domain, style: (stroke: black), label: $"AE"_(p l)$)
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))

      plot.add(x => x * 1/2 + 2.5, domain: domain, style: (stroke: black), label: $"AE"_(p l)$)

      plot.add(x => x * 1/2 + 3.3 , domain: domain, style: (stroke: black))





      }
    )
  })
)


$
  M arrow.t ==> triangle R_"YE" ... triangle R_"YE" ==> triangle R_"comm"_A = triangle R_"com"_B ==> triangle I_A = triangle I_B \ \ 
  triangle Y_A = 1/(1-alpha_A) dot triangle I > triangle Y_B = 1/(1-alpha_B) dot triangle I
$


Рассматриваем еще больше приколов. 

Напоминание про анализа перехода из точек в LM

#set align(center)
#canvas({
  import draw: *

  plot.plot(
    size: (6, 6),
    
    x-label: $"Y"$,
    y-label: $"R"$,

    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: 0, y-max: 10,
    legend: "inner-north",

    {
      let domain = (0, 10)

      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))   

      plot.add(x => x -2 , domain: (3,9), style: (stroke: rgb(red)))
      plot.add(((5, 3),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))

      plot.add(((6, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
    }
  )
})
#set align(left)

Confirm that red = 2, green = 3. 

$
  delta(Y) s.t. (delta R  = 0) = 1/(m^d'_Y) dot (delta(M))/P ("black" -> "red") \ \ 
  delta(R) s.t. (delta Y =  0) = 1/(m^d'_R) dot (delta(M)/P) ("black" -> "green")\ \ 
  delta(R)/delta(Y)|_"LM" = (-m^d'Y)/m^d'_R
$

As a result: 

#set align(center)
#canvas({
  import draw: *

  plot.plot(
    size: (6, 6),
    
    x-label: $"Y"$,
    y-label: $"R"$,

    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: 0, y-max: 10,
    legend: "inner-north",

    {
      let domain = (0, 10)

      
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"$, style: (stroke: rgb("#000000")))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))   

      plot.add(x => x, domain: (2,8), label: $"LM"_A$, style: (stroke: rgb(red)))
      plot.add(x => x  - 2 , domain: (3,9), style: (stroke: rgb(red)))

      plot.add(x => x * 1.5 - 2.5 , domain: (3,9), label: $"LM"_B$, style: (stroke: rgb(blue)))
      plot.add(x => x * 1.5 - 4.5 , domain: (3,9), style: (stroke: rgb(blue)))
    }
  )
})
#set align(left)

Рассмотрим альтернативное изменение угла наклона. 


#set align(center)
#canvas({
  import draw: *

  plot.plot(
    size: (6, 6),
    
    x-label: $"Y"$,
    y-label: $"R"$,

    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: 0, y-max: 10,
    legend: "inner-north",

    {
      let domain = (0, 10)

      
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"$, style: (stroke: rgb("#000000")))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))   

      plot.add(x => x, domain: (2,8), label: $"LM"_B$, style: (stroke: rgb(blue)))
      plot.add(x => x  - 2 , domain: (3,9), style: (stroke: rgb(blue)))

      plot.add(x => x * 1.5 - 2.5 , domain: (3,9), label: $"LM"_A$, style: (stroke: rgb(red)))
      plot.add(x => x * 1.5 - 4.5 , domain: (3,9), style: (stroke: rgb(red)))
    }
  )
})
#set align(left)

Мы рассмотрели первоначальные состояния, теперь нужно осуществить политику. Ставим новую точку 3, после чего необходимо 

Теперь рассмотрим $|I'_R|_A > |I'_R|_B$ что повлияет на IS. Повторим знакомый анализ. 


Для рисования нужны: 

$
  (1 - alpha) delta(Y) = delta(A_0) + I'_R dot delta R \ \ 
  delta (Y) s.t. (delta R = 0) = 1/1-alpha dot delta A_0 , quad delta (R) s.t. (delta Y = 0) = 1/I'_R dot delta(A_0) , quad delta(R)/delta(Y)|_"IS" = (1 - alpha)/I'_R
$

Проводим монетарную политику. 

#set align(center)
#canvas({
  import draw: *

  plot.plot(
    size: (6, 6),
    
    x-label: $"Y"$,
    y-label: $"R"$,

    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: 0, y-max: 10,
    legend: "inner-north",

    {
      let domain = (0, 10)

      
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"$, style: (stroke: rgb("#000000")))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))   

      plot.add(x => x * 1.5 - 2.5 , domain: (3,9), label: $"LM"$, style: (stroke: rgb(red)))
      plot.add(x => x * 1.5 - 4.5 , domain: (3,9), style: (stroke: rgb(red)))

      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_A$, style: (stroke: rgb(black)))
      plot.add(x => -x * 1/2 + 7.5,  domain: (2,8), label: $"IS"_B$, style: (stroke: rgb(blue)))


    }
  )
})
#set align(left)

Если попробовать так -же как с эффектами то получиться полный бред (check later)

Далее, вариант для монетарной политиии, что при $alpha_A > alpha_B$. 


#set align(center)
#canvas({
  import draw: *

  plot.plot(
    size: (6, 6),
    
    x-label: $"Y"$,
    y-label: $"R"$,

    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: 0, y-max: 10,
    legend: "inner-north",

    {
      let domain = (0, 10)

      
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"$, style: (stroke: rgb("#000000")))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))   

      plot.add(x => x * 1.5 - 2.5 , domain: (3,9), label: $"LM"$, style: (stroke: rgb(red)))
      plot.add(x => x * 1.5 - 4.5 , domain: (3,9), style: (stroke: rgb(red)))

      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_A$, style: (stroke: rgb(black)))
      plot.add(x => -x * 2 + 15,  domain: (3,7), label: $"IS"_B$, style: (stroke: rgb(blue)))


    }
  )
})
#set align(left)


== Фискаьная политика. 

Чувствительность спроса на деньги в А > B. 

#set align(center)
#canvas({
  import draw: *

  plot.plot(
    size: (6, 6),
    
    x-label: $"Y"$,
    y-label: $"R"$,

    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: 0, y-max: 10,
    legend: "east",

    {
      let domain = (0, 10)

      
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"$, style: (stroke: rgb("#000000")))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))   

      plot.add(x => x * 1.5 - 2.5 , domain: (3,9), label: $"LM"$, style: (stroke: rgb(red)))
      plot.add(x => x * 1.5 - 4.5 , domain: (3,9), style: (stroke: rgb(red)))

      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_A$, style: (stroke: rgb(black)))
      plot.add(x => -x * 2 + 15,  domain: (3,7), label: $"IS"_B$, style: (stroke: rgb(blue)))

      plot.add(x => -x * 2 + 17,  domain: (3,8), label: $"IS"_B$, style: (stroke: rgb("#00d5ff")))

      plot.add(x => -x + 12, domain: (3,9), style: (stroke: rgb("#000000")))

    }
  )
})
#set align(left)

Теперь рассмотрим: $|I'_R|_A > |I'_R|_B$



#set align(center)
#canvas({
  import draw: *

  plot.plot(
    size: (6, 6),
    
    x-label: $"Y"$,
    y-label: $"R"$,

    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: 0, y-max: 10,
    legend: "east",

    {
      let domain = (0, 10)

      
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"$, style: (stroke: rgb("#000000")))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))   

      plot.add(x => x * 1.5 - 2.5 , domain: (3,9), label: $"LM"$, style: (stroke: rgb(red)))

      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_A$, style: (stroke: rgb(black)))
      plot.add(x => -x * 2 + 15,  domain: (3,7), label: $"IS"_B$, style: (stroke: rgb(blue)))

      plot.add(x => -x * 2 + 17,  domain: (3,8), label: $"IS"_B$, style: (stroke: rgb("#00d5ff")))

      plot.add(x => -x + 12, domain: (3,9), label: $"IS"$, style: (stroke: rgb("#000000")))

    }
  )
})
#set align(left)








