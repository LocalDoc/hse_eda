#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-plot:0.1.3": plot

All markets seen in the current semester have 3 potential stages. 
+ Standard model (black and / or grey)
+ Economic shock (red and / or orange)
+ Return to (new) equilibrium (green and / or dark green)




=== Goods market 

#set align(center)
#canvas({
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: "Y", y-label: "AE",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)
      plot.add(x => x, domain: domain, style: (stroke: black),label: $"AE"_f$)
      plot.add(x => x * 1/2 + 2.5, domain: domain, style: (stroke: black), label: $"AE"_(p l)$)
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#938c8c"), dash: "dotted", thickness: 1pt)))

      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))
    }
    )
  })
#set align(left)

=== IS - LM model 

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
      //default 
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 
    }
  )
})
#set align(left)

=== Financial market 


#set align(center)
#canvas({
    import draw: *
    plot.plot( // financial market model  
      size: (6, 6),
      x-label: $M^S/P$, y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)
        plot.add(x => -x + 10 , domain: (2,8), label: $m^d (Y)$, style: (stroke: black))

        plot.add-hline(5, min: 0, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add-vline(5, label: $M^S/P$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))

        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))


      }
    )
})

#set align(left)
=== Bonds market (Ценных бумаг или облигаций)

#set align(center)
#canvas({
  import draw: *

  plot.plot( //IS - LM model 
    size: (6, 6),
    
    x-label: $"# ЦБ"$,
    y-label: $"R"$,

    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: 0, y-max: 10,
    legend: "inner-north",

    {
      let domain = (0, 10)
      //default 
      plot.add(x => -x + 10, domain: (2,8), label: $"S"_"ЦБ"$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"D"_"ЦБ"$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 
    }
  )
})
#set align(left)

=== Two models

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

=== Three models 

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

      }
    )
  })
)
#set align(left)


