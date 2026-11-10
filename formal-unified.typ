#import "./formulas.typ": falling_sums_btherom, falling_sum_lr_btherom
#set align(center)

$((x-1)+1)^2 = (x-1)^2+2(x-1) +1$ \
$(x-1)^2 = (x-2)^2+2(x-2) +1$ \
$x^2 = sum_(b=0)^(x-1) [2b+1]$ \
$((x-1)+1)^1 = (x-1)^1 + 1$
$((x-1))^1 = (x-2)^1 + 1$ \
$x^1 = sum_(b=0)^(x-1)[1]$ \
$x^2 = sum_(b=0)^(x-1) [2sum_(c=0)^(b-1)[1]+1]$ \
$x^2 = 2sum_(b=0)^(x-1) [sum_(c=0)^(b-1)[1]] + 1sum_(b=0)^(x-1) [1]$ \

I have a theory, all $x^n$'s can be written as a sum of nested sums with falling upper bounds \
$x^n = d_1 sum_(b=0)^(x-1)1 + d_2 sum_(b=0)^(x-1)sum_(c=0)^(b-1)1  + ... + d_n overbrace(sum_(b=0)^(x-1)sum_(c=0)^(b-1)...sum_(n_n=0)^(n_(n-1)-1)1, n "sums")  $

This the goal of this paper

== Reucrsions from Binomial therom 
=== falling sums
according to formulas.typ's #link("formulas.pdf#falling_sums")[falling_sum section].

#falling_sums_btherom

I will extend this paper by attempting to calculate the scalars on the sums (the $d_n$ numbers): 

$x^n = d_1 sum_(b=0)^(x-1)1 + d_2 sum_(b=0)^(x-1)sum_(c=0)^(b-1)1  + ... + d_n overbrace(sum_(b=0)^(x-1)sum_(c=0)^(b-1)...sum_(n_n=0)^(n_(n-1)-1)1, n "sums")  $


the example in this paper was derived from the binomial therom, the outer term was expanded to generate recurssion

this is excalty what falling_sum_lr_btherom does (upto 2 sums):
#falling_sum_lr_btherom

lets revist our inital example for x^2

$
  "let" a=1, l=x \
  "for all" 1 in RR | r in ZZ^(+) | x in ZZ^(+) \
  x^r = sum_(b=0)^(x-1) [ sum_(c=0)^(r-1)[binom(r,c) (x-(b+1))^c ]] + (0)^r \
  "let" r=2\
  x^2 = sum_(b=0)^(x-1) [ sum_(c=0)^(2-1)[binom(2,c) (x-(b+1))^c ]] + (0)^(2) \
  x^2 = sum_(b=0)^(x-1) [binom(2,0) (x-(b+1))^0 + binom(2,1) (x-(b+1))^1 ] + (0)^2 \
  x^2 = sum_(b=0)^(x-1) [1 + 2(x-(b+1)) ]\
$

