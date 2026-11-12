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
  $
    x^r = overbrace(sum_(b=0)^(r-1) [ binom(r,b)a^(r-b) [sum_(c=0)^(b-1) [ binom(b,c)a^(b-c)  ... [sum_(n_l=0)^(n_(l-1)-1) [ binom(n_(l-1),n_(l))a^(n_(l-1)-n_(l)) (x-l a)^(n_l)  ] ] ...   ]]  ] , l "sums")  \
  + 
    overbrace(sum_(b=0)^(r-1) [ binom(r,b)a^(r-b) [sum_(c=0)^(b-1) [ binom(b,c)  a^(b-c) ... [sum_(n_(l-1)=0)^(n_(l-2)-1) [binom(n_(l-2),n_(l-1)) a^(n_(l-2)-n_(l-1)) (x-l a)^(n_(l-1)) ]  ] ...  ] ]  ] , l-1 "sums")  \
  + ... +
    overbrace(sum_(b=0)^(r-1) [ binom(r,b)  a^(r-b) [ (x-2a)^b] ], 1 "sums")  \
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
=== Variable: `falling_sum_lr_btherom_reversed`
#let falling_sum_lr_btherom_reversed = $
  "for all" a in RR | r in ZZ^(+) | l in ZZ^(+) \
  x^r = sum_(b=(l-1))^(x-a) [ sum_(c=0)^(r-1)[binom(r,c) (b)^c a^(r-c)]] + (x-l a)^r \
$
Display: #falling_sum_lr_btherom_reversed
#v(1em)
=== Variable: `n_falling_sums_sub_freedom_btherom`
#let n_falling_sums_sub_freedom_btherom = $
"for all" r in ZZ^(+) | n_0 in R| n_0 !=0 | n_1...n_n in ZZ^(+)  \
x^r = 
overbrace(
sum_(b_n=0)^(n_n - 1) [ ...
sum_(b_2=0)^(n_2 - 1) [ 
sum_(b_1=0)^(n_1 - 1) [ 
sum_(b_0=0)^(r - 1) [   
 binom(r, b_0) 
  ( 
    (
      ...(x-b_n n_(n-1) ...n_2 n_1 n_0 )...
    - b_2 n_1 n_0) 
  - (b_1 + 1) n_0) ^(b_0) n_0^(r - b_0) 
] ] ] ] , n "sums")
+ (x - n_n ...n_2 n_1 n_0)^r
$
Display: #n_falling_sums_sub_freedom_btherom
#v(1em)
=== Variable: `n_falling_sums_add_freedom_btherom`
#let n_falling_sums_add_freedom_btherom = $
"for all" r in ZZ^(+) | n_0 in R| n_0 !=0 | n_1...n_n in ZZ^(+)  \

x^r = -1 overbrace(sum_(b_n=0)^(n_n-1)[...sum_(b_2=0)^(n_2-1)[sum_(b_1=0)^(n_1-1)[ sum_(b_0=0)^(r-1)[binom(r,b_0)(((x+b_n n_n...n_1n_0)+...+b_2n_1n_0)+b_1n_0)^(b_0) n_0^(r-b_0)]]]],n "sums") + ((x+n_n...n_2n_1n_0)^r \
$
Display: #n_falling_sums_add_freedom_btherom
#v(1em)
=== Variable: `binom_hockey`
#let binom_hockey = $
    binom(a,n) = sum_(b=0)^(a-1)[binom(b,n-1)] + binom(0,n)
$
Display: #binom_hockey
#v(1em)
=== Variable: `binom_hockey_recurssion`
#let binom_hockey_recurssion = $
   "for all" n in ZZ_>=0 \
   binom(a,n) = overbrace(sum_(b=0)^(a-1)[   
     sum_(c=0)^(b-1)[...sum_(n_n=0)^(n_(n-1)-1)[1] ...] ],n "sums") + binom(0,n) \
 $
Display: #binom_hockey_recurssion
#v(1em)