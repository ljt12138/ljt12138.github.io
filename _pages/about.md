---
permalink: /
title: "About me"
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

I am Jiatu Li (李嘉图), a third-year graduate student at [MIT theory group](https://toc.csail.mit.edu/), advised by Prof. [Ryan Williams](https://people.csail.mit.edu/rrw/). 

I obtained my Bachelor's degree from the "Yao Class", Institute for Interdisciplinary Information Science (IIIS), Tsinghua University.

## Research Interests

My research interests are about *circuit complexity*, *meta-complexity*, and *proof complexity*. Recently, I am interested in the following concrete directions:

- The strength of Bounded Arithmetic, the fragments of Peano that capture the *complexity of reasoning* (see, e.g., [Youtube Talk by Sam Buss](https://www.youtube.com/watch?v=cD9lnxr9aJI)). Can we prove strong lower bounds in [Cook's theory **PV$$_1$$**](https://dl.acm.org/doi/10.1145/800116.803756) or [Buss's theory $$S^1_2$$](https://dl.acm.org/doi/10.1145/22145.22177)? Can we separate [Jerabek's theory **APC$$_1$$**](https://www.cambridge.org/core/journals/journal-of-symbolic-logic/article/abs/approximate-counting-in-bounded-arithmetic/A7B01D53C883261836B93CD036B1FE9D) and Cook's **PV$$_1$$**? Can we identify the relative strengths of combinatorial principles and theorems as a feasible analogy of the program of [Reverse Mathematics](https://en.wikipedia.org/wiki/Reverse_mathematics)? Our partial results: [APC vs PV](https://eccc.weizmann.ac.il/report/2023/038/), [reverse mathematics](https://eccc.weizmann.ac.il/report/2024/060/), [unprovability](https://eccc.weizmann.ac.il/report/2023/022/), [unprovability'](https://eccc.weizmann.ac.il/report/2024/083/)
- The complexity of the Range Avoidance Problem (see [Kor21](https://www.dcs.warwick.ac.uk/~igorcarb/complexity-meetings-files/OliverKorten-Talk.pdf), [RSW22](https://www.icms.org.uk/sites/default/files/downloads/Workshops/2022/Jul-2022/Tzameret/Hanlin%20Ren.pdf)). What is the computational complexity of finding a non-output of an $$n$$-input $$(n+1)$$-output circuit? What if the circuit is a restricted one, say, an **AC$$_0$$** circuit? Our partial results: [upper bound](https://eccc.weizmann.ac.il/report/2023/072/), [lower bound 1](https://eccc.weizmann.ac.il/report/2023/038/), [lower bound 2](https://eccc.weizmann.ac.il/report/2023/206/)
- Proving unconditional complexity lower bounds (e.g. [MW18](https://eccc.weizmann.ac.il/report/2017/188/), [Chen23](https://eccc.weizmann.ac.il/report/2022/183/), [CHR23](https://arxiv.org/pdf/2309.12912.pdf), [Li23](https://arxiv.org/abs/2310.17762)) and derandomization results (e.g. [CLORS23](https://arxiv.org/abs/2305.15140)). Our partial results: [catalytic](https://eccc.weizmann.ac.il/report/2024/106/), [general](https://eccc.weizmann.ac.il/report/2021/023/), [PRFs](https://eccc.weizmann.ac.il/report/2021/125/)

As complexity theorists, our mission is to liberate the warriors trying to solve inherently hard problems. Sometimes we can use their stories to alleviate insomnia for cryptographers (see, e.g., [Cryptographers Seldom Sleep Well](http://www.chenyilei.net/cryptographers-seldom-sleep-well.html)).

I am also interested in writing formal (i.e. computer verified) mathematical proofs in Coq and Lean. Although it seems to be incredible nowadays, I believe that proof assistants will eventually be able to help mathematicians in their research (if mathematicians are not completely replaced by something like GPT-256, see, e.g., [ChatGPT](https://chat.openai.com/)).[^1]

## Selected Publications[^2]

- **Reverse Mathematics of Complexity Lower Bounds**. FOCS 2024. Lijie Chen, *Jiatu Li*, Igor C. Oliveira. Invited to SICOMP special issue; see the [Quanta article](https://www.quantamagazine.org/reverse-mathematics-illuminates-why-hard-problems-are-hard-20251201/). 
- **The Exact Complexity of Pseudorandom Functions and the Black-Box Natural Proof Barrier for Bootstrapping Results in Computational Complexity.** STOC 2022 (**Best Student Paper**). Zhiyuan Fan, *Jiatu Li*, Tianqi Yang.  


## Experience 

- PhD Student: MIT (2023-)
    - Research Intern: NTT Research (2025 Summer), Advised by [Abhishek Jain](https://www.cs.jhu.edu/~abhishek/)
- Undergraduate Student: Tsinghua University (2019-2023) 
    - Undergraduate Research Intern: University of Warwick (2022.3-2022.7), Advised by [Igor Carboni Oliveira](https://www.dcs.warwick.ac.uk/~igorcarb/)
    - Undergraduate Research Intern: Shanghai Qi Zhi Institute (2022.8-2022.9), Advised by [Yilei Chen](http://www.chenyilei.net/)

## Interesting facts about me

- My name, Li Jiatu, is the same as the Chinese translation of *Ricardo*. My parents chose the name when they were reading *The Capital* of Karl Marx, in which the name *David Ricardo* occurs constantly.
- I learned Go (the chess game, not the programming language) when I was a kid and achieved amateur four-dan. Recently, I'm interested in playing go again. My ID on Fox Weiqi is jiatu1li (6d). I am a member of the MIT Go Club and you could probably catch me in the meetings (check <https://www.meetup.com/massgo/> for the schedule). 


[^1]: Update (2026): This claim was made shortly after the release of GPT-3, and it seems that the whole world has now been almost convinced. I remain confident that proof assistant will be helpful for common mathematicians at some point -- I mean it will be something like compilers for programmers. However, it seems hard to imagine that it will be happening within a year or two. I hope I'm wrong. 

[^2]: Other papars are also good. I love all of them equally! 