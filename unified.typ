$
  "binomial therom:" (x+a)^r = sum_(b=0)^(r) [ binom(r,b) x^b a^(r-b) ] \
  #[let $a=1$, $ 1^n $ always =1 so all x terms are just multiplied by 1] \

  (x+1)^r = sum_(b=0)^(r) [ binom(r,b) x^b 1 ] \
  #[let $x'=x-1$ to cancel the $+1$ and produce $x^r$] \

  ((x-1)+1)^r = x^r = sum_(b=0)^(r) [ binom(r,b) (x-1)^b ] \

  #[bring out the $(x-1)^r$ to get recurssion (by applying the identity to that term)] \

  x^r = sum_(b=0)^(r-1) [ binom(r,b) (x-1)^b ] + (x-1)^r \
  x^r = sum_(b=0)^(r-1) [ binom(r,b) (x-1)^b ] + sum_(b=0)^(r-1) [ binom(r,b) (x-2)^b ]+ sum_(b=0)^(r-1) [ binom(r,b) (x-3)^b ] +(x-3)^r \

  x^r = sum_(b=0)^(r-1) [ binom(r,b) (x-1)^b ] + sum_(b=0)^(r-1) [ binom(r,b) (x-2)^b ] + ... + sum_(b=0)^(r-1) [ binom(r,b) (x-x)^b ] + (x-x)^r \

  x^r = sum_(b=0)^(x-1) [ sum_(c=0)^(r-1) [binom(r,c)b^c ]] + 0^r
$ \

$
  #[apply the identity to the $b^c$ terms assymetrically to get sums of $x^0$] \
  x^r = sum_(b=0)^(x-1) [ sum_(c=0)^(r-1) [binom(r,c)b^c ]] + 0^r \
  x^r = sum_(b=0)^(x-1) [ sum_(c=0)^(r-1) [binom(r,0)b^0  + binom(r,1)b^1 + binom(r,2)b^2 + ... + binom(r,r-1)b^(r-1) ]] + 0^r \
  x^r = sum_(b=0)^(x-1)  [binom(r,0)b^0  + binom(r,1)sum_(c=0)^(b-1) [ binom(1,0)c^0 ] + binom(r,2)sum_(c=0)^(b-1) [binom(2,0)c^0+binom(2,1)sum_(d=0)^(c-1) [binom(1,0)d^0] ] + ... + binom(r,r-1)b^(r-1) ] + 0^r \
  x^r = binom(r,0)sum_(b=0)^(x-1) [b^0]  + binom(r,1)binom(1,0)sum_(b=0)^(x-1)sum_(c=0)^(b-1) [ c^0 ] + binom(r,2)binom(2,0)sum_(b=0)^(x-1) sum_(c=0)^(b-1) [c^0]+binom(r,2)binom(2,1)binom(1,0)sum_(b=0)^(x-1) sum_(c=0)^(b-1)sum_(d=0)^(c-1) [d^0]  + ... + binom(r,r-1)b^(r-1) ] + 0^r \
  x^r = binom(r,0)sum_(b=0)^(x-1) [b^0]  + (binom(r,1)binom(1,0)+binom(r,2)binom(2,0))sum_(b=0)^(x-1)sum_(c=0)^(b-1) [ c^0 ] + binom(r,2)binom(2,1)binom(1,0)sum_(b=0)^(x-1) sum_(c=0)^(b-1)sum_(d=0)^(c-1) [d^0]  + ... + binom(r,r-1)b^(r-1) ] + 0^r \
  #[let the product and sum of these outer binom terms grouped by sum level $(n)$, $= D_(r,n)$] \
  x^r = D_(r,1)sum_(b=0)^(x-1) [b^0]  + D_(r,2)sum_(b=0)^(x-1)sum_(c=0)^(b-1) [ c^0 ] + D_(r,3)sum_(b=0)^(x-1) sum_(c=0)^(b-1)sum_(d=0)^(c-1) [d^0]  + ...+  D_(r,r) overbrace(sum_(b=0)^(x-1) sum_(c=0)^(b-1)sum_(d=0)^(c-1)...sum_(n_n=0 )^(n_(n-1) -1)[n_(n) ^0],r "sums") + 0^r \
$ \


$
  #[pascals identity]\ 
  binom(a,n)=binom(a-1,n)+binom(a-1,n-1) \
 
  #import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
  #import fletcher.shapes: diamond
  
    "apply pascals identity recursivley to lhs"\
  #diagram(
    node-stroke: 1pt,
    node-fill: rgb("f9f9f9"),
    edge-stroke: 1pt,
    mark-scale: 80%,
    spacing: (1mm, 10mm), // (columns, rows)
    
    // Row 0: Start Node
    node((0, 0), [$cancel(binom(a,n))$], corner-radius: 5pt, fill: rgb("e3f2fd")),

    

    node((1, 1), [$binom(a-1,n-1)$], corner-radius: 5pt, fill: rgb("e3f2fd")),
    edge((0,0)),

    
    node((-1, 1), [$cancel(binom(a-1,n))$], corner-radius: 5pt, fill: rgb("e3f2fd")),
    edge((0,0)),

    node((0, 2), [$binom(a-2,n-1)$], corner-radius: 5pt, fill: rgb("e3f2fd")),
    edge((-1,1)),
    
    node((-2, 2), [$cancel(binom(a-2,n))$], corner-radius: 5pt, fill: rgb("e3f2fd")),
    edge((-1,1)),

    node((-1, 3), [$binom(a-3,n-1)$], corner-radius: 5pt, fill: rgb("e3f2fd")),
    edge((-2,2)),

    node((-3, 3), [$cancel(binom(a-3,n))$], corner-radius: 5pt, fill: rgb("e3f2fd")),
    edge((-2,2)),

    node((-2, 4), [$binom(a-4,n-1)$], corner-radius: 5pt, fill: rgb("e3f2fd")),
    edge((-3,3)),
    
    node((-4, 4), [$cancel(binom(a-4,n))$], corner-radius: 5pt, fill: rgb("e3f2fd")),
    edge((-3,3)),

    node((-5, 5), [$binom(a-a,n)$], corner-radius: 5pt, fill: rgb("e3f2fd")),
    edge((-3,3)),
    
    node((-3,5), [$binom(a-a,n-1)$], corner-radius: 5pt, fill: rgb("e3f2fd")),
    edge((-4,4))

    
  )\
  binom(a,n)=sum_(b=0)^(a-1)[binom(b,n-1)]+ binom(0,n) \
  #[apply the identity to the inner $binom(b,n-1)$] \

  binom(a,n)=sum_(b=0)^(a-1)[sum_(c=0)^(b-1)[binom(c,n-2)]+ binom(0,n-1)]+ binom(0,n) \
  #[expanding the inner term n-1 times, for n total sums, causes its inner term to be 1, as $binom(a>=0,0)=1$] \
  
  binom(a,n)=underbrace(sum_(b=0)^(a-1)[sum_(c=0)^(b-1)[sum_(d=0)^(c-1)[...sum_(n_n=0)^(n_(n-1)-1)[binom(n_n,n-n)]+ binom(0,n-(n-1))...] binom(0,n-2)]+ binom(0,n-1)],"n sums")+ binom(0,n) \

  binom(a,n)=underbrace(sum_(b=0)^(a-1)[sum_(c=0)^(b-1)[sum_(d=0)^(c-1)[...sum_(n_n=0)^(n_(n-1)-1)[binom(n_n,0)]+ binom(0,n-(n-1))...] binom(0,n-2)]+ binom(0,n-1)],"n sums")+ binom(0,n) \

  #[as we only expanded n-1 times the $binom(0,n_(n-1))$ only reach $binom(0,n-(n-1)) = binom(0,1)=0$, as $binom(0,n>0)=0$] \

  #[if $n=0$, the sums arent expanded and only the $binom(0,n)$ remains] \

  binom(a,n)=underbrace(sum_(b=0)^(a-1)[sum_(c=0)^(b-1)[sum_(d=0)^(c-1)[...sum_(n_n=0)^(n_(n-1)-1)[1]]]],"n sums")+ binom(0,n) \
$

$
  #[the sums in the binomial therom expansion and pascals identity expansions have the same bounds change] \

    x^r = D_(r,1)sum_(b=0)^(x-1) [1]  + D_(r,2)sum_(b=0)^(x-1)sum_(c=0)^(b-1) [ 1 ] + D_(r,3)sum_(b=0)^(x-1) sum_(c=0)^(b-1)sum_(d=0)^(c-1) [1]  + ...+  D_(r,r) overbrace(sum_(b=0)^(x-1) sum_(c=0)^(b-1)sum_(d=0)^(c-1)...sum_(n_n=0 )^(n_(n-1) -1)[1],r "sums") + 0^r \
    
    x^r = D_(r,1)binom(x,1)  + D_(r,2)binom(x,2) + D_(r,3)binom(x,3)  + ...+  D_(r,r) overbrace(binom(x,r),r "sums") + 0^r \

    x^r = sum_(b=1)^(r)[D_(r,b) binom(x,b)] +0^r \
    #[let $D_(r,0) = 0^r$] \
    x^r = sum_(b=0)^(r)[D_(r,b) binom(x,b)]
$


$
  x^r = sum_(b=0)^(x-1) [ sum_(c=0)^(r-1) [binom(r,c)b^c ]] + 0^r   
$
every expansion of $b^c$ adds a sum layer to the expanded terms, the $sum_(b=0)^(x-1)$ is this accumulator 

each new layer of $b_(n)^(c)$ adds a sum to the expanded terms, so each new  layer can only produce diffrences upto $n$ (beacuse it has a term with a minimum of $n$ sums)

therfore to get the nth diffrence you would on need to expand n times, (n-1 times if you count the base identity as the 0th expansion beacuse it adds a outer sum to the terms); diliberate expansion of terms with $r$

$
  x^r = sum_(b=0)^(x-1) [binom(r,0)b^0 + binom(r,1)b^1 + binom(r,2)b^2 ... binom(r,r-1)b^(r-1)   ] + 0^r  \
  b^0 = 1 \
  b^1 = sum_(c=0)^(x-1) [overbrace(binom(1,0)c^0,1)] \
  b^2 = sum_(c=0)^(x-1) [overbrace(binom(2,0)c^0,1) + binom(2,1)sum_(d=0)^(c-1) [overbrace(binom(1,0)d^0,1)] ] \
  #[each layer contains a 1 term it will have L (layer) amount of sums (for $r>=0$)] \ 
  x^r = sum_(b=0)^(x-1) [ sum_(c=1)^(r-1) [binom(r,c)b^c ]+overbrace(binom(r,0)b^0,1 "at" r>=1)] + overbrace(0^r,1 "at" r=0) 
$

$
  x^r = sum_(b=0)^(x-1) [ sum_(c=0)^(r-1) [binom(r,c)b^c ]] + 0^r   \
  x^r = sum_(b=0)^(r)[D_(r,b) binom(x,b)] \
  x^r = sum_(b=0)^(x-1) [ sum_(c=0)^(r-1) [binom(r,c)sum_(d=0)^(c)[D_(c,d) binom(b,d)] ]] + 0^r \

    x^r = sum_(b=0)^(x-1) [ binom(r,0)sum_(d=0)^(0)[D_(0,d) binom(b,d)] + binom(r,1)sum_(d=0)^(1)[D_(1,d) binom(b,d)] + ... + binom(r,r-1)sum_(d=0)^(r-1)[D_(r-1,d) binom(b,d)] ] + 0^r \
$
        grouping the terms by $binom(b,d)$ tells the coefficents of each diffrence level, this will produce a formula for $D_(r,c)$ in terms of $D_(r,c)$ from lower degree terms. 

        since every time you lower the degree you loose a diffrence level until $D_0$, there will be a falling number of each diffrence level in the sum. $sum^(r-1) D_0 + sum^(r-2) D_1 +... sum^(r-r) D_(r-1)$ (grouping the inner sum, excluding $sum^(x-1)$)
$
  x^r = sum_(b=0)^(x-1) [ binom(r,0)sum_(d=0)^(0)[D_(0,d) binom(b,d)] + binom(r,1)sum_(d=0)^(1)[D_(1,d) binom(b,d)] + ... + binom(r,r-1)sum_(d=0)^(r-1)[D_(r-1,d) binom(b,d)] ] + 0^r \

    x^r = sum_(b=0)^(x-1) [ overbrace([binom(r,0)D_(0,0)+ binom(r,1)D_(1,0) + ... + binom(r,r-1)D_(r-1,0)],D_(r,0+1))binom(b,0) + ... + overbrace([binom(r,r-1)D_(r-1,r-1)], D_(r,r-1+1)) binom(b,r-1) ] + 0^r \
$

    beacuse of outer sum the diffrence level has 1 added to it,the grouped coefficents on $binom(b,n)$ tells the diffrence level of the $n$th diffrence as this would expand to $n$ falling sums 
$
  x^r = sum_(b=0)^(x-1) [sum_(c=0)^(r-1)[D_(c,0)binom(r,c)]binom(b,0) + sum_(c=1)^(r-1)[D_(c,1)binom(r,c)]binom(b,1) + ... + sum_(c=r-1)^(r-1)[D_(c,r-1)binom(r,c)]binom(b,r-1)]+0^r \

    x^r = sum_(b=0)^(x-1) [sum_(c=0)^(r-1)[binom(b,c)sum_(d=c)^(r-1)[D_(d,c)binom(r,d)]]]+0^r \

    
    binom(a,n)=underbrace(sum_(b=0)^(a-1)[sum_(c=0)^(b-1)[sum_(d=0)^(c-1)[...sum_(n_n=0)^(n_(n-1)-1)[1]]]],"n sums")+ binom(0,n) \
    \
    x^r = sum_(c=0)^(r-1)[overbrace(binom(x,c+1),"Diffrence sums (c+1)" ) overbrace(sum_(d=c)^(r-1)[D_(d,c)binom(r,d)], "Diffrence coefficents")]+overbrace(0^r,0"th Diffrence") \

    D_(r,0)=0^r \

    D_(0,0)=1 \

    D_(r,c+1) = overbrace(sum_(d=c)^(r-1)[D_(d,c)binom(r,d)], "Diffrence coefficents") \

    D_(r,c) = overbrace(sum_(d=c-1)^(r-1)[D_(d,c-1)binom(r,d)], "Diffrence coefficents")

$

$
   D_(r,c) = sum_(d=c-1)^(r-1)[D_(d,c-1)binom(r,d)] \
   D_(r,c) = sum_(d=c-1)^(r-1)[sum_(e=c-2)^(d-1)[D_(e,c-2)binom(d,e)]binom(r,d)] \
   #[expand c-1 times, (c times if you count the base diffrences identity as the 0th expansion )] \
   D_(r,c) = overbrace(sum_(d=c-1)^(r-1)[sum_(e=c-2)^(d-1)[sum_(f=c-3)^(e-1)[...sum_(n_(c-1)=c-c)^(n_(c-2)-1)[D_(n_(c-1),c-c)binom(n_(c-2),n_(c-1))]...binom(e,f)]binom(d,e)]binom(r,d)],c "sums")
$

$
  D_(r,c) = sum_(d=c-1)^(r-1)[D_(d,c-1)binom(r,d)] \
  #[since $x^r$ only has diffrences upto level $r$ , $D_(r,(c>r))$ can be treated as 0] \
  D_(r,c) = sum_(d=0)^(r-1)[D_(d,c-1)binom(r,d)] \
  D_(r,c) = sum_(d=0)^(r-1)[sum_(e=0)^(d-1)[D_(e,c-2)binom(d,e)] binom(r,d)] \
  D_(r,c) = overbrace(sum_(d=0)^(r-1)[sum_(e=0)^(d-1)[sum_(f=0)^(e-1)[...sum_(n_(c-1)=0)^(n_(c-2)-1)[D_(n_(c-1),c-c)binom(n_(c-2),n_(c-1))]...binom(e,f)]binom(d,e)]binom(r,d)],c "sums") \
  D_(r,c) = overbrace(sum_(d=0)^(r-1)[sum_(e=0)^(d-1)[sum_(f=0)^(e-1)[...sum_(n_(c-1)=0)^(n_(c-2)-1)[D_(n_(c-1),0)binom(n_(c-2),n_(c-1))]...binom(e,f)]binom(d,e)]binom(r,d)],c "sums") \
  D_(r,0)=0^r \
  D_(r,c) = overbrace(sum_(d=0)^(r-1)[sum_(e=0)^(d-1)[sum_(f=0)^(e-1)[...sum_(n_(c-1)=0)^(n_(c-2)-1)[0^(n_(c-1)) binom(n_(c-2),n_(c-1))]...binom(e,f)]binom(d,e)]binom(r,d)],c "sums") \

  
$
  since $0^r= 1$ only at $r=0$, the inner sums $0^(n_(c-1))$ will only be $1$ at the start, since $0^(!=0)$ is $0$ the $binom(n_(c-2),n_(c-1))$ will cancle out when not at the start of the sum, the sum only produces a single non zero run at its start, as long as the inner most upper bound is not negative, if $r>=c$ the inner sum is guarnted to run at least once
$

  #[the inner sum only runs once if upper bound is not negative] \
   D_(r,c) = overbrace(sum_(d=0)^(r-1)[sum_(e=0)^(d-1)[sum_(f=0)^(e-1)[...sum_(n_(c-2)-1)^(n_(c-2)-1)[1]...binom(e,f)]binom(d,e)]binom(r,d)],c "sums") \

  D_(r,c) = overbrace(sum_(d=0)^(r-1)[sum_(e=0)^(d-1)[sum_(f=0)^(e-1)[...sum_(n_(c-2)=0)^(n_(c-3)-1)[sum_(n_(c-2)-1)^(n_(c-2)-1)[1] binom(n_(c-3),n_(c-2))]...binom(e,f)]binom(d,e)]binom(r,d)],c "sums") \
  #[for the inner most sum to run the outer sums lower bound must be at least 1, $n_(c-2) >=1$, if it is 0 it will not run] \
  #[$1-0^(n_(c-2))$ is only 1 if $n_(c-2)!=0$ or $n_(c-2)>0$ and $n_(c-2)<0$] \
  #[since $n_(c-2)$ starts at 0 and goes upto $n_(c-3)-1$ it can be negative or its parent sum wouldnt have run it] \
  D_(r,c) = overbrace(sum_(d=0)^(r-1)[sum_(e=0)^(d-1)[sum_(f=0)^(e-1)[...sum_(n_(c-2)=0)^(n_(c-3)-1)[[1-0^(n_(c-2))] binom(n_(c-3),n_(c-2))]...binom(e,f)]binom(d,e)]binom(r,d)],c-1 "sums") \
    D_(r,c) = overbrace(sum_(d=0)^(r-1)[sum_(e=0)^(d-1)[sum_(f=0)^(e-1)[...sum_(n_(c-2)=0)^(n_(c-3)-1)[1] binom(n_(c-3),n_(c-2))]...binom(e,f)]binom(d,e)]binom(r,d)],c-1 "sums") \
    + overbrace(sum_(d=0)^(r-1)[sum_(e=0)^(d-1)[sum_(f=0)^(e-1)[...sum_(n_(c-2)=0)^(n_(c-3)-1)[[-0^(n_(c-2))] binom(n_(c-3),n_(c-2))]...binom(e,f)]binom(d,e)]binom(r,d)],c-1 "sums") \
    D_(r,c) = overbrace(sum_(d=0)^(r-1)[sum_(e=0)^(d-1)[sum_(f=0)^(e-1)[...sum_(n_(c-2)=0)^(n_(c-3)-1)[1] binom(n_(c-3),n_(c-2))]...binom(e,f)]binom(d,e)]binom(r,d)],c-1 "sums") \
    + overbrace(sum_(d=0)^(r-1)[sum_(e=0)^(d-1)[sum_(f=0)^(e-1)[...sum_(n_(c-3)=0)^(n_(c-4)-1) [sum_(n_(c-2)=0)^(n_(c-3)-1)[[-0^(n_(c-2))] binom(n_(c-3),n_(c-2))]binom(n_(c-4),n_(c-3))]...binom(e,f)]binom(d,e)]binom(r,d)],c-1 "sums") \
      #[ $-0^(n_(c-2))$ is only -1 if $n_(c-2)$ is 0, the base of the sum, $binom(n_(c-3),n_(c-2))$ is 1 at the base ] \
      D_(r,c) = overbrace(sum_(d=0)^(r-1)[sum_(e=0)^(d-1)[sum_(f=0)^(e-1)[...sum_(n_(c-2)=0)^(n_(c-3)-1)[1] binom(n_(c-3),n_(c-2))]...binom(e,f)]binom(d,e)]binom(r,d)],c-1 "sums") \
      + overbrace(sum_(d=0)^(r-1)[sum_(e=0)^(d-1)[sum_(f=0)^(e-1)[...sum_(n_(c-3)=0)^(n_(c-4)-1) [sum_(n_(c-3)-1)^(n_(c-3)-1)[-1]binom(n_(c-4),n_(c-3))]...binom(e,f)]binom(d,e)]binom(r,d)],c-1 "sums")  \
      \ \ \ \ \ \ \ 
      overbrace(sum_(d=0)^(r-1)[sum_(e=0)^(d-1)[sum_(f=0)^(e-1)[...sum_(n_(c-3)=0)^(n_(c-4)-1) [sum_(n_(c-3)-1)^(n_(c-3)-1)[-1]binom(n_(c-4),n_(c-3))]...binom(e,f)]binom(d,e)]binom(r,d)],c-1 "sums")  = \
      overbrace(sum_(d=0)^(r-1)[sum_(e=0)^(d-1)[sum_(f=0)^(e-1)[...sum_(n_(c-3)=0)^(n_(c-4)-1) [[-1+0^(n_(c-3))]binom(n_(c-4),n_(c-3))]...binom(e,f)]binom(d,e)]binom(r,d)],c-2 "sums")  \
    
$

$
  "let" k= overbrace(sum_(n_1 =0)^(n_0 -1)[sum_(n_2 =0)^(n_1-1)[sum_(n_3=0)^(n_2-1)[... sum_(n_n=0)^(n_(n-1)-1)[0^n_(n)]...]]],n "sums") \
  k=sum_(n_1 =0)^(n_0 -1)[sum_(n_2 =0)^(n_1-1)[sum_(n_3=0)^(n_2-1)...[ sum_(n_(n-1)=0)^(n_(n-2)-1)[sum_(n_(n-1)-1)^(n_(n-1)-1)[1]]...]]] \
$

$sum_(b=0)^(a)[0^b]$ will produce 1 if $a>=0$, it will produce 0 if $a<0$
it is a switch that is only on if the upper sum bound is $>=0$ \
$sum_(b=0)^(a)[0^b] = a>=0 = a==0 | a>0$
it defaults to 1 only if $a<0$ will it be 0, defualt - (1 if less than 0) = 1 - (1 if less than 0)

$
  sum_(b=0)^(a)[0^b] = 1 - cases(1 "if" a<0 ,0 "if" a==0, 0 "if" a>0  ) = cases(0 "if" a<0 ,1 "if" a==0, 1 "if" a>0  ) \

  0^a = cases(1 "if" a==0, 0 "or undefined" "if" a<0,0 "if" a>0) \
  0^(a+1) = cases(1 "if" a==(-1), 0  "or undefined" "if" a<(-1),0 "if" a>(-1)) \
  #[$1-0^(a+1)$ will only be zero if $a = -1$, it is also the inverts $0^(a+1)$ as it defualts to 1 and is only 0 when $0^(a+1)==1$] \
  1-0^(a+1) = cases(0 "if" a==(-1), 1  "or undefined" "if" a<(-1),1 "if" a>(-1)) =  cases(0 "if" a==(-1), 1  "or undefined" "if" a<(-1),1 "if" a==(0),1 "if" a>(0)) \
  #[2 of the 4 cases match $cases(0 "if" a<0 ,1 "if" a==0, 1 "if" a>0  )$, the 1st case is paritally matched (only for $a==-1$ not for $a<(-1)$)  ] \
  forall a "such that" a==-1 | a>0 | a==0 : sum_(b=0)^(a)[0^b] = 1-0^(a+1)
  
$
  
$
  forall a "such that" a==0 | a>1 | a==1 : sum_(b=0)^(a-1)[0^b] = 1-0^(a) \
  sum_(b=0)^(a-1)[0^b] = overbrace(1 - 0^a,"deafults to 1, only if a is 0 will this drop out")\
  #[the sum will not run if $a=0$, $0-1=-1$, $sum_(b=0)^(-1)=0$] \ \ \
  #[apply the identity to the $0^n$ sums] \
  #[if the upper bound of a inner sum drops negative the sum will not run and the incosistency will never be reached] \
  k=sum_(n_1 =0)^(n_0 -1)[sum_(n_2 =0)^(n_1-1)[sum_(n_3=0)^(n_2-1)...[ sum_(n_(n-1)=0)^(n_(n-2)-1)[1-0^(n_(n-1))]]...]] \
  k=sum_(n_1 =0)^(n_0 -1)[sum_(n_2 =0)^(n_1-1)[sum_(n_3=0)^(n_2-1)...[ sum_(n_(n-1)=0)^(n_(n-2)-1)[-0^(n_(n-1))]+sum_(n_(n-1)=0)^(n_(n-2)-1)[1]]...]] \
  k=sum_(n_1 =0)^(n_0 -1)[sum_(n_2 =0)^(n_1-1)[sum_(n_3=0)^(n_2-1)...sum_(n_(n-2)=0)^(n_(n-3)-1)[ -(1-0^(n_(n-2)))+  [ sum_(n_(n-1)=0)^(n_(n-2)-1)[1]]]...]] \
  k=sum_(n_1 =0)^(n_0 -1)[sum_(n_2 =0)^(n_1-1)[sum_(n_3=0)^(n_2-1)...sum_(n_(n-3)=0)^(n_(n-4)-1)[sum_(n_(n-2)=0)^(n_(n-3)-1)[ -1]+ sum_(n_(n-2)=0)^(n_(n-3)-1)[ 0^(n_(n-2))] + [ sum_(n_(n-1)=0)^(n_(n-2)-1)[1]]]...]] \
  k=sum_(n_1 =0)^(n_0 -1)[sum_(n_2 =0)^(n_1-1)[sum_(n_3=0)^(n_2-1)...sum_(n_(n-3)=0)^(n_(n-4)-1)[sum_(n_(n-2)=0)^(n_(n-3)-1)[ -1]+ ( 1-0^(n_(n-3)) ) + [ sum_(n_(n-1)=0)^(n_(n-2)-1)[1]]]...]] \
  
  #[every expansion inverts the sign of the terms and adds a term to a lower sum level] \
   k=sum_(n_1 =0)^(n_0 -1)[(-1)^(n-1)+ 0^(n_1)(-1)^n+sum_(n_2 =0)^(n_1-1)[(-1)^(n-2)+sum_(n_3=0)^(n_2-1)...(-1)^3+sum_(n_(n-3)=0)^(n_(n-4)-1)[(-1)^2+sum_(n_(n-2)=0)^(n_(n-3)-1)[ (-1)^1 + [ sum_(n_(n-1)=0)^(n_(n-2)-1)[(-1)^0]]]]...]] \

   k=(-1)^(n+1)0^(n_0)+(-1)^(n)
   +sum_(n_1 =0)^(n_0 -1)[(-1)^(n-1)]+sum_(n_1 =0)^(n_0 -1)[sum_(n_2 =0)^(n_1-1)[(-1)^(n-2)]] \ 
   + sum_(n_1 =0)^(n_0 -1)[sum_(n_2 =0)^(n_1-1)[sum_(n_3=0)^(n_2-1)[(-1)^3]]]
   +... sum_(n_1 =0)^(n_0 -1)[sum_(n_2 =0)^(n_1-1)[sum_(n_3=0)^(n_2-1)[...sum_(n_(n-3)=0)^(n_(n-4)-1)[(-1)^2]]]]+ \ 
   sum_(n_1 =0)^(n_0 -1)[sum_(n_2 =0)^(n_1-1)[sum_(n_3=0)^(n_2-1)[...sum_(n_(n-3)=0)^(n_(n-4)-1)[sum_(n_(n-2)=0)^(n_(n-3)-1)[ (-1)^1 ]]]]]
  +    overbrace(sum_(n_1 =0)^(n_0 -1)[sum_(n_2 =0)^(n_1-1)[sum_(n_3=0)^(n_2-1)[...sum_(n_(n-3)=0)^(n_(n-4)-1)[sum_(n_(n-2)=0)^(n_(n-3)-1)[ sum_(n_(n-1)=0)^(n_(n-2)-1)[(-1)^0]]]]]], n-1 "sums") \ 
$







   
