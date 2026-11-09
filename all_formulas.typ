= Master Formula Inventory
This file contains all formulas physically extracted from source documents.

== From Source: `formulas.typ`
=== Variable: `flat_sums_btherom`
#let flat_sums_btherom = $
        x^r = overbrace(sum_(b=0)^(r) [ binom(r,b) sum_(c=0)^(b) [ binom(b,c) sum_(d=0)^(c) [ binom(c,d)... [sum_(n_l=0)^(n_(l -1 )) [ binom(n_(l-1),n_(l)) (x-l a)^(n_l) a^(n_(l-1) - n_l ) ]] a^(c-d ) ]  a^(b-c) ]  a^(r-b) ], l "sums") \ 
     
  $
Display: #flat_sums_btherom
#v(1em)
=== Variable: `falling_sums_btherom`
#let falling_sums_btherom = [
  $"for all" a in RR | r in ZZ^(+) | d "in" RR "where" (x/d = l, l in ZZ^(+) ) => $
  $x^r = overbrace(sum_(b=0)^(r-1) [ binom(r,b) [sum_(c=0)^(b-1) [ binom(r,b)  ... [sum_(n_l=0)^(n_(l-1)-1) [ binom(n_(l-1),n_(l)) (x-l a)^(n_l) a^(n_(l-1)-n_(l)) ] ] ...  a^(b-c) ]] a^(r-b) ] , l "sums")  \
  + 
    overbrace(sum_(b=0)^(r-1) [ binom(r,b) [sum_(c=0)^(b-1) [ binom(r,b)  ... [sum_(n_(l-1)=0)^(n_(l-2)-1) [(x-l a)^(n_(l-1)) ]  ] ...  a^(b-c) ] ] a^(r-b) ] , l-1 "sums")  \
  + ... +
    overbrace(sum_(b=0)^(r-1) [ binom(r,b) [ (x-2a)^b] a^(r-b) ], 1 "sums")  \
  +
    overbrace((x-a)^r, 0 "sums")  \
  $
]
Display: #falling_sums_btherom
#v(1em)
=== Variable: `falling_sum_lr_btherom`
#let falling_sum_lr_btherom = $
"for all" a in RR | r in ZZ^(+) | l in ZZ^(+) \
x^r = sum_(b=0)^(l-1) [ sum_(c=0)^(r-1)[binom(r,c) (x-(b+1)a)^c a^(r-c)]] + (x-l a)^r \
$
Display: #falling_sum_lr_btherom
#v(1em)