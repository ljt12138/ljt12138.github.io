---
title: Publications
copyright: false
date: 2024-07-12 11:33:22
tags: 
---



## Conference Publication

> In theoretical computer science, the authors are usually listed in alphabetical order. 

**Distinguishing, Predicting, and Certifying: On the Long Reach of Partial Notions of Pseudorandomness**. FOCS 2024 (to apper). *Jiatu Li*, Edward Pyne, Roei Tell.
**View Paper**. To appear.
**Summary**. We proved the equivalence between general derandomization (e.g. $\mathsf{prBPP}=\mathsf{prP}$ or $\mathsf{prBPP}=\mathsf{prZPP}$) and partial notions of pseudorandomness such as \emph{distinguish-to-predict transforms} [DPT24](https://dl.acm.org/doi/10.1145/3618260.3649772) and \emph{certified derandomization} [PRZ23](https://ieeexplore.ieee.org/document/10353166) that are initially studied for space-bounded computation. Utilizing the idea, we also proved new unconditional results regarding catalytic computation, derived $\mathsf{NL}=\mathsf{UL}$ from weaker assumptions, and provided insightful new proofs of many classical results in the theory of derandomization. 

**Reverse Mathematics of Complexity Lower Bounds**. FOCS 2024 (to appear). Lijie Chen, *Jiatu Li*, Igor C. Oliveira.
**View Paper**. [Preliminary Version](https://eccc.weizmann.ac.il/report/2024/060/).
**Summary**. We systematically studied the reverse mathematics of complexity lower bounds using Cook's bounded theory $\mathsf{PV}_1$ as the base theory. In particular, we proved the equivalence between complexity lower bounds and fundamental combinatorial principles such as the pigeonhole principle, and obtained some counter-intuitive corollaries. 

**Hardness of Range Avoidance and Remote Point for Restricted Circuits via Cryptography.** STOC 2024. Yilei Chen and *Jiatu Li*.
**View Paper**. [Full Version](https://eccc.weizmann.ac.il/report/2023/206/). [Conference Version](https://dl.acm.org/doi/10.1145/3618260.3649602).
**Summary**. Under a strong but plausible LWE-like assumption, we proved that the range avoidance problem is extremely hard: there is no efficient algorithm even if the circuit is of constant depth and the algorithm is allowed to use nondeterministic guesses. The main technical contribution is a generic construction of *witness encryption* for certain (possibly not NP-complete) hard languages from *public-key encryption* that has certain structures, and a Regev-style PKE that is plausibly hard against *nondeterministic adversaries*.

**Indistinguishability Obfuscation, Range Avoidance, and Bounded Arithmetic.** STOC 2023. Rahul Ilango, *Jiatu Li*, R. Ryan Williams. 
**View Paper**. [Full Version](https://eccc.weizmann.ac.il/report/2023/038/). [Conference Version](https://dl.acm.org/doi/abs/10.1145/3564246.3585187). 
**Summary**. We showed that the range avoidance problem has no deterministic polynomial-time algorithm assuming $\mathsf{NP}\ne\mathsf{coNP}$ and indistinguishability obfuscation. Under similar assumptions, we proved that Cook's theory $\mathsf{PV}$ cannot prove the dual weak pigeonhole principle, i.e., Jerabek's $\mathsf{APC}_1$ is a strict extension of $\mathsf{PV}$. 

**Range Avoidance, Remote Point, and Hard Partial Truth Table via Satisfying-Pairs Algorithms.** STOC 2023. Yeyuan Chen, Yizhi Huang, *Jiatu Li*, Hanlin Ren. 
**View Paper**. [Full Version](https://eccc.weizmann.ac.il/report/2023/072/). [Conference Version](https://dl.acm.org/doi/abs/10.1145/3564246.3585147).
**Summary**. We proposed a framework that solves the range avoidance problem, remote point problem, and hard partial truth-table for restricted circuit classes by non-trivial algorithms that solve satisfying pairs for the circuit class. This generalizes Williams's algorithmic approach in circuit lower bounds. In particular, we construct *unconditional* $\mathsf{FP}^{\mathsf{NP}}$ algorithms of these problems for $\mathsf{ACC}^0$ circuits that recover the best-known (almost-everywhere) lower bound against $\mathsf{ACC}^0$.

**Unprovability of Strong Complexity Lower Bounds in Bounded Arithmetic.** STOC 2023. *Jiatu Li*, Igor C. Oliveira.
**View Paper**. [Full Version](https://arxiv.org/abs/2305.15235). [Conference Version](https://dl.acm.org/doi/abs/10.1145/3564246.3585144).  
**Summary**. We showed that strong average-case separation in the third level of polynomial-time hierarchy cannot be proved in $\mathsf{APC}_1$. This is a corollary of a general result that applies to the $i$-th level of polynomial-time hierarchy. We demonstrated a convenient game-theoretic witnessing theorem to develop unprovability results. 

**Extremely Efficient Constructions of Hash Functions, with Applications to Hardness Magnification and PRFs.** CCC 2022. Lijie Chen, *Jiatu Li*, Tianqi Yang.
**View Paper.** [Full Version](https://eccc.weizmann.ac.il/report/2022/086/). [Conference Version](https://drops.dagstuhl.de/opus/volltexte/2022/16585/).
**Summary.** We constructed an explicit, uniform, randomness efficient, and low-complexity hash function. It is used to prove the following hardness magnification result: if there is a sparse language in **NP** that is not computable by $2.01n$ size probabilistic circuits, then **NP** is not contained in **SIZE**$[n^k]$. 

**The Exact Complexity of Pseudorandom Functions and the Black-Box Natural Proof Barrier for Bootstrapping Results in Computational Complexity.** STOC 2022. Zhiyuan Fan, *Jiatu Li*, Tianqi Yang.  
**View Paper.** [Full Version](https://eccc.weizmann.ac.il/report/2021/125/). [Conference Version](https://dl.acm.org/doi/10.1145/3519935.3520010). [Online Talk](https://www.youtube.com/watch?v=QcBypyG6oMU&t=451s).
**Summary.** We gave tight bounds to compute PRFs in general $\mathsf{B}_2$ circuit (in size), $\mathsf{NC}_1$ circuits (in size and depth) and $\mathsf{TC}_0$ circuits (in wire). Inspired by the natural proof barrier and our results, we demonstrated a barrier for bootstrapping results (e.g. hardness magnification) in complexity theory.

**$3.1n−o(n)$ Circuit Lower Bounds for Explicit Functions.** STOC 2022. *Jiatu Li*, Tianqi Yang.  
**View Paper.** [Full Version](https://eccc.weizmann.ac.il/report/2021/023/). [Conference Version](https://dl.acm.org/doi/10.1145/3519935.3519976). [Online Talk](https://www.youtube.com/watch?v=54ILPK6JK5c&t=1118s).
**Summary.** We improved the $(3 + 1/86)n + o(n)$ unconditional circuit lower bound (for explicit function in $\mathsf{P}$ to $3.1n + o(n)$ with a more clever choice of complexity measure and a more careful case analysis (plus some combinatorial tricks).

## Manuscripts

> In theoretical computer science, the authors are usually listed in alphabetical order. 

**The Structure of Catalytic Space: Capturing Randomness and Time via Compression.** James Cook, *Jiatu Li*, Ian Mertz, Edward Pyne.
**View Paper.** [Preliminary Version](https://eccc.weizmann.ac.il/report/2024/106/).
**Summary**. We unconditionally resolved several fundamental structural question related to catalytic computation. In particular, we proved $\mathsf{CBPL}=\mathsf{CL}$ (full derandomization for catalytic logspace). 

**On the Unprovability of Circuit Size Bounds in Intuitionistic $S^1_2$**. Lijie Chen, *Jiatu Li*, Igor C. Oliveira.
**View Paper.** [Preliminary Version](https://eccc.weizmann.ac.il/report/2024/083/).
**Summary**. We show that there is a constant $k$ such that Buss's intuitionistic theory $\mathsf{IS}^1_2$ does not prove that SAT requires co-nondeterministic circuits of size at least $n^k$. To our knowledge, this is the first unconditional unprovability result in bounded arithmetic in the context of worst-case fixed-polynomial size circuit lower bounds. We complement this result by showing that the upper bound $\mathsf{NP}\subseteq \mathsf{coNSIZE}[n^k]$ is unprovable in $\mathsf{IS}^1_2$.



# Other projects 

- **Formalization of PAL·S5 in Proof Assistant.**
    + Technical Report: <https://arxiv.org/abs/2012.09388>.
    + Talk in LIRa seminar: <https://projects.illc.uva.nl/lgc/seminar/2021/03/lira-session-jiatu-li/>
    + **Summary.** We formalize public announcement logic (a special kind of dynamic epistemic logic) in Lean theorem prover as an experiment to apply formal tools in logic research. We present formal proof of its soundness, completeness and reduction (i.e. elimination of dynamic modalities) theorem.
- **Formalization of a theorem in a competitive programming problem.**
    + Github: <https://github.com/ljt12138/Proof-of-Surreal>
- **Cutepiler: A Compiler for a C-like Language.**
    + Github: <https://github.com/Cutepiler/Cutepiler-Sysy2020>
    + In National Student Computer System Capability Challenge (Compiler track).
    + A joint work with Runda Liu, Zhidong Wang and Mengdi Wu.
- **Hyper OS: An Operating System Simulator in C++.**
    + Github: <https://github.com/tqyaaaaang/Hyper-OS>
    + A joint work with Tianqi Yang. 
    + **Summary.** An operating system simulator for teaching and research use in C++. It contains basic virtual hardware (such as CPU, APIC, MMU, etc) and a tiny kernel (including process scheduling and paging).
- **A Quick Introduction to Mathematical Logic.**
    + Note: <https://ljt12138.github.io/2020/05/05/logic-note/>
    + **Summary.** A note on classical results about propositional logic, first-order logic, proof system and (basic) model theory. It covers completeness theorem of first-order logic, the compactness theorem and G¨odel’s incompleteness theorem.
- **The Application of Non-Programming Problems in Competitive Programming Training (in Chinese).**
    + Essay: <https://ljt12138.github.io/2020/01/09/wc-final/>
