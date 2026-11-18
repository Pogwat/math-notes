#set align(center)

$
  (x+a)^r= sum_(b=0)^(r)[binom(r,b)x^b a^(r-b)]
$

== Discrete

using falling_sum_lr_btherom
$

x^r = sum_(b=0)^(l-1) [ sum_(c=0)^(r-1)[binom(r,c) (x-(b+1)a)^c a^(r-c)]] + (x-l a)^r \

"let" a=1 \

x^r = sum_(b=0)^(l-1) [ sum_(c=0)^(r-1)[binom(r,c) (x-(b+1))^c ]] + (x-l)^r \

"let" l =x \

x^r = sum_(b=0)^(x-1) [ sum_(c=0)^(r-1)[binom(r,c) (x-(b+1))^c ]] + (x-x)^r \

"reverse the sum" \
x^r = sum_(b=0)^(x-1) [ sum_(c=0)^(r-1)[binom(r,c) b^c ]] + 0^r \

$

goal: $sum_(b=0)^(x-1)[b^(r-1)]$ , descrete power sum

$
  x^r = sum_(b=0)^(x-1) [ sum_(c=0)^(r-1)[binom(r,c) b^c ]] + 0^r \
  "extract" sum_(b=0)^(x-1) [b^(r-1)] \
  x^r = sum_(b=0)^(x-1) [ sum_(c=0)^(r-2)[binom(r,c) b^c ] + binom(r,r-1) b^(r-1) ] + 0^r \
  binom(r,r-1)^(-1)x^r = sum_(b=0)^(x-1) [ binom(r,r-1)^(-1)sum_(c=0)^(r-2)[binom(r,c) b^c ] + b^(r-1) ] + 0^r \
$
by scaling x^r by some coefficent we were able to extract $sum_(b=0)^(x-1)[b^(r-1)]$ from the r-1 sum with that scalling coefficent perfeclty cancelling the coefficent that was on $sum_(b=0)^(x-1)[b^(r-1)]$, however the terms in the now r-2 sum were also scaled by this coefficent. if we jump one degree down we can factor out a b^r-2 sum, calculate its overlap and neutralize it, if we repeat this porcess until we hit degree 0 all terms will be neutralized excluding the goal term. 

let $K_(r,c)$ be these neutralizing coefficents and therfore the coefficnets on the lower power terms themselves

K_(r,a) depends on K_(r,a-1) which depends on K_(r,a-2) ..., as each k scales all degree terms leaving overlap, goal: find a formula for K_(r,c) using its recurence to lower K(r,c-1...) terms
 \
 \ \ \ \ \ \ 
$
  sum_(b=0)^(x-1)[b^(r-1)] =K_(r,0)x^r + K_(r,1)x^(r-1) + ... + K_(r,r)x^0 \
  sum_(b=0)^(x-1)[b^(r-1)] =sum_(b=0)^(r)[K_(r,b)x^(r-b)]
$  

$
x^r = sum_(b=0)^(x-1) [ sum_(c=0)^(r-1)[binom(r,c) b^c ]] + 0^r
$
$
  "inverse of binmial coefficent on term r-1" \
  K_(r,0) = binom(r,r-1)^(-1) \
  "inverse of binomal coefficent of lower degree * increase of K_(r,0) and r-2 term binom coefficent" \
  K_(r,1) = binom((r-1),(r-1)-1)^(-1) (K_(r,0) binom(r,r-2)^(-1) )^(=1)
  
$