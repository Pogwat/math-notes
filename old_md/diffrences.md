$$ 
x^r = \sum_{b=0}^{x-1}\sum_{c=0}^{r-1} \left[\binom{r}{c}b^c    \right] +0^r \\

x^r=\sum_{b=0}^{r}D_{b,r}\binom{x}{b} \\

x^r = \sum_{b=0}^{x-1}\sum_{c=0}^{r-1} \left[\binom{r}{c}  \sum_{d=0}^{c}D_{d,c}\binom{b}{d}   \right] +0^r \\

\text{group $D_{d,c}$ by $d$} \\


x^r = \sum_{b=0}^{x-1} \left[ \binom{r}{0}  \left[D_{0,0}\binom{b}{0}  \right] + \binom{r}{1}\left[D_{0,1}\binom{b}{0}+D_{1,1}\binom{b}{1}  \right] \ldots +\binom{r}{r-1}\left[D_{0,r-1} \binom{b}{0} + \ldots + D_{r-1,r-1}\binom{b}{r-1}\right] \right ] +0^r \\

x^r = \sum_{b=0}^{x-1}\left[\binom{b}{0}\sum_{c=0}^{r-1}\left[\binom{r}{c}D_{0,c} \right] + \binom{b}{1}\sum_{c=1}^{r-1}\left[\binom{r}{c}D_{1,c} \right] + \ldots + \binom{b}{r-1}\sum_{c=r-1}^{r-1}\left[\binom{r}{c}D_{r-1,c} \right] \right]+0^r \\

x^r = \sum_{b=0}^{x-1}\left[\sum_{c=0}^{r-1}\binom{b}{c}\sum_{d=c}^{r-1}\left[\binom{r}{d}D_{c,d} \right]\right]+0^r \\


$$