---
title: Is Lattice-Based Cryptography Post-Quantum Secure? 
copyright: true
date: 2022-02-24 00:39:09
tags: Cryptography
---

## Quantum Algorithms for Lattice Problems

*Cryptographers seldom sleep well*, as noted in [[Kil88]](https://dl.acm.org/doi/10.1145/62212.62215), *Their careers are frequently based on very precise complexity-theoretic assumptions, which could be shattered the next morning*. Based on my personal observation, many of my friends working in cryptography are currently facing the situation that a new algorithm [[Che24]](https://eprint.iacr.org/2024/555) would change their careers, or even their whole lives [^1].   

Learning with error (LWE) is the following (average-case) search problem. Let $n,m,q\in\mathbb{N}$ and $\alpha\in(0,1)$ be parameters, and $s\in\mathbb{Z}_q^n$ be a hidden vector. Given a uniformly random matrix $A\in \mathbb{Z}_q^{n\times m}$, and a vector $sA+e\bmod q$ for some error vector $e\in\mathbb{Z}_q^m$ whose coordinates are i.i.d. sampled from Gaussian distribution with standard deviation $\alpha q/\sqrt{2\pi}$, the task is to find the secret $s$. 

Chen [[Che24]](https://eprint.iacr.org/2024/555) designed a new quantum algorithm for Learning-with-Error with parameters $m=\Omega()$


## References 

[^1]: Anonymous, private communication. 