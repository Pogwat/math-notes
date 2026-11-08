$$
x^r = \sum_{b=0}^{x-1}\sum_{c=0}^{r-1} \left[\left[\binom{r}{c}b^c    \right]\right] +0^r \\

\text{the binomial sum can have this idenity applied to it, the $b^c$ terms} \\

\text{expanding the r-1 binomial sum and applying the identity c times for each $b^c$ term} \\

x^r = \sum_{b=0}^{x-1} \left[\binom{r}{0}b^0 + \binom{r}{1}b^1 +\binom{r}{2}b^2+ \ldots + \binom{r}{r-1}b^{r-1}   \right] +0^r \\

x^r = \sum_{b=0}^{x-1} \left[\binom{r}{0}b^0 + \binom{r}{1}\sum_{c=0}^{b-1}\sum_{d=0}^{1-1} \left[\left[\binom{1}{d}c^d    \right]\right] +\binom{r}{2}\sum_{c=0}^{b-1}\sum_{d=0}^{2-1} \left[\left[ \binom{2}{d}c^d    \right]\right]+ \ldots + \binom{r}{r-1}b^{r-1}   \right] +0^r \\

x^r = \sum_{b=0}^{x-1} \left[\binom{r}{0}b^0 + \binom{r}{1}\sum_{c=0}^{b-1}\left[\binom{1}{0}c^0   \right] + \binom{r}{2}\sum_{c=0}^{b-1}\left[\binom{2}{0}c^0 +\binom{2}{1}c^1\right]+ \ldots + \binom{r}{r-1}b^{r-1}   \right] +0^r \\

x^r = \sum_{b=0}^{x-1} \left[\binom{r}{0}b^0 + \binom{r}{1}\sum_{c=0}^{b-1}\left[\binom{1}{0}c^0   \right] + \binom{r}{2}\sum_{c=0}^{b-1}\left[\binom{2}{0}c^0 +\binom{2}{1}\sum_{d=0}^{c-1} \left[\binom{1}{0}d^0    \right]     \right]+ \ldots + \binom{r}{r-1}b^{r-1}   \right] +0^r \\

x^r = \sum_{b=0}^{x-1} \left[\binom{r}{0}b^0 + \binom{r}{1}\sum_{c=0}^{b-1}\left[\binom{1}{0}c^0   \right] + \ldots + \binom{r}{r-1}\sum_{c=0}^{b-1}\sum_{d=0}^{r-2}+\ldots \sum_{}^{}\sum_{}^{r-r}\left[ \binom{1}{0}1\right]  \right] +0^r \\

\text{expanding each term grouping same layer deep sums and evaluting the binomial product allows bringing the binomial product out as $D_{n,r}$ } \\
\text{$D_{n,r}$ = grouped product of binomial terms of sums of the same ($n$th) depth in a $x^r$} \\
x^r = D_{1,r}\sum_{b=0}^{x-1}\left[1\right]  + D_{2,r}\sum_{b=0}^{x-1}\sum_{c=0}^{b-1}\left[1\right]   + \ldots D_{r,r}\sum_{b=0}^{x-1}\sum_{c=0}^{b-1} \ldots \sum_{}^{}\left[ 1 \right]  +0^r \\

\text{$D_{0,r}$ can be set to $0^r$ for consitency} \\
x^r = D_{0,r} + D_{1,r}\sum_{b=0}^{x-1}\left[1\right]  + D_{2,r}\sum_{b=0}^{x-1}\sum_{c=0}^{b-1}\left[1\right]   + \ldots D_{r,r}\sum_{b=0}^{x-1}\sum_{c=0}^{b-1} \ldots \sum_{}^{}\left[ 1 \right] \\

 
$$