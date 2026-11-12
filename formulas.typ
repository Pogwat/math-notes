#set align(center)
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
  x^r = sum_(b=0)^(r-1) [ binom(r,b) a^(r-b) (x-a)^b ] + binom(r,r) a^0 (x-a)^r   \
   
  x^r = sum_(b=0)^(r-1) [ binom(r,b) a^(r-b)  
    sum_(c=0)^(b-1) [ binom(b,c) a^(b-c) ((x-a)-a)^c  ] + binom(b,b) a^0 ((x-a)-a)^b  
  ] + binom(r,r) (x-a)^r a^0  \

  x^r = overbrace(sum_(b=0)^(r-1) [ binom(r,b) a^(r-b)  
    sum_(c=0)^(b-1) [ binom(b,c) a^(b-c) \
      ... [sum_(n_l=0)^(n_(l-1)-1) [ binom(n_(l-1),n_(l)) a^(n_(l-1)-n_(l)) (x-l a)^(n_l) ] + binom(n_(l-1),n_(l-1)) a^0 (x-l a)^n_(l-1) ] ...
     \ + binom(b,b) a^0 ((x-a)-a)^b  
  ] ],l "sums") + binom(r,r) (x-a)^r a^0  \


$

$ a^0 = 1  "for all" a in RR $
$ binom(r,r) = 1 "for all" r in ZZ^(+)$

if we restrict our formula with these we can simplify it

according to our restriciton $a^0=1$ and $binom(r,r) =1$

$
  x^r = overbrace(sum_(b=0)^(r-1) [ binom(r,b) a^(r-b)  (
  sum_(c=0)^(b-1) [ binom(b,c) a^(b-c) (
    ... sum_(n_l=0)^(n_(l-1)-1) [ binom(n_(l-1),n_(l)) a^(n_(l-1)-n_(l)) (x-l a)^(n_l) ] + (x-l a)^(n_(l-1)) ... )
  ] + (x-2a)^b ) ],l "sums") + (x-a)^r  \
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
#falling_sums_btherom

== Falling sums (l,r upper bound)
$
  (x+a)^r = sum_(b=0)^(r) [ binom(r,b) x^b a^(r-b) ] \
  (x+a)^r = sum_(b=0)^(r-1) [ binom(r,b) x^b a^(r-b) ] + binom(r,r) x^r a^(0) \
  "let" x' = x-a , "let" a' = a \
  ((x-a)+a)^r = sum_(b=0)^(r-1) [ binom(r,b) (x-a)^b a^(r-b) ] + binom(r,r) (x-a)^r a^(0) \
$ 
the previous falling sums resulted from expanding the inner (x-a)^b, if we expand the outer (x-a)^r we get a diffrent falling sum
$
  ((x-a)+a)^r = x^r = sum_(b=0)^(r-1) [ binom(r,b) (x-a)^b a^(r-b) ] + binom(r,r) (x-a)^r a^(0) \
  x^r = sum_(b=0)^(r-1) [ binom(r,b) (x-a)^b a^(r-b) ] + binom(r,r) [sum_(b=0)^(r-1) [ binom(r,b) ((x-a)-a)^b a^(r-b) ] + binom(r,r) ((x-a)-a)^r a^(0)] a^(0) \
  x^r = overbrace(sum_(b=0)^(r-1) [ binom(r,b) (x-a)^b a^(r-b) ] + binom(r,r) [sum_(b=0)^(r-1) [ binom(r,b) ((x-a)-a)^b a^(r-b) ] + binom(r,r) \ ...[sum_(b=0)^(r-1) [ binom(r,b) (x-l a)^b a^(r-b) ] + binom(r,r) (x-l a)^r a^(0)] ... a^(0)] a^(0), l "sums")  \ 
  x^r = overbrace( sum_(b=0)^(r-1) [ binom(r,b) (x-a)^b a^(r-b) ] \
  + 
  binom(r,r) a^(0) sum_(b=0)^(r-1) [ binom(r,b) (x-2a)^b a^(r-b) ] \
  + 
  binom(r,r)^2 a^(0)^2 sum_(b=0)^(r-1) [ binom(r,b) (x-3a)^b a^(r-b) ]  \
  + ... + 
  binom(r,r)^(l-1) a^(0)^(l-1) sum_(b=0)^(r-1) [ binom(r,b) (x-l a)^b a^(r-b) ] \
  + 
  binom(r,r)^(l) (x-l a)^r a^(0)^(l) , l "sums" ) \
  x^r = sum_(b=0)^(l-1) [ binom(r,r)^(b) a^(0)^(b) sum_(c=0)^(r-1)[binom(r,c) (x-(b+1)a)^c a^(r-c)]] + binom(r,r)^(l) (x-l a)^r a^(0)^(l)
$
note: for the simplifed sum aboe to work binom(r,r)^(0) and a^(0)^(0) must simplify to 1, so a^0 is implictly assumed to be 1 for that sum to work. you could factor out first term of the sum to make it pure

if we add restrictions the sum simplifies

$ a^0 = 1  "for all" a in RR $
$ binom(r,r) = 1 "for all" r in ZZ^(+)$

#let falling_sum_lr_btherom =$
"for all" a in RR | r in ZZ^(+) | l in ZZ^(+) \
x^r = sum_(b=0)^(l-1) [ sum_(c=0)^(r-1)[binom(r,c) (x-(b+1)a)^c a^(r-c)]] + (x-l a)^r \
$
#falling_sum_lr_btherom

=== Falling sums (l,r upper bound) reversed

we can reverse the sum \
(x-(b+1)a) is isolated from the inner sum \
if b starts at l-1 and goes upto x-1a the sum is still identical but reversed

#let falling_sum_lr_btherom_reversed =$
  "for all" a in RR | r in ZZ^(+) | l in ZZ^(+) \
  x^r = sum_(b=(l-1))^(x-a) [ sum_(c=0)^(r-1)[binom(r,c) (b)^c a^(r-c)]] + (x-l a)^r \
$
#falling_sum_lr_btherom_reversed


== falling sums, free upper bounds 

=== shrinking terms
if we just keep exapnding the new outer term derived from the falling l,r formula with the falling l,r formula we get more nested sums
$
"for all" a in RR | r in ZZ^(+) | l in ZZ^(+) \
x^r = sum_(b=0)^(l-1) [ sum_(c=0)^(r-1)[binom(r,c) (x-(b+1)a)^c a^(r-c)]] + (x-l a)^r \

x^r = sum_(b=0)^(l-1) [ sum_(c=0)^(r-1)[binom(r,c) (x-(b+1)a)^c a^(r-c)]] +sum_(b=0)^(l-1) [ sum_(c=0)^(r-1)[binom(r,c) ((x-l a)-(b+1)a)^c a^(r-c)]] + ((x-l a)-l a)^r \ 

x^r = sum_(d=0)^(m-1)[ sum_(b=0)^(l-1) [ sum_(c=0)^(r-1)[binom(r,c) ((x-d l a)-(b+1)a)^c a^(r-c)]]] + (x-m l a)^r \ 



x^r = sum_(b_3=0)^(n_3 - 1) [ sum_(b_2=0)^(n_2 - 1) [ sum_(b_1=0)^(n_1 - 1) [ sum_(b_0=0)^(r - 1) [ binom(r, b_0) (((x - b_3 n_2 n_1 n_0) - b_2 n_1 n_0) - (b_1 + 1) n_0)^(b_0) n_0^(r - b_0) ] ] ] ] + (x - n_3 n_2 n_1 n_0)^r \

$

if we expand n times
$
x^r = 
sum_(b_n=0)^(n_n - 1) [ ...
sum_(b_4=0)^(n_4 - 1) [ 
sum_(b_3=0)^(n_3 - 1) [ 
sum_(b_2=0)^(n_2 - 1) [ 
sum_(b_1=0)^(n_1 - 1) [ 
sum_(b_0=0)^(r - 1) [   
\ 
  binom(r, b_0) 
  (
  ( 
  (
  
  (
  ...(x-b_n n_(n-1) ...n_3 n_2 n_1 n_0 )...
  - b_4 n_3 n_2 n_1 n_0
  )
   
  - b_3 n_2 n_1 n_0) 
  - b_2 n_1 n_0) 
  - (b_1 + 1) n_0)^(b_0) n_0^(r - b_0) 
\
] 
] 
] 
] 
]
]
+ (x - n_n ...n_4 n_3 n_2 n_1 n_0)^r
$


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
#n_falling_sums_sub_freedom_btherom

=== growing terms

this can be cleaned up if we avoid $((x-a)+a)^r = x^r$ substituion
  $
    (x+a)^r = sum_(b_0=0)^(r-1)[binom(r,b_0)x^(b_0) a^(r-b_0)]+binom(r,r)a^0x^r \
  x^r = -sum_(b_0=0)^(r-1)[binom(r,b_0)x^(b_0) a^(r-b_0)] + (x+a)^r \
  x^r = -sum_(b_0=0)^(r-1)[binom(r,b_0)x^(b_0) a^(r-b_0)] +[ -sum_(b_0=0)^(r-1)[(x+a)^(b_0) a^(r-b_0)] + ((x+a)+a)^r] \ 
  x^r = sum_(b_1=0)^(n_1-1)[ -sum_(b_0=0)^(r-1)[binom(r,b_0)(x+b_1a)^(b_0) a^(r-b_0)]] + ((x+n_1a)^r \ 
  x^r = sum_(b_1=0)^(n_1-1)[ -sum_(b_0=0)^(r-1)[binom(r,b_0)(x+b_1n_0)^(b_0) n_0^(r-b_0)]] + ((x+n_1n_0)^r \ 
  $
the restrictions we have are from $binom(r,r) (n_0)^0$ being applied to each new varible.
factoring out the -1 we get:

  
#let n_falling_sums_add_freedom_btherom = $
"for all" r in ZZ^(+) | n_0 in R| n_0 !=0 | n_1...n_n in ZZ^(+)  \

x^r = -1 overbrace(sum_(b_n=0)^(n_n-1)[...sum_(b_2=0)^(n_2-1)[sum_(b_1=0)^(n_1-1)[ sum_(b_0=0)^(r-1)[binom(r,b_0)(((x+b_n n_n...n_1n_0)+...+b_2n_1n_0)+b_1n_0)^(b_0) n_0^(r-b_0)]]]],n "sums") + ((x+n_n...n_2n_1n_0)^r \
$
#n_falling_sums_add_freedom_btherom

== binomial recurssion

=== hockey stick

pascals identity:
$binom(a,n) = binom(a-1,n)+ binom(a-1,n-1) $ 

pasclas identity can be applied to its own terms

i will apply the idenitty to its left hand terms
$
  binom(a,n) = binom(a-1,n)+ binom(a-1,n-1)  \
  binom(a,n) = [binom(a-2,n)+ binom(a-2,n-1)]+ binom(a-1,n-1) \
  binom(a,n) = [[...[binom(a-a,n)+ binom(a-a,n-1)]...+ binom(a-3,n-1)]+ binom(a-2,n-1)]+ binom(a-1,n-1) \
  binom(a,n) = sum_(b=0)^(a-1)[binom(b,n-1)] + binom(0,n)
$ 
the hockey stick identity:
#let binom_hockey =$
    binom(a,n) = sum_(b=0)^(a-1)[binom(b,n-1)] + binom(0,n)
$
binom_hockey


=== hockey stick recurssion

the hockey stick identity can also be applied to its own terms o get a nested sum with falling uper bounds

 $
   binom(a,n) = sum_(b=0)^(a-1)[binom(b,n-1)] + binom(0,n) \
    binom(a,n) = sum_(b=0)^(a-1)[   
      sum_(c=0)^(b-1)[binom(c,n-2)
      ] + binom(0,n-1) ] + binom(0,n) \

    binom(a,n) = sum_(b=0)^(a-1)[   
      sum_(c=0)^(b-1)[...sum_(n_n=0)^(n_(n-1)-1)[binom(n_n,n-n)] + binom(0,n-(n-1)) ...] + binom(0,n-1) ] + binom(0,n) \
 $ 
 if we restrict n the sum simplifies

 this simplifes the $binom(0,n-d)$ at each layer
 $
   "for all" n in ZZ_(>=0) \
   binom(0,n) = cases(1 "if" n=0, 0 "if" n!=0)
 $
this simplifes the innermost $binom(n_n,0)$
 $
   "for all" a in RR \
   binom(a,0)=1
 $

 when $n!=0$ the inner $binom(0,n-d)$ simplifies to 0, when n=0, the inner sums are never reached and $binom(a,0)=binom(0,0)$
 hockey stick recurssion identity:
 #let binom_hockey_recurssion = $
   "for all" n in ZZ_>=0 \
   binom(a,n) = overbrace(sum_(b=0)^(a-1)[   
     sum_(c=0)^(b-1)[...sum_(n_n=0)^(n_(n-1)-1)[1] ...] ],n "sums") + binom(0,n) \
 $
#binom_hockey_recurssion


 












