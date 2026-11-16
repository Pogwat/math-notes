#set align(center)

$
  binom(a,n) = a! / (n!(a-n)!) \
  a! = product_(b=1)^(a)b \
  binom(a,n) = (product_(b=1)^(a)[b]) / (product_(b=1)^(n)[b]  product_(b=1)^(a-n)[b]) \
$
we can strip away 1 from all n or a products, this splits binom(a,n) into a prodcut of a falling a or n binomial 

stripping away a
  $
    binom(a,n) = (product_(b=1)^(a)[b]) / (product_(b=1)^(n)[b]  product_(b=1)^(a-n)[b]) \
    binom(a,n) = (a product_(b=1)^(a-1)[b]) / (product_(b=1)^(n)[b]  (a-n) product_(b=1)^((a-1)-n)[b]) \
    binom(a,n) = (a/(a-n))( product_(b=1)^(a-1)[b]) / (product_(b=1)^(n)[b] product_(b=1)^((a-1)-n)[b]) \
  $
transforming all a cases allows the rhs to be re-written as $binom(a-1,n)$
  $
    binom(a,n) = a/(a-n)binom(a-1,n)
  $
now recursivley expand rhs to reach binom(a-a,b) if a is a positive integer
$
  binom(a,n) = a/(a-n)(a-1)/((a-1)-n)binom((a-1)-1,n) \
  binom(a,n) = a/(a-n)(a-1)/((a-1)-n)...(a-(a-1))/(((a-(a-1))-n))binom((a-(a-1)-1),n) \
  binom(a,n) = a/(a-n)(a-1)/((a-1)-n)...(a-(a-1))/(((a-(a-1))-n))
  
$

