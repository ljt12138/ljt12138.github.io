---
title: "3.1n-o(n) Circuit Lower Bounds for Explicit Functions"
collection: publications
category: conferences
permalink: /publication/stoc22-clb
excerpt: 'We prove that an explicit function in **P** requires $$3.1n-o(n)$$ size to compute by general circuits. This improves an earlier $$(3+1/86)n-o(n)$$ lower bound for the same function.'
date: 2022-06-24
venue: 'STOC'
slidesurl: 
paperurl: 'https://eccc.weizmann.ac.il/report/2021/023/'
bibtexurl: 'https://dblp.org/rec/conf/stoc/Li022.html?view=bibtex'
citation: 
---

**Abstract:** Proving circuit lower bounds has been an important but extremely hard problem for decades. Although one may show that almost every function $$f:\mathbb{F}^n_2\to\mathbb{F}_2$$ requires circuit of size $$\Omega(2^n/n)$$ by a simple counting argument, it remains unknown whether there is an explicit function (for example, a function in **NP**) not computable by circuits of size 10n. In fact, a $$3n−o(n)$$ explicit lower bound by Blum (TCS, 1984) was unbeaten for over 30 years until a recent breakthrough by Find et al. (FOCS, 2016), which proved a $$(3+1/86)n−o(n)$$ lower bound for affine dispersers, a class of functions known to be constructible in **P**.

In this paper, we prove a stronger lower bound $$3.1n−o(n)$$ for affine dispersers. To get this result, we strengthen the gate elimination approach for $$(3+1/86)n$$ lower bound, by a more sophisticated case analysis that significantly decreases the number of bottleneck structures introduced during the elimination procedure. Intuitively, our improvement relies on three observations: adjacent bottleneck structures becomes less troubled; the gates eliminated are usually connected; and the hardest cases during gate elimination have nice local properties to prevent the introduction of new bottleneck structures.