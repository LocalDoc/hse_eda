#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-plot:0.1.3": plot

#show heading: set align(center)
#show block: set align(center)

#set document(
  title: [Subject name: Handbook],
  author: "Freire Serioguina Daniel Fabian"
)

#set page(
  margin: (top: 2cm, bottom: 2cm),
  numbering: "1", 
  header: context [
    #set text(8pt, style: "normal")
    #grid(
      columns: (0.18fr, 1fr),
      [Template: Handbook],
      align(right)[Faculty of Computer Science]
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
  #text(size: 16pt, weight: "bold")[Template: Handbook] \
  #text(size: 16pt)[Faculty of Computer Science] \
  #text(size: 12pt)[Economics and Data Science] \
  #text(size: 8pt)[Freire Serioguina Daniel Fabian]
]

#set heading(numbering: "1.")
#outline(depth: 2)

#show emph: set text(purple)

#pagebreak()



= Topics. 

Topics that cover a whole topic from a subject. More often than not it will cover the material of a whole lecture. 

#block(
  width: 100%, 
  stroke: 0.2pt, 
  inset: 10pt, 
  "After each topic there is a short block on the motivation behind why we are doing what we are doing. It should be short, and precise,"
)

== Subtopics. 

Subtopics of a main topic. 

#block(
  width: 100%, 
  stroke: 0.2pt, 
  inset: 10pt, 
  "After each subtopic there is a short block on the motivation behind why we are doing what we are doing. It should be short, and precise,"
)

=== Subsubtopics (Cases)

These subsubtopics are do not get a motivation section for they are cases of subtopics, and share their motivation, but take a look at a specific case. 

==== Anything lesser than a subsubtopics
Anything lesser than a subsubtopics is to be considered an exception and to be used rarely, or never if possible. 

= Examples, statements, and proof.

Certain sections are special and are to be marked as such. 

== Examples:

#let example = "This is an example. Examples always go in a blue block. When we are providing an example it should go inside of the following format, with an name that goes like: example_of_example. "

#set align(left)
#block(
  fill: rgb(0,0,100,50), 
  width: 100%, 
  stroke: 0.2pt, 
  inset: 10pt, 
  example
)



== Theorems, statements, implications, formulas, & conlusions: 

#let theorem = "Important facts that a student should know by hand go inside of purpule blocks. Theorems, implications, models and the like have to go in this color. It must by named appropiately by what it is describing. "

#set align(left)
#block(
  fill: rgb(100,0, 100, 50),
  width: 100% ,
  stroke: 0.2pt, 
  inset: 10pt, 
  theorem
)

== Proofs and the like. 

#let proof = "When we are proving a statement, or we are "


#set align(left)
#block(
  fill: rgb(0,150,0,50),
  width: 100%,
  stroke: 0.2pt, 
  inset: 10pt, 
  proof
)


#pagebreak()


= Figures 

#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-plot:0.1.3": plot

#set figure(numbering: "1.1")

#figure(
  caption: [Example plot],
  supplement: [Plot],
  kind: "plot",
  canvas(length: 1cm, {
    plot.plot(
      size: (12, 8),
      x-tick-step: none,
      y-tick-step: none,
      x-label: [Horizontal ($x$)],
      y-label: [Vertical ($y$)],
      legend: "inner-north",
      {
        plot.add(domain: (-12, 12), label: [$f(x)$], x => calc.sin(x) * 2) 
        plot.add(((-2,-1), (0,0), (3,1)), label: [Data], mark: "o", style: (stroke: none))
      }
    )
  })
) <plot-name>

Check out @plot-name for the main results.



