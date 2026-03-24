#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-plot:0.1.3": plot

#show heading: set align(center)
#show block: set align(center)
= Макроэкономика 
=== Лекция 15
=== Модель IS-LM-BP
=== Экономика и Анализ Данных 
=== Фрейре Серёгина Даниэль Фабиан


#pagebreak()





*Модель IS в открытой экономике*

*График BP*

*Счет движения капитала*

=== Модель равновесия потоков платежного баланса

= Модель IS-LM-BP


Данная модель предзначена для малой открытой экономике. 

*Малая \ большая открытая экономика.*

Завист от возможности финансового рынка госдарства влиять на международная ставка процента.

Remember that the BP model is the модель платежного баланса ()

$
  cases(
    "IS" := (1-alpha) dot Y  = A_0 + I'_R dot R quad ("we have to consider " triangle N_X), 
    "LM" := M/P = m^(d')_Y dot Y +  m^(d')_R dot R, 
    "BP"
  )
$

What is BP?


При плавующем валютном курсе:

$
  "BP" = 0 quad "CA" + "CF" = 0 quad (triangle "OR" = 0)
$

How to model CF? 

The main drawback, it does not depend on the currency rate. As a result: 

$
  "CF"(R, R^f)
$

There are three variants of the CA.

*I. Отсудсвующая мобильность капитала. *

$
  (delta C)/(delta R) = 0 \ 
  "CF"(R, R^f) = "CF"_0 + "CF"'_R (R + R^f)
$


#canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "CF", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)
        plot.add-vline(5, label: $M^S/P$, style: (stroke: (paint: rgb(black), thickness: 1pt)))

      }
    )
  })


*II. Мобильность капитала *

$
  (delta C)/(delta R) > 0 

$

#canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "CF", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)

        plot.add(x => x , domain: (1,9), style: (stroke: black))


      }
    )})



*III. Абсолютная (совершенная) мобильность капитала.*


$
  (delta C)/(delta R) --> infinity 
$

#canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "CF", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)
        plot.add-hline(5, min:1, max:9, label: $M^S/P$, style: (stroke: (paint: rgb(black), thickness: 1pt)))

      }
    )
  })

Now we will take a look at CA. 

$
  "CA" ~ N_X = E_X (p^d, p^f, E^(f/d), Y^f) - I_M (p^d, p^f, E^(f/d),Y) =>  \
  "CA"(p^d,p^f, E^(f/d),Y, Y^f) = "CA"'_(p^d) dot p^d + "CA"'_(p^f) dot p^f + "CA"'_(E^(f/d)) dot E^(f/d) + "CA"_(Y^f) dot Y^f + "CA"'_Y dot Y - I_M'_Y
$



Можно заменить первые три компоненты на полный валютный курс $epsilon$. 

As a result: 


$
"BP" = 0 => "CA" + "CF" = 0 quad (triangle "OR" = 0 ) => "BP" (p^d, p^f, E^(f/d), Y^f, underbracket(Y","R, "fix these"), R^f) = 0
$

//  p


В итоге получаем что 


$
  (delta "CF")/(delta R) = 0 \ 
  "CF"(R, R^f) = "CF"_0 + "CF"'_R (R + R^f)
$


#canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "CF", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)
        plot.add-vline(5, label: $"BP"$, style: (stroke: (paint: rgb(black), thickness: 1pt)))

      }
    )
  })


$
  (delta "CF")/(delta R) > 0 

$

#canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "CF", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)

        plot.add(x => x , label: "BP" ,domain: (1,9), style: (stroke: black))


      }
    )})




$
  (delta "CF")/(delta R) --> infinity 
$

#canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "CF", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)
        plot.add-hline(5, min:1, max:9, label: $M^S/P$, style: (stroke: (paint: rgb(black), thickness: 1pt)))

      }
    )
  })

=== Графическое построение BP при мобильной капитале

#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "-CF", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-west",
      {
        let domain = (0, 10)
          plot.add(
          x => -x + 10,  domain: (1, 9), label: "-CF plot", style: (stroke: (rgb(black)))
          )
          plot.add(((4, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black))
          plot.add-hline(6, min: 0, max: 10, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
          plot.add-vline(4, max: 6, label: $M^S/P$, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))

          //shock 
          plot.add(((6, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red))
          plot.add-hline(4, min: 0, max: 10, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
          plot.add-vline(6, max: 4, label: $M^S/P$, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))



      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "Y", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)
        plot.add(
          x => x, domain: (1, 9), label: "BP plot", style: (stroke: (black))
          )
        plot.add(((6, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black))
        plot.add-hline(6, min: 0, max: 6, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
        plot.add-vline(6, max: 6, label: $M^S/P$, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))

        //red 
        plot.add(((4, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red))
        plot.add-hline(4, min: 0, max: 4, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
        plot.add-vline(4, max: 4, label: $M^S/P$, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))


      }
    )
  })
)
#set align(left)

// plot.add(x => -x + 10, domain: (2,8), label: $"S"_"ЦБ"$, style: (stroke: rgb("#000000")))

#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "-CF", y-label: "CA",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-west",
      {
        let domain = (0, 10)
          plot.add(
          x => x,  domain: (1, 9), label: $"BP EQ " $, style: (stroke: (rgb(black)))
          )
          plot.add(((4, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black))
          plot.add-hline(4, min: 0, max: 10, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
          plot.add-vline(4, max: 10, label: $M^S/P$, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))

          //red 
          plot.add(((6, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red))
          plot.add-hline(6, min: 0, max: 10, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
          plot.add-vline(6, max: 10, label: $M^S/P$, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))


      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "-CF", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)
        plot.add(
          x => -x + 10, domain: (1, 9), label: "CA plot", style: (stroke: (black))
          )
        plot.add(((6, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black))
        plot.add-hline(4, min: 0, max: 6, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
        plot.add-vline(6, max: 10, label: $M^S/P$, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))


        ///red
        plot.add(((4, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red))
        plot.add-hline(6, min: 0, max: 4, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
        plot.add-vline(4, max: 10, label: $M^S/P$, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))


      }
    )
  })
)
#set align(left)

Mathematically: 

$
  0 =  "CA"(p^d,p^f, E^(f/d),Y, Y^f) = "CA"'_(p^d) dot p^d + "CA"'_(p^f) dot p^f + "CA"'_(E^(f/d)) dot E^(f/d) + "CA"_(Y^f) dot Y^f + "CA"'_Y dot Y - I_M'_Y
$

Thus as a result: 

$
  (d R)/(d Y )|_"BP" = (overbracket(I'_M_Y))/(underbracket("CF"'_R))
$

Formally:

#let formal_2  = $
  & SS  =   \
  & EE_(-"CF")  \
  & EE_("BP") \
  & EE_("BP EQ")  \
  & EE_("CA")  \
  & Re = 
$

#block(
  inset: 10pt, 
  stroke: 0.2pt, 
  width: 100%,
  formal_2
  
)


=== Отсудсвувие мобильности капитала. 

#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "-CF", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-west",
      {
        let domain = (0, 10)
          plot.add-vline(5, label: $M^S/P$, style: (stroke: (paint: rgb(black), thickness: 1pt)))

          //shock 




      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "Y", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)
        plot.add-vline(5, label: $M^S/P$, style: (stroke: (paint: rgb(black), thickness: 1pt)))       

        //red 

      }
    )
  })
)
#set align(left)

// plot.add(x => -x + 10, domain: (2,8), label: $"S"_"ЦБ"$, style: (stroke: rgb("#000000")))

#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "-CF", y-label: "CA",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-west",
      {
        let domain = (0, 10)
          plot.add(
          x => x,  domain: (1, 9), label: $"BP EQ " $, style: (stroke: (rgb(black)))
          )
          plot.add(((4, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black))
          plot.add-hline(4, min: 0, max: 10, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
          plot.add-vline(4, max: 10, label: $M^S/P$, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))

          //red 


      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "-CF", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)
        plot.add(
          x => -x + 10, domain: (1, 9), label: "CA plot", style: (stroke: (black))
          )
        plot.add(((6, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black))
        plot.add-hline(4, min: 0, max: 6, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
        plot.add-vline(6, max: 10, label: $M^S/P$, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))


        ///red



      }
    )
  })
)
#set align(left)


=== Аналогичное для абсолютной мобильности капитала.


#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "-CF", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-west",
      {
        let domain = (0, 10)
          plot.add-hline(5, label: $M^S/P$, style: (stroke: (paint: rgb(black), thickness: 1pt)))

          //shock 

      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "Y", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)
        plot.add-hline(5, label: $M^S/P$, style: (stroke: (paint: rgb(black), thickness: 1pt)))       

        //red 

      }
    )
  })
)
#set align(left)

// plot.add(x => -x + 10, domain: (2,8), label: $"S"_"ЦБ"$, style: (stroke: rgb("#000000")))

#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "-CF", y-label: "CA",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-west",
      {
        let domain = (0, 10)
          plot.add(
          x => x,  domain: (1, 9), label: $"BP EQ " $, style: (stroke: (rgb(black)))
          )
          plot.add(((4, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black))
          plot.add-hline(4, min: 0, max: 10, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
          plot.add-vline(4, max: 10, label: $M^S/P$, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))

          //red 


      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "-CF", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)
        plot.add(
          x => -x + 10, domain: (1, 9), label: "CA plot", style: (stroke: (black))
          )
        plot.add(((6, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black))
        plot.add-hline(4, min: 0, max: 6, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
        plot.add-vline(6, max: 10, label: $M^S/P$, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))


        ///red



      }
    )
  })
)
#set align(left)

== Состояение неравновесия платежного баланса при мобильном капитале. 

We start on the BP, the fix some rate R 

#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "-CF", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-west",
      {
        let domain = (0, 10)
          plot.add(
          x => -x + 10,  domain: (1, 9), label: "-CF plot", style: (stroke: (rgb(black)))
          )
          plot.add-hline(6, min: 0, max: 10, label: $ $, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
          plot.add-vline(4, max: 6, label: $$, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
          plot.add(((4, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black))


         //red



      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "Y", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)
        plot.add(
          x => x, domain: (1, 9), label: "BP plot", style: (stroke: (black))
        )
        plot.add-hline(6, min: 0, max: 6, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
        plot.add-vline(6, max: 6, label: $$, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
        plot.add(((6, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black))

        //red
        plot.add-vline(4, max: 6, label: $$, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
        plot.add(((4, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red))

        //blue 

        plot.add-vline(8, max: 6, label: $$, style: (stroke: (paint: rgb(blue), dash: "dotted", thickness: 1pt)))
        plot.add(((8, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: blue, thickness: 2pt), fill: blue))



        

      }
    )
  })
)
#set align(left)

// plot.add(x => -x + 10, domain: (2,8), label: $"S"_"ЦБ"$, style: (stroke: rgb("#000000")))

#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "-CF", y-label: "CA",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-west",
      {
        let domain = (0, 10)
          plot.add(
          x => x,  domain: (1, 9), label: $"BP EQ " $, style: (stroke: (rgb(black)))
          )
          plot.add-hline(4, min: 0, max: 10, label: $ $, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
          plot.add-vline(4,min: 4, max: 10, label: $$, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
          plot.add(((4, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black))



      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "-CF", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)
        plot.add(
          x => -x + 10, domain: (1, 9), label: "CA plot", style: (stroke: (black))
        )
        plot.add-hline(4, min: 0, max: 6, label: $ $, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
        plot.add-vline(6,min: 0, max: 10, label: $$, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
        plot.add(((6, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black))

        //red
        plot.add-vline(4, min: 6,  max: 10, label: $$, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
        plot.add-hline(6, min: 0, max: 4, label: $ $, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
        plot.add(((4, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red))

        //blue 

        plot.add-vline(8, max: 10, label: $$, style: (stroke: (paint: rgb(blue), dash: "dotted", thickness: 1pt)))
        plot.add(((8, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: blue, thickness: 2pt), fill: blue))

      }
    )
  })
)
#set align(left)



If it is over BP избыток платеж

If it is under BP дефицит платеж баланса


HOMEWORK: 



if there are points to the left (less than) BP then there is a deficit of BP, if there are points on the right (more than ) BP then there is a !deficit of BP 

same thing if the BP is horizontal and we can check if points are over and under the BP line, where over BP, more than BP (BP > 0) there is a !deficit. 


---

Рассмотрим наши равные условия. 

$
  p^d , p^f, E^(f/d), Y^f -" CA" \ 
  R^"f" - "CF" 
$


Suppose that $p^f arrow.t$


We are looking at the mobile capital situation. 

#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "-CF", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-west",
      {
        let domain = (0, 10)
          plot.add(
          x => -x + 10,  domain: (1, 9), label: "-CF plot", style: (stroke: (rgb(black)))
          )
          plot.add(((4, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black))
          plot.add-hline(6, min: 0, max: 10, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
          plot.add-vline(4, max: 6, label: $ $, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))


      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "Y", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)
        plot.add(x => x, domain: (1, 9), label: "BP plot", style: (stroke: (black)))
        plot.add(((6, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black))
        plot.add-hline(6, min: 0, max: 6, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
        plot.add-vline(6, max: 6, label: $ $, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))

        //red 
        plot.add(((8, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red))
        plot.add-hline(6, min: 6, max: 8, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
        plot.add-vline(8, max: 6, label: $ $, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
        plot.add(x => x - 2, domain: (1, 9), label: "BP plot", style: (stroke: (red)))

        


      }
    )
  })
)
#set align(left)

// plot.add(x => -x + 10, domain: (2,8), label: $"S"_"ЦБ"$, style: (stroke: rgb("#000000")))

#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "-CF", y-label: "CA",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-west",
      {
        let domain = (0, 10)
          plot.add(
          x => x,  domain: (1, 9), label: $"BP EQ " $, style: (stroke: (rgb(black)))
          )
          plot.add(((4, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black))
          plot.add-hline(4, min: 0, max: 10, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
          plot.add-vline(4, max: 10, label: $ $, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))




      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "-CF", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)
        plot.add(x => -x + 10, domain: (1, 9), label: "CA plot", style: (stroke: (black)))
        plot.add(((6, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black))
        plot.add-hline(4, min: 0, max: 6, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
        plot.add-vline(6, max: 10, label: $ $, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))


        ///red
        plot.add(((8, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red))
        plot.add-hline(4, min: 6, max: 8, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
        plot.add-vline(8, max: 10, label: $ $, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
        plot.add(x => -x + 12, domain: (1, 9), label: "CA plot", style: (stroke: (red)))
        }
    )
  })
)
#set align(left)


#pagebreak()


Now are we going to check out a situation where there is a change in $E^(f/d)$


Our currency is getting more expensive.  


#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "-CF", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-west",
      {
        let domain = (0, 10)
          plot.add(
          x => -x + 10,  domain: (1, 9), label: "-CF plot", style: (stroke: (rgb(black)))
          )
          plot.add(((4, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black))
          plot.add-hline(6, min: 0, max: 10, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
          plot.add-vline(4, max: 6, label: $ $, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))


      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "Y", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)
        plot.add(x => x, domain: (1, 9), label: "BP plot", style: (stroke: (black)))
        plot.add(((6, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black))
        plot.add-hline(6, min: 0, max: 6, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
        plot.add-vline(6, max: 6, label: $ $, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))

        //red 
        plot.add(((8, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red))
        plot.add-hline(6, min: 6, max: 8, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
        plot.add-vline(8, max: 6, label: $ $, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
        plot.add(x => x - 2, domain: (1, 9), label: "BP plot", style: (stroke: (red)))

        


      }
    )
  })
)
#set align(left)

// plot.add(x => -x + 10, domain: (2,8), label: $"S"_"ЦБ"$, style: (stroke: rgb("#000000")))

#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "-CF", y-label: "CA",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-west",
      {
        let domain = (0, 10)
          plot.add(
          x => x,  domain: (1, 9), label: $"BP EQ " $, style: (stroke: (rgb(black)))
          )
          plot.add(((4, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black))
          plot.add-hline(4, min: 0, max: 10, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
          plot.add-vline(4, max: 10, label: $ $, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))




      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "-CF", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)
        plot.add(x => -x + 10, domain: (1, 9), label: "CA plot", style: (stroke: (black)))
        plot.add(((6, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black))
        plot.add-hline(4, min: 0, max: 6, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
        plot.add-vline(6, max: 10, label: $ $, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))


        ///red
        plot.add(((8, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red))
        plot.add-hline(4, min: 6, max: 8, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
        plot.add-vline(8, max: 10, label: $ $, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
        plot.add(x => -x + 12, domain: (1, 9), label: "CA plot", style: (stroke: (red)))

        



      }
    )
  })
)
#set align(left)


Now we will take a look at a situation where our currency is getting more expensive but there is an absolute mobility of capital.




Изменение прочих равных условиях для счета текущих операций does not shift the BP on the situation of the absolute mobility of capital



=== Влияние изменение инностранной ставки процента



=== хуйня хуйня хуйня

Рассмотрим ситуацию мобильного капитала, и рассмотрим 



#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "-CF", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-west",
      {
        let domain = (0, 10)
          plot.add(
          x => -x + 10,  domain: (1, 9), label: "-CF plot", style: (stroke: (rgb(black)))
          )
          plot.add(((4, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black))
          plot.add-hline(6, min: 0, max: 10, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
          plot.add-vline(4, max: 6, label: $ $, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))


      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "Y", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)
        plot.add(x => x, domain: (1, 9), label: "BP plot", style: (stroke: (black)))
        plot.add(((6, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black))
        plot.add-hline(6, min: 0, max: 6, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
        plot.add-vline(6, max: 6, label: $ $, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))

        //red 
        plot.add(((8, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red))
        plot.add-hline(6, min: 6, max: 8, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
        plot.add-vline(8, max: 6, label: $ $, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
        plot.add(x => x - 2, domain: (1, 9), label: "BP plot", style: (stroke: (red)))
      }
    )
  })
)
#set align(left)

#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "-CF", y-label: "CA",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-west",
      {
        let domain = (0, 10)
          plot.add(
          x => x,  domain: (1, 9), label: $"BP EQ " $, style: (stroke: (rgb(black)))
          )
          plot.add(((4, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black))
          plot.add-hline(4, min: 0, max: 10, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
          plot.add-vline(4, max: 10, label: $ $, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))




      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (5.6, 5.6),
      x-label: "-CF", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)
        plot.add(x => -x + 10, domain: (1, 9), label: "CA plot", style: (stroke: (black)))
        plot.add(((6, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black))
        plot.add-hline(4, min: 0, max: 6, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))
        plot.add-vline(6, max: 10, label: $ $, style: (stroke: (paint: rgb(black), dash: "dotted", thickness: 1pt)))


        ///red
        plot.add(((8, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red))
        plot.add-hline(4, min: 6, max: 8, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
        plot.add-vline(8, max: 10, label: $ $, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
        plot.add(x => -x + 12, domain: (1, 9), label: "CA plot", style: (stroke: (red)))
        }
    )
  })
)
#set align(left)


we can do the еще какая-то залупа 

