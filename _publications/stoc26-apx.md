---
title: "A Theory for Probabilistic Polynomial-Time Reasoning"
collection: publications
category: conferences
topics: [PC, CC]
permalink: /publication/stoc26-apx
excerpt: 'We introduce $$\textbf{APX}_1$$, a new bounded arithmetic theory that formalizes feasible probabilistic reasoning, aiming to expose more fine-grained proof complexity structure for polynomial time approximate counting.'
date: 2026-06-22
venue: 'STOC'
slidesurl: '/files/APX-stoc-final.pptx'
paperurl: 'https://arxiv.org/abs/2602.09302'
bibtexurl: 'https://dblp.org/rec/conf/stoc/ChenLOW26.html?view=bibtex'
citation: 'Lijie Chen, Jiatu Li, Igor C. Oliveira, Ryan Williams. A Theory for Probabilistic Polynomial-Time Reasoning. <i>STOC</i>, 2026.'
---

**Published version:** [STOC 2026 (ACM Digital Library)](https://dl.acm.org/doi/10.1145/3798129.3800842) &middot; **Full version:** [arXiv](https://arxiv.org/abs/2602.09302)

**Abstract:** In this work, we propose a new bounded arithmetic theory, denoted $$\textbf{APX}_1$$, designed to formalize a broad class of probabilistic arguments commonly used in theoretical computer science. Under plausible assumptions, $$\textbf{APX}_1$$ is strictly weaker than previously proposed frameworks, such as the theory $$\textbf{APC}_1$$ introduced in the seminal work of Jeřábek (2007). From a computational standpoint, $$\textbf{APX}_1$$ is closely tied to approximate counting and to the central question in derandomization, the $$\textbf{prBPP}$$ versus $$\textbf{prP}$$ problem, whereas $$\textbf{APC}_1$$ is linked to the dual weak pigeonhole principle and to the existence of Boolean functions with exponential circuit complexity.

A key motivation for introducing $$\textbf{APX}_1$$ is that its weaker axioms expose finer proof-theoretic structure, making it a natural setting for several lines of research, including unprovability of complexity conjectures and reverse mathematics of randomized lower bounds. In particular, the framework we develop for $$\textbf{APX}_1$$ enables the formulation of precise questions concerning the provability of $$\textbf{prBPP}=\textbf{prP}$$ in deterministic feasible mathematics. Since the (un)provability of $$\textbf{P}$$ versus $$\textbf{NP}$$ in bounded arithmetic has long served as a central theme in the field, we expect this line of investigation to be of particular interest.

Our technical contributions include developing a comprehensive foundation for probabilistic reasoning from weaker axioms, formalizing non-trivial results from theoretical computer science in $$\textbf{APX}_1$$, and establishing a tailored witnessing theorem for its provably total TFNP problems. As a byproduct of our analysis of the minimal proof-theoretic strength required to formalize statements arising in theoretical computer science, we resolve an open problem regarding the provability of $$\textbf{AC}^0$$ lower bounds in $$\textbf{PV}_1$$, which was considered in earlier works by Razborov (1995), Krajíček (1995), and Müller and Pich (2020).
