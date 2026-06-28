---
title: "Reverse Mathematics of Complexity Lower Bounds"
collection: publications
category: journals
topics: [PC, CC]
permalink: /publication/focs24-reverse
excerpt: 'We show that with respect to the theory **PV**, certain lower bounds about communication complexity and Turing machines are equivalent to basic mathematical principles such as the Pigeonhole Principle.'
date: 2026-04-29
venue: 'SICOMP'
slidesurl: '/files/slides-reverse-math.pptx'
paperurl: 'https://eccc.weizmann.ac.il/report/2024/060/'
bibtexurl: 'https://dblp.org/rec/conf/focs/0001LO24.html?view=bibtex'
citation: 'Lijie Chen, Jiatu Li, Igor C. Oliveira. Reverse Mathematics of Complexity Lower Bounds. <i>SIAM Journal on Computing</i>, 2026. Special section on FOCS 2024.'
---

**Published version:** [SIAM Journal on Computing](https://doi.org/10.1137/24M1717865) (FOCS 2024 special section) &middot; preliminary version in [FOCS 2024](https://dblp.org/rec/conf/focs/0001LO24.html?view=bibtex)

**Note:** See the [Quanta Magazine article](https://www.quantamagazine.org/reverse-mathematics-illuminates-why-hard-problems-are-hard-20251201/) about the paper!

**Abstract:** Reverse mathematics is a program in mathematical logic that seeks to determine which axioms are necessary to prove a given theorem. In this work, we systematically explore the reverse mathematics of complexity lower bounds. We explore reversals in the setting of bounded arithmetic, with Cook's theory $$\mathbf{PV}_1$$  as the base theory, and show that several natural lower bound statements about communication complexity, error correcting codes, and Turing machines are equivalent to widely investigated combinatorial principles such as the weak pigeonhole principle for polynomial-time functions and its variants. As a consequence, complexity lower bounds can be formally seen as fundamental mathematical axioms with far-reaching implications.

The proof-theoretic equivalence between complexity lower bound statements and combinatorial principles yields several new implications for the (un)provability of lower bounds. Among other results, we derive the following consequences:

- Under a plausible cryptographic assumption, the classical single-tape Turing machine $$\Omega(n^2)$$-time lower bound for Palindrome is unprovable in Jerabek's theory $$\mathbf{APC}_1$$. The conditional unprovability of this simple lower bound goes against the intuition shared by some researchers that most complexity lower bounds could be established in $$\mathbf{APC}_1$$.
    
- While $$\mathbf{APC}_1$$ proves one-way communication lower bounds for Set Disjointness, it does not prove one-way communication lower bounds for Equality, under a plausible cryptographic assumption. 

- An amplification phenomenon connected to the (un)provability of some lower bounds, under which a quantitatively weak $$n^{1 + \varepsilon}$$ lower bound is provable if and only if a stronger (and often tight) $$n^c$$ lower bound is provable.

- Feasibly definable randomized algorithms can be feasibly defined deterministically ($$\mathbf{APC}_1$$ is $$\forall\Sigma^b_1$$-conservative over $$\mathbf{PV}_1$$) if and only if one-way communication complexity lower bound for Set Disjointness are provable in $$\mathbf{PV}_1$$.   