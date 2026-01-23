---
title: "Indistinguishability Obfuscation, Range Avoidance, and Bounded Arithmetic"
collection: publications
category: conferences
permalink: /publication/stoc23-hardness
excerpt: 'We show that the range avoidance problem is hard for deterministic algorithms, assuming **NP** $$\ne$$ **coNP** and the existence of indistinguishability obfuscation. With a similar approach, we also obtain unprovability results in bounded arithmetic.'
date: 2023-06-23
venue: 'STOC'
slidesurl: 
paperurl: 'https://eccc.weizmann.ac.il/report/2023/038'
bibtexurl: 'https://dblp.org/rec/conf/stoc/IlangoLW23.html?view=bibtex'
---

**Abstract:** The range avoidance problem (denoted by Avoid) asks to find a string outside of the range of a given circuit $$C:\{0,1\}^n\to\{0,1\}^m$$, where $$m>n$$. Although at least half of the strings of length $$m$$ are correct answers, it is not clear how to deterministically find one. Recent results of Korten (FOCS'21) and Ren, Wang, and Santhanam (FOCS' 22) show that efficient deterministic algorithms for Avoid would have far-reaching consequences, including strong circuit lower bounds and explicit constructions of combinatorial objects (e.g., Ramsey graphs, extractors, rigid matrices). This strongly motivates the question: does an efficient deterministic algorithm for Avoid actually exist?

In this work, we prove under the existence of subexponentially secure indistinguishability obfuscation (iO) that deterministic polynomial-time algorithms for Avoid imply NP=coNP. Combining this with Jain, Lin, and Sahai's recent breakthrough construction of iO from well-founded assumptions (STOC'21, EUROCRYPT'22), we provide the first plausible evidence that Avoid has no efficient deterministic algorithm. Moreover, we also prove the hardness of Avoid based on polynomially-secure iO and a weaker variant of the Nondeterministic Exponential Time Hypothesis (NETH).

Extending our techniques, we prove a surprising separation in bounded arithmetic, conditioned on similar assumptions. Assuming subexponentially secure iO and coNP is not infinitely often in AM, we show that Avoid has no deterministic polynomial-time algorithm even when we are allowed $$O(1)$$ queries to an oracle that can invert the given input circuit on an arbitrarily chosen $$m$$-bit string. It follows that the dual Weak Pigeonhole Principle, the combinatorial principle underlying Avoid, is not provable in Cook's theory $$PV_1$$. This gives (under plausible assumptions) the first separation of Cook's theory $$PV_1$$ for polynomial-time reasoning and Jerabek's theory $$APC_1$$ for probabilistic polynomial-time reasoning. 