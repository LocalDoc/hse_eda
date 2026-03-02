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
#let formal_1 = $
  & SS  =  G  arrow.t \ 
  & EE_(KK KK) stretch(==>)^(G arrow.t)   "AE"_0 arrow.t ==>
   "AE"_1_"pl" (R_1) < "AE"_2_"pl" (R_1) 
  stretch(==>)^(Y= Y_1) "AE" > Y ==> Y arrow.t 
  stretch(==>)^(Y = Y_2) "AE" = Y \ 
  & EE_(II SS -LL  MM) stretch(==>)^(R = R_1) Y arrow.t , space "IS"_2 > "IS"_1  stretch(==>)^(R=R_2) Y arrow.b \ 
  & EE_(FF MM)  stretch(==>)^(R = R_2) m^d'_2 (Y_"green") > m^d'_1 (Y_"black")\
  & Re = "AE"_1_"pl" (R_1) <  "AE"_3_"pl" (R_2) , space "IS"_1 < "IS"_2  , space m^d'_1 (Y_"black") < m^d'_2 (Y_"green")
$

#block(
  inset: 10pt, 
  stroke: 0.2pt, 
  width: 100%,
  formal_1
  
)


*Фискальная политика и сдвиг кривой AD.*

При фискальной политики экономика в модели IS-LM  переходит в новое равновесие. 

Величина сопокупного спроса растет, но при том же уровне цен, что соотвествует параллеьному сдвину AD. 

Изменение величины совокупного спроса  соотвествует изменению равновесного выпуска модели IS-LM. 

Чем больше фискальная политика в модели IS-LM воздействует на выпуск, тем более эффективно она воздействует на совокупный спрос. При этом изменение спроса при том же уровне цен будет равно изменению равновесия в IS-LM. 

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
      plot.add(x => -x + 10, domain: (2,8), label: $ "IS"(G_1) $, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"_(P_1)$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      plot.add(x => -x + 12, domain: (3,9), label: $ "IS"(G_2) $, style: (stroke: rgb(red)))
      plot.add(((6, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none)) 
      plot.add-vline(6, max: 6, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
      plot.add-hline(6, max: 6, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
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
      plot.add(x => -x + 10, domain: (2,8), label: $"AD"_(g_1)$, style: (stroke: rgb("#000000")))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-vline(5, max: 10, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      plot.add(x => -x + 11, domain: (3,9), label: $"AD"_(g_2)$, style: (stroke: rgb(red)))
      plot.add-hline(5, min: 5, max: 6, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
      plot.add(((6, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none)) 
      plot.add-vline(6, max: 5, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
      }
    )
}),

#pagebreak()

Formally: 

#let formal_2  = $
  & SS  =  "Fiscal policy" (triangle G, T, T r) \ 
  & EE_(II SS -LL  MM) = A_0 arrow.t space ==> "IS"_1 < "IS"_2  ==> "New EQ" \
  & EE_("AD") = "FP" stretch(==>)^(P = P_1) Y arrow.t  ==> "New EQ" \
  & Re = Y_2 > Y_1 
$

#block(
  inset: 10pt, 
  stroke: 0.2pt, 
  width: 100%,
  formal_2
  
)


= Эффект вытеснения в модели IS-LM

*Crowding-out effect. (Эффект вытеснения).* 

Разнца между ростом дохода в результате действия стимулирующей фискальной политики при той же ставке процента (в товарном рынке) и ростом дохода в модели IS-LM в результате приспособления к шоку как товарного, так и финансовом рынке.  (1)


*Multiplier effect. (Эффект мультипликатора).*

Уменьшение дохода в модели IS-LM происходит из-за снижения инвестиций в результате роста ставки процента которое вызвана неравновесием на финансовом рынке. (2)

*Оценка эффекта вытеснения в модели IS-LM.*

Далее, чем меньше *эффект вытеснения  инвестиций* тем больше изменение дохода в модели IS-LM, тем более эффективно действует на спрос фискальная политика. (3)

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
      plot.add-hline(5, max:5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      plot.add(x => -x + 12, domain: (3,9), label: $"IS"_2$, style: (stroke: rgb(red)))
      plot.add-vline(7, max: 5, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, min:5 , max:7, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
      plot.add(((7, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none)) 

      plot.add(((6, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none)) 
      plot.add-vline(6, max: 6, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))
      plot.add-hline(6, min:0 , max:6, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))

      plot.add-hline(1, min:6 , max:7, label: "Crowding-out effect", style: (stroke: (paint: rgb(purple), dash: "dotted", thickness: 1pt)))

      plot.add-hline(2, min:5 , max:7, label: "Multiplier effect", style: (stroke: (paint: rgb(orange), dash: "dotted", thickness: 1pt)))

      plot.add-hline(1, min:5 , max:6, label: "Change in income in IS-LM following fiscal policy", style: (stroke: (paint: rgb(yellow), dash: "dotted", thickness: 1pt)))
      }
    )
}),
#set align(left)


Formally: 

#let formal_3  = $
  & SS  = "FP" (arrow.t) => G arrow.t , T arrow.b, T r arrow.b => Y arrow.t   \
  & EE_(II SS -LL  MM) = Y arrow.t stretch(==>)^(R = R_1) Y_1 < Y_2 => R arrow.t stretch(==>)^(R=R_2) Y_1 < Y_3 < Y_2  \
  & Re = "Crowding out effect" := (Y_2 - Y_3) , "Mult effect" := (Y_2 - Y_1) , triangle Y = (Y_3 - Y_1) 
$

#block(
  inset: 10pt, 
  stroke: 0.2pt, 
  width: 100%,
  formal_3
  
)

*Оценка эффекта вытеснения в модели IS-LM*

Оценить эффект вытеснения, возникающий при проведении стимулирующей фискальной политики можно двумя способами. 

1. Разница изменения дохода в КК   изменение дохода в IS-LM при проедении стимулирующей фискальной политики. 

#let example = $
  
$

#block(
  fill: rgb("#577fe649"),
  inset: 10pt, 
  stroke: 0.2pt, 
  width: 100%,
  example
)

2. Как реакцию товарного рынка на рост ставки процента, который произошел в экономике для восстановления совместеого равновесия в IS-LM после фискальной политики. 

#let example = $
  
$

#block(
  fill: rgb("#577fe649"),
  inset: 10pt, 
  stroke: 0.2pt, 
  width: 100%,
  example
)

= Монетарная политика в модели IS-LM



#let mixed_IS_LM = $
mat((1-α)/m_d^(Y'), -I^'_R; m_d^(Y') , m_d^R)dot vec(d Y, d R) = vec(0 , (d M^S)/P)
==>  \ 
==>

    d Y  
  = mat(#($0$, $- I^'_R$), #($ (d M^S)/P$, $m^d'_R$), delim: "|")/triangle  = (I'_R)/triangle  dot (d M^S)/P > 0 , quad  

  d R 
  = mat(#($(1- alpha)$, $0$), #($m^d'_Y$, $ (d M^S)/P$), delim: "|") /triangle = ((1 - alpha))/triangle  (d M^S)/P <  0
$

#block(
  inset: 10pt, 
  stroke: 0.2pt, 
  width: 100%, 
  mixed_IS_LM, 
)

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

*Теперь рассмотрим что произойдет при $d M > 0$ в КК. *

#canvas({ //this is the KK model 
  import draw: *

  plot.plot(
    size: (6, 6),
    x-label: $"Y"$, y-label: $"AE"$,
    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: 0, y-max: 10,
    legend: "north-east",

    {
      let domain = (0, 10)
      plot.add(x => x, domain: domain, style: (stroke: black),label: $ "AE"_f $)
      plot.add(x => x * 1/2 + 2.5, domain: domain, style: (stroke: black), label: $ "AE"_1_(p l) (R_1) $)
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#938c8c"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      plot.add(x => x * 1/2 + 3.1, domain: domain, style: (stroke: green), label: $ "AE"_3_(p l) (R_2) $)
      plot.add(((6.2, 6.2),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
      plot.add-vline(6.2, max: 6.2, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))

      plot.add-vline(1.2, min: 3.1, max: 3.7, label: $ triangle I $ , style: (stroke: (paint: rgb(green),  dash: "dotted", thickness: 1pt)))
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
      plot.add(x => -x + 10, domain: (2,8), label: $"IS"$, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $"LM"_1$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 10, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 10, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      plot.add(x => x - 2.5, domain: (3.5,9.5), label: $"LM"_2$, style: (stroke: rgb(red)))

      plot.add(((5, 2.1),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 5pt), fill: red), style: (stroke: none))
      plot.add-hline(2, max: 10, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))

      plot.add(((6.2, 3.8),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
      plot.add-hline(3.8, max: 10, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))
      plot.add-vline(6.2, max: 10, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))

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
        plot.add-vline(5, label: $ M_1^S/P $, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 


        plot.add-hline(2, max: 8, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
        plot.add-vline(8, label: $ M_2^S/P $, style: (stroke: (paint: rgb(red), thickness: 1pt)))
        plot.add(((8, 2),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none)) 

        plot.add-hline(4, max: 8, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))
        plot.add(x => -x + 12 , domain: (3,9), label: $ m^d_2 (Y_"green") $, style: (stroke: red))
        plot.add(((8, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none)) 

      }
    )
  })
)



Formally: 

#let formal_3  = $
  & SS  =   \
  & EE_(KK KK)  \
  & EE_(II SS -LL  MM) \
  & EE_(FF MM)  \
  & Re = 
$

#block(
  inset: 10pt, 
  stroke: 0.2pt, 
  width: 100%,
  formal_3
  
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
      plot.add(x => x, domain: (2,8), label: $"LM"_1$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 10, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 9, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      plot.add(x => x - 2, domain: (3,9), label: $"LM"_2$, style: (stroke: rgb(red)))
      plot.add(((5, 3),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none)) 
      plot.add-hline(3, max: 5, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))


      plot.add(((6, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none)) 
      plot.add-hline(4, max: 6, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))
      plot.add-vline(6, max: 4, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))

      plot.add-hline(1, min: 5 , max: 6, label: "Change of income in IS-LM via monetary policy", style: (stroke: (paint: rgb(purple), dash: "dotted", thickness: 1pt)))

      plot.add-vline(5.2, min: 3, max: 5, label: "Liquidity effect" , style: (stroke: (paint: rgb(orange), dash: "dotted", thickness: 1pt)))

      plot.add-vline(4.8, min: 3, max: 4, label: "Income effect" , style: (stroke: (paint: rgb(yellow), dash: "dotted", thickness: 1pt)))
      }
    )
}),
#set align(left)


Formally: 

#let task  = $
  & SS  =   \
  & EE_(KK KK)  \
  & EE_(II SS -LL  MM) \
  & EE_(FF MM)  \
  & Re = 
$

#block(
  inset: 10pt, 
  stroke: 0.2pt, 
  width: 100%,
  task
  
)


*Effects of the monetary policy in the IS-LM model.*

Увеличение предложения денег ($M^S$) при исходоной ставки процента и исходном уровне выпуска ведет к $m^d < (M^S)/P => S_"ЦБ" < D_"ЦБ"$. Для ликвидации неравновесия на рынке уенных бумаг их доходность $(R)$ падает , это действует эффект ликвидности. Снижение ставки процента увеличивает инвестиции, совокупные расходы растут, доходы расту ($Y$), спрос на деньги $m^d$ растет. На финансовом рынке возникает неравновесие: $m^d > M^S/P => S_"ЦБ" > D_"ЦБ"$. Для ликвидации неравновесия на рынке ценных бумаг доходность ($R arrow.t$), это действует эффект дохода. Так как действие эффекта ликвидности больше эффекта доход, то в результате равновесная ставка процента падает, то есть в итоге на товарном рынке инвестиции растут, равновестный доход растет.    


#set align(center)
#grid(
  columns: (1fr, 1fr, 1fr), 
  gutter: 1em,  

  canvas({
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: "M?P", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "south",
      {
        let domain = (0, 10)

        plot.add(x => -x + 10 , domain: (2,8), label: $m^d (Y_1)$, style: (stroke: black))

        plot.add-hline(5, min: 0, max: 10, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add-vline(5, label: $ M_1^S/P $, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))

        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

        plot.add-vline(7, label: $ M_2^S/P $, style: (stroke: (paint: rgb(red), thickness: 1pt)))
        plot.add(((7, 3),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
        plot.add-hline(3, min: 0, max: 10, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
        plot.add(x => -x + 11.5 , domain: (3,9), label: $ m^d (Y_2) $, style: (stroke: green))


        plot.add(((7, 4.5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
        plot.add-hline(4.5, min: 0, max: 10, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))
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
      legend: "south",
      {
        let domain = (0, 10)
        plot.add(x => -x + 10 , domain: (2,8), style: (stroke: black))
        plot.add-hline(5, min: 0, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

        plot.add-hline(3, min: 0, max: 10, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
        plot.add(((7, 3),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))

        plot.add-hline(4.5, min: 0, max: 10, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))
        plot.add(((5.5, 4.5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))


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

        plot.add(x => -x + 10, domain: (2,8), label: $"IS"$, style: (stroke: rgb("#000000")))
        plot.add(x => x, domain: (2,8), label: $"LM"_1$, style: (stroke: rgb("#938c8c")))
        plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

        plot.add(((4, 3),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
        plot.add(x => x - 1, domain: (2.5,8.5), label: $"LM"_2$, style: (stroke: rgb(red)))

        plot.add-hline(3, min: 0, max: 10, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))

        plot.add(((5.5, 4.5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
        plot.add-hline(4.5, min: 0, max: 5.8, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))
        plot.add-vline(5.5, max: 4.6, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))




      }
    )
  })
)
#set align(left)

*Изменения ставки процента в результате действия эффекта ликвидности.*

#let task  = $
M/P = m^(d')_Y dot Y + m^('d)_R dot R ==> (d M)/P - M/(P^2) dot d P = m^(d')_Y dot d Y + m^(d')_R dot d R ==> d R |_"LE" = 1/(m^d'_R) dot (d M)/P 
$

#block(
  inset: 10pt, 
  stroke: 0.2pt, 
  width: 100%,
  task
)

*Изменение ставки процента в результате действия эффекта дохода.*

#let task  = $
M/P = m^(d')_Y dot Y + m^('d)_R dot R ==> (d M)/P - M/(P^2) dot d P = m^(d')_Y dot d Y + m^(d')_R dot d R ==> d R |_"YE" = - (m^(d')_Y)/m^(d')_R dot d Y 
$

#block(
  inset: 10pt, 
  stroke: 0.2pt, 
  width: 100%,
  task
)

*Изменение ставки процента при проедениии монетарной политики.*

#let task  = $
d R  = d R|_"LE" + d R|_"YE" = (1/(m^d'_R) dot (d M)/P) dot (- (m^d'_Y)/m^d'_R dot d Y ) = 1/(m^'_R) dot ((d M)/P - m^d'_Y dot d Y)
$

#block(
  inset: 10pt, 
  stroke: 0.2pt, 
  width: 100%,
  task
)

*Изменение равновесного дохода при моентарной политики.*

#let task  = $
d Y = 1/(1 - alpha) dot (d I)
$

#block(
  inset: 10pt, 
  stroke: 0.2pt, 
  width: 100%,
  task
)

= Смешанная политика спроса в модели IS-LM

#let mixed_IS_LM = $
mat((1-α)/m_d^(Y'), -I^'_R; m_d^(Y') , m_d^R)dot vec(d Y, d R) = vec(d G , (d M^S)/P)
==>  \ 
==>

    d Y  
  = mat(#($ d G$, $- I^'_R$), #($ (d M^S)/P$, $m^d'_R$), delim: "|")/triangle  = (m^(d')_R + I'_R)/triangle  dot d G > 0 , quad  

  d R 
  = mat(#($(1- alpha)$, $d G$), #($m^d'_Y$, $ (d M^S)/P$), delim: "|") /triangle = (overbracket((1 - alpha), (+)) dot (d M)/P  overbracket( - m^d_Y dot d G, (-)) )/triangle <  0
$

#block(
  inset: 10pt, 
  stroke: 0.2pt, 
  width: 100%, 
  mixed_IS_LM, 
)


*Монетарная политика и сдвиг кривой AD.*

При монетарной политике экономика в модели IS-LM переходит в новое равновесие. 

Величина совокупного спроса растет, но при том же уровне цен, что соотвествует параллеьному сдвигу AD. 

Изменение величины совокупного спроса соотвествует изменинеию равновесного выпуска в модели IS-LM. 

Чем больше моентарная политика в модели IS-LM воздействует на выпуск, тем более эффективно она воздействует на совокупный спрос. При этом изменение спроса при том же уровне цен равно изменению равновесия в IS-LM. 

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
      plot.add(x => -x + 10, domain: (2,8), label: $ "IS"(G_1) $, style: (stroke: rgb("#000000")))
      plot.add(x => x, domain: (2,8), label: $ "LM"(P_1, M_1) $, style: (stroke: rgb("#938c8c")))
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      plot.add(x => x, domain: (2,8), label: $ "LM"(P_1, M_2) $, style: (stroke: rgb("#938c8c")))
      plot.add(x => x - 3, domain: (3.8,9.5), label: $ "LM" $, style: (stroke: rgb(red)))

      plot.add-vline(6.5, max: 3.5, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))
      plot.add(((6.5, 3.5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))

      plot.add(((6.5, 6.5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
      plot.add-vline(6.5, min: 3.5, max: 6.5, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))
      plot.add-hline(6.5, max: 6.5, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))


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
      plot.add(x => -x + 10, domain: (2,8), label: $"AD" (M_1)$, style: (stroke: rgb("#000000")))

      plot.add(x => -x + 12, domain: (3,9), label: $"AD" (M_2)$, style: (stroke: rgb(red)))

      plot.add-vline(5, max: 10, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 5, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))

      plot.add-hline(5,min: 5, max: 7, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))

      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      plot.add(((5, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))

      plot.add(((7, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
      }
    )
}),

Рассмотрим политику $d G = (d M)/P$ в модели IS-LM при случае падения ставки процента. 

#canvas({ //this is the KK model 
  import draw: *

  plot.plot(
    size: (6, 6),
    x-label: $"Y"$, y-label: $"AE"$,
    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: 0, y-max: 10,
    legend: "north-east",

    {
      let domain = (0, 10)
      plot.add(x => x, domain: domain, style: (stroke: black),label: $ "AE"_f $)
      plot.add(x => x * 1/2 + 1.5, domain: domain, style: (stroke: black), label: $ "AE"_1_(p l) (R_1) $)
      plot.add-vline(3, max: 3, style: (stroke: (paint: rgb("#938c8c"), dash: "dotted", thickness: 1pt)))
      plot.add(((3, 3),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      plot.add(x => x * 1/2 + 3, domain: domain, style: (stroke: red), label: $ "AE"_2_(p l) (R_1) $)
      plot.add(((7, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
      plot.add-vline(7, max: 7, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))


      plot.add(x => x * 1/2 + 3.5, domain: domain, style: (stroke: green), label: $ "AE"_3_(p l) (R_3) $)
      plot.add(((6, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
      plot.add-vline(6, max: 6, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))

      plot.add-vline(1, min: 2, max: 3.6, label: $ triangle G  $ , style: (stroke: (paint: rgb(red),  dash: "dotted", thickness: 1pt)))

      plot.add-vline(1.2, min: 3.6, max: 4, label: $ triangle I $ , style: (stroke: (paint: rgb(green),  dash: "dotted", thickness: 1pt)))
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
      plot.add(x => -x + 8, domain: (1,7), label: $"IS"_1$, style: (stroke: rgb("#000000")))
      plot.add(x => x + 2, domain: (1,7), label: $"LM"$, style: (stroke: rgb("#938c8c")))
      plot.add-vline(3, max: 10, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add-hline(5, max: 10, style: (stroke: (paint: rgb("#000000"), dash: "dotted", thickness: 1pt)))
      plot.add(((3, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none)) 

      plot.add-vline(6, max: 10, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))

      plot.add-vline(7, max: 10, style: (stroke: (paint: rgb(green), dash: "dotted", thickness: 1pt)))

      plot.add(x => -x + 11, domain: (2.5,9), label: $"IS"_2$, style: (stroke: rgb(red)))
      plot.add(x => x  - 2, domain: (2,9), label: $"LM"_2$, style: (stroke: rgb(orange)))


      plot.add(((6, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
      plot.add-hline(2, max: 10, style: (stroke: (paint: rgb(red), dash: "dotted", thickness: 1pt)))


      plot.add(((9, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))


      plot.add(((3, 1),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: orange, thickness: 2pt), fill: orange), style: (stroke: none))

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

#let task  = $
  & SS  =   \
  & EE_(KK KK)  \
  & EE_(II SS -LL  MM) \
  & EE_(FF MM)  \
  & Re = 
$

#block(
  inset: 10pt, 
  stroke: 0.2pt, 
  width: 100%,
  task
  
)