
$$
\text{binomial therom:} \\
(x+a)^r = \sum_{b=0}^{r} \left[ \binom{r}{b}x^ba^{r-b}  \right] \\
\text{taking the last term off} \\
(x+a)^r = \sum_{b=0}^{r-1} \left[ \binom{r}{b}x^ba^{r-b} \right] + \binom{r}{r}x^ra^0 \\
\text{let a=1, as $1^n = 1$, the $x^b $ terms are multipled by a constant $1$ } \\
(x+1)^r = \sum_{b=0}^{r-1} \left[ \binom{r}{b}x^b1 \right] + \binom{r}{r}x^r1 \\
\text{let $x'=x-1$, the $a=1$ will cancel this leaving $x^r$} \\
((x-1)+1)^r =x^r= \sum_{b=0}^{r-1} \left[ \binom{r}{b}(x-1)^b \right] + \binom{r}{r}(x-1)^r \\
\text{the $\binom{r}{r}(x-1)^r$ term can have this idenity applied to itself $x-1$ times} \\
 x^r= \sum_{b=0}^{r-1} \left[ \binom{r}{b}(x-1)^b \right] + \binom{r}{r}\left(\sum_{b=0}^{r-1} \left[ \binom{r}{b}(x-2)^b \right] + (x-2)^r\right) \\
x^r= \sum_{b=0}^{r-1} \left[ \binom{r}{b}(x-1)^b \right] + \binom{r}{r}\left(\sum_{b=0}^{r-1} \left[ \binom{r}{b}(x-2)^b \right] +\ldots + \binom{r}{r}\left(\sum_{b=0}^{r-1} \left[ \binom{r}{b}(x-x)^b \right]  + (x-x)^r \right)   \right) \\
\text{as $\binom{r}{r}=1$ the equation can be written as} \\
x^r= \sum_{b=0}^{r-1} \left[ \binom{r}{b}(x-1)^b \right] + \sum_{b=0}^{r-1} \left[ \binom{r}{b}(x-2)^b \right] +\ldots + \sum_{b=0}^{r-1} \left[ \binom{r}{b}(x-x)^b \right]  + (x-x)^r    \\
\text{this can be written as this sum, (reverse order) $(x-x) \ldots(x-1)$} \\
x^r = \sum_{b=0}^{x-1}\sum_{c=0}^{r-1} \left[\left[\binom{r}{c}b^c    \right]\right] +0^r \\


$$