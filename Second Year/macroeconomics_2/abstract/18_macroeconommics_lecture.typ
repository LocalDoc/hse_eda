#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-plot:0.1.3": plot

#show heading: set align(center)
#show block: set align(center)
= Макроэкономика 
=== Лекция 18
=== Эффекты политик на модели IS-LM-BP 
=== Экономика и Анализ Данных 
=== Фрейре Серёгина Даниэль Фабиан

#pagebreak()


Консультация по демо-версии в пятницу.

=== Влияние шоков на локальную экономику в рамках модели IS-LM-BP. 

Прочие равные условия: 
$
  underbracket(p^f"," Y^f, "CA") , underbracket(R^f, "CF") 
$

Рассмотрим шок:

I.
$
  p^f arrow.t (R^f = "const") => N_X arrow.t cases("IS" arrow.r, "BP" arrow.r, "CA" arrow.t "," "CF" = "cosnt" => cases("BP" > 0, X^d > X^s))
$

II. (plavuyushia mobilnost kapitala)

$
  E^(f/d)  arrow.t => "М-Л" => N_X arrow.b => cases("IS" arrow.l, "BP" arrow.l)
$

Graphically: 


#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (5, 5),
      x-label: "", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 10, label: $"BP"_1$, style: (stroke: (paint: rgb("#8f440b"), thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      //red 
      plot.add(x => -x + 12, domain: (3,9), label: $"IS"_2$, style: (stroke: rgb(red)))
      plot.add-vline(7, max: 10, label: $"BP"_2$, style: (stroke: (paint: rgb(red), thickness: 1pt)))
      plot.add(((6, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none)) 

      





      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (5,5),
      x-label: "", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      plot.add(x => x * 1.50 - 2.5, domain: (2,8), label: $"BP"_1$, style: (stroke: rgb("#8f440b")))
      
      //shock
      plot.add(x => -x + 11, domain: (3,9), label: $"IS"_2$, style: (stroke: rgb(red)))
      plot.add(x => x * 1.50 - 4.5, domain: (3.5,9), label: $"BP"_2$, style: (stroke: rgb(red)))
      plot.add(((5.6, 5.4),), mark: "o", mark-size: 2pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none)) 

     

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
      size: (5, 5),
      x-label: "", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)
        plot.add(x => -x + 10, domain: (2,8), label: $"IS"$, style: (stroke: rgb("#000000")))
        plot.add(x => x, domain: (2,8), label: $"BP"_1$, style: (stroke: rgb("#8f440b")))
        plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 
        plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))


        plot.add(x => x * 1.50 - 2.5, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))

        //red

        plot.add(x => x -2 , domain: (3,9), label: $"BP"_2$, style: (stroke: rgb(red)))
        plot.add(x => -x + 11, domain: (2,8), label: $"IS"$, style: (stroke: rgb(red)))



        
      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (5, 5),
      x-label: "", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-hline(5, max: 10, label: "BP", style: (stroke: (paint: rgb("#8f440b"), thickness: 1pt)))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      // red

      plot.add(x => -x + 12, domain: (3,9), label: $"IS"_2$, style: (stroke: rgb(red)))


      }
    )
  })
)
#set align(left)

the first step will always be to change the IS 

the change of BP is always larger tha IS 

III 

$
  & 1: "CA"_1 + "CF"_1 = 0 \ 
  & 2: ("CA"_2 + "CF"_1) > 0  \
  & 3: ("CA"_3 + "CF"_1) = 0
$

In this model the new eq would return to the previous eq point, which can be show via the matrixes. 


----

Suppose: 

I
$
  Y^f arrow.b (R^f = "const") => N_X arrow.b => cases("IS" arrow.l, "bP" arrow.l,"CA" arrow.b "," "CF" = "const" => cases("BP" < 0, X^d < X^s))
$

$
  E^(f/d) arrow.b stretch(=>)^(М-Л) N_X arrow.t => cases("BP" arrow.b, "IS" arrow.b) => "IS"_0 - "LM"_0 - "BP"_0
$


Graphically (otsudstive mobilnost kapitala)


#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (5, 5),
      x-label: "", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 10, label: $"BP"_1$, style: (stroke: (paint: rgb("#8f440b"), thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      //red 

     }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (5,5),
      x-label: "", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      plot.add(x => x * 1.50 - 2.5, domain: (2,8), label: $"BP"_1$, style: (stroke: rgb("#8f440b")))
      
      //shock
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
      size: (5, 5),
      x-label: "", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)
        plot.add(x => -x + 10, domain: (2,8), label: $"IS"$, style: (stroke: rgb("#000000")))
        plot.add(x => x, domain: (2,8), label: $"BP"$, style: (stroke: rgb("#8f440b")))
        plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 
        plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add(x => x * 1.50 - 2.5, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
        //red
        
      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (5, 5),
      x-label: "", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-hline(5, max: 10, label: "BP", style: (stroke: (paint: rgb("#8f440b"), thickness: 1pt)))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      // red
      }
    )
  })
)
#set align(left)


-----


Now suppose that: 
$
  |I'_M_Y| arrow.t cases(N_X ("ugol BP " arrow.t ) => "BP bolee krutaya", alpha arrow.b => "IS bolee krutaya vokrug tochki na ordinate", N_X arrow.b => cases("BP" < 0, X^d < X^s ))
$


Reminder: 

$
  (d R)/(d Y)|_"BP" = (I'_M_Y)/("CF"'_R)
$

#canvas({
    import draw: *
    plot.plot(
      size: (5,5),
      x-label: "", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(x => x * 1.50 - 2.5, domain: (2,8), label: $"BP"_1$, style: (stroke: rgb("#8f440b")))
      plot.add(((5, 5),), mark: "o", mark-size: 2pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      
      //shock

      plot.add(x => -x * 2 + 11 , domain: (2,5.4), label: $"IS"_2$, style: (stroke: rgb(red)))
      plot.add(x => x * 2 -2 , domain: (1.5,6.5), label: $"BP"_2$, style: (stroke: rgb(red)))
      plot.add(((3.7, 3.7),), mark: "o", mark-size: 2pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none)) 





      }
    )
  })
#set align(left)

As a result: 
$
  "IS"_2 - "LM"_0 - "BP"_2 vec(Y = "const", R="const") 
$


Now we check out the same with a fixed R. 

Suppose: 

I. 
$
  p^f arrow.t => N_X arrow.t cases("IS" arrow.r, "BP" arrow.l, "CA" arrow.t "CF" = "const" => cases("BP">0, X^d > X^s))
$

#canvas({
    import draw: *
    plot.plot(
      size: (5,5),
      x-label: "Y", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000"))) // IS
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c"))) // LM 
      plot.add(x => x * 1.50 - 2.5, domain: (2,8), label: $"BP"_1$, style: (stroke: rgb("#8f440b"))) // BP
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 2pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 
      //shock
      plot.add(x => x * 1.50 - 6.5, domain: (4.5,9.5), label: $"BP"_2$, style: (stroke: rgb(red))) // BP
      plot.add(x => -x + 11, domain: (2,8), label: $"IS"_2$, style: (stroke: rgb(red))) // IS
      plot.add(((5.55, 5.45),), mark: "o", mark-size: 2pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: black), style: (stroke: none)) 

      }
    )
  })
#set align(left)

Reminder: 
$
  "CA" + "CF" = triangle "OR"
$

II. 

$
  "OR" arrow.t => cases(X^s stretch(=>)^(E = overline(E)) X^d = X^s , H arrow.t => underbracket( M arrow.t, "additional effect") => "LM"_1 => "LM"_2) 
$

$
   3: = "IS"_2 - "LM"_2 -"BP"_2 (Y arrow.t R arrow.b)
$


Now we will take a look at a liquidity trap for the same case. 
#canvas({
    import draw: *
    plot.plot(
      size: (5,5),
      x-label: "Y", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)
      plot.add-vline(5, max: 10, label: $"IS"_1$, style: (stroke: (paint: rgb("#000000"), thickness: 1pt)))
      plot.add(x => x, domain: (2,8), label: $"BP"_1$, style: (stroke: rgb("#8f440b"))) // BP  8f440b
      plot.add(x => x * 1.50 - 2.5, domain: (2,8), label: $"LM"_1$, style: (stroke: rgb("#938c8c"))) // LM
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 2pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 
      //shock

      plot.add-vline(6, max: 10, label: $"IS"_2$, style: (stroke: (paint: rgb(red), thickness: 1pt)))
      plot.add(x => x * 1.50 - 5.5, domain: (1,9), label: $"LM"_2$, style: (stroke: rgb(red))) // BP





      }
    )
  })
#set align(left)


Now we are checking out $Y^f$ 

I. 
$
  Y^f arrow.b -> N_X arrow.b => cases("IS" arrow.l, "BP" arrow.l , cases("BP">0, X^d < X^s))
$

II. 
$
"ЦБ" "OR" arrow.b ==> cases(X^s arrow.b stretch(=>)^(E = overline(E)) X^s= X^d, H arrow.b => M arrow.b => "LM"_1 -> "LM"_2  )
$


image 1 complete later





The effect of the change in foreign currency rate on the local economy. 

I
$
R^f arrow.t ==> cases("CA" = "const", "CF" arrow.b = > cases(
  "BP" < 0 , X^d < X^s 
) )
$


#canvas({
    import draw: *
    plot.plot(
      size: (5,5),
      x-label: "", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (0, 10)
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      plot.add(x => x * 1.50 - 2.5, domain: (2,8), label: $"BP"_1$, style: (stroke: rgb("#8f440b")))
      
      //shock
      plot.add(x => x * 1.50 - 0.5, domain: (1,9), label: $"BP"_2$, style: (stroke: rgb(red)))

      //effect
      plot.add(x => -x + 11, domain: (3,9), label: $"IS"_3$, style: (stroke: rgb(green)))
      plot.add(((5.6, 5.4),), mark: "o", mark-size: 2pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
      plot.add(x => x * 1.50 - 0.5, domain: (1,9), label: $"BP"_2$, style: (stroke: rgb(red)))
      plot.add(x => x * 1.50 - 4.5, domain: (1,9), label: $"BP"_3$, style: (stroke: rgb(green)))


      }
    )
  })

II. 
$
  E^(f/d) arrow.b stretch(==>)^("М-Л") => N_X arrow.t => cases("IS" arrow.r, "BP" arrow.r) 
$


change in foreign currency rate with a fixed currency rate 



#canvas({
    import draw: *
    plot.plot(
      size: (5, 5),
      x-label: "", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)
        plot.add(x => -x + 10, domain: (2,8), label: $"IS"$, style: (stroke: rgb("#000000")))
        plot.add(x => x, domain: (2,8), label: $"BP"$, style: (stroke: rgb("#8f440b")))
        plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 
        plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add(x => x * 1.50 - 2.5, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
        //red
        
      }
    )
  })


I.

$
R^f arrow.t ==> cases("CA" = "const", "CF" arrow.b = > cases(
  "BP" < 0 , X^d < X^s 
) )
$

II. 

$
  "ЦБ" "OR" arrow.b cases(X^s arrow.b stretch(=>)^(E = overline(E)) , H arrow.b => M arrow.b => "LM"_1 -> "LM"_2)
$

, 