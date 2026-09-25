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
  x^r = D_(r,1)sum_(b=0)^(x-1) [b^0]  + D_(r,2)sum_(b=0)^(x-1)sum_(c=0)^(b-1) [ c^0 ] + D_(r,3)sum_(b=0)^(x-1) sum_(c=0)^(b-1)sum_(d=0)^(c-1) [d^0]  + ...+  D_(r,r) overbrace(sum_(b=0)^(x-1) sum_(c=0)^(b-1)sum_(d=0)^(c-1)...sum_(n_n=0 )^(n_(n-1) -1)[n_(n) ^0],n "sums") + 0^r \
$ \


$
  #[pascals identity]\ 
  binom(a,n)=binom(a-1,n)+binom(a-1,n-1) \
 
  #import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
  #import fletcher.shapes: diamond
  

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

    node((0, 2), [$binom(a-1,n-1)$], corner-radius: 5pt, fill: rgb("e3f2fd")),
    edge((-1,1)),
    
    node((-2, 2), [$cancel(binom(a-2,n))$], corner-radius: 5pt, fill: rgb("e3f2fd")),
    edge((-1,1)),

    node((-1, 3), [$binom(a-1,n-1)$], corner-radius: 5pt, fill: rgb("e3f2fd")),
    edge((-2,2)),

    node((-3, 3), [$cancel(binom(a-3,n))$], corner-radius: 5pt, fill: rgb("e3f2fd")),
    edge((-2,2)),

    node((-2, 4), [$binom(a-1,n-1)$], corner-radius: 5pt, fill: rgb("e3f2fd")),
    edge((-3,3)),
    
    node((-4, 4), [$cancel(binom(a-4,n))$], corner-radius: 5pt, fill: rgb("e3f2fd")),
    edge((-3,3)),

    node((-5, 5), [$binom(a-a,n)$], corner-radius: 5pt, fill: rgb("e3f2fd")),
    edge((-3,3)),
    
    node((-3,5), [$binom(a-a,n-1)$], corner-radius: 5pt, fill: rgb("e3f2fd")),
    edge((-4,4))

    
  )\
  "apply pascals identity recursivley to lhs"\
  binom(a,n)=sum_(b=0)^(a-1)[binom(b,n-1)]+ binom(0,n)




  




$