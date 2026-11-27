#set align(center)
$
  "let" p(a,n) = overbrace(sum_(b_0=0)^(a-1)[binom(a,b_0)sum_(b_1=0)^(b_0-1)[binom(b_0,b_1)...sum_(b_n=0)^(b_(n-1)-1)[binom(b_(n-1),b_n)]]],n "sums") \
  "binom_hockey_recurssion" \
     "for all" n in ZZ_>=0 \
     binom(a,n) = overbrace(sum_(b=0)^(a-1)[   
       sum_(c=0)^(b-1)[...sum_(n_n=0)^(n_(n-1)-1)[1] ...] ],n "sums") + binom(0,n) \
     (x+a)^r = sum_(b_0=0)^(r)[binom(r,b_0)x^b a^(r-b)] \
     (1+1)^r = sum_(b_0=0)^(r)[binom(r,b_0)1^b 1^(r-b)] \
     (1+1)^r = sum_(b_0=0)^(r-1)[binom(r,b_0)1^b 1^(r-b)]- 1^r \ 
     ((1+1)+1)^r = sum_(b_0=0)^(r-1)[binom(r,b_0)(1+1)^b 1^(r-b)]- (1+1)^r  \
     ((1+1)+1)^r = sum_(b_0=0)^(r-1)[binom(r,b_0)(1+1)^b]- (1+1)^r  \
     x=1, a=1 -> x'=(x+a) \
     (x+1)^r = sum_(b_0=0)^(r-1)[binom(r,b_0)x^b] - x^r  \
     ((x'+1)+1)^r = sum_(b_0=0)^(r-1)[binom(r,b_0)(x'+1)^b] - (x'+1)^r  \
     ((x'+1)+1)^r = sum_(b_0=0)^(r-1)[binom(r,b_0)sum_(b_1=0)^(b_0-1)[binom(b_0,b_1)(x')^(b_1)] - (x')^(b_1)] - (x'+1)^r \
     "those added x'^(b_1...) terms can be removed using this same identity." \
     "hwoever removing them introduces lower term overkap which has to be removed by a lower degree of this indetity and so on,
     until all overlap and terms are removed" \
     "for now lets define them as" \
     B_(n,x,i) \
     "where" \
     (x+n)^r + B_(n,x,0) + B_(n,x,1) +...+B_(n,x,n-1) = overbrace(sum_(b_0=0)^(r-1)[binom(r,b_0)sum_(b_1=0)^(b_0-1)[binom(b_0,b_1)...sum_(b_n=0)^(b_(n-1)-1)[binom(b_(n-1),b_n)(x)^(b_n)]] ] , n "sums") \
     "n contributeds n overlap terms i.e (x+1)^r has 1 overlap term B_(1,x,0) removes it" \
     (x+1)^r = sum_(b_0=0)^(r-1)[binom(r,b_0)x^b ]+x^r \
     "as a example" B_(1,x,0) = - (x)^r ", as" (x+1)^r - (x)^r = sum_(b_0=0)^(r-1)[binom(r,b_0)x^b ]
     
     
$