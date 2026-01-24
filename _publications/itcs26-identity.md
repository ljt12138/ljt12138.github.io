---
title: "Identity Testing for Circuits with Exponentiation Gates"
collection: publications
category: conferences
permalink: /publication/itcs26-identity
excerpt: 'We introduce an identity testing problem inspired by machine learning compiler design and analyze a simple randomized algorithm. The algorithm is implemented in [Mirage](https://arxiv.org/abs/2405.05751) and works well in practice.'
date: 2026-01-30
venue: 'ITCS'
slidesurl: 
paperurl: 'https://arxiv.org/abs/2506.04529v1'
bibtexurl: 
citation: 'Jiatu Li, Mengdi Wu. Identity Testing for Circuits with Exponentiation Gates. <i>ITCS</i>, 2026.'
---

**Abstract:** Motivated by practical applications in the design of optimization compilers for neural networks, we initiated the study of identity testing problems for arithmetic circuits augmented with *exponentiation gates* that compute the real function $$x\mapsto e^x$$. These circuits compute real functions of form $$P(\vec x)/P'(\vec x)$$, where both $$P(\vec x)$ and $$P'(\vec x)$$ are exponential polynomials
$$
\sum_{i=1}^kf_i(\vec x)\cdot \exp\left(\frac{g_i(\vec x)}{h_i(\vec x)}\right),
$$
for polynomials $$f_i(\vec x)$$, $$g_i(\vec x)$$, and $$h_i(\vec x)$$. 

We formalize a black-box query model over finite fields for this class of circuits, which is mathematical simple and reflects constraints faced by real-world neural network compilers. We proved that a simple and efficient randomized identity testing algorithm achieves perfect completeness and non-trivial soundness. Concurrent with our work, the algorithm has been implemented in the optimization compiler Mirage by Wu et al. (OSDI 2025), demonstrating promising empirical performance in both efficiency and soundness error. Finally, we propose a number-theoretic conjecture under which our algorithm is sound with high probability.