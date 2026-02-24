#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-plot:0.1.3": plot


#show heading: set align(center)

= Макроэкономика 
=== Лекция 9-10
=== Фискальная, моентарная, смешанная политика, эффект вытеснения и политика спроса в модели IS-LM.
=== Экономика и Анализ Данных 
=== Фрейре Серёгина Даниэль Фабиан


#pagebreak()

*Фискальная политика.*

#set align(center)
#table(
  columns: 2, 
  fill: (col, row) => if row == 0 {rgb("#557fe649")},
  [Стимулирующая],[Сдерживающая ],
  [$ 
     "G" arrow.t , "T" arrow.b, "Tr" arrow.t
   $],[$
   "G" arrow.b , "T" arrow.t, "Tr" arrow.b
   $],
)

#set align(left)

*Монетарна политика.*

#set align(center)
#table(
  columns: 2, 
  fill: (col, row) => if row == 0 {rgb("#557fe649")},
  [Стимулирующая],[Сдерживающая ],
  [$ 
     "M"^S arrow.t
   $],[$
    "M"^S arrow.b
   $],
)

= Политика спроса в модели IS-LM 


#let differential_matrix_part_1 = $
cases(
  (1 - alpha) dot Y  = A_0 + I'_R dot R, 
  m^d'_y dot Y + m^d'_R dot R  = M/P
)
==> 
cases(
  (1-alpha) d Y = d A_0 + I'R dot d R, 
m^d'_Y dot d Y + m^d'_R dot d R = d(M/P)   
)
==> \
==>
cases(
  (1-alpha) d Y = d A_0 + I'R dot d R, 
m^d'_Y dot d Y + m^d'_R dot d R = (d M^S)/P - M/P^2 d P
)
==> 
mat((1- alpha), - I'_R; m^(d')_Y , m^(d')_R)dot vec(d Y, d R) = vec(d A_0 , (d M)/P - M/P^2 d P)
$

#set align(left)

Применим метод Крамера. 



#block(
  inset: 10pt, 
  stroke: 0.2pt, 
  width: 100%, 
  differential_matrix_part_1
)

#let cramer_method = $
  cases(
    a_11 x_1  + a_12 x_2 = b_1 ,, 
    a_21 x_1 + a_22 x_2 = b_2 
  ) 
  =
  mat(
    a_11, a_12;
    a_21, a_22 
  )
  dot 
  mat(
    x_1; 
    x_2
  )
  =
  mat(
    b_1;
    b_2
  )
  \ 
  triangle = det mat(    a_11, a_12;
    a_21, a_22) = a_(1  1) dot a_(2 2 ) - a_( 2 1) dot a_(1 2)  overshell(!=,"s.t") 0 
  \ \
  triangle_(x_1) = det mat(b_1 , a_(1 2); b_2, a_(12)), triangle_x_2 = det mat(a_11 , b_1; a_21, b_2) ==> x_1 = (triangle x_1)/triangle, quad x_2 = (triangle x_2)/triangle
$

#block(
  fill: rgb("#577fe649"),
  inset: 10pt, 
  stroke: 0.2pt, 
  width: 100%,
  cramer_method
)

#let differential_matrix_part_2 = $
  triangle = mat(#($ (1- alpha) $, $ - I'_R $), #($m^(d')_Y$, $m^(d')_R$), delim: "|")  = underbracket((1 - alpha), (+)) dot underbracket(m^d'_R, - )- underbracket(-I'_R, -) dot underbracket(m^d'_Y ,+)< 0 \
  
    d Y  
  = mat(#($ d A_0 $, $ - I'_R $), #($(d M)/P$, $m^(d')_R$), delim: "|")/triangle , quad  

  d R 
  = mat(#($ (1- alpha) $, $ d A_0 $), #($m^(d')_Y$, $(d M)/P$), delim: "|") /triangle 
  $

#block(
  inset: 10pt, 
  stroke: 0.2pt, 
  width: 100%, 
  differential_matrix_part_2 
)




= Фискальная политика в модели IS-LM


Рассмотрим что произойдет при cтимулирующей и сдерживающей фискальной политики. 

$
(Y arrow.t ,  R arrow.t), (Y arrow.b, R arrow.b)
$


#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: $"Y"$, y-label: $"R"$,    
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      plot.add(x => -x + 12, domain: (3,9), label: $"IS"_2$, style: (stroke: rgb(red)))
      plot.add-vline(6, max: 6, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
      plot.add-hline(6, max: 6, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
      plot.add(((6, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none)) 
      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: $"Y"$, y-label: $"R"$,    
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      plot.add(x => -x + 8, domain: (1,7), label: $"IS"_2$, style: (stroke: rgb(red)))
      plot.add-vline(4, max: 4, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
      plot.add-hline(4, max: 4, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
      plot.add(((4, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none)) 

      }
    )
  })
)
#set align(left)

*Увеличение государственных закупок за счет выпуска гособлиациий ($d G = d B$).*

Формально: $d G = d B stretch(==>)^(d M =0) d A_0 = d G , d R = 0$

#let dG_dB = $
mat((1-α)/m_d^(Y'), -I^'_R; m_d^(Y') , m_d^R)dot vec(d Y, d R) = vec(d G , 0)
==> 

    d Y  
  = mat(#($d G$, $- I^'_R$), #($0$, $m^d'_R$), delim: "|")/triangle  = (m^d'_R)/triangle d G, quad  

  d R 
  = mat(#($(1- alpha)$, $d G$), #($m^d'_Y$, $0$), delim: "|") /triangle = - (m'_Y)/triangle d G
$


#block(
  inset: 10pt, 
  stroke: 0.2pt, 
  width: 100%, 
  dG_dB 
)

#set align(left)

#canvas({ //this is the KK model 
  import draw: *

  plot.plot(
    size: (6, 6),
    x-label: $"Y"$, y-label: $"AE"$,
    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: 0, y-max: 10,
    legend: "south",

    {
      let domain = (0, 10)
      plot.add(x => x, domain: domain, style: (stroke: black),label: $ "AE"_f $)
      plot.add(x => x * 1/2 + 2.5, domain: domain, style: (stroke: black), label: $ "AE"_1_(p l) (R_1) $)
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#938c8c"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      plot.add(x => x * 1/2 + 4.5, domain: domain, style: (stroke: red), label: $ "AE"_2_(p l) (R_1) $)
      plot.add(((9, 9),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
      plot.add-vline(9, max: 9, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))


      plot.add(x => x * 1/2 + 3.5, domain: domain, style: (stroke: green), label: $ "AE"_3_(p l) (R_2) $)
      plot.add(((7, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
      plot.add-vline(7, max: 7, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))

      plot.add-vline(1, min: 3, max: 5, label: $ triangle G $ , style: (stroke: (paint: rgb(red),  dash: "dotted", thickness: 1pt)))

      plot.add-vline(1.2, min: 4.1, max: 5.1, label: $ triangle I $ , style: (stroke: (paint: rgb(green),  dash: "dotted", thickness: 1pt)))
    }
  )
})

#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({ //this is the IS - LM model 
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: "Y", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (2, 8) 
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 10, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 9, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      plot.add-vline(9, max: 10, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))

      plot.add-vline(7, max: 10, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))

      plot.add(x => -x + 14, domain: (4.5,9.6), label: $"IS"_2$, style: (stroke: rgb(red)))

      plot.add(((7, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
      plot.add-hline(7, max: 10, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))


      plot.add(((9, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
      }
    )
  }),

  canvas({ //financial market 
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: $M/P$, y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (2, 8)

        plot.add(x => -x + 10 , domain: (2,8), label: $ m^d_1 (Y_"black") $, style: (stroke: black))

        plot.add-hline(5, min: 0, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add-vline(5, label: $ M^S/P $, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))

        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))   

        plot.add-hline(7, max: 5, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))
        plot.add(((5, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))  

        plot.add(x => -x + 12 , domain: (2,8), label: $ m^d _2 (Y_"green") $, style: (stroke: green))
      }
    )
  })
)

Formally:
$
  & SS ("Shock") =  G  arrow.t \ 
  & EE ("Effect")_(KK KK)   ==> "AE"_0 arrow.t 
  ==> "AE"_1_"pl" (R_1) < "AE"_2_"pl" (R_1) 
  stretch(==>)^(Y= Y_1) "AE" > Y ==> Y arrow.t 
  stretch(==>)^(Y = Y_2) "AE" = Y \ 
  & EE_(II SS -LL  MM) stretch(==>)^(R = R_1) Y arrow.t , space "IS"_2 > "IS"_1  stretch(==>)^(R=R_2) Y arrow.b \ 
  & EE_(FF MM)  stretch(==>)^(R = R_2) m^d'_2 (Y_"green") > m^d'_1 (Y_"black")\
  & Re ("Result") = "AE"_1_"pl" (R_1) <  "AE"_3_"pl" (R_2) , space "IS"_1 < "IS"_2  , space m^d'_1 (Y_"black") < m^d'_2 (Y_"green")
$

*Увеличение государственных закупок за счет увеличения налогов ($d G = d T$)*

Формально: $d G = d T_0 stretch(==>)^(d M = 0)  d A_0 = - "mpc" d T_0 + d G  = - "mpc" d G + d G = d G (1 - "mpc"), d R = 0$

#let dG_dT = $
  mat(
  1-alpha, -I'_R; 
  m^d'_Y, m^d'_R
 )
 dot 
 mat(
  d Y; d R
 )
 = 
 mat(
  (1-"mpc") dot d G; 0
 )
 ==> \ 
   d Y  
  = (det mat(
    (1 - "mpc") d G, -I'_R; 0, m^d'_R
    ))/(Delta) 
    = 
    (overbracket((1-"mpc"),(+)) dot overbracket(m^d'_R, (-)))/Delta  dot underbracket(d G, (+)) > 0 \
  d R 
  =( det mat(
    1 - alpha, 1 - "mpc" d G; m^d'_R, 0
    ))/Delta 
    = 
    (-overbracket((1-"mpc"),(+)) dot overbracket(m^d'_y, (+)))/underbracket(Delta, (-))  dot underbracket(d G, (+)) > 0
$ 

#block(
  inset: 10pt, 
  stroke: 0.2pt, 
  width: 100%, 
  dG_dT
)


#let fact= $ d G  = d B " is more effective than " d G = d T "due to the presence of the (1 - mpc) < 1".$


#set align(left)
#block(
  fill: rgb("#ff8c003a"),
  inset: 10pt, 
  width: 100%, 
  stroke: 0.2pt,
  fact
)

#canvas({ //this is the KK model 
  import draw: *

  plot.plot(
    size: (6, 6),
    x-label: $"Y"$, y-label: $"AE"$,
    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: 0, y-max: 10,
    legend: "south",

    {
      let domain = (0, 10)
      plot.add(x => x, domain: domain, style: (stroke: black),label: $ "AE"_f $)
      plot.add(x => x * 1/2 + 2.5, domain: domain, style: (stroke: black), label: $ "AE"_1_(p l) (R_1) $)
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#938c8c"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      plot.add(x => x * 1/2 + 4.5, domain: domain, style: (stroke: red), label: $ "AE"_2_(p l) (R_1) $)
      plot.add(((9, 9),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
      plot.add-vline(9, max: 9, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))


      plot.add(x => x * 1/2 + 3.5, domain: domain, style: (stroke: green), label: $ "AE"_3_(p l) (R_2) $)
      plot.add(((7, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
      plot.add-vline(7, max: 7, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))

      plot.add-vline(1, min: 3, max: 5, label: $ triangle G ( 1 - "mpc") $ , style: (stroke: (paint: rgb(red),  dash: "dotted", thickness: 1pt)))

      plot.add-vline(1.2, min: 4.1, max: 5.1, label: $ triangle I $ , style: (stroke: (paint: rgb(green),  dash: "dotted", thickness: 1pt)))
    }
  )
})

#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({ //this is the IS - LM model 
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: "Y", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (2, 8) 
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 10, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 9, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      plot.add-vline(9, max: 10, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))

      plot.add-vline(7, max: 10, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))

      plot.add(x => -x + 14, domain: (4.5,9.6), label: $"IS"_2$, style: (stroke: rgb(red)))

      plot.add(((7, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
      plot.add-hline(7, max: 10, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))


      plot.add(((9, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
      }
    )
  }),

  canvas({ //financial market 
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: $M/P$, y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (2, 8)

        plot.add(x => -x + 10 , domain: (2,8), label: $ m^d_1 (Y_"black") $, style: (stroke: black))

        plot.add-hline(5, min: 0, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add-vline(5, label: $ M^S/P $, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))

        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))   

        plot.add-hline(7, max: 5, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))
        plot.add(((5, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))  

        plot.add(x => -x + 12 , domain: (2,8), label: $ m^d _2 (Y_"green") $, style: (stroke: green))
      }
    )
  })
)


Formally:
$
  & SS  =  G  arrow.t \ 
  & EE_(KK KK) stretch(==>)^(G arrow.t)   "AE"_0 arrow.t ==>
   "AE"_1_"pl" (R_1) < "AE"_2_"pl" (R_1) 
  stretch(==>)^(Y= Y_1) "AE" > Y ==> Y arrow.t 
  stretch(==>)^(Y = Y_2) "AE" = Y \ 
  & EE_(II SS -LL  MM) stretch(==>)^(R = R_1) Y arrow.t , space "IS"_2 > "IS"_1  stretch(==>)^(R=R_2) Y arrow.b \ 
  & EE_(FF MM)  stretch(==>)^(R = R_2) m^d'_2 (Y_"green") > m^d'_1 (Y_"black")\
  & Re = "AE"_1_"pl" (R_1) <  "AE"_3_"pl" (R_2) , space "IS"_1 < "IS"_2  , space m^d'_1 (Y_"black") < m^d'_2 (Y_"green")
$

= I am tired the following is work in progress. 

*Фискальная политика и сдвиг кривой AD.*



#canvas({ //this is the IS - LM model 
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: "Y", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (2, 8) 
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 10, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 9, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 


      }
    )
}),

#canvas({ //this is the IS - LM model 
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: "Y", y-label: "P",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (2, 8) 
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))

      }
    )
}),


= Эффект вытеснения в модели IS-LM


#set align(center)
#canvas({ //this is the IS - LM model 
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: "Y", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (2, 8) 
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 10, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 9, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 


      }
    )
}),
#set align(left)


*Crowding-out effect (Оценка эффекта вытеснения в модели IS-LM).*


*Multiplier effect*


*Оценка эффекта вытеснения в модели IS-LM*

Способоы:

1. 

2. 


= Монетарная политика в модели IS-LM

Рассмотрим что произойдет при cтимулирующей и сдерживающей монетарной политики. 

$
(Y arrow.t ,  R arrow.b), (Y arrow.b, R arrow.t)
$

#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: $"Y"$, y-label: $"R"$,    
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)

      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      plot.add(x => x - 2, domain: (3,9), label: $"LM"_2$, style: (stroke: rgb(red)))
      plot.add(((6, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none)) 

      plot.add-vline(6, max: 4, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
      plot.add-hline(4, max: 6, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))

      }
    )
  }),

  canvas({
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: $"Y"$, y-label: $"R"$,    
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"_1$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      plot.add(x => x + 2, domain: (1,7), label: $"LM"_2$, style: (stroke: rgb(red)))
      plot.add(((4, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none)) 
      plot.add-vline(4, max: 6, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
      plot.add-hline(6, max: 4, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
      }
    )
  })
)
#set align(left)


bla bla bla bl abla 

#canvas({ //this is the KK model 
  import draw: *

  plot.plot(
    size: (6, 6),
    x-label: $"Y"$, y-label: $"AE"$,
    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: 0, y-max: 10,
    legend: "south",

    {
      let domain = (0, 10)
      plot.add(x => x, domain: domain, style: (stroke: black),label: $ "AE"_f $)
      plot.add(x => x * 1/2 + 2.5, domain: domain, style: (stroke: black), label: $ "AE"_1_(p l) (R_1) $)
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#938c8c"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      plot.add(x => x * 1/2 + 4.5, domain: domain, style: (stroke: red), label: $ "AE"_2_(p l) (R_1) $)
      plot.add(((9, 9),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
      plot.add-vline(9, max: 9, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))


      plot.add(x => x * 1/2 + 3.5, domain: domain, style: (stroke: green), label: $ "AE"_3_(p l) (R_2) $)
      plot.add(((7, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
      plot.add-vline(7, max: 7, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))

      plot.add-vline(1, min: 3, max: 5, label: $ triangle G ( 1 - "mpc") $ , style: (stroke: (paint: rgb(red),  dash: "dotted", thickness: 1pt)))

      plot.add-vline(1.2, min: 4.1, max: 5.1, label: $ triangle I $ , style: (stroke: (paint: rgb(green),  dash: "dotted", thickness: 1pt)))
    }
  )
})

#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({ //this is the IS - LM model 
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: "Y", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (2, 8) 
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 10, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 9, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      plot.add-vline(9, max: 10, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))

      plot.add-vline(7, max: 10, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))

      plot.add(x => -x + 14, domain: (4.5,9.6), label: $"IS"_2$, style: (stroke: rgb(red)))

      plot.add(((7, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
      plot.add-hline(7, max: 10, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))


      plot.add(((9, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
      }
    )
  }),

  canvas({ //financial market 
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: $M/P$, y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (2, 8)

        plot.add(x => -x + 10 , domain: (2,8), label: $ m^d_1 (Y_"black") $, style: (stroke: black))

        plot.add-hline(5, min: 0, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add-vline(5, label: $ M^S/P $, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))

        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))   

        plot.add-hline(7, max: 5, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))
        plot.add(((5, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))  

        plot.add(x => -x + 12 , domain: (2,8), label: $ m^d _2 (Y_"green") $, style: (stroke: green))
      }
    )
  })
)


*Monetary policy in the IS-LM model.*

#set align(center)
#canvas({ //this is the IS - LM model 
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: "Y", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (2, 8) 
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 10, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 9, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 


      }
    )
}),
#set align(left)

*Effects of the monetary policy in the IS-LM model.*

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
      legend: "south",
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
      legend: "south",
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
      legend: "south",
      {
        let domain = (0, 10)

      }
    )
  })
)
#set align(left)



= Смешанная политика спроса в модели IS-LM

bla bla bla bla 


#canvas({ //this is the IS - LM model 
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: "Y", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (2, 8) 
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 10, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 9, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 


      }
    )
}),

#canvas({ //this is the IS - LM model 
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: "Y", y-label: "P",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "north-east",
      {
        let domain = (2, 8) 
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))

      }
    )
}),




mmmmmmmmmmmmmmmm 

#pagebreak()

#canvas({ //this is the KK model 
  import draw: *

  plot.plot(
    size: (6, 6),
    x-label: $"Y"$, y-label: $"AE"$,
    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: 0, y-max: 10,
    legend: "south",

    {
      let domain = (0, 10)
      plot.add(x => x, domain: domain, style: (stroke: black),label: $ "AE"_f $)
      plot.add(x => x * 1/2 + 2.5, domain: domain, style: (stroke: black), label: $ "AE"_1_(p l) (R_1) $)
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#938c8c"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      plot.add(x => x * 1/2 + 4.5, domain: domain, style: (stroke: red), label: $ "AE"_2_(p l) (R_1) $)
      plot.add(((9, 9),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
      plot.add-vline(9, max: 9, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))


      plot.add(x => x * 1/2 + 3.5, domain: domain, style: (stroke: green), label: $ "AE"_3_(p l) (R_2) $)
      plot.add(((7, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
      plot.add-vline(7, max: 7, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))

      plot.add-vline(1, min: 3, max: 5, label: $ triangle G ( 1 - "mpc") $ , style: (stroke: (paint: rgb(red),  dash: "dotted", thickness: 1pt)))

      plot.add-vline(1.2, min: 4.1, max: 5.1, label: $ triangle I $ , style: (stroke: (paint: rgb(green),  dash: "dotted", thickness: 1pt)))
    }
  )
})

#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({ //this is the IS - LM model 
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: "Y", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (2, 8) 
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 10, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 9, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      plot.add-vline(9, max: 10, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))

      plot.add-vline(7, max: 10, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))

      plot.add(x => -x + 14, domain: (4.5,9.6), label: $"IS"_2$, style: (stroke: rgb(red)))

      plot.add(((7, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
      plot.add-hline(7, max: 10, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))


      plot.add(((9, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
      }
    )
  }),

  canvas({ //financial market 
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: $M/P$, y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (2, 8)

        plot.add(x => -x + 10 , domain: (2,8), label: $ m^d_1 (Y_"black") $, style: (stroke: black))

        plot.add-hline(5, min: 0, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add-vline(5, label: $ M^S/P $, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))

        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))   

        plot.add-hline(7, max: 5, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))
        plot.add(((5, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))  

        plot.add(x => -x + 12 , domain: (2,8), label: $ m^d _2 (Y_"green") $, style: (stroke: green))
      }
    )
  })
)
