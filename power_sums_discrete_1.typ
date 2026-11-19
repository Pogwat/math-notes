#set align(center)

$
  (x+a)^r= sum_(b=0)^(r)[binom(r,b)x^b a^(r-b)]
$

== Discrete
$
"let" a=1 \
(x+1)^r= sum_(b=0)^(r)[binom(r,b)x^b 1^(r-b)] \
"let" x' = x-1 \
((x-1)+1)^r=x^r sum_(b=0)^(r)[binom(r,b)(x-1)^b 1^(r-b)] \
"factor out last term" \
x^r = sum_(b=0)^(r-1)[binom(r,b)(x-1)^b 1^(r-b)]+binom(r,r)(x-1)^r 1^(r-r)\
x^r = sum_(b=0)^(r-1)[binom(r,b)(x-1)^b ]+(x-1)^r
"recurse into (x-1)^r"\
x^r = sum_(b=0)^(r-1)[binom(r,b)(x-1)^b ]+[sum_(b=0)^(r-1)[binom(r,b)(x-2)^b ]+(x-2)^r]\
x^r = sum_(b=0)^(x-1)[sum_(c=0)^(r-1)[binom(r,c)b^c]] + (x-x)^r\
"expand inner r-1 sum"\
x^r = sum_(b=0)^(x-1)[binom(r,0)b^0+ binom(r,1)b^1 +...+ binom(r,(r-1))b^(r-1)] + (x-x)^r\
"reverse"\
x^r = sum_(b=0)^(x-1)[binom(r,(r-1))b^(r-1)+binom(r,(r-2))b^(r-2)+ ...+ binom(r,0)b^0] + (x-x)^r\
"goal: isolate" sum_(b=0)^(x-1)[b^(r-1)]\
"notice x^(r-1) overlaps last degree with second last of x^r"\
"scale x^(r-1) and add to x^r to neutralize 2nd last degree, calculate overlap and repeat for lower degrees"\

"all lower x^r's can be written as sum_(b=0)^(x-1)[...], they can all be grouped into one big sum_(b=0)^(x-1)[...]" \

"lets define the scalars for these lower degress as K_(r,c) such that"\
x^r K_(r,0) + x^(r-1) K_(r,1) + x^(r-2) K_(r,2) + x^(r-r) K_(r,r) = sum_(b=0)^(x-1)[b^(r-1)]\
$
$
"we can easily determine K_(r,0)"\
x^r = sum_(b=0)^(x-1)[binom(r,(r-1))b^(r-1)+binom(r,(r-2))b^(r-2)+ ...+ binom(r,0)b^0] + (0)^r\

binom(r,(r-1))^(-1)x^r = sum_(b=0)^(x-1)[b^(r-1)+binom(r,(r-1))^(-1)(binom(r,(r-2))b^(r-2)+ ...+ binom(r,0)b^0)] + (0)^r \
K_(r,0) = binom(r,(r-1))^(-1) \

"lets expand our K_(r,c) sum and calculate overlap" \
x^r K_(r,0) 
+ 
x^(r-1) K_(r,1) 
+ 
x^(r-2) K_(r,2) 
+ ... +
x^(r-r) K_(r,r) 
= sum_(b=0)^(x-1)[b^(r-1)] \

[sum_(b=0)^(x-1)[binom(r,(r-1))b^(r-1)+binom(r,(r-2))b^(r-2)+ ...+ binom(r,0)b^0] + (0)^r] K_(r,0)  \
+ 
[sum_(b=0)^(x-1)[binom((r-1),(r-2))b^(r-2)+binom((r-1),(r-3))b^(r-3)+ ...+ binom(r,0)b^0] + (0)^(r-1)] K_(r,1) \
+ 
[sum_(b=0)^(x-1)[binom((r-2),(r-3))b^(r-3)+binom((r-2),(r-4))b^(r-4)+ ...+ binom(r,0)b^0] + (0)^(r-2)]  K_(r,2) \
+ ... +
[sum_(b=0)^(x-1)[binom(1,0)b^(0)] + (0)^(r-(r-1))] K_(r,r-1) \
+
[sum_(b=0)^(x-1)[sum_(c=0)^(0-1)[binom(0,c)b^c]] + (0)^(r-r)] K_(r,r) \

= sum_(b=0)^(x-1)[b^(r-1)] \
"group into 1 sum" \
  sum_(b=0)^(x-1)[ \
    [binom(r,(r-1))b^(r-1)+binom(r,(r-2))b^(r-2)+ ...+ binom(r,0)b^0]  K_(r,0) 
  + \
    [binom((r-1),(r-2))b^(r-2)+binom((r-1),(r-3))b^(r-3)+ ...+ binom(r,0)b^0] K_(r,1) 
  + \
    [binom((r-2),(r-3))b^(r-3)+binom((r-2),(r-4))b^(r-4)+ ...+ binom(r,0)b^0 ]  K_(r,2) 
  + ... + \
    [binom(1,0)b^(0)] K_(r,r-1) 
  + \
    [sum_(c=0)^(0-1)[binom(0,c)b^c]] K_(r,r)
 ] \
 
 + 
 (0)^r K_(r,0) 
 + 
 (0)^(r-1) K_(r,1)
 + 
 (0)^(r-2)  K_(r,2) 
 + ... +
 (0)^(r-(r-1)) K_(r,r-1) 
 +
 (0)^(r-r) K_(r,r)
  
  = sum_(b=0)^(x-1)[b^(r-1)] \
  
"simply 0^r terms" \
  sum_(b=0)^(x-1)[ \
    [binom(r,(r-1))b^(r-1)+binom(r,(r-2))b^(r-2)+ ...+ binom(r,0)b^0]  K_(r,0)  
  +  \
    [binom((r-1),(r-2))b^(r-2)+binom((r-1),(r-3))b^(r-3)+ ...+ binom(r,0)b^0] K_(r,1) 
  + \
    [binom((r-2),(r-3))b^(r-3)+binom((r-2),(r-4))b^(r-4)+ ...+ binom(r,0)b^0 ]  K_(r,2) 
  + ... + \
    [binom(1,0)b^(0)] K_(r,r-1) 
  + \
    [sum_(c=0)^(0-1)[binom(0,c)b^c]] K_(r,r)
 ]
 
+ \
  sum_(b=0)^(r)[0^(r-b)K_(r,b)]
  = sum_(b=0)^(x-1)[b^(r-1)] \
$
$
"group by degree" \
sum_(b=0)^(x-1)[
  [binom(r,(r-1))b^(r-1)]K_(r,0) 
  + \
  [binom(r,(r-2))b^(r-2)]K_(r,0) + [binom((r-1),(r-2))b^(r-2)] K_(r,1)
  + \
  [binom(r,(r-3))b^(r-3)]K_(r,0) + [binom((r-1),(r-3))b^(r-3)] K_(r,1) + [binom((r-2),(r-3))b^(r-3)]K_(r,2)
  + ... + \
  [binom(r,(r-r))b^(r-r)]K_(r,0) + [binom((r-1),(r-r))b^(r-r)] K_(r,1) + [binom((r-2),(r-r))b^(r-r)]K_(r,2) +...+ [binom(r-(r-1),(r-r))b^(r-r)]K_(r,(r-1)) 
] + \
sum_(b=0)^(r)[0^(r-b)K_(r,b)]
= sum_(b=0)^(x-1)[b^(r-1)] \

"the b^(r-r) dosent activate at degree 0 as r-1 -> 0-1 = -1 the sum dosent run" \
"establish equalities"  \
  [binom(r,(r-1))b^(r-1)]K_(r,0) = b^(r-1) \
  [binom(r,(r-2))b^(r-2)]K_(r,0) + [binom((r-1),(r-2))b^(r-2)] K_(r,1) = 0 \
  [binom(r,(r-3))b^(r-3)]K_(r,0) + [binom((r-1),(r-3))b^(r-3)] K_(r,1) + [binom((r-2),(r-3))b^(r-3)]K_(r,2) = 0 \
  ...
  [binom(r,(r-r))b^(r-r)]K_(r,0) + [binom((r-1),(r-r))b^(r-r)] K_(r,1) + [binom((r-2),(r-r))b^(r-r)]K_(r,2) +...+ [binom(r-(r-1),(r-r))b^(r-r)]K_(r,(r-1)) =0 \

"isolate" \
  K_(r,0) = binom(r,(r-1))^(-1) \
  K_(r,1) = -[binom(r,(r-2))]K_(r,0) [binom((r-1),(r-2))]^(-1) \
  K_(r,2) = (-[binom(r,(r-3))]K_(r,0) - [binom((r-1),(r-3))] K_(r,1) )[binom((r-2),(r-3))]^(-1) \
  ...
  K_(r,(r-1)) =  (-[binom(r,(r-r))]K_(r,0) - [binom((r-1),(r-r))] K_(r,1) - [binom((r-2),(r-r))]K_(r,2) -...- )[binom(r-(r-1),(r-r))]^(-1) \

"formula" \
K_(r,a) = sum_(b=0)^(a-1)[-[binom(r-b,r-(a+1))]K_(r,b)] binom(r-a,(r-(a+1)))^(-1) \
sum_(b=0)^(r)[x^(b) K_(r,r-b)] = sum_(b=0)^(x-1)[b^(r-1)] \
"K_(r,r) -> 0-1 =-1, sum dosent run, only produces 0^0" \
"no higher degrees contain a constant term, only sum terms, K_(r,r) dosent exist unless r=0" \
sum_(b=1)^(r)[x^(b) K_(r,r-b)] = sum_(b=0)^(x-1)[b^(r-1)] \
"reverse" \
sum_(b=0)^(r-1)[x^(b+1) K_(r,r-(b+1))] = sum_(b=0)^(x-1)[b^(r-1)] \
$



