#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-plot:0.1.3": plot

#show heading: set align(center)
#show block: set align(center)

#set document(
  title: [Macroeconomics: Handbook],
  author: "Freire Serioguina Daniel Fabian"
)

#set page(
  margin: (top: 2cm, bottom: 2cm),
  numbering: "1", 
  header: context [
    #set text(8pt, style: "normal")
    #grid(
      columns: (0.27fr, 1fr),
      [Macroeconomics Handbook],
      align(right)[Faculty of Economic Sciences]
    )
    #v(-6pt) 
    #line(length: 100%, stroke: 0.2pt)
  ],
  footer: context [
    #line(length: 100%, stroke: 0.2pt)
    #v(-6pt)
    #set text(8pt)
    #grid(
      columns: (1fr, 1fr),
      align(right)[Page #counter(page).display()]
    )
  ]
)

#align(center)[
  #text(size: 16pt, weight: "bold")[Macroeconomics Handbook] \
  #text(size: 16pt)[Faculty of Economic Sciences] \
  #text(size: 12pt)[Economics and Data Science] \
  #text(size: 8pt)[Freire Serioguina Daniel Fabian]
]

#set heading(numbering: "1.")
#outline(depth: 2)

#show emph: set text(purple)

#pagebreak()

= Экономика с полностью гибкими ценами и полной занятостью 

== Рынок труда и совокупное предложение 
(в условиях полного рыночного приспособления  )

(20 - 21)

Seminar 11 

== Совокупный спрос в экономике с гибкими ценами  

(22 - 23)

Seminar 12




