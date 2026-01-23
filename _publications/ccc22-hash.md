---
title: "Extremely Efficient Constructions of Hash Functions, with Applications to Hardness Magnification and PRFs"
collection: publications
category: conferences
permalink: /publication/ccc22-hash
excerpt: 'A follow-up work on the STOC 2022 PRF paper, provide an even more efficient hash function construction and use it to show hardness magnification results.'
date: 2022-07-23
venue: 'CCC'
paperurl: 'https://eccc.weizmann.ac.il/report/2022/086/'
bibtexurl: 'https://dblp.org/rec/conf/coco/0001L022.html?view=bibtex'
---

**Abstract:** In a recent work, Fan, Li, and Yang (STOC 2022) constructed a family of almost-universal hash functions such that each function in the family is computable by $$(2n+ o(n))$$-gate circuits of fan-in 2 over the $$B_2$$ basis. Applying this family, they established the existence of pseudorandom functions computable by circuits of the same complexity, under the standard assumption that OWFs exist. However, a major disadvantage of the hash family construction by Fan, Li, and Yang (STOC 2022) is that it requires a seed length of poly(n), which limits its potential applications.

We address this issue by giving an improved construction of almost-universal hash functions with seed length $$\mathsf{polylog}(n)$$, such that each function in the family is computable with **POLYLOGTIME**-uniform $$(2n+ o(n))$$-gate circuits. Our new construction has the following applications in both complexity theory and cryptography.
- (*Hardness magnification*). Let $$α:\mathbb{N}\to\mathbb{N}$$ be any function such that $$α(n)\le \log n/\log \log n$$. We show that if there is an $$nα(n)$$-sparse **NP** language that does not have probabilistic circuits of $$2n+ O(n/\log \log n)$$ gates, then we have (1) $$\mathsf{NTIME}[2^n] ⊈ SIZE[2^{n^{1/5}}]$$ and (2) **NP** $$\nsubseteq \mathsf{SIZE}[n^k]$$ for every constant $$k$$. Complementing this magnification phenomenon, we present an $$O(n)$$-sparse language in **P** which requires probabilistic circuits of size at least $$2n−2$$. This is the first result in hardness magnification showing that even a sub-linear additive improvement on known circuit size lower bounds would imply $$\mathsf{NEXP}\nsubseteq\mathsf{P}/\mathsf{poly}$$. Following Chen, Jin, and Williams (STOC 2020), we also establish a sharp threshold for explicit obstructions: we give an explict obstruction against $$(2n−2)$$-size circuits, and prove that a sub-linear additive improvement on the circuit size would imply (1) $$\mathsf{DTIME}[2^n] \nsubseteq \mathsf{SIZE}[2^{n^{1/5}}]$$ and (2) $$\mathsf{P} \nsubseteq\mathsf{SIZE}[n^k]$$ for every constant $$k$$.
- (*Extremely efficient construction of pseudorandom functions*). Assuming that one of integer factoring, decisional Diffie-Hellman, or ring learning-with-errors is sub-exponentially
hard, we show the existence of pseudorandom functions computable by **POLYLOGTIME**-uniform $$\mathsf{AC}^0[2]$$ circuits with $$2n+ o(n)$$ wires, with key length $$\mathsf{polylog}(n)$$. We also show that PRFs computable by **POLYLOGTIME**-uniform $$B_2$$ circuits of $$2n+ o(n)$$ gates follows from the existence f sub-exponentially secure one-way functions.
