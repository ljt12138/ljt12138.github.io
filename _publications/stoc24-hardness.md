---
title: "Hardness of Range Avoidance and Remote Point for Restricted Circuits via Cryptography"
collection: publications
category: conferences
topics: [CC, CR]
permalink: /publication/stoc24-hardness
excerpt: 'This is a follow up work of the STOC 2023 paper with Rahul Ilango and Ryan Williams. We prove stronger hardness results by using more specific cryptographic assumptions.'
date: 2024-06-28
venue: 'STOC'
slidesurl: '/files/slides-Avoid-hardness.pptx'
paperurl: 'https://eccc.weizmann.ac.il/report/2023/206/'
bibtexurl: 'https://dblp.org/rec/conf/stoc/ChenL24.html?view=bibtex'
citation: Yilei Chen, Jiatu Li. Hardness of Range Avoidance and Remote Point for Restricted Circuits via Cryptography. <i>STOC</i>, 2024. 
---

**Note:** The main result of this paper has been superseded by two recent papers: [Ren-Wang-Yan](https://eccc.weizmann.ac.il/report/2025/191/) and [Ilango](https://eccc.weizmann.ac.il/report/2025/190/) using different approaches. Both papers are simpler and stronger. If you are not looking for the concept of "witness encryption against **coNP**" in this paper that is still of independent interests, you can directly read their papers.

**Abstract:** A recent line of research has introduced a systematic approach to explore the complexity of explicit construction problems through the use of meta problems, namely, the range avoidance problem (abbrev. Avoid) and the remote point problem (abbrev. RPP). The upper and lower bounds for these meta problems provide a unified perspective on the complexity of specific explicit construction problems that were previously studied independently. An interesting question largely unaddressed by previous works is whether Avoid and RPP are hard for simple circuits such as low-depth circuits.

In this paper, we demonstrate, under plausible cryptographic assumptions, that both the range avoidance problem and the remote point problem cannot be efficiently solved by nondeterministic search algorithms, even when the input circuits are as simple as constant-depth circuits. This extends a hardness result established by Ilango, Li, and Williams (STOC'23) against deterministic algorithms employing witness encryption for NP, where the inputs to Avoid are general Boolean circuits.

Our primary technical contribution is a novel construction of witness encryption inspired by public-key encryption for certain promise language in NP that is unlikely to be NP-complete. We introduce a generic approach to transform a public-key encryption scheme with particular properties into a witness encryption scheme for a promise language related to the initial public-key encryption scheme. Based on this translation and variants of standard lattice-based or coding-based PKE schemes, we obtain, under plausible assumption, a provably secure witness encryption scheme for some promise language in NP?coNP/poly. Additionally, we show that our constructions of witness encryption are plausibly secure against nondeterministic adversaries under a generalized notion of security in the spirit of Rudich's super-bits (RANDOM'97), which is crucial for demonstrating the hardness of Avoid and RPP against nondeterministic algorithms.