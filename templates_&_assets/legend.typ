#import "@preview/cetz:0.4.2": canvas
#import "@preview/cetz-plot:0.1.3": plot

#let example = lorem(100)

=== Examples:
#set align(left)
#block(
  fill: rgb(0,0,100,50), 
  width: 100%, 
  stroke: 0.2pt, 
  inset: 10pt, 
  example
)

#let theorem = lorem(100)

=== Theorems, statements, implications, formulas, & conlusions: 

#set align(left)
#block(
  fill: rgb(100,0, 100, 50),
  width: 100% ,
  stroke: 0.2pt, 
  inset: 10pt, 
  theorem
)


#let proof = lorem(100)

=== Proofs and the like. 

#set align(left)
#block(
  fill: rgb(0,100,0,50),
  width: 100%,
  stroke: 0.2pt, 
  inset: 10pt, 
  proof
)

=== Colored text

#text(rgb("#3d67b0"))[
  $
    "Энергоемкость" = "Потребление энергоресурсов ( кВт⋅ч)" / "ВРП (в постоянных ценах)" 
  $
]


=== Mathematics 

#block(
  width: 100%, 
  stroke: 0.2pt, 
  inset: 10pt, 
  $ f(x) = 1 $
)


=== Macroeconomics formal notation

#let formal_1  = $
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
  formal_1
  
)
