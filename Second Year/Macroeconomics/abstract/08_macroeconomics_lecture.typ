#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-plot:0.1.3": plot


#show heading: set align(center)
= Макроэкономика 
== Лекция 8
== Модель IS - LM 
== Экономика и Анализ Данных 
== Фрейре Серёгина Даниэль Фабиан


#pagebreak()
#show heading: set align(left)


Сохраним все предедущие предпослыки, с исключением того что ставка процента у нас может изменяться.Тоже, вспомним что любая точка на IS была точкой равновесия товарного рынка, но точную ставку процента мы не знали, а когда строилась точка LM, где любая точка на кривой была состоянием равновесия финансового рынка, но мы не знали равновесный уровень дохода Y. Что-же произойдет если мы их совместим?


= Модель IS - LM (Investment-Saving  =  Liquidity preference)

Модель IS  - LM показывает равновесие между товарным рынком (IS) и денежном рынке (LM) соотвественно. 

*Равновесие в модели IS - LM:*

#let model_IS_LM = $
cases(
  "IS" := (1 - alpha) dot Y = A_0 + I'_R dot R, , "LM":= m^d_Y dot Y + m^d_R dot R = M/P)
$

#set align(center)
#block(
  fill: rgb(255,140,0, 100),
  inset: 10pt, 
  model_IS_LM
)
#set align(left)


#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({ // Money market 
    import draw: *
    plot.plot(
      size: (7, 7),
      x-label: $Y$, y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (2, 8)
        plot.add-vline(5, style: (stroke: (paint: rgb("#000000"), thickness: 0.5pt)))
        plot.add(x => -x + 10, domain: (2,8), label: $"IS"$, style: (stroke: rgb("#000000")))
        plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
        plot.add-hline(5, min: 0, max: 10, style: (stroke: (paint: rgb("#000000"), thickness: 0.5pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))
        
      }
    )
  }),
  // LM model 
  canvas({
    import draw: *
    plot.plot(
      size: (7, 7),
      x-label: $M/D$, y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (2, 8)
        plot.add(x => -x + 10 , domain: (2,8), label: $m^d (Y_1)$, style: (stroke: black))
        plot.add-hline(5, min: 0, max: 10, style: (stroke: (paint: rgb("#000000"), thickness: 0.5pt)))
        plot.add-vline(5, label: $M^S/P$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))
      }
    )
  })
)
#set align(left)

Теперь, рассмотрим ситуацию когда мы находимся не в равновесии. 

#set align(center)
#grid(
  columns: (1fr, 1fr, 1fr), 
  gutter: 1em,  

  canvas({ //IS model
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: "Y", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)
        plot.add(x => -x + 10, domain: (2,8), label: $"IS"$, style: (stroke: rgb("#000000")))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))
        plot.add(((3, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))
        plot.add(((7, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))
        plot.add-hline(5, min: 3, max: 7, style: (stroke: (paint: rgb("#000000"), thickness: 0.5pt)))
      }
    )
  }),

  canvas({ // LM model 
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: "Y", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)
        plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#000000")))
        plot.add-vline(5,  min: 3, max:  7, style: (stroke: (paint: rgb("#000000"), thickness: 0.5pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))
        plot.add(((5, 3),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))
        plot.add(((5, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))
      }
    )
  }),

  canvas({ //IS - LM model 
    import draw: *
    plot.plot(
      size: (4.9, 4.9),
      x-label: "Y", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (0, 10)
        plot.add(x => -x + 10, domain: (2,8), label: $"IS"$, style: (stroke: rgb("#000000")))
        plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))    
        plot.add(((5, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))
        plot.add(((5, 3),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))    
        plot.add(((3, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))    
        plot.add(((7, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))    
      }
    )
  })
)
#set align(left)


Рас мы ввели равновесие, нужно рассмотреть что произойдет когда экономика выдет из равновесия. Считаем слева направо. 


Figure 1. 

Когда мы находимся в состоянии неравновесия при одной ставки процента, если мы над кривой IS, то мы наблюдаем избыток предложения (дефицит спроса) на товарном рынке и фирма будет сокращять свое производство. Если мы под кривой IS то наблюдается дефицит предложения (избыток спроса) на товарном рынке, и фирма будет увеличивать свое производство.

Figure 2. 

Когда мы находимся в состоянии неравновесия, если мы находимся над LM, то на денежном рынке избыток спроса (и дефицит спроса на рынке ценных бумаг), по этому ставка процента начинает падать. Если мы находимся под кривой LM то на денежном рынке дефицит спроса (избыток спроса на рынке ценных бумаг), и по этому ставка процента начинает расти. 

Figure 3. 

Если мы обьединим обе модели, то у нас будет четыре квадранта. Рассмотрим ситуацию не равновесия в такой экономики. 

I. Над точкой равновесия. Мы находимся над LM и над IS, на денежом рынке происходит избыток спроса (дефицит спроса на рынке ценных буман), а на товарном рынке избыток предложения (дефицит спроса). Произойдет уменьшение производста и процентной ставки.

II. Справа точки равновесия. Мы находимся над IS и под LM. На товарном рынке избыток предложения (дефицит спроса), а на денежном рынке дефицит спроса (избыток спроса на рынке ценных бумаг), что значит что производсто будет падать а ставка процента расти. 

III. Под точкой равновесия. Мы находимся под IS и под LM. На товарном избыток предложения (дефицит спроса), а на денежном рынке дефицит спроса (избыток спроса на рынке ценных бумаг). Как результат производсто будет расти а ставка процента падать. 

IV. Cлева точки равновесия. Мы находимся под IS и под LM. На товарном рынке будет дефицит спроса (избыток предложения), а на денежом рынке будет дефицит спроса (избыток спроса на рынке ценных бумаг). Как результат падает производство и растет ставка процента. 

В таких моделях мы можем иметь равновесие по спирали или движение по круту. 

#let imporant = "Важно отметить что ставка процента всегда реагирует моментально, и уровень дохода реагирует медленеее. Тогда изменения I, II, III, IV выглядят так: "

#block(
  fill: rgb(255,140,0, 100),
  inset: 10pt, 
  imporant
)
#set align(left)

#set align(center)
#canvas({
  import draw: *

  plot.plot(
    size: (6, 6),
    
    x-label: $"Y"$,
    y-label: $"Y"$,

    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: 0, y-max: 10,
    legend: "inner-north",

    {
      let domain = (0, 10)
        plot.add(x => -x + 10, domain: (2,8), label: $"IS"$, style: (stroke: rgb("#000000")))
        plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))
        plot.add(((3, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 1pt), fill: black), style: (stroke: none)) 
        plot.add(((3, 3),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 1pt), fill: black), style: (stroke: none)) 
        plot.add(((4, 3),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 1pt), fill: black), style: (stroke: none)) 
        plot.add(((4, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 1pt), fill: black), style: (stroke: none)) 
        plot.add(((5, 4),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 1pt), fill: black), style: (stroke: none)) 
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 1pt), fill: black), style: (stroke: none)) 
    }
  )
})
#set align(left)

Найдем равновесие в модели IS - LM. 


=== Метод Крамера (напоминание).


#let method = $
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

#set align(center)
#block(
  fill: rgb("#35353564"),
  inset: 10pt, 
  method
)
#set align(left)


#set align(center)

#block(
  fill: rgb(255,140,0, 100),
  inset: 10pt, 
  model_IS_LM
)

#set align(left)



Применим метод Крамера чтобы выразить $Y$ и $R$. Т.к они наши переменные то все что зависит от них пойдет в право. 

$
  cases(
    (1 - alpha) dot Y - I'_R dot R = A_0  ,, 
    m^d'_Y dot Y + m^d'_R dot R = M^S / P
  )
  ==> 
  mat(
    (1- alpha), - I'_R ;
    m^d'_Y , m^d'_R
  ) dot 
  mat(
    Y;
    R
  ) 
  =
  mat(
    A_0 ;
    M/P
  ) 
  \
  Delta = undershell(1 - alpha, (+)) dot undershell(m^d'_R,(-)) + undershell(I'_R, (-)) dot undershell(m^d'_Y, (+)) < 0 
  \
  Y = (det mat(A_0, -I'_R; M^S/P, m^d'_R))/triangle  = (overshell(A_0, (+)) dot overshell(m^d'_R, (-))+overshell(I'_R, (-)) dot overshell(M^S/P, (+)))/triangle > 0  
  \
  R = (det mat( (1-alpha), A_0; m^d'_Y, M^S/P))/triangle  = (overshell((1-alpha), (+)) dot overshell( M^S/P, (+))-overshell(A_0, (+)) dot overshell(m^d'_Y, (+)))/triangle > 0  
$

Далее разберем числовой пример. 

#set align(center)

#let example = $
  cases(
  0.4 dot Y = 200 - 0.1 dot R, , 
  0.2 dot Y - 0.2 dot R = 500/1 
  )
  =
  mat(
    0.4 , 0.1 ; 
    0.2, -0.2
  ) dot 
  mat(
    Y; 
    R 
  ) = 
  mat(
    200; 
    500
  )
  \ \
  Delta = 0.4 dot (-0.2) -0.1 dot 0.2 = -0.1 
  \ \ 
  Y = mat(200, 0.1; 500, -0.2)/(-0.1) = -90/(-0.1) = 900 , quad 
  R = mat(0.4, 200; 0.2, 500)/(-0.1) = 160/(-0.1)=-1600 

$

#block(
  fill: rgb(87, 127, 230, 100),
  inset: 10pt, 
  example
)

#set align(left)


Теперь рассмотрим что как модель IS - LM это модель совокупного спроса. Это можно сделать выведя уровенение совокупного спроса из равновесия IS - LM, но значала немного визуальных эффектов. 

#canvas({ //this is the KK model 
  import draw: *

  plot.plot(
    size: (6, 6),
    
    x-label: $"AE"$,
    y-label: $"Y"$,

    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: 0, y-max: 10,
    legend: "inner-north",

    {
      let domain = (0, 10)

      plot.add(x => x, domain: domain, style: (stroke: black), label: $"AE"_f$)
      plot.add(x => x * 1/2 + 2.5, domain: domain, style: (stroke: black), label: $"AE"_(p l)$)
      plot.add-vline(5, max: 5, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))

      plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

      plot.add(x => x * 1/2 + 1, domain: domain, style: (stroke: green))
      plot.add-vline(4,max: 3, style: (stroke: (paint: rgb(green), thickness: 0.5pt)))
      plot.add(((4, 3),), mark: "o", mark-size: 6pt, mark-style: (stroke: (paint: green), fill: green), style: (stroke: none))


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
      legend: "inner-north",
      {
        let domain = (2, 8) //LM and IS plots
        plot.add(x => -x + 10 , domain: (2,8), label: "IS", style: (stroke: black))
        plot.add(x => x, domain: (2,8), label: $"LM"$, style: (stroke: rgb("#938c8c")))

        //dotted
        plot.add-hline(5, min: 0, max: 10, style: (stroke: (paint: rgb("#000000"), thickness: 0.5pt)))
        plot.add-vline(5,style: (stroke: (paint: rgb("#000000"), thickness: 0.5pt)))

        //Eq 
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

        plot.add-hline(7, min: 0, max: 10, style: (stroke: (paint: rgb(red), thickness: 0.5pt)))
        plot.add(((5, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
        plot.add(x => x + 2, domain: (2,8),  style: (stroke: rgb(red)))

        plot.add(((4, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))  

        plot.add-hline(6, min: 4, max: 10, style: (stroke: (paint: rgb(green), thickness: 0.5pt)))
        plot.add-vline(4,style: (stroke: (paint: rgb(green), thickness: 0.5pt)))
      }
    )
  }),

  canvas({ //monetary market 
    import draw: *
    plot.plot(
      size: (6, 6),
      x-label: $M/P$, y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (2, 8)
        plot.add(x => -x + 10 , domain: (2,8), label: $m^d (Y_0)$, style: (stroke: black))
        plot.add-hline(5, min: 0, max: 5, style: (stroke: (paint: rgb("#000000"), thickness: 0.5pt)))
        plot.add-vline(5, label: $M^S/P$, style: (stroke: (paint: rgb("#938c8c"), thickness: 1pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))
        plot.add-vline(3, style: (stroke: (paint: rgb(red), thickness: 1pt))) 
        plot.add(((3, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none)) 
        plot.add-hline(7, min: 0, max: 3, style: (stroke: (paint: rgb(red), thickness: 0.5pt)))

        plot.add-hline(6, min: 0, max: 4, style: (stroke: (paint: rgb(green), thickness: 0.5pt)))
        plot.add(((3, 6),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none)) 

        plot.add(x => -x + 9 , domain: (2,8), style: (stroke: green))


               
      }
    )
  })
)

#canvas({ //this is the KK model 
  import draw: *

  plot.plot(
    size: (6, 6),
    
    x-label: $"Y"$,
    y-label: $"P"$,

    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: 0, y-max: 10,
    legend: "inner-north",

    {
      let domain = (0, 10)
      plot.add(x => -x + 10 , domain: (2,8), style: (stroke: black), label: "AD")
      plot.add-vline(5,style: (stroke: (paint: rgb("#000000"), thickness: 0.5pt)))
      plot.add-hline(5,max: 5, style: (stroke: (paint: rgb("#000000"), thickness: 0.5pt))) 

      plot.add(((4, 6),), mark: "o", mark-size: 6pt, mark-style: (stroke: (paint: green), fill: green), style: (stroke: none))
      plot.add-vline(4,style: (stroke: (paint: rgb(green), thickness: 0.5pt)))      
    }
  )
})

Допустим что изменилась цена (#text(red)[$p_1$] > $p_0$). Все начальные изменения происходят учитивая что уровень дохода = $Y_1$. На денежном рынке сдвигается предложения денег. На модели IS - LM мы происходим в красную точку со своей ставкой процента и прежнем уровене дохода. Она не находится в равновесии, и т.к. над IS и над LM, то существует избыток предложения (дефицит спроса) на товарном рынке, избыток спроса на денежном рынке (дефицит спроса на рынке ценных бумаг). Как результат балансирования получаем #text(green)[новую точку], с новым уровенем дохода и ставки процента. Остальные изменения аналогичны тому что мы уже знаем. 


*Формально распишем описанное.*

Мы хотим найти как измениться равновестная величиниа Y в модели IS - LM при изменении цен. 

$
  Y = (A_0 dot m^d'_R +I'_R  dot M^S/P) /triangle = undershell((m^d'_R)/triangle, (1) ) dot A_0 + undershell(I'_R/triangle, (2)) dot M/P   = "AD"
  \ \
  (1) : = "Мультипликатор фискальной политики IS - LM" 
  \ \ 
  (2) := "Мультипликатор монетарной политики IS - LM" 

$


$
  delta (Y) = m^d'_R/ Delta dot overshell( A_0, 0) + I'_R/Delta overshell((delta M)/P, 0) - I'_R/triangle  dot M/p^2 dot delta (P)
  => 
  delta (Y )= -(I'_R dot M)/(Delta dot p^2) delta P 
  =>  
  lr((delta P)/ (delta Y)|)_"AD"
 = (- Delta dot p^2)/(I'_R dot M)  < 0 
$

*Формальная оценка воздейсвия политики на состояния равновесие в IS - LM.*

В очередной раз воспользуемся методом Крамера. 

$
  "Eq"_"IS-LM" := cases(
    (1 - alpha) dot Y - I'_R dot R = A_0  ,, 
    m^d'_Y dot Y + m^d'_R dot R = M^S / P
  )
  ==> 
  cases(
    (1 - alpha) dot delta(Y) - I'_R dot delta(R) = delta(A_0)  ,, 
    m^d'_Y dot delta(Y) + m^d'_R dot delta(R) =delta( M^S / P)
  )
  \ \ 


  mat(
    (1- alpha), - I'_R ;
    m^d'_Y , m^d'_R
  ) dot 
  mat(
    delta(Y);
    delta(R)
  ) 
  =
  mat(
    delta(A_0) ;
    delta(M/P)
  ) 
  \
  Delta = 1 - alpha dot m^d'_R + I'_R dot m^d'_Y overshell(<,s.t.) 0 
  \
  delta(Y) = (det mat(A_0, -I'_R; delta(M/P), m^d'_R))/triangle  = (delta(A_0) dot delta(m^d'_R)+ I'_R dot delta(M/P))/triangle  = (m^d'_R)/triangle dot delta(A_0) + I'_R/triangle dot delta(M/P) 
  \
  s.t. := delta(A_0) = delta(C_0) - "mpc" delta(T_0) + delta(I_0) + delta ("G") + delta( N_X_0)
  \
  delta(R) = (det mat( (1-alpha), delta(A_0); m^d'_Y, delta(M/P)))/triangle  = ((1-alpha) dot delta(M/P)- delta (A_0) dot m^d'_Y)/triangle 
$

$
triangle.filled
$