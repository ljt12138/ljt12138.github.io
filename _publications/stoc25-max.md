---
title: "Maximum Circuit Lower Bounds for Exponential-Time Arthur Merlin"
collection: publications
category: conferences
topics: [CC]
permalink: /publication/stoc25-max
excerpt: 'We prove that Arthur-Merlin protocols with exponential time and a sub-exponential advice requires maximum circuit complexity. Previously, maximum lower bounds are known only for classes in the second level of the polynomial-time hierarchy.'
date: 2025-6-27
venue: 'STOC'
slidesurl: '/files/slides-maximum.pptx'
paperurl: 'https://eccc.weizmann.ac.il/report/2024/182/'
bibtexurl: 'https://dblp.org/rec/conf/stoc/0001LL25.html?view=bibtex'
citation: Lijie Chen, Jiatu Li, Jingxun Liang. Maximum Circuit Lower Bounds for Exponential-Time Arthur Merlin. <i>STOC</i>, 2025.
---

**Abstract:** We show that the complexity class of exponential-time Arthur Merlin with sub-exponential advice ($$AMEXP_{/2^{n^{\varepsilon}}}$$) requires circuit complexity at least $$2^n/n$$. Previously, the best known such near-maximum lower bounds were for symmetric exponential time by Chen, Hirahara, and Ren (STOC'24) and Li (STOC'24), or randomized exponential time with MCSP oracle and sub-exponential advice by Hirahara, Lu, and Ren (CCC'23). 

Our result is proved by combining the recent iterative win-win paradigm of Chen, Lu, Oliveira, Ren, and Santhanam (FOCS'23) together with the uniform hardness-vs-randomness connection for Arthur-Merlin protocols by Shaltiel-Umans (STOC'07) and van Melkebeek-Sdroievski (CCC'23). We also provide a conceptually different proof using a novel "critical win-win" argument that extends a technique of Lu, Oliveira, and Santhanam (STOC'21). 

Indeed, our circuit lower bound is a corollary of a new explicit construction for properties in $$coAM$$. We show that for every dense property $$P \in coAM$$, there is a quasi-polynomial-time Arthur-Merlin protocol with short advice such that the following holds for infinitely many $$n$$: There exists a canonical string $$w_n \in P \cap \{0,1\}^n$$ so that (1) there is a strategy of Merlin such that Arthur outputs $$w_n$$ with probability $$1$$ and (2) for any strategy of Merlin, with probability $$2/3$$, Arthur outputs either $$w_n$$ or a failure symbol $$\bot$$. As a direct consequence of this new explicit construction, our circuit lower bound also generalizes to circuits with an $$AM \cap coAM$$ oracle. To our knowledge, this is the first unconditional lower bound against a strong non-uniform class using a hard language that is only "quantitatively harder".