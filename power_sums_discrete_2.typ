$
"from paper 1" \
K_(r,a) = sum_(b=0)^(a-1)[-[binom(r-b,r-(a+1))]K_(r,b)] binom(r-a,(r-(a+1)))^(-1) \
K_(r,0) = binom(r,(r-1))^(-1) \
sum_(b=0)^(r-1)[x^(b+1) K_(r,r-(b+1))] = sum_(b=0)^(x-1)[b^(r-1)] \
$

$
  K_(r,a) = sum_(b=0)^(a-1)[-[binom(r-b,r-(a+1))]K_(r,b)] binom(r-a,(r-(a+1)))^(-1) \
  "expand" \
  K_(r,a) = sum_(b=0)^(a-1)[-[binom(r-b,r-(a+1))][
    sum_(c=0)^(b-1)[-[binom(r-c,r-(b+1))]K_(r,c)] binom(r-b,(r-(b+1)))^(-1)
  ]] binom(r-a,(r-(a+1)))^(-1) \
  
  K_(r,n_0) = sum_(b_0=0)^(n_0-1)[-[binom(r-b_0,r-(n_0+1))][
    sum_(b_1=0)^(b_0-1)[-[binom(r-b_1,r-(b_0+1))]K_(r,b_1)] binom(r-b_0,(r-(b_0+1)))^(-1)
  ]] binom(r-n_0,(r-(n_0+1)))^(-1) \

  K_(r,n_0) = sum_(b_0=0)^(n_0-1)[-[binom(r-b_0,r-(n_0+1))][
    sum_(b_1=0)^(b_0-1)[-[binom(r-b_1,r-(b_0+1))]...[
      sum_(b_n=0)^(b_(n-1)-1)[-[binom(r-b_n,r-(b_(n-1)+1))]K_(r,b_n)] binom(r-b_(n-1),(r-(b_(n-1)+1)))^(-1)
    ]] binom(r-b_0,(r-(b_0+1)))^(-1)
  ]] binom(r-n_0,(r-(n_0+1)))^(-1) \
$