Identities used:
binomial therom \
$(x+a)^r = sum_(b=0)^(r) [ binom(r,b) x^b a^(r-b) ] $ \
pascals identity \
$binom(a,n) = binom(a-1,n) + binom(a-1,n-1)$ \

== Reucrsions from Binomial therom 
=== Non falling sums <non_falling_sums>

  $ (x+a)^r = sum_(b=0)^(r) [ binom(r,b) x^b a^(r-b) ] $ \
  let $a=1$ \
  $ (x+1)^r = sum_(b=0)^(r) [ binom(r,b) x^b ] $ \
  let $x= x'-1$ \
  $ ((x'-1)+1)^r = x^r= sum_(b=0)^(r) [ binom(r,b) (x'-1)^b ] $ \
  in general \
  $ ((x-b)+a)^r = sum_(b=0)^(r) [ binom(r,b) (x-b)^b a^(r-b) ] $ \
  if b=a \
  $ x^r = sum_(b=0)^(r) [ binom(r,b) (x-a)^b a^(r-b) ] $ \
  we can subtitute the defintion of $x^r$ into $(x-a)^b$ or $a^(r-b)$ \
  $(x-a)^b$ is a good substitution as it the nested power term will shrink by $a$ \
  after $x/a$ expansions the inner power term will be $0$ 
  $
    x^r = sum_(b=0)^(r) [ binom(r,b) (x-a)^b a^(r-b) ] \
    (x-a)^b =  sum_(c=0)^(b) [ binom(b,c) ((x-a)-a)^c a^(b-c) ] \
    x^r = sum_(b=0)^(r) [ binom(r,b) sum_(c=0)^(b) [ binom(b,c) ((x-a)-a)^c a^(b-c) ]  a^(r-b) ] \
    #[every layer strips one $a$ from inner power's base] \
    x^r = sum_(b=0)^(r) [ binom(r,b) sum_(c=0)^(b) [ binom(b,c) ((x-a)-a)^c a^(b-c) ]  a^(r-b) ] \

    x^r = overbrace(sum_(b=0)^(r) [ binom(r,b) sum_(c=0)^(b) [ binom(b,c) sum_(d=0)^(c) [ binom(c,d)... [sum_(n_(x/a)=0)^(n_((x/a) -1 )) [ binom(n_((x/a) -1 ),n_(x/a)) 0^(n_(x/a)) a^(n_((x/a)-1) - n_(x/a) ) ]] a^(c-d ) ]  a^(b-c) ]  a^(r-b) ], x/a "sums") \
  $
  
    you can stop at any layer you want, you dont need to fully expand 
   
    #let flat_sums_btherom = $
        x^r = overbrace(sum_(b=0)^(r) [ binom(r,b) sum_(c=0)^(b) [ binom(b,c) sum_(d=0)^(c) [ binom(c,d)... [sum_(n_l=0)^(n_(l -1 )) [ binom(n_(l-1),n_(l)) (x-l a)^(n_l) a^(n_(l-1) - n_l ) ]] a^(c-d ) ]  a^(b-c) ]  a^(r-b) ], l "sums") \ 
     
  $
  #flat_sums_btherom
=== falling sums <falling_sums>
$ 
  (x+a)^r = sum_(b=0)^(r) [ binom(r,b) x^b a^(r-b) ] \
  (x+a)^r = sum_(b=0)^(r-1) [ binom(r,b) x^b a^(r-b) ] + binom(r,r) x^r a^0  \
  ((x-a)+a)^r = x^r = sum_(b=0)^(r-1) [ binom(r,b) (x-a)^b a^(r-b) ] + binom(r,r) (x-a)^r a^0  \
$ 
the same reassoning applys here as in the last case: \
"we can subtitute the defintion of $x^r$ into $(x-a)^b$ or $a^(r-b)$ \
$(x-a)^b$ is a good substitution as it the nested power term will shrink by $a$ \
after $x/a$ expansions the inner power term will be $0$ "
$
  x^r = sum_(b=0)^(r-1) [ binom(r,b) (x-a)^b a^(r-b) ] + binom(r,r) (x-a)^r a^0  \
  (x-a)^b = sum_(c=0)^(b-1) [ binom(r,b) ((x-a)-a)^c a^(b-c) ] + binom(b,b) ((x-a)-a)^b a^0  \
  x^r = sum_(b=0)^(r-1) [ binom(r,b) [sum_(c=0)^(b-1) [ binom(r,b) ((x-a)-a)^c a^(b-c) ] + binom(b,b) ((x-a)-a)^b a^0] a^(r-b) ] + binom(r,r) (x-a)^r a^0  \
  x^r = overbrace(sum_(b=0)^(r-1) [ binom(r,b) [sum_(c=0)^(b-1) [ binom(r,b) \ ... [sum_(n_l=0)^(n_(l-1)-1) [ binom(n_(l-1),n_(l)) (x-l a)^(n_l) a^(n_(l-1)-n_(l)) ] + binom(n_(l-1),n_(l-1)) (x-l a)^(n_(l-1)) a^0] ... \ a^(b-c) ] + binom(b,b) (x-2a)^b a^0] a^(r-b) ] + binom(r,r) (x-a)^r a^0, l "sums")  \
$

$ a^0 = 1  "for all" a in RR $
$ binom(r,r) = 1 "for all" r in ZZ^(+)$

if we restrict our formula with these we can simplify it

according to our restriciton $a^0=1$ and $binom(r,r) =1$

$ 
  x^r = overbrace(sum_(b=0)^(r-1) [ binom(r,b) [sum_(c=0)^(b-1) [ binom(r,b)  ... [sum_(n_l=0)^(n_(l-1)-1) [ binom(n_(l-1),n_(l)) (x-l a)^(n_l) a^(n_(l-1)-n_(l)) ] + (x-l a)^(n_(l-1))] ...  a^(b-c) ] + (x-2a)^b] a^(r-b) ] + (x-a)^r, l "sums")  \
$

the sum can be factored into a sum of falling sums
The papers theory holds if the restrictions hold:
$ a^0 = 1  "for all" a in RR $
$ binom(r,r) = 1 "for all" r in ZZ^(+)$
Since we can freely choose a only the restriction on r remains

"I have a theory, all $x^n$'s can be written as a sum of nested sums with falling upper bounds "

all $x^r$'s can be written as a sum of nested sums with falling upper bounds $"for all" r in ZZ^(+)$
also x must have a divisor $d "in" RR$ where $(x/d = l, l in ZZ^(+) )$, if it has this divisor it can be written a nested sum with l sums 
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
#falling_sums_btherom