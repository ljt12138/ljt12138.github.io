---
title: 2018 秋：编译原理
date: 2019-08-03 21:26:11
tags: THU-Courses
copyright: true
categories: System
---

## 课程介绍

编译原理课程的核心内容是编译器的原理和构造，前置课程包括形式语言与自动机、数理逻辑和数据结构，后续课程包括操作系统等。一方面，编译器和程序设计语言是大多数软件的基础，是数学理论应用于工程实践的典范；另一方面，编译器是重要的大型软件，可以展示许多软件工程中有用的技巧。

<!-- more -->

一个完整的编译器一般包括多个部分：

- **词法分析：**将字符流变为单词流，通常由文法分析器调用
- **文法分析：**将单词流转化为更底层的中间表示，通常是抽象文法树（AST），但也可以直接变为三地址码（TAC）。文法分析通常利用形式语言与自动机中讨论的**上下文无关语言（CFL）**，利用下推自动机的若干近似来实现分析。常用的技术有 LL(1)、LR(1)、LALR(1) 等等。
- **类型检查和中间代码生成：**对于静态类型语言来说，我们需要利用 AST 对代码做类型检查，并同时完成变量表的建立查询，生成更底层次的目标代码。事实上，这两步也可以整合在文法分析中。
- **代码优化：**利用三地址码（TAC）可以做许多平台无关优化，例如提取公共子表达式，归纳变量提取等等。代码优化的有力工具是基于图论算法的数据流分析。
- **目标代码生成：**由三地址码生成平台相关的目标代码。对于一般的堆栈-寄存器机来说，需要考虑寄存器分配和指令选择的问题。

课程的主体部分在于文法分析，此外对于词法分析、类型检查、代码生成等均有讨论。

## 实验报告

课程实验的主要内容是给面向对象的静态类型语言 Decaf 增加功能。

- PA1-A：Yacc 和 Lex 的使用，文法表示 [Report](/files/compiler-report/PA1-A.pdf)
- PA1-B：LL(1) 分析 [Report](/files/compiler-report/PA1-B.pdf)
- PA2：符号表和类型检查 [Report](/files/compiler-report/PA2.pdf)
- PA3：中间代码生成 [Report](/files/compiler-report/PA3.pdf)
- PA4：数据流分析 [Report](/files/compiler-report/PA4.pdf)
- PA5：寄存器选择 [Report](/files/compiler-report/PA5.pdf)

## 大实验：Cqq 解释器

Cqq 是一个很小的 C++ 语言子集，事实上未来程序改 $\subseteq Cqq\subseteq C++$。由于当时写的比较匆忙，文件结构很混乱orz

- Github: https://github.com/ljt12138/Cqq-Project
- [Report](/files/cqq-project/report.pdf)，[Slide](/files/cqq-project/slide.pptx)

## WC 2018 营员交流

我、tqyaaaaang 和 WerkeyTom_FTD 在 WC 2018 营员交流中介绍了编译原理相关知识，由于时间所限讲述比较匆忙。[Slide](/files/compiler-report/elephant.pptx)