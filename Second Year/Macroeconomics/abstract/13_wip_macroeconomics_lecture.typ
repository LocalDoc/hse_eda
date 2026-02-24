#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-plot:0.1.3": plot

#show heading: set align(center)
= Макроэкономика 
=== Лекция 13
=== Особые случаи в модели IS - LM, вид функции IS и LM, Эффективность политик спроса. 
=== Экономика и Анализ Данных 
=== Фрейре Серёгина Даниэль Фабиан

#pagebreak()
#show heading: set align(left)



Продолжаем говорить про оценки эффективности фискальной политики.


= Особые случаи в модели IS - LM

Случаи когда фискальная политика максимально эффективна. 


$
  "Инвестиционная ловушка" |I'_R| = 0
$

Common graph 

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
        plot.add(x => x , domain: (2,8), label: $"LM"$, style: (stroke: black))
        plot.add-hline(5, min: 0, max: 5, style: (stroke: (paint: rgb("#000000"), thickness: 0.5pt)))
        plot.add-vline(5, label: $"IS"$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

        plot.add-vline(7, label: $"IS"_2$, style: (stroke: (paint: rgb(red), thickness: 1pt)))
        plot.add(((7, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))




    }
  )
})
#set align(left)


#set align(center)
#grid(
  columns: (1fr, 1fr, 1fr), 
  gutter: 1em,  

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
      plot.add(x => x, domain: domain, style: (stroke: black),label: $"AE"_f$)
      plot.add(x => x * 1/2 + 2.5, domain: domain, style: (stroke: black), label: $"AE"_(p l)$)
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))

      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      plot.add(x => x, domain: domain, style: (stroke: black),label: $"AE"_f$)


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
        plot.add(x => x, domain: domain, label: "first")
        plot.add(x => x/2 + 2, domain: domain, label: "second")
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
        plot.add(x => x, domain: domain, label: "first")
        plot.add(x => x/2 + 2, domain: domain, label: "second")
      }
    )
  })
)
#set align(left)


Формально: 
$
  G arrow.t dots Y arrow.t => m^d (underbracket(Y, (+)))arrow.t stretch(=>)^(R=R_1) cases(m^d > M/P , D_"ЦБ" < S_"ЦБ") => R arrow.t => т.к. triangle I = I'_R dot triangle R => triangle I = 0 => "Эв" =0 
$



Рассмотрим инвестиционную ловущку, но теперь будем проводить монетарную политику. 

#set align(center)
#canvas({
  import draw: *

  plot.plot( // IS LM model (generalized)
    size: (6, 6),
    
    x-label: $"Y"$,
    y-label: $"R"$,

    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: 0, y-max: 10,
    legend: "east",

    {
      let domain = (0, 10)
       plot.add(x => x  , domain: (2,8), label: $"LM"_1$, style: (stroke: black))
       plot.add-hline(5, min: 0, max: 5, style: (stroke: (paint: rgb("#000000"), thickness: 0.5pt)))
       plot.add-vline(5, label: $"IS"$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))
       plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      //red 
        plot.add(x => x - 2  , domain: (2,8), label: $"LM"_2$, style: (stroke: red))
        plot.add(((5, 3),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
        plot.add-hline(3, min: 0, max: 5, style: (stroke: (paint: rgb(red), thickness: 0.5pt)))
    }
  )
})
#set align(left)


#set align(center) //transactional model 
#grid(
  columns: (1fr, 1fr, 1fr), 
  gutter: 1em,  

  canvas({
    import draw: *
    plot.plot( //financial market 
      size: (4.9, 4.9),
      x-label: $M/P$, y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)

        plot.add(x => -x + 10 , domain: (2,8), label: $m^d (Y_0)$, style: (stroke: black))
        plot.add-hline(5, min: 0, max: 5, style: (stroke: (paint: rgb("#000000"), thickness: 0.5pt)))
        plot.add-vline(5, label: $M_1/P$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

        //red
        plot.add-vline(7, label: $M_2/P$, style: (stroke: (paint: rgb(red), thickness: 1pt)))
        plot.add(((7, 3),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
        plot.add-hline(3, min: 0, max: 10, style: (stroke: (paint: rgb(red), thickness: 0.5pt)))
    }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: "I", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)
        plot.add-vline(5, style: (stroke: (paint: rgb("#000000"), thickness: 1pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))
        plot.add-hline(5, min: 0, max: 5, style: (stroke: (paint: rgb("#938c8c"), thickness: 0.5pt)))

        plot.add-hline(3, min: 0, max: 5, style: (stroke: (paint: rgb(red), thickness: 0.5pt)))
        plot.add(((5, 3),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))


      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: "Y", y-label: "AE",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)
      plot.add(x => x, domain: domain, style: (stroke: black),label: $"AE"_f$)
      plot.add(x => x * 1/2 + 2.5, domain: domain, style: (stroke: black), label: $"AE"_(p l)$)
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))

      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      }
    )
  })
)
#set align(left)


Действуем монетарной политикой. 


Формально: 
$
  M arrow.t => (M/P) arrow.t => R= R_1 cases(m^d < M/P, D_"ЦБ" > S_"ЦБ") => R arrow.b stretch(=>)^(R=R_2) cases(M^S/P = m^d, D_"ЦБ"  = S_"ЦБ"), \ 
  "т.к." I'_R = 0 => triangle I = 0 => triangle Y = 1/(1-alpha) dot triangle I => triangle Y  = 0   
$

Это считается наиболее неэффективная политика. 


(photo 1 from lecture)



=== Ликвидная ловушка. 

Горизонтальная LM так как $|m^d'_R| --> infinity$

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
        plot.add(x => -x + 10  , domain: (2,8), label: $"IS"$, style: (stroke: black))
        plot.add(x => 3  , domain: (0,10), label: $"LM"$, style: (stroke:  rgb("#959090")))

        plot.add(x => -x + 12  , domain: (3,9), label: $"IS"_2$, style: (stroke: red))


    }
  )
})
#set align(left)

Что вообще озночает что LM горизонтальна? 


Строис тансиционный механизм. 


#set align(center)
#grid(
  columns: (1fr, 1fr, 1fr), 
  gutter: 1em,  

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
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      plot.add(x => x * 1/2 + 3.5, domain: domain, style: (stroke: red), label: $"AE"_(p l_2)$)
      plot.add-vline(7, max: 7, style: (stroke: (paint: rgb(red), thickness: 0.5pt)))
      plot.add(((7, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
    }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: $M/P$, y-label: $R$,       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)
        plot.add(x => -x + 10 , domain: (2,8), label: $m^d$, style: (stroke: black))
        plot.add-hline(5, min: 0, max: 10, style: (stroke: (paint: rgb("#000000"), thickness: 0.5pt)))
        plot.add-vline(5, label: $M_1/P_1$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

        plot.add-vline(7, style: (stroke: (paint: rgb(red), thickness: 1pt))) //look into this one later 


      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: "I", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)
        plot.add(x => -x + 10 , domain: (2,8), label: $m^d$, style: (stroke: black))
        plot.add-hline(5, min: 0, max: 5, style: (stroke: (paint: rgb("#000000"), thickness: 0.5pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))
        plot.add-vline(5, max: 5,  label: $M_1/P_1$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))
      }
    )
  })
)
#set align(left)


Формально: 

$
  G arrow.t => dots Y arrow.t => m^d (Y) arrow.t  space stretch(=>)^(R=R_1) cases(m^d > M^S/P, D_"ЦБ" < S_"ЦБ") => triangle R = 0 =>  triangle I = 0 => "Eq" = 0
$

something something revist this again. 


#pagebreak()


Теперь рассмотрим моентарную политику. 

Ликвидная ловушка  и мы проводим денежную политику. $|m^d'_R| -> infinity$


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
        plot.add(x => -x + 10  , domain: (2,8), label: $"IS"$, style: (stroke: black))
        plot.add(x => 3  , domain: (0,10), label: $"LM"$, style: (stroke:  rgb("#959090")))

        plot.add(x => -x + 12  , domain: (3,9), label: $"IS"_2$, style: (stroke: red))


    }
  )
})
#set align(left)

рассмотрим трансиционный механизм монетарной политики. 

Проводим стимулирующию политику. 

#set align(center)
#grid(
  columns: (1fr, 1fr, 1fr), 
  gutter: 1em,  

  canvas({
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: $M/P$, y-label: $R$,       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)    
        plot.add-hline(5, min: 0, max: 10, label: $m^d$,  style: (stroke: (paint: rgb("#000000"), thickness: 1pt)))
        plot.add-vline(5, label: $M_1/P_1$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

        plot.add-vline(7, style: (stroke: (paint: rgb(red), thickness: 1pt))) 
        plot.add(((7, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
        

    }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: $I$, y-label: $R$,       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)
        plot.add(x => -x + 10 , domain: (2,8), label: $m^d$, style: (stroke: black))
        plot.add-hline(5, min: 0, max: 5, style: (stroke: (paint: rgb("#000000"), thickness: 0.5pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))
        plot.add-vline(5, max: 5,  label: $M_1/P_1$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))
      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: "Y", y-label: "AE",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)
      plot.add(x => x, domain: domain, style: (stroke: black),label: $"AE"_f$)
      plot.add(x => x * 1/2 + 2.5, domain: domain, style: (stroke: black), label: $"AE"_(p l)$)
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))
      }
    )
  })
)
#set align(left)

Formally: 
$
  M arrow.t => (M/P) arrow.t => R = R_1 => cases(m^d < M^S/P, D_"ЦБ" > S_"ЦБ") => R arrow.b => I arrow.t => Y arrow.t => m^d arrow.t
$


=== Класссический случай 


Помним что 
$
  m^d = m^d'_Y dot Y + m^d'_R dot R 
$

Классики считают что $m^d (Y)$ а не $m^d(Y, R)$ как думали Кейнсианцы. 


Мы рассматриваем случай когда: $m^d'=0$

There should be picture 4 here.  

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

       plot.add(x => -x + 10   , domain: (2,8), label: $"IS"_1$, style: (stroke: black))
       plot.add-hline(5, min: 0, max: 5, style: (stroke: (paint: rgb("#000000"), thickness: 0.5pt)))
       plot.add-vline(5, label: $"LM"_1$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))
       plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

       plot.add-vline(7, label: $"LM"_2$, style: (stroke: (paint: rgb(red), thickness: 1pt)))
       plot.add-hline(3, min: 0, max: 7, style: (stroke: (paint: rgb(red), thickness: 0.5pt)))
       plot.add(((7, 3),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))


    }
  )
})
#set align(left)



#set align(center)
#grid(
  columns: (1fr, 1fr, 1fr), 
  gutter: 1em,  

  canvas({
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: $M/P$, y-label: $R$,       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)    
        plot.add-hline(5, min: 0, max: 10, label: $m^d$,  style: (stroke: (paint: rgb("#000000"), thickness: 1pt)))
        plot.add-vline(5, label: $M_1/P_1$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

        plot.add-vline(7, style: (stroke: (paint: rgb(red), thickness: 1pt))) 
        plot.add(((7, 3),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
        plot.add-hline(3, min: 0, max: 10, label: $m^d$,  style: (stroke: (paint: rgb(red), thickness: 0.5pt)))   

    }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: $I$, y-label: $R$,       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)
        plot.add(x => -x + 10 , domain: (2,8), label: $m^d$, style: (stroke: black))
        plot.add-hline(5, min: 0, max: 5, style: (stroke: (paint: rgb("#000000"), thickness: 0.5pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))
        plot.add-vline(5, max: 5,  label: $M_1/P_1$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))


      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: "Y", y-label: "AE",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)
      plot.add(x => x, domain: domain, style: (stroke: black),label: $"AE"_f$)
      plot.add(x => x * 1/2 + 2.5, domain: domain, style: (stroke: black), label: $"AE"_(p l)$)
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))
      }
    )
  })
)
#set align(left)


Formally: 

$
  M arrow.t => cases(m^d < M^S/P, D_"ЦБ" > S_"ЦБ") => R arrow.b => I arrow.t => Y arrow.t => m^d arrow.t \ 
  ("red point ") := cases(m^d =  M^S/P, D_"ЦБ" = S_"ЦБ")  stretch(=>)^(R= R_2) I arrow.t => triangle Y = 1/(1-alpha) triangle I > 0
  $

(warning this formally could be incorrect??)

This is the most efficient monetary policy, as there is no income effect. 


== Класссический случай фискальной политики. 


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

       plot.add(x => -x + 10   , domain: (2,8), label: $"IS"_1$, style: (stroke: black))
       plot.add-hline(5, min: 0, max: 5, style: (stroke: (paint: rgb("#000000"), thickness: 0.5pt)))
       plot.add-vline(5, label: $"LM"_1$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))
       plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

       plot.add(x => -x + 12   , domain: (3,9), label: $"IS"_2$, style: (stroke: red))
       plot.add(((5, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
       plot.add-hline(7, min: 0, max: 5, style: (stroke: (paint: rgb(red), thickness: 0.5pt)))
    }
  )
})
#set align(left)

#set align(center)
#grid(
  columns: (1fr, 1fr, 1fr), 
  gutter: 1em,  

  canvas({
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: $M/P$, y-label: $R$,       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)    
      plot.add(x => x, domain: domain, style: (stroke: black),label: $"AE"_f$)
      plot.add(x => x * 1/2 + 2.5, domain: domain, style: (stroke: black), label: $"AE"_(p l)$)
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      plot.add(x => x * 1/2 + 3.5, domain: domain, style: (stroke: red), label: $"AE"_(p l_2)$)
      plot.add(((7, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
      plot.add-vline(7, max: 7, style: (stroke: (paint: rgb(red), thickness: 0.5pt)))

    }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: $I$, y-label: $R$,       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)

        plot.add-hline(5, min: 0, max: 10, label: $m^d$,  style: (stroke: (paint: rgb("#000000"), thickness: 1pt)))
        plot.add-vline(5, label: $M_1/P_1$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

        plot.add-vline(7, style: (stroke: (paint: rgb(red), thickness: 1pt))) 
        plot.add(((7, 3),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
        plot.add-hline(3, min: 0, max: 10, label: $m^d$,  style: (stroke: (paint: rgb(red), thickness: 0.5pt)))   




      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: "Y", y-label: "AE",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)       
        plot.add(x => -x + 10 , domain: (2,8), label: $m^d$, style: (stroke: black))
        plot.add-hline(5, min: 0, max: 5, style: (stroke: (paint: rgb("#000000"), thickness: 0.5pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))
        plot.add-vline(5, max: 5,  label: $M_1/P_1$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))
      }
    )
  })
)
#set align(left)



Formally: 

$
  G arrow.t => Y arrow.t => m^d arrow.t stretch(=>)^(R=R_1) cases(m^d > M/P, D_"" < S_"") => R arrow.t => I arrow.b => arrow.b Y => triangle G = |triangle I | => triangle Y > 0
$

Fiscal policy does not work as the monetary market 


Иееется поный эффек вытеснения 

Неравновесике -> 


#pagebreak()

=== No-name case.

$|I'_R|--> infinity$


monetary policy


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
      plot.add(x => x  , domain: (2,8), label: $"LM"$, style: (stroke: black))
      plot.add-hline(5, min: 0, max: 10, label: "IS" , style: (stroke: (paint: rgb("#606060"), thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      plot.add(x => x  - 2   , domain: (3,9), label: $"LM"$, style: (stroke: red))
      plot.add(((7, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
    }
  )
})
#set align(left)


#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: "x", y-label: "y",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)
        plot.add(x => x, domain: domain, label: "first")
        plot.add(x => x/2 + 2, domain: domain, label: "second")
      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: "x", y-label: "y",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)
        plot.add(x => x, domain: domain, label: "first")
        plot.add(x => x/2 + 2, domain: domain, label: "second")
      }
    )
  })
)
#set align(left)

Formally: 

$
  M arrow.t => R arrow.b => I arrow.t => Y arrow.t => m^d(Y) arrow.t => cases(triangle R  = 0, triangle Y > 0)
$

Fiscal policy 

$
 G arrow.t => Y arrow.t => m^d arrow.t => cases(m^d > M/P, D_"" < S_"") => R arrow.t => I arrow.b => triangle G = |triangle I|
$