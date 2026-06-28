---
title: "The Structure of Catalytic Space: Capturing Randomness and Time via Compression"
collection: publications
category: conferences
topics: [CC]
permalink: /publication/stoc25-catalytic
excerpt: 'We prove two unconditional structural results about catalytic computation: **CL** $$\cap$$ **P** = **CLP** and **CBPL** = **CL**.'
date: 2025-6-27
venue: 'STOC'
slidesurl:
paperurl: 'https://eccc.weizmann.ac.il/report/2024/106/'
bibtexurl: 'https://dblp.org/rec/conf/stoc/CookLMP25.html?view=bibtex'
citation: 'James Cook, Jiatu Li, Ian Mertz, Edward Pyne. The Structure of Catalytic Space: Capturing Randomness and Time via Compression. <i>STOC</i>, 2025.'
authors: 'James Cook, Jiatu Li, Ian Mertz, Edward Pyne'
---

**Abstract:** In the catalytic logspace ($$CL$$) model of (Buhrman et. al. STOC 2013), we are given a small work tape, and a larger catalytic tape that has an arbitrary initial configuration. We may edit this tape, but it must be exactly restored to its initial configuration at the completion of the computation. This model is of interest from a complexity-theoretic perspective as it gains surprising power over traditional space. However, many fundamental structural questions remain open.
    
We substantially advance the understanding of the structure of $$CL$$, addressing several questions raised in prior work. Our main results are as follows.

1: We unconditionally derandomize catalytic logspace: $$CBPL = CL$$. 

2: We show time and catalytic space bounds can be achieved separately if and only if they can be achieved simultaneously: any problem in $$CL \cap P$$ can be solved in polynomial time-bounded $$CL$$.

3: We characterize deterministic catalytic space by the intersection of randomness and time: $$CL$$ is equivalent to polytime-bounded, zero-error randomized $$CL$$.

Our results center around the compress--or--random framework. 
For the second result, we introduce a simple yet novel compress--or--compute algorithm which, for any catalytic tape, either compresses the tape or quickly and successfully computes the function at hand. For our first result, we further introduce a compress--or--compress--or--random algorithm that combines runtime compression with a second compress--or--random algorithm, building on recent work on distinguish-to-predict transformations and pseudorandom generators with small-space deterministic reconstruction.