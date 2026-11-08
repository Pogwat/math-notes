// =========================================================================
// 1. THE LAYOUT ENGINES & MACROS
// =========================================================================
#let publish-formula(label-name, body) = { [#metadata(body) #label(label-name)] }
#let quote-published(label-name) = {
  context {
    let matches = query(label(label-name))
    if matches.len() == 0 [ *Error:* Label not found. ] else {
      let item = matches.first()
      block(width: 100%, fill: luma(250), stroke: (left: 3pt + rgb("2196F3")), inset: 12pt, radius: 4pt, breakable: false)[
        #item.value
      ]
    }
  }
}

// =========================================================================
// 2. THE PHYSICAL FILE COPIES (AUTOMATICALLY GATHERED & HIDDEN VIA ZERO-SPACE PLACE)
// =========================================================================
// We wrap the hidden text inside a zero-sized 'place' container and use 'hide'.
// This forces Typst to register the labels perfectly in memory without creating space or pages.
#place(top + left, dx: 0pt, dy: 0pt)[
  #hide([
    // Source Note File Reference: formulas.typ
    #publish-formula("non-falling-sums-btherom")[
      $ x^r = overbrace(sum_(b=0)^(r) [ binom(r,b) sum_(c=0)^(b) [ binom(b,c) sum_(d=0)^(c) [ binom(c,d)dots [sum_(n_l=0)^(n_(l -1 )) [ binom(n_(l-1),n_(l)) (x-l a)^(n_l) a^(n_(l-1) - n_l ) ]] a^(c-d ) ]  a^(b-c) ]  a^(r-b) ], l "sums") $
    ]

    // Source Note File Reference: formulas.typ
    #publish-formula("falling-sums-btherom")[
      $ 
  x^r = overbrace(sum_(b=0)^(r-1) [ binom(r,b) [sum_(c=0)^(b-1) [ binom(r,b)  dots [sum_(n_l=0)^(n_(l-1)-1) [ binom(n_(l-1),n_(l)) (x-l a)^(n_l) a^(n_(l-1)-n_(l)) ] ] dots  a^(b-c) ]] a^(r-b) ] , l "sums")  \
  + 
    overbrace(sum_(b=0)^(r-1) [ binom(r,b) [sum_(c=0)^(b-1) [ binom(r,b)  dots [sum_(n_(l-1)=0)^(n_(l-2)-1) [(x-l a)^(n_(l-1)) ]  ] dots  a^(b-c) ] ] a^(r-b) ] , l-1 "sums")  \
  + dots +
    overbrace(sum_(b=0)^(r-1) [ binom(r,b) [ (x-2a)^b] a^(r-b) ], 1 "sums")  \
  +
    overbrace((x-a)^r, 0 "sums")  \
$
    ]

  ])
]

// =========================================================================
// 3. THE VISIBLE SHEET OUTPUT (YOUR QUOTES ARE LIVE BELOW)
// =========================================================================
#set page(paper: "a4", margin: 1.5cm)

= Master Dynamic Formula Reference Index

#quote-published("non-falling-sums-btherom")

#quote-published("falling-sums-btherom")
