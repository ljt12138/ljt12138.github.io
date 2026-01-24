---
title: "The Exact Complexity of Pseudorandom Functions and the Black-Box Natural Proof Barrier for Bootstrapping Results in Computational Complexity"
collection: publications
category: conferences
permalink: /publication/2stoc22-prf
excerpt: 'We obtained the exact circuit complexity of computing pseudorandom functions in various circuit models. We also use these construction to explain the difficulty of proving circuit lower bounds.'
date: 2022-06-24
venue: 'STOC'
paperurl: 'https://eccc.weizmann.ac.il/report/2021/125/'
bibtexurl: 'https://dblp.org/rec/conf/stoc/FanL022.html?view=bibtex'
citation: 'Zhiyuan Fan, Jiatu Li, Tianqi Yang. The Exact Complexity of Pseudorandom Functions and the Black-Box Natural Proof Barrier for Bootstrapping Results in Computational Complexity. <i>STOC</i>, 2022.'
---

**Awards:** This paper is the co-winner of the Best Student Paper of STOC 2022. 

**Abstract:** Investigating the computational resources we need for cryptography is an essential task of both theoretical and practical interests. This paper provides answers to this problem on pseudorandom functions (PRFs). We resolve the exact complexity of PRFs by proving tight upper and lower bounds for various circuit models.
* PRFs can be constructed in $$2n+o(n)$$ size general circuits assuming the existence of polynomial-size PRFs, simplifying and improving the $$O(n)$$ upper bound by Ishai, Kushilevitz, Ostrovsky, and Sahai (STOC 2008). Moreover, if PRFs exist in $$\mathsf{NC}_1$$, we can further guarantee the depth of our construction to be $$(1+\varepsilon)logn$$. We show that our construction is almost optimal by giving an unconditional $$2n−O(1)$$ lower bound.
* PRFs can be constructed in $$\mathsf{AC}^0[2]$$ circuits of $$o(n)$$ gates and $$2n+o(n)$$ wires assuming the existence of polynomial-size $$\mathsf{AC}^0[2]$$ PRFs. We show the optimality of our construction with a $$2n+(n)$$  wire complexity lower bound.
* PRFs can be constructed with wire complexity $$n^{1+O(1.61^{−d})}$$ in depth-$$d$$ $$\mathsf{TC}^0$$ circuits assuming the existence of polynomial-size $$\mathsf{TC}^0$$ PRFs. We also present an $$n^{1+(c^{−d})}$$ wire complexity lower bound against depth-$$d$$ $$\mathsf{TC}^0$$ circuits for some $$c>1.61$$.
As a byproduct, we prove unconditional tight upper and lower bounds for "almost" universal hash functions that are of independent interest.

Following the natural proof barrier of Razborov and Rudich (J. Comput. Syst. Sci. 1997), we observe that our exact complexity results are closely related to the "bootstrapping phenomena" in circuit complexity (such as hardness magnification and quantified derandomization). We introduce the black-box natural proof barrier and show that a large range of techniques for bootstrapping results cannot be combined with "black-box" lower bound proofs to obtain a breakthrough.

