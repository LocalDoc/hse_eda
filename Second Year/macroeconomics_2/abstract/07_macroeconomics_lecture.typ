#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-plot:0.1.3": plot


#show heading: set align(center)
= Макроэкономика 
=== Лекция 7 
=== Уравнение LM и монетарная политика
=== Экономика и Анализ Данных 
=== Фрейре Серёгина Даниэль Фабиан


#pagebreak()
#show heading: set align(left)

О любых найденных ошибках, несостыковок, и опечаток сообщять #link("https://t.me/local_dan")[мне], либо сделать merge request на #link("github.com/LocalDoc/hse_eda/tree/main/Second Year/Macroeconomics")[гит]. Я буду очень благодарен. 

#let inquiry = "Мы уже рассматривали как денежный рынок и рынок ценных бумаг взаимосвязаны в прошлой лекции. Мы посмотрели как он возвращяется обратно в равновесие после некого шока. Полезно попытаться обяснить что происходит в Figure 1 перед тем как продолжить (лекция 6)."

#block(
  fill: luma(235),
  inset: 10pt,
  inquiry,
)

#set align(center)

#figure(
  image("/assets/image-2.png", width: 60%),
  caption: []
)
#set align(left)


#let inquiry  = "Что может изменить состояние равновесия на денежном рынке?"

#block(
  fill: oklab(70%, -0.05, -0.1),
  inset: 10pt,
  inquiry,
)

Графически понятно что это либо сдвиг спроса на денги, либо предложения на денги, так как рынок ценных бумаг влечел изменения на денежном рынке. 

#set align(center)

#figure(
  image("/assets/image-1.png", width: 60%),
  caption: []
)
#set align(left)


+ Может сдвинуться реальное предложение благодоря (изменение денежного предложение $triangle "M", "уровень цен" triangle "P" ("Не в КК, где цены const")$). В данном случае, сдвигается реальное предложение денег $("M"^"S")/"P"$. 
+ Спрос на денги $m^d$ может крутиться ($(delta m^d)/(delta R)$) или сдвигаться ($triangle Y$) спрос на деньги $m^d$. 

*Математически:*

Формально рассмотрим изменение денежного рынка. 

Равновесие для обоих вариантов:
$
  (1) triangle M, triangle P "где сдвигается предложение денег" ("M"^"S")/"P" : cases(
    m^d =  underbrace("m"^d'_Y, "(+)") dot Y_1 + underbrace("m"^d'_R, "(-)") dot R , 
    ("M"^"S")/P = "M"_0/"P"_0)
    \ 
    "Так как равновесие на " Y_1, "по этому " Y = Y_1 
    \
    \
    "Далее равновесие денежного рынка:"
    \
    "M"/"P"^2 = underbrace("m"^d'_Y, "(+)") dot Y_1 + underbrace("m"^d'_R, "(-)") dot R
$

Продифференцируем равновесие. 
$
  (delta M)/P - M/P delta P = "m"^d'_Y dot delta Y + "m"^d'_R dot delta R
$

Теперь рассмотрим что может изменить точку равновесия на денежном рынке с координатами покупательной способноси и ставки процента. Воспользуемся графиком. 

#set align(center)
#figure(
  image("/assets/image.png", width: 60%),
  caption: []
)
#set align(left)


Зафиксируем P, и рассмотрим изменение M.

Рост денежной массы $arrow.t M   => $ рост предложения на деньги  $arrow.t M^S / P$ при той же ставки процента $R = R_1$. На денежном рынке у нас возник избыток предложения или дефицит спроса $"m"^d < "M"^S / P$. Это озночает что на денежном рынке происходит избыток спроса или дефицит предложения ($D_"CB" > S_"CB"$). Из этого следует падению номинальной ставки процента $arrow.b R$, а это приведет в равновесие рынок ценных бумаг $S_"ЦБ" = D_"ЦБ"$ при $R = R_2$. Далее, так как спрос на денги $m^d$ отрицательно зависит от ставки процента, а значит что при падении ставки процента спрос на деньги вырастет, дав нам равновесие денежного рынка $M^S/P = m^d$ при новой ставки номинального процента $R=R_2$.

Формально:

$
  arrow.t M   ==> arrow.t M^S / P "при" R = R_1 ==> "m"^d < "M"^S / P ==> D_"ЦБ" > S_"ЦБ" ==> arrow.b R ==> 
  cases(
    S_"ЦБ" = D_"ЦБ" "при"  R = R_2, 
    m^d(R) arrow.t ==> "при" R = R_2
  )
  
$

Теперь зафиксируем M и рассмотрим изменение P. 

#set align(center)
#figure(
  image("/assets/image-3.png", width: 60%),
  caption: []
)
#set align(left)

Запишем формально, повторяя процесс текстовым способом:

$
  P arrow.t ==> M/P "при" R=R_1 ==> m^d > ("M"^"S")/P ==> D_"ЦБ" < S_"ЦБ" ==> R arrow.t ==>
  cases(
    S_"ЦБ" = D_"ЦБ"  "при" R= R_2, 
    m^d = "M"^"S"/P "при" R=R_2
  )
$


Теперь рассмотрим, что произойдет, если изменится спрос на деньги $m^d$ при фиксированных M и P.


Формула спроса на деньги. 

$
  m^d = m^(d')_Y dot Y + m^(d')_R dot R
$

Рассмотрим от чего будет зависить изменение спроса на денгьи $m^d$
(на лекциях тоже называется как покупная способнось, хотя  не уверен насколько этот корректно).

$
  delta (m^d) = m^(d')_Y dot delta Y + m^(d')_R dot delta R
$

Cдвиг спроса на деньги будет спровоцирован изменением $Y$, но что будет крутить спрос на деньги не очень понятно, 
что и найдем. 

$
  (delta R)/(delta m^d)|_(m^d) = 1/(m^(d')_R)
$

В итоге: 


#let important  = $ delta (m^d) = underbrace( m^(d')_Y , "Сдвиг" m^d ) dot delta Y + underbrace( m^(d')_R, "Поворот" m^d)  dot delta R $

#set align(center)
#block(
  fill: oklab(80%, 0.05, 0.1),
  inset: 10pt,
  important,
)
#set align(left)

#pagebreak()

= Уравнение LM (Liquidity preference =  Money supply)
Равновесие финансового рынка при любом возможном уровне дохода. Показывает все возможные комбинации уровней ставки процента $R$ и реального дохода $Y$ при которых денежный рынок находиться в равновеии ($m^d = (M^S)/P$).


#let important  = $"LM" : "M"^S/"P" = m^d'_Y dot  Y  + m^d'_R dot R$

#set align(center)
#block(
  fill: oklab(80%, 0.05, 0.1),
  inset: 10pt,
  important,
)
#set align(left)

Угол наклона LM при прочих равных условиях. 

#let important  = $((delta R)/(delta Y)) _"LM" = - (m^d'_Y)/(m^d'_R) $

#set align(center)
#block(
  fill: oklab(80%, 0.05, 0.1),
  inset: 10pt,
  important,
)
#set align(left)

Аналогично прошлым моделям, не всегда очевидно какой угол или точка должны измениться при изменении LM. 

#set align(center)
#canvas({
  import draw: *

  plot.plot(
    size: (6, 6),
    
    x-label: $"Y"$,
    y-label: $"R"$,

    x-tick-step: none, y-tick-step: none,
    x-min: 0, x-max: 10, y-min: -2, y-max: 10,
    legend: "inner-north",

    {
        let domain = (-2, 8)
        plot.add(x => x - 1, domain: domain, label: "LM", style: (stroke: black))
        plot.add(x => x * 1/2 - 1/2   , domain: domain, label: $"LM при" m^d'_Y arrow.t$, style: (stroke: red))
        plot.add(x => x * 2 -1   , domain: domain, label: $"LM при" |m^d'_R| arrow.t$, style: (stroke: blue))
        plot.add-hline(0, min: 0, max: 10, style: (stroke: (paint: rgb("#000000"))))
        plot.add(((1, 0),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))
        plot.add(((0, -1),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))

    }
  )
})
#set align(left)

(пока не осознал как точки подсипывать, но короче B = (-1,0), A = (1,0) и угол 1 это от точки А к Y)

$
  (delta"M")/P - "M"/"P"^2 dot delta P = m^d'_Y dot  delta Y + m_R^d' dot R ,
$

#let important = $
  R(Y) : R= underbrace(1/(m^d'_R) dot "M"'/"P", B)  - underbrace((m^d'_Y)/(m^d'_R) dot Y, "tg угла"  1)  , quad Y(R) : underbrace(Y = 1/(m^d'_Y) dot "M"/"P", A)  - (m^d'_R)/(m^d'_Y) dot R
$
#set align(center)
#block(
  fill: oklab(80%, 0.05, 0.1),
  inset: 10pt, 
  important
)
#set align(left)

Данное позволяет обсудить эффекты монетарной политики.

=== Монетарная политика.

Проводиться ЦБ через изменение денежного предложения, среди инструментов ЦБ будут: ставка рефенансирования $r_("ref")$ , норма обязятельного резервирования $ r r_("for")$ и операции на открытом рынке. 

Рассмотрим каждое из этих инструментов. 

*Ставка рефенансирования ($r_("for")$)*  (Ключевая ставка)

Ставка под которую ЦБ дает кредиты коммерчиским банкам. При ее росте коммерчиским банкам становиться дороже брать кредиты. и кредитные возможности коммерчиских банков падают, что значит что стоимость кредита выростет. При меньшем количестве банков которых берут кредиты. то денежное предложение будеит уменьшаться. 

Выжно отметить что при изменении ключевой ставки, денежнный мультипликатор не меняется, так как: 

$
  k_m = (1 + "cr")/("cr" + "rr")
$

*Норма обязятельного резервирования ($r r _"for"$)*. 

При ее изменеии: 

$
  triangle M= D ( 1 -  r r) dot 1/(r r ), "где " r r = r r _("forced") + r r _("voluntary") 
$

При росте ставки обязятельного резервирования так-же изменяется мультипликатор. 

*Операции на открытом рынке.*

Операции на открытом рынке делиться на первичный и вторичный рынок ценных бумаг. 
- Первичный: Имитент продает ценные бумаги. 
- Вторичный: Торгует кто угодно проме имитетна. 

Напоминание: Государство выпускает некоторые гос облигации V, которые делятся между населением и центальным банком. 

$
  V = B + B_("CB")
$


#set align(center)
#table(
  columns: 2, 
  [*Aктивы*], [*Пассивы*], 
  [OR], [Cash],
  [$"B"_"CB"$],[RR]
)
#set align(left)


Если мы хотим это как суммиризировать. 

#set align(center)
#table(
  columns: 2, 
  [Первичный рынок], [Вторичный рынок], 
  [Государство $arrow$ население ],[население $arrows.rl$ ЦБ],
  [$triangle V = triangle B $],[$triangle "B" = triangle "B"_"CB"$], 
  [$triangle B_"CB" = 0$],[$triangle V = 0$], 
  [$triangle M  =  0$],[$triangle M > 0$],
  [Связан с фискальной политикой], [Монетарная политика]
)
#set align(left)

Что стоит сделать если мы хотим произвести стимулирующию и сдерживающию политику?

#set align(center)

#table(
  columns: 3, 
  [],[$ M arrow.t => arrow.t Y$],[$M arrow.b => Y arrow.t$],
  [$r_("ref")$],[$arrow.b$],[$arrow.t$],
  [$r r _"for"$],[$arrow.b$],[$arrow.t$],
  [Операции на открытом рынке],[$triangle B_"ЦБ" > 0$ ],[$triangle B_"ЦБ" < 0$],
)

#set align(left)

== Функция LM и монетарная политика

#set align(center)
#grid(
  columns: (1fr, 1fr), 
  gutter: 1em,  
  canvas({ // Money market 
    import draw: *
    plot.plot(
      size: (7, 7),
      x-label: $M/P$, y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (2, 8)
        plot.add-vline(5, label: $M^S/P$, style: (stroke: black))
        plot.add-vline(3, style: (stroke: red))
        plot.add-vline(7, style: (stroke: green))
        plot.add(x => -x + 10, domain: (-10,10), label: $m^d (Y_1)$, style: (stroke: rgb("#000000")))
        plot.add-hline(5, min: 0, max: 10, style: (stroke: (paint: rgb("#000000"), thickness: 0.5pt)))
        plot.add-hline(7, min: 0, max: 10, style: (stroke: (paint: red, thickness: 0.5pt), dash: (1pt, 0.5pt)))
        plot.add-hline(3, min: 0, max: 10, style: (stroke: (paint: green, thickness: 0.5pt), dash: (1pt, 0.5pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))
        plot.add(((3, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
        plot.add(((7, 3),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))

      }
    )
  }),
  // LM model 
  canvas({
    import draw: *
    plot.plot(
      size: (7, 7),
      x-label: "Y", y-label: "R",       
      x-tick-step: none, y-tick-step: none,
      x-min: 0, x-max: 10, y-min: 0, y-max: 10,
      legend: "inner-north",
      {
        let domain = (2, 8)
        plot.add(x => x , domain: domain, label: "LM", style: (stroke: black))
        plot.add(x => x + 2, domain: domain, style: (stroke: red))
        plot.add(x => x - 2, domain: domain, style: (stroke: green))
        plot.add-hline(5, min: 0, max: 10, style: (stroke: (paint: rgb("#000000"), thickness: 0.5pt)))
        plot.add-hline(7, min: 0, max: 10, style: (stroke: (paint: red, thickness: 0.5pt), dash: (1pt, 0.5pt)))
        plot.add-hline(3, min: 0, max: 10, style: (stroke: (paint: green, thickness: 0.5pt), dash: (1pt, 0.5pt)))
        plot.add(((5, 5),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: black, thickness: 2pt), fill: black), style: (stroke: none))
        plot.add(((5, 7),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: red, thickness: 2pt), fill: red), style: (stroke: none))
        plot.add(((5, 3),), mark: "o", mark-size: 4pt, mark-style: (stroke: (paint: green, thickness: 2pt), fill: green), style: (stroke: none))
      }
    )
  })
)
#set align(left)


Допустим что при $Y_1$ у нас есть равновесие. Крастным отмечен первый сдвиг, который отобразим тут:: 

$
  r_("ref") arrow.t => M arrow.b => M_1/p < M_0/P_0 overbrace(==>, R = R_1)  cases(m^d > (M^S)/P, D_"ЦБ" < S_"ЦБ") => R arrow.t overbrace(==>, R =R_2) cases(S_"ЦБ" = D_"ЦБ", m^d = M^S/P) 
$

\
\

#set align(center)
$triangle.filled$
#set align(left)