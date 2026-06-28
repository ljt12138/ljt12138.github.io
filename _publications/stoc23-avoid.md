---
title: "Range Avoidance, Remote Point, and Hard Partial Truth Tables via Satisfying-Pairs Algorithms"
collection: publications
category: conferences
topics: [CC]
permalink: /publication/stoc23-avoid
excerpt: 'We provide unconditional NP-oracle algorithms for solving certain Range Avoidance Problem. This can be viewed as a generalization of ACC circuit lower bounds proved by Ryan Williams.'
date: 2023-06-23
venue: 'STOC'
slidesurl: '/files/slides-Avoid-algo.pptx'
paperurl: 'https://eccc.weizmann.ac.il/report/2023/072'
bibtexurl: 'https://dblp.org/rec/conf/stoc/ChenHLR23.html?view=bibtex'
citation: Yeyuan Chen, Yizhi Huang, Jiatu Li, Hanlin Ren. Range Avoidance, Remote Point, and Hard Partial Truth Tables via Satisfying-Pairs Algorithms. <i>STOC</i>, 2023. 
authors: 'Yeyuan Chen, Yizhi Huang, Jiatu Li, Hanlin Ren'
---

**Abstract:** The *range avoidance problem*, denoted as $$\mathcal{C}$$-$$\rm Avoid$$, asks to find a non-output of a given $$\mathcal{C}$$-circuit $$C:\{0,1\}^n\to\{0,1\}^\ell$$ with stretch $$\ell>n$$. This problem has recently received much attention in complexity theory for its connections with circuit lower bounds and other explicit construction problems. Inspired by the Algorithmic Method for circuit lower bounds, Ren, Santhanam, and Wang (FOCS'22) established a framework to design $$\rm FP^{NP}$$ algorithms for $$\mathcal{C}$$-$$\rm Avoid$$ via *slightly non-trivial* data structures related to $$\mathcal{C}$$. However, a major drawback of their approach is the lack of unconditional results even for $$\mathcal{C}={\rm AC}^0$$.
	
In this work, we present the first unconditional $$\rm FP^{NP}$$ algorithm for $${\rm ACC}^0$$-$$\rm Avoid$$. Indeed, we obtain $$\rm FP^{NP}$$ algorithms for the following stronger problems:
$$\bullet$$ ($${\rm ACC}^0$$-$$\rm RemotePoint$$). Given $$C:\{0,1\}^n\to\{0,1\}^\ell$$ for some $$\ell={\rm quasipoly}(n)$$ such that each output bit of $$C$$ is computed by a $${\rm quasipoly}(n)$$-size $${\rm AC}^0[m]$$ circuit, we can find some $$y\in\{0,1\}^\ell$$ in $$\rm FP^{NP}$$ such that for every $$x\in\{0, 1\}^n$$, the relative Hamming distance between $$y$$ and $$C(x)$$ is at least $$1/2-1/{\rm poly}(n)$$. This problem is the ``average-case'' analogue of $${\rm ACC}^0$$-$$\rm Avoid$$.
$$\bullet$$ ($${\rm ACC}^0$$-$$\rm AvgPartialHard$$). Given $$x_1,\dots,x_\ell\in\{0,1\}^n$$ for some $$\ell={\rm quasipoly}(n)$$, we can compute $$\ell$$ bits $$y_1,\dots,y_\ell\in\{0,1\}$$ in $$\rm FP^{NP}$$ such that for every $$2^{\log^c(n)}$$-size $${\rm ACC}^0$$ circuit $$C$$, $$\Pr_i[C(x_i)\ne y_i]\ge 1/2-1/{\rm poly}(n)$$, where $$c=O(1)$$. This problem generalises the strong average-case circuit lower bounds against $${\rm ACC}^0$$ in a different way. 
Our algorithms can be seen as natural generalisations of the best known almost-everywhere average-case lower bounds against $${\rm ACC}^0$$ circuits by Chen, Lyu, and Williams (FOCS'20). Note that both problems above have been studied prior to our work, and no $$\rm FP^{NP}$$ algorithm was known even for weak circuit classes such as $${\rm GF}(2)$$-linear circuits and DNF formulas. 

Our results follow from a strengthened algorithmic method: slightly non-trivial algorithms for the *Satisfying-Pairs* problem for $$\mathcal{C}$$ implies $$\rm FP^{NP}$$ algorithms for $$\mathcal{C}$$-$$\rm Avoid$$ (as well as $$\mathcal{C}$$-$$\rm RemotePoint$$ and $$\mathcal{C}$$-$$\rm AvgPartialHard$$). Here, given $$\mathcal{C}$$-circuits $$\{C_i\}$$ and inputs $$\{x_j\}$$, the $$\mathcal{C}$$-Satisfying-Pairs problem asks to (approximately) count the number of pairs $$(i,j)$$ such that $$C_i(x_j)=1$$.
	
A technical contribution of this work is a construction of a *short, smooth, and rectangular PCP of Proximity* that combines two previous PCP constructions, which may be of independent interest. It serves as a key tool that allows us to generalise the framework for $$\rm Avoid$$ to the average-case scenarios.
