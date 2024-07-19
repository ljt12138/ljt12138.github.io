---
title: 页面置换算法和竞争性分析
copyright: true
date: 2019-08-05 08:48:57
tags: THU-Courses
categories: Algorithm
---

# 竞争性分析

竞争性分析（Competitive Analysis）是分析在线算法的有用技术。对于在线算法 $A$，设 $C_A(S)$ 表示算法 $A$ 在输入序列 $S$ 上的开销。如果存在 $k$ 对于任意的序列 $S$ 都满足
$$
C_A(S) \le k\times OPT(S) + O(1)
$$
其中 $OPT(S)$ 是离线最优算法的开销，那么称算法 $A$ 是 $k$-Competitive 的。

<!-- more -->

# 页面置换算法

在 OS 课前期调查中我们简要调查了页面置换算法的内容。

- 写到最后肝不下去的 Report：[page_doc.pdf](/files/page-replacement/page_doc.pdf)
- 和陈渝老师交流的 Slide：[slide.pdf](/files/page-replacement/slide.pdf)
- 在 APIO2019 的交流 ppt：[paging.pptx](/files/paging.pptx)

