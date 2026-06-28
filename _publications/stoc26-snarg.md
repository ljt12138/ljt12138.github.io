---
title: "SNARGs for NP from Unprovability of Mathematical Theorems (Or: How to Use the Simplicity of Cryptographic Reasoning)"
collection: publications
category: conferences
topics: [CR, PC, CC]
permalink: /publication/stoc26-snarg
excerpt: 'We build SNARGs for $$\textbf{NP}$$ from a new source of hardness—the difficulty of *proving mathematical theorems*—by leveraging the fact that cryptographic security proofs formalize in weak bounded arithmetic.'
date: 2026-06-22
venue: 'STOC'
slidesurl: '/files/SNARG-talk.key'
paperurl: 'https://eprint.iacr.org/2026/1180'
bibtexurl: 'https://dblp.org/rec/conf/stoc/HsiehJLM26.html?view=bibtex'
citation: 'Yao-Ching Hsieh, Abhishek Jain, Jiatu Li, Surya Mathialagan. SNARGs for NP from Unprovability of Mathematical Theorems (Or: How to Use the Simplicity of Cryptographic Reasoning). <i>STOC</i>, 2026.'
authors: 'Yao-Ching Hsieh, Abhishek Jain, Jiatu Li, Surya Mathialagan'
---

**Published version:** [STOC 2026 (ACM Digital Library)](https://dl.acm.org/doi/10.1145/3798129.3800724) &middot; **Full version:** [ePrint](https://eprint.iacr.org/2026/1180) &middot; [ECCC](https://eccc.weizmann.ac.il/report/2026/098/)

**Abstract:** Modern cryptography relies on the intractability of computational problems. This work presents an approach to build cryptography from a new source of hardness: proving mathematical theorems.

The primary contribution is a construction of succinct non-interactive arguments (SNARGs) for $$\textbf{NP}$$ under standard derandomization ($$\textbf{prBPP}=\textbf{prP}$$) and cryptographic assumptions (LWE and SXDH), along with a new, but natural assumption on the hardness of proving lower bounds in proof complexity. This assumption states that proving the correctness of certifying hard tautologies against Extended Frege within a weak bounded arithmetic theory is impossible. The assumption draws inspiration from an informal mathematical challenge by Razborov and generalizes an unconditional unprovability result due to Krajíček and Pudlák.

The construction is a simple variant of the SNARG by Jin, Kalai, Lombardi, and Vaikuntanathan. While their original soundness proof applied only to a subclass of $$\textbf{NP}$$, this work extends soundness to all $$\textbf{NP}$$ under the stated assumption. A key observation is that cryptographic reasoning formalizes simply within weak theories, demonstrating how the scheme formalizes in Jeřábek's theory $$\textbf{APC}_1$$—a weak bounded arithmetic theory.
