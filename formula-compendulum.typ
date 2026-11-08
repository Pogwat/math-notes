
#let rhide(body) = {}

#rhide[$ x^r = overbrace(sum_(b=0)^(r) [ binom(r,b) sum_(c=0)^(b) [ binom(b,c) sum_(d=0)^(c) [ binom(c,d)... [sum_(n_l=0)^(n_(l -1 )) [ binom(n_(l-1),n_(l)) (x-l a)^(n_l) a^(n_(l-1) - n_l ) ]] a^(c-d ) ]  a^(b-c) ]  a^(r-b) ], l "sums") $ 
]



#rhide[$ 
  x^r = overbrace(sum_(b=0)^(r-1) [ binom(r,b) [sum_(c=0)^(b-1) [ binom(r,b)  ... [sum_(n_l=0)^(n_(l-1)-1) [ binom(n_(l-1),n_(l)) (x-l a)^(n_l) a^(n_(l-1)-n_(l)) ] ] ...  a^(b-c) ]] a^(r-b) ] , l "sums")  \
  + 
    overbrace(sum_(b=0)^(r-1) [ binom(r,b) [sum_(c=0)^(b-1) [ binom(r,b)  ... [sum_(n_(l-1)=0)^(n_(l-2)-1) [(x-l a)^(n_(l-1)) ]  ] ...  a^(b-c) ] ] a^(r-b) ] , l-1 "sums")  \
  + ... +
    overbrace(sum_(b=0)^(r-1) [ binom(r,b) [ (x-2a)^b] a^(r-b) ], 1 "sums")  \
  +
    overbrace((x-a)^r, 0 "sums")  \
$]

