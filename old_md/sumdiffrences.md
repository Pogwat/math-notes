$$
\binom{a}{n}=\overbrace{\sum_{b=0}^{a-1}  \sum_{c=0}^{b-1} \ldots \sum_{n_{n}=0}^{n_{n-1}-1}\left[1 \right]}^{\text{$n$ sums}}   + \binom{0}{n} \\

x^r = D_{0,r} + D_{1,r}\sum_{b=0}^{x-1}\left[1\right]  + D_{2,r}\sum_{b=0}^{x-1}\sum_{c=0}^{b-1}\left[1\right]   + \ldots D_{r,r}\overbrace{\sum_{b=0}^{x-1}\sum_{c=0}^{b-1} \ldots \sum_{}^{}\left[ 1 \right]}^{\text{r sums}} \\

\text{$x^r$ is a sum of succesive nested sums of 1 with $D_{n,r}$ coefficents, so the combanatroical identity can be applied to the nested sums} \\

x^r = D_{0,r}\binom{x}{0} + D_{1,r}\binom{x}{1}  + D_{2,r}\binom{x}{2}    + \ldots D_{r,r}\binom{x}{r}  \\
x^r = \sum_{b=0}^{r}D_{b,r}\binom{x}{b}

$$