#import "@preview/cetz:0.4.2": canvas
#import "@preview/cetz-plot:0.1.3": plot

#let example = lorem(100)

=== Examples:
#set align(left)
#block(
  fill: rgb("#577fe649"),
  inset: 10pt, 
  example
)

#let theorem = lorem(100)


=== Theorems, statements, implications, formulas, & conlusions: 

#set align(left)
#block(
  fill: rgb("#ff8c003a"),
  inset: 10pt, 
  theorem
)


#let proof = lorem(100)

=== Proofs and the like. 

#set align(left)
#block(
  fill: rgb("#0080003d"),
  inset: 10pt, 
  proof
)

#text(rgb("#3d67b0"))[
  $

    h_0 = frac(sum^s_(r=1) u_r dot y_r_0,sum^m_(i=1) v_i dot x_i_0) -> max quad "s.t." frac(sum^s_(r=1) u_r dot y_(r j),v_i dot x_(i j)) <= 1, space  forall u_r, v_i >= 0 , space j, r,i= cases(
      j = 1","dots","n, 
      r  = 1","dots","s,
      i=1","dots","m
    )
  $
]



#text(rgb("#3d67b0"))[
  $
   ∑_(r=1)^s u_r y_(r_0) -> max

"s.t."

∑_(i=1)^m v_i x_(i_0) = 1, space 

∑_(r=1)^s u_r y_(r j) − ∑_(i=1)^m v_i x_(i j) ≤ 0, \
u_r, v_i >= 0,  space j, r,i= cases(
      j = 1","dots","n, 
      r  = 1","dots","s,
      i=1","dots","m
)
  $
]

