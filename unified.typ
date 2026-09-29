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

    D_(r,c+1) = overbrace(sum_(d=c)^(r-1)[D_(d,c)binom(r,d)], "Diffrence coefficents")]\

    D_(r,c) = overbrace(sum_(d=c-1)^(r-1)[D_(d,c-1)binom(r,d)], "Diffrence coefficents") \

$







   
