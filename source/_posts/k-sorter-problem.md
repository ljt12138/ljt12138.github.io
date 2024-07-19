---
title: 关于 k-sorter 问题
copyright: true
date: 2019-12-01 22:06:29
tags: Algorithm-Analysis
categories: Algorithm
---

##  概述

k-sorter 问题指如何利用“给 k 个元素排序”这一基本操作，构造高效的排序算法。由于一个 k-sorter 可以由 $k\log k$ 次比较操作构造，而比较排序的时间复杂度下界是 $n\log n$，因此 k-sorter 问题的排序器使用次数下界（下称比较下界）为 $n\log n/k\log k$。我对这个问题的了解来自于清华大学邓俊辉老师的《数据结构》课程中的一道编程练习题（题目对应 $k=3$ 的情景），并将一个简单的做法（$n\log n/k$ 次比较的算法）出做了集训队作业题目[^1]。近期我对此问题又做了一些调查和探索，结论如下：

- 存在若干种比较次数在 $O(n\log n/k)$ 的确定性排序算法，包括两个比较简单的基于归并的算法；
- 存在期望 $O(n\log n/k\log k)$ 次比较的随机算法，这一算法思路简单，但分析稍加繁琐；
- 存在 $(n\log n/k\log k)$ 次比较的确定性算法，这一算法来自[^2].

<!-- more -->

## 两种简单算法

我们首先介绍两种比较次数为 $O(n\log n/k)$ 的简单算法。

### 算法1：二路归并

**算法流程：**考虑使用二路归并算法。首先将所有元素划分为等大的两部分递归排序，并在两序列末尾分别补上 $k/2$ 个无穷大 INF。接下来不断地如此做：在两个序列中分别选择 $k/2$ 个最小的数，将这些数排序，并将其中最小的 $k/2$ 个元素从队列中取出，直到除 INF 外的所有元素均被取出。

**正确性：**只需证明每次取出的 $k/2$ 个元素是整个序列最小的 $k/2$ 个元素即可，为此只需证明两序列最小的 $k/2$ 个元素的并包含了整个序列最小的 $k/2$ 个元素，而这是显然的。

**比较次数：**设 $T(n)$ 为比较次数，有 $T(n) = 2T(n/2) + O(n/(k/2))$，用主定理解得 $T(n) = O(n\log n/k)$。

### 算法2：$2^{k-1}$ 路归并

**算法流程：**首先将整个序列随意划分成 $2^{k-1}$ 个等大的部分递归排序，现在考虑如何合并这些序列。考虑建立一棵区间长度为 $2^{k-1}$ 的、维护区间最小值的线段树，其中位置 $i$ 维护划分成的第 $i$ 个序列中，未被取出的最小元素值。很明显，线段树的根节点便维护了所有 $2^{k-1}$ 路中所有元素的最小值（因为每个序列本身已经排序）。

考虑每次从线段树中取出最小元素以构成完整的、排序后的序列。不妨设当前全局最小值 $u$ 来自第 $i$ 个序列。在取出 $u$ 后，我们需要将线段树的位置 $i$ 更新为序列 $i$ 去掉 $u$ 后最小的元素。由于更新线段树上一个结点仅会影响这个结点到根上的所有结点 $i, parent(i), parent(parent(i)),\dots $，而这些结点的信息仅和
$$
i, brother(i), brother(parent(i)), brother(parent(parent(i)))\dots
$$
共 $k$ 个元素的相对大小有关，因此可以用一个 $k$-sorter 比较操作完成更新。

**正确性：**正确性是显然的。

**比较次数：**设 $T(n)$ 为比较次数，有 $T(n) = 2^{k-1}T(n/2^{k-1})+O(n)$，用主定理解得 $T(n) = O(n\log n/k)$。

## 类似快速排序的随机算法

### 算法流程

为了描述的方便不妨设我们拥有 $2k$-sorter 比较器。首先从所有元素中随机选出 $k$ 个支点，将他们用 1 次比较操作排序，并用 $O(n/k)$ 次比较操作将剩余 $n-k$ 个元素划分到这 $k$ 个元素之间，并递归对 $k+1$ 段进行排序。这一步可以通过每次将 $k$ 个元素和 $k$ 个支点共同排序来完成。

### 比较次数分析

由于分析过程复杂，这里仅列出一些关键的引理，证明的细节在附件 [proof.pdf](/files/k-sorter/proof.pdf) 中给出。

**引理1：**
$$
\sum_{1\le i\le B} i{n-i-1\choose k-1} = {n\choose k+1} - \frac{Bk+n}{k+1}{n-B-1\choose k}.
$$
**引理2：**当 $n>k>1$ 时，有
$$
\frac{1}{n\choose k}\left[\sum_{1\le i\le n-2}(n-1-i)i{n-i-2\choose k-2} + \sum_{1\le i\le n-1}2i{n-i-1\choose k-1} \right] = n-k.
$$
**引理3：**算法的比较次数可以表示为
$$
T(n)=\frac{1}{n\choose k}\left[\sum_{0=i_0<i_1< i_2< \dots< i_{d}<i_{d+1}=n+1}\sum_{1\le j\le d+1}T(i_j - i_{j-1}-1)\right] + O\left(\frac{n}{k}\right).
$$
**引理4：**
$$
T(n)=\frac{1}{n\choose k}\left[\sum_{1\le i\le n-2}(n-1-i)T(i){n-i-2\choose k-2} + \sum_{1\le i\le n-1}2 T(i){n-i-1\choose k-1}\right] + O\left(\frac n k\right).
$$
**引理5：**
$$
{n\choose k+1} - \frac{Bk+n}{k+1}{n-B-1\choose k} = \Theta\left({n\choose k+1}\right)
$$
**定理：**多路快速排序算法的期望比较次数是 $O(n\log n/k\log k)$。

**证明思路：**考虑使用代入法，将 $cn\log n/k\log k$ 带入引理 4 并对和式进行估计。对于第二部分直接用 $\log n$ 作为 $\log i$ 的上界并用引理 2 计算，第一部分将和式分为 $[1, B]$ 和 $[B, n-2]$ 两部分，并分别用 $\log B$ 和 $\log n$ 作为 $\log i$ 的上界，取 $B = n/k$，利用引理 $1, 2, 5$ 进行估计。

### 注记

这一部分的分析是我自己折腾出来的，awd/wmd/WerkeyTom_FTD/tqyaaaaang 等同学帮助 fix 了一些问题。

文献[^2]中给出了另外一种基于快速排序的实现：不断随机选择划分点，直到每一部分包含不超过 $2n/(k/2\ln k\log k)$ 个元素。

## 确定性算法

> 这一算法来自 [^2]

### 子算法 1

使用 $k$ 元比较器，在 $O(n/k)$ 次比较操作选出第 $i$ 大元素。

考虑将经典的 Median of medians 算法[^3]推广到 $k$ 元比较器上，这一点是容易的：将原先算法中分为 5 路变为 $k$ 路即可。

### 算法流程

算法分为四步。设 $a, b$ 为待取的常数。

1. 将序列随意划分为 $n/k$ 个长度为 $k$ 的链，并对每个链排序；
2. 从每个链中选出均匀的选出 $a$ 个元素，即选出排名为 $k/a, 2k/a, \dots$ 的元素，将所有链中选出的元素称为 $a$-points
3. 从所有 $a$-points 中均匀的选出 $b$ 个元素，称为 $b$-points
4. 将所有元素划分到 $b$-points 之间，递归给所有的段排序

### 算法分析

**首先分析划分过程的复杂度**。

1. 第一步需要 $n/k$ 次比较
2. 第二步不需要比较操作
3. 第三步通过连续 $b$ 次使用子算法，需要 $O(\frac{nab}{k^2})$ 次比较。
4. 第四步仅需要 $O(n/k)$ 次比较

取 $a = b = \frac {\sqrt k}{\log k}$，便可以将第三步的比较次数限制在 $O(n/k)$ 之内。

**然后分析划分的平均程度**。

**引理：**划分出的任何一段元素数量都不超过 $n(2/b+1/a)$。

**证明：**不妨将所有 $a$-points 从小到大列出，由于 $b$-points 是均匀选出的，任意两个 $b$-points 中均有 $O(na/(kb))$ 个 $a$-points。考虑原序列中，大小在某两个相邻的 $b$-points $b' < b''$ 之间的元素个数。由于任何一个元素均在两个相邻的 $a$-points 之间，我们只需要考虑所有相邻的 $a$-points $a'<a''$ 的情况。

1. 两个 $a$-points 至少有一者在 $b', b''$ 之间，由于其之间共有 $\frac{na}{kb}$ 个 $a$-points，这种情况仅有不超过 $\frac{2na}{kb}$ 对，因此这些 $a$-points 之间对应的原数组的元素个数之和为 
   $$
   \frac{2na}{kb}\times \frac{k}{a} = \frac{2n}{b}.
   $$

2. $a' < b' < b'' < a''$，由于 $a'$ 和 $a''$ 在其对应的链上是连续的，因此在每一个链上至多有一对这样的 $a$-points，总的对数不会超过链的个数 $n/k$，之间的元素个数不会超过
   $$
   \frac{n}{k}\times \frac{k}{a} = \frac{n}{a}.
   $$


综上所述，任何两个 $b$-points 之间的元素个数都不超过 $n(2/b +1/a)$。

**Q. E. D.**

由于 $a = b=\sqrt k/\log k$，算法可以在 $O(n/k)$ 的时间复杂度内，将所有元素划分到 $b+1 = O(\sqrt k/\log k)$ 组中，并使得每组中元素都不超过 $3n/b​$ 个元素。因此比较次数可以如下表示
$$
T(n) = \sum_{i=0}^{b} T(d_i) + O(n/k)
$$
其中 $d_i$ 是第 $i$ 段中包含的元素个数，有 $d_i\le 3n/b$。那么用代入法就有
$$
\begin{equation}
\begin{aligned}
T(n) &\le \sum_{i=0}^b c\frac{d_i\log d_i}{k\log k} + c_1\frac{n}{k}\\
&\le \frac{c\log \frac{3n}{b}}{k\log k}\left(\sum_{i=0}^bd_i\right)+c_1\frac{n}{k}\\
&\le c\frac{n\log n}{k\log k}-c\frac{n\log \frac{b}{3}}{k\log k} +c_1\frac{n}{k}\\
&\le c\frac{n\log n}{k\log k} + \left(c_1\frac{n}{k}-c\frac{n(\frac{1}{2}\log k-\log\log k-\log 3)}{k\log k}\right)\\
&\le c\frac{n\log n}{k\log k} + \left(c_1\frac{n}{k}-cc_2\frac{n}{k}\right).
\end{aligned}
\end{equation}
$$
 取 $c = c_1/c_2$ 便能够使得归纳成立。

## 参考

[^1]: http://uoj.ac/problem/445 
[^2]: Beigel R, Gill J. Sorting n objects with a k-sorter[J]. IEEE Transactions on Computers, 1990, 39(5): 714-716.

[^3]: https://en.wikipedia.org/wiki/Median_of_medians  
