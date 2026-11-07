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

Identities used

binomial therom \
$(x+a)^r = sum_(b=0)^(r) [ binom(r,b) x^b a^(r-b) ] $ \
pascals identity \
$binom(a,n) = binom(a-1,n) + binom(a-1,n-1)$ \

== Reucrsions from Binomial therom 
=== Case 1 -- Non falling sums

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

    "you can stop at any layer you want, you dont need to fully expand " \
     x^r = overbrace(sum_(b=0)^(r) [ binom(r,b) sum_(c=0)^(b) [ binom(b,c) sum_(d=0)^(c) [ binom(c,d)... [sum_(n_l=0)^(n_(l -1 )) [ binom(n_(l-1),n_(l)) (x-l a)^(n_l) a^(n_(l-1) - n_l ) ]] a^(c-d ) ]  a^(b-c) ]  a^(r-b) ], l "sums") \
    
  $
  
  


