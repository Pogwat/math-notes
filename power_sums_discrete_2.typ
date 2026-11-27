#set align(center)

$
"from paper 1" \
K_(r,a) = sum_(b=0)^(a-1)[-[binom(r-b,r-(a+1))]K_(r,b)] binom(r-a,(r-(a+1)))^(-1) \
K_(r,0) = binom(r,(r-1))^(-1) \
sum_(b=0)^(r-1)[x^(b+1) K_(r,r-(b+1))] = sum_(b=0)^(x-1)[b^(r-1)] \
$

$
  K_(r,a) = sum_(b=0)^(a-1)[-[binom(r-b,r-(a+1))]K_(r,b)] binom(r-a,(r-(a+1)))^(-1) \

$
lets cleanup the equation so we can expand with less cluter terms
$
  K_(r,0) = binom(r,(r-1))^(-1) \
  K_(r-a,0) = binom(r-a,((r-a)-1))^(-1) = binom(r-a,(r-(a+1)))^(-1) \
  K_(r,a) = sum_(b=0)^(a-1)[-binom(r-b,r-(a+1))K_(r,b)] K_(r-a,0) \
  "let" T(a,b) =  binom(r-b,r-(a+1)) \ 
  K_(r,a) = sum_(b=0)^(a-1)[-T(a,b)K_(r,b)] K_(r-a,0) \
$

now assyemtrically expand $K_(r,b)$ terms

$
  K_(r,1) = sum_(b=0)^(1-1)[-T(1,b)K_(r,b)] K_(r-1,0) = [-T(1,0)K_(r,0)] K_(r-1,0)  \
  K_(r,2) = sum_(b=0)^(2-1)[-T(2,b)K_(r,b)] K_(r-2,0) = [-T(2,0)K_(r,0) -T(2,1)K_(r,1)] K_(r-2,0)\ 
  K_(r,3) = sum_(b=0)^(3-1)[-T(3,b)K_(r,b)] K_(r-3,0) = [-T(3,0)K_(r,0)-T(3,1)K_(r,1)-T(3,2)K_(r,2)] K_(r-3,0) \
$

$
  K_(r,a) = sum_(b=0)^(a-1)[-T(a,b)K_(r,b)] K_(r-a,0) \
  K_(r,a) = sum_(b=0)^(a-1)[-T(a,b)sum_(b_1=0)^(b-1)[-T(b,b_1)K_(r,b_1)] K_(r-b,0)] K_(r-a,0) \
  
$
 


