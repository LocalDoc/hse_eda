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


=== Политики спроса в IS-LM-BP при плавующей валютного курса. 


Situation A and B)

A 

$
  (delta "CF")/(delta "R") = 0
$

Situation B 

$
  (delta "CF")/(delta "R") > 0 
$


Situation C and D 


IN case D we have 

$
  (delta "CF")/(delta "R") -> infinity
$


#pagebreak()

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
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 10, label: "BP", style: (stroke: (paint: rgb("#8f440b"), thickness: 1pt)))
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
      legend: "south",
      {
        let domain = (0, 10)
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 10, label: "BP", style: (stroke: (paint: rgb("#8f440b"), thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      plot.add(x => x * 1.50 - 2.5, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))



      

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
      size: (6, 6),
      x-label: "", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)
        
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
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-hline(5, max: 10, label: "BP", style: (stroke: (paint: rgb("#8f440b"), thickness: 1pt)))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      }
    )
  })
)
#set align(left)

everything before is covered by image 1 

Here we have been presented with four different types of economies. 


Now we are not going to show that the adaptation mechanism for economies A & B, C & D are the same. BUt that is true 


=== Влияние фискальной политики IS-LM-BP при плавующей валютного курса



#set align(center)
#canvas({
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: "", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 10, label: "BP", style: (stroke: (paint: rgb("#8f440b"), thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      //red 
      plot.add(x => -x + 12, domain: (3,9), label: $"IS"_2$, style: (stroke: rgb(red)))
      plot.add(((6, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
      plot.add-hline(6, max: 6, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))

      //green 
      plot.add(x => -x + 14, domain: (4,9.7), label: $"IS"_3$, style: (stroke: rgb(green)))


    }
  )
})

#set align(left)

Formally:

#let formally = $ & SS:   \
                 & triangle G  = triangle B => "IS"_0 -> "IS"_1 => "IS"_1 - "LM"_0 " in position 2" \ 
                 & "in position 2" cases(Y arrow.t => I_M arrow.t => "CA" arrow.t, R arrow.t => (delta "CF")/(delta "R") = 0 underbracket(=>, (*)) triangle "CF" = 0) => cases("BP" < 0 , "X"^d < "X"^s) \ 
                 & EE: \ 
                 & E^(f/d) arrow.b => "Согласно условию Маршала Лермана" => N_X arrow.t 
                \ 
                & "New equilibrium" => "IS"_2 - "LM"_0 - "BP"_1 (Y arrow.t, R arrow.t)
                \
                & (*) : = "This happens as " "CF" = "CF"_0 + "CF"'_R (R - R^+) "image 2"                     
$

#block(
  inset: 10pt, 
  stroke: 0.2pt, 
  width: 100%, 
  formally
)


Проведем $"FP"(arrow.t)$


Formally: 

#let formally = $
  & SS: \
  & triangle G  = triangle B  => "IS"_0 => "IS"_1 => "IS"_1 - "LM"_0 "in point 2" \ 
  & "thus in point 2" => cases(Y arrow.t => "Im" arrow.t => "CA" arrow.b, R arrow.t => (delta "CF")/(delta "R") > 0 => "CF" arrow.t) => |triangle "CA"| > |triangle "CF"| ==> cases("BP" < 0 , X^d < X^s) \ 
  & EE: ""
  & 

$

#block(
  inset: 10pt, 
  stroke: 0.2pt, 
  width: 100%, 
  formally
)

Something something there was an important fact formally

The image presented here is num 4 

Now we take a look at the case:

=== Сильной мобильности капитала: 


image number 5, BP will look a bit different here. 

#set align(center)
#canvas({
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: "", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 10, label: "BP", style: (stroke: (paint: rgb("#8f440b"), thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      //red 
      plot.add(x => -x + 12, domain: (3,9), label: $"IS"_2$, style: (stroke: rgb(red)))
      plot.add(((6, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
      plot.add-hline(6, max: 6, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))

      //green 
      plot.add(x => -x + 11, domain: (2.5,8.5), label: $"IS"_3$, style: (stroke: rgb(green)))


      
    }
  )
})



Formally: 

#let formally = $
  & SS: \
  & triangle G  = triangle B  => "IS"_0 => "IS"_1 => "IS"_1 - "LM"_0 "in point 2" \ 
  & "thus in point 2" => cases(Y arrow.t => "Im" arrow.t => "CA" arrow.b, R arrow.t => (delta "CF")/(delta "R") > 0 => "CF" arrow.t) => |triangle "CA"| > |triangle "CF"| ==> cases("BP" < 0 , X^d < X^s) \ 
  & EE: "" \ 
  & E^(f/d) ==> "Согласно условию М-Л"=> "NX" arrow.b ==> cases("IS slide to the left", "BP slide to the left") \ 
  & "new equilbrium" "IS"_3 - "LM"_1 - "BP"_3 (Y arrow.t , R arrow.t)
$

#block(
  inset: 10pt, 
  stroke: 0.2pt, 
  width: 100%, 
  formally
)

#set align(left)


Случай абсолютной мобильности капитала. 



#set align(center)
#canvas({
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: "", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"_1$, style: (stroke: rgb("#938c8c")))
      plot.add-hline(5, max: 10, label: $"BP"_1$, style: (stroke: (paint: rgb("#8f440b"), thickness: 1pt)))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      //red
      plot.add(x => -x + 12, domain: (3,9), label: $"IS"_2$, style: (stroke: rgb(red)))
      plot.add(((6, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))

      //green 
      plot.add(((5,5),), mark: "o", mark-size: 2pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: red), style: (stroke: none))  
    }
  )
})

#set align(left)

Reminder on key characteristic of this BP case, as it changes only when there is a change in the foreign rate. 



Example: 

Suppose: 



Now show what happens when:
$
  |I'R| arrow.t
$

#set align(center)
#canvas({
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

#set align(left)


Formally: 

#let formally = $
  & SS: \
  & |I'_R| arrow.t  => "IS"_1 -> "IS"_2 => "IS"_2 - "LM"_1 "in point 2" \ 
  & "thus in point 2" => cases(Y arrow.b => "CA" arrow.t, R arrow.b => (delta "CF")/(delta "R") < 0 => "CF" arrow.b) => |triangle "CA"| > |triangle "CF"| ==> cases("BP" > 0 , X^d > X^s) \ 
  & EE: "" \ 
  & E^(f/d) ==> "Согласно условию М-Л"=> "NX" arrow.b ==> cases("IS slide to the left", "BP slide to the left") \ 
  & "new equilbrium" "IS"_3 - "LM"_1 - "BP"_3 (Y arrow.t , R arrow.t)
$

#block(
  inset: 10pt, 
  stroke: 0.2pt, 
  width: 100%, 
  formally
)


=== MP in IS-LM-BP при плавующей валютного курса


Suppose that $"MP"(arrow.t)$. 

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
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"_1$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 10, label: $"BP"_1$, style: (stroke: (paint: rgb("#8f440b"), thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      //red 
      plot.add(x => x -2 , domain: (3,9), label: $"LM"_2$, style: (stroke: rgb(red)))


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
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"_1$, style: (stroke: rgb("#938c8c")))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 
      plot.add(x => x * 2.50 - 7.5, domain: (3.5,6.5), label: $"BP"_1$, style: (stroke: rgb("#8f440b")))

      //red 
      plot.add(x => x - 2, domain: (3,9), label: $"LM"_2$, style: (stroke: rgb(red)))
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
      size: (6, 6),
      x-label: "", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)

      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"_1$, style: (stroke: rgb("#938c8c")))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 
      plot.add(x => x * 0.50 + 2.5, domain: (1.5,8.5), label: $"BP"_1$, style: (stroke: rgb("#8f440b")))
        
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
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"_1$, style: (stroke: rgb("#938c8c")))
      plot.add-hline(5, max: 10, label: $"BP"_1$, style: (stroke: (paint: rgb("#8f440b"), thickness: 1pt)))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      //red 

      plot.add(x => x - 2, domain: (3,9), label: $"LM"_2$, style: (stroke: rgb(red)))

      }
    )
  })
)
#set align(left)


the complete image here is num 7 

Formally: 

#let formally = $
  & SS: \
  & M arrow.t  => "IS"_1 -> "IS"_2 => "IS"_1 - "LM"_2 "in point 2" \ 
  & "thus in point 2" => cases(Y arrow.t => "CA" arrow.b, R arrow.b => (delta "CF")/(delta "R") < 0 => "CF" arrow.b) => |triangle "CA"| > |triangle "CF"| ==> cases("BP" < 0 , X^d < X^s) \ 
  & EE: "" \ 
  & E^(f/d) arrow.b  ==> "Согласно условию М-Л"=> "NX" arrow.b ==> cases("IS slide to the right", "BP slide to the right") \ 
  & "with the exception of" (delta "CF")/(delta "R") -> infinity \ 
$

#block(
  inset: 10pt, 
  stroke: 0.2pt, 
  width: 100%, 
  formally
)


As a result we can say on which one is the more efficient? 


=== Сильная мобильность капитала

$
  |m^d'_R| arrow.t
$


#set align(center)
#canvas({
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: "", y-label: "",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)
        plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
        plot.add(x => x, domain: (2,8), label: $"LM"_1$, style: (stroke: rgb("#938c8c")))
        plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 
        plot.add(x => x * 0.50 + 2.5, domain: (1.5,8.5), label: $"BP"_1$, style: (stroke: rgb("#8f440b")))

        //red 
        plot.add(x => x * 0.5 + 0.75, domain: (2,8), label: $"LM"_1$, style: (stroke: rgb(red)))
      }
  )
})

last image of the set here