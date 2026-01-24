---
title: "Unprovability of Strong Complexity Lower Bounds in Bounded Arithmetic"
collection: publications
category: conferences
permalink: /publication/stoc23-unprov
excerpt: 'Following a recent breakthrough of Pich and Santhanam (2021), we prove unprovability of strong complexity lower bounds in the the theory **PV** and even stronger theories.'
date: 2023-06-23
venue: 'STOC'
slidesurl: '/files/slides-unprov.pptx'
paperurl: 'https://eccc.weizmann.ac.il/report/2023/022'
bibtexurl: 'https://dblp.org/rec/conf/stoc/LiO23.html?view=bibtex'
citation: Jiatu Li, Igor C. Oliveira. Unprovability of Strong Complexity Lower Bounds in Bounded Arithmetic. <i>STOC</i>, 2023.
---

**Abstract:** While there has been progress in establishing the unprovability of complexity statements in lower fragments of bounded arithmetic, understanding the limits of Jerabek's theory $$\textbf{APC}_1$$ (2007) and of higher levels of Buss's hierarchy $$\textbf{S}^i_2$$ (1986) has been a more elusive task. Even in the more restricted setting of Cook's theory $$\textbf{PV}$$ (1975), known results often rely on a less natural formalization that encodes a complexity statement using a collection of sentences instead of a single sentence. This is done to reduce the quantifier complexity of the resulting sentences so that standard witnessing results can be invoked. 

In this work, we establish unprovability results for stronger theories and for sentences of higher quantifier complexity. In particular, we unconditionally show that $$\textbf{APC}_1$$ cannot prove strong complexity lower bounds separating the third level of the polynomial hierarchy. In more detail, we consider non-uniform average-case separations, and establish that $$\textbf{APC}_1$$ cannot prove a sentence stating that
* $$\forall n \geq n_0\;\exists\,f_n \in \Pi_3\text{-}\textbf{SIZE}[n^d]$$ that is $$(1/n)$$-far from every $$\Sigma_3\text{-}\textbf{SIZE}[2^{n^{\delta}}]$$ circuit. 
This is a consequence of a much more general result showing that, for every $$i \geq 1$$, strong separations for $$\Pi_{i}\text{-}\textbf{SIZE}[\textrm{poly}(n)]$$ versus $$\Sigma_{i}\text{-}\textbf{SIZE}[2^{n^{\Omega(1)}}]$$ cannot be proved in the theory $$\textbf{T}_\textbf{PV}^i$$ consisting of all true $$\forall \Sigma^b_{i-1}$$-sentences in the language of Cook's theory $$\textbf{PV}$$. 

Our argument employs a convenient game-theoretic witnessing result that can be applied to sentences of arbitrary quantifier complexity. We combine it with extensions of a technique introduced by Krajicek (2011) that was recently employed by Pich and Santhanam (2021) to establish the unprovability of lower bounds in $$\textbf{PV}$$ (i.e., the case $$i =1$$ above, but under a weaker formalization) and in a fragment of $$\textbf{APC}_1$$.