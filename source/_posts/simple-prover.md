---
title: 实现一个简单的命题逻辑定理证明器
copyright: true
date: 2020-04-07 16:07:36
categories: Programming Language
---

**概述：**本文将介绍如何实现一个非常简单的命题逻辑定理证明器。这个定理证明器用 Haskell 编写，以交互式的方式进行使用，输出 Hilbert Style System 下原命题的一个证明。用这个小工具，我们可以生成许多难以直接证明的定理（如析取、合取的结合律）的证明。

<!-- more -->

# 问题设定

## Hilbert Style System

我们的目标是输出原命题在 Hilbert Style System 下的一个证明。我们所使用的系统只有一个连接词 $\to$ 和一个特殊的、表示矛盾原子命题 $\perp$。其中，$\lnot\varphi $ 定义为 $\varphi\to\perp$，$\varphi\lor \psi$ 定义为 $\lnot \varphi\to \psi$，$\varphi\land\psi$ 定义为 $\lnot(\varphi\to\lnot\psi)$。为了方便起见，$\to$ 是右结合的。很容易验证这样的定理和通常的定义是等价的。证明系统具有三个公理模式：

1. $\varphi\to\psi\to\varphi$
2. $(\varphi\to\psi\to\rho)\to(\varphi\to\psi)\to\varphi\to\rho$
3. $\lnot\lnot\varphi\to\varphi$

也就是说，我们将要在经典逻辑而非直觉主义逻辑下工作。证明系统唯一的证明规则是 MP Rule，即如果已证明 $\varphi\to\psi$ 和 $\varphi$，那么可以证明 $\psi$。

更严格的，Hilbert Style System 的证明由 $n$ 行构成，其中每一行要么是某个公理模式的一个实例（即将每个命题变元 $\varphi,\psi.\rho$ 替换为具体的内容），要么是 MP $(i, j)$，即对第 $i$ 行和第 $j$ 行的结论使用 MP Rule。

## 自然演绎系统

我们将要使用自然演绎系统作为生成 Hilbert Style System 证明的中介。对命题逻辑来说，自然演绎系统的证明是一棵以结论为根的树。关于自然演绎系统的描述可以在数理逻辑教材上找到，这里略过细节。

## 交互方式

定理证明器的前端由以下三部分构成。

1. **假设：**列出所有可以在证明中使用的假设，其中每条假设都对应一个编号，以在证明中使用这条假设。
2. **目标（或子目标）：**当前需要证明的目标，是一个命题。
3. **命令行：**即用户可以执行的证明策略。

用户可以执行的基本证明策略包括以下几种：

1. 前提引入`intro @id`：若目标为 $\varphi\to\psi$，将 $\varphi$ 加入假设列表，编号为 `@id`，并将目标转化为 $\psi$；
2. 应用 `apply @id`：若目标为 $\varphi$，编号为 `@id` 的假设为 $\psi\to\rho$，那么系统会先生成一个子目标 $\psi$；在子目标完成证明后，将目标变为 $\rho\to\varphi$。特别的，如果假设 `@id` 正是 $\psi\to\varphi$，那么第二部分仅需要证明 $\varphi\to\varphi$。
3. 引用假设 `just @id`：若目标正是编号为 `id` 的假设，则可以直接用这一条命令结束目标的证明。
4. 反证法 `contra @id`：若目标为 $\varphi$，将 $\lnot\varphi$ 加入假设编号为 `id`，并将目标变为 $\perp$。这正是我们平常对反证法的使用。

为了方便使用，我们还引入了 `perp`，`identity` 和 `assumption` 策略，分别表示

1. 当目标为 $\perp$ 时，结束证明
2. 当目标为 $\varphi\to\varphi$ 时，结束证明
3. 当目标是某个假设时，结束证明

为了实现的方便，我们忽略命题的 parsing，直接使用 Haskell shell 唤起定理证明器。

# 实现方式

可以发现，问题关键在于将交互式的证明过程转化成 Hilbert Style System 中的一个证明。根据 Deduction Theorem，$\Gamma \vdash \varphi\to\psi$ 当且仅当 $\Gamma, \varphi\vdash \psi$，我们可以用展开 Deduction Theorem 的证明的方式实现前提引入。

为了实现的方便，我们将采取另一种方式，即利用 Curry Howard 同构的方式来完成这种转化。从这种视角来看，证明的转化对应了不同语言之间的编译，而编译则是我们非常熟悉的任务。编译过程分为三步：

1. 前端：将输入的指令翻译成一个用简单类型 λμ 演算表示的、自然演绎系统的证明；
2. 中端：将自然演绎系统的证明翻译成用组合子表示的、Hilbert Style System 的证明；
3. 后端：输出一份可读的 Hilbert Style System 证明。

## 命题的表示

在 Curry Howard 同构的视角下，证明对应于类型，其定义仅包含原子类型、$\perp$ 和箭头类型三种。为了使用的方便，我们可以定义出箭头类型、与、或、非和逻辑等价的简记符号。

```haskell
data Type = TypeId Int | TypeArrow Type Type | Perp

infixr 5 -->
(-->) u v = TypeArrow u v

lnot u = u --> Perp
atom u = TypeId u
perp = Perp

infixl 6 \/
(\/) u v = (lnot u)-->v
infixl 7 /\
(/\) u v = (u-->(lnot v))-->perp
infixl 4 <->
(<->) u v = (u --> v) /\ (v --> u)
```

我们需要定义类型的输出函数，即 `Show Type` 的实例。此外，我们需要定义两个类型的相等，作为使用 MP Rule 的判别条件。

```haskell
sametype (TypeId u) (TypeId v) = u == v
sametype (TypeArrow u u') (TypeArrow v v') = (sametype u v) && (sametype u' v')
sametype Perp Perp = True
sametype _ _ = False
```

## 简单类型 λμ 演算

简单类型 λμ 演算的项是如下定义的：
$$
Term := x\mid \lambda x:Type.Term \mid (Term~Term)\mid \mu x:\lnot Type.Term
$$
也就是

```haskell
data Term = VarId Int | App Term Term | 
			Abs Int Type Term | 
			Mu Int Type Term
```

其中，`Mu u t e` 表示 $\mu x:\lnot t.e$。如果这一项是类型良好的，那么 $e:\perp$，并且这一项的类型为 $t$。我们需要编写 λμ 演算的类型规则，即给定一个项，如何确定其类型。令 `@con` 为自由变量的类型表，`get_type` 函数计算一个项的类型。

```haskell
type Context = Map.Map Int Type
get_type :: Context -> Term -> Maybe Type
get_type con (VarId id)   = Map.lookup id con
get_type con (Abs id t e) = fmap (\x -> t --> x) $ get_type (Map.insert id t con) e 
get_type con (Mu id t e) = case get_type (Map.insert id (lnot t) con) e of
                             Just Perp -> Just t
                             _ -> Nothing                             
get_type con (App e e') = let tt  = get_type con e
                              tt' = get_type con e'
  in case tt' of
       Just t' -> case tt of 
                     Just (TypeArrow t1 t2) ->
                       if sametype t1 t' then
                         Just t2
                       else
                         Nothing
                     _ -> Nothing
       _ -> Nothing
```

## 简单类型组合子

类似地，用于表示 Hilbert Style System 证明的简单类型组合子项如下定义。

```haskell
data CTerm = CVarId Int | CApp CTerm CTerm 
			| S Type Type Type | K Type Type | D Type 
```

其中，`CVarId Int` 表示自由变元，其对应于证明使用的所有假设。在证明转化的过程中，我们将会使用自由变元。`CApp` 对应了组合子的应用，对应于 MP Rule。`S, K, D` 表示了三个基本组合子，分别为 
$$
\begin{align*}
S_{\varphi,\psi,\rho}:&~(\varphi\to\psi\to\rho)\to(\varphi\to\psi)\to\varphi\to\rho\\
K_{\varphi,\psi}:&~\varphi\to\psi\to\varphi\\
D_{\varphi}:&~\lnot\lnot\varphi\to\varphi
\end{align*}
$$
分别对应了系统的三条公理模式。我们需要定义组合子项的类型 `get_type_c`。

```haskell
get_type_c con (CVarId id) = Map.lookup id con
get_type_c con (S p q r) = Just $ (p --> q --> r) --> (p --> q) --> p --> r
get_type_c con (K p q) = Just $ p --> q --> p
get_type_c con (D p) = Just $ (lnot $ lnot p) --> p
get_type_c con (CApp c c') = let tt  = get_type_c con c
                                 tt' = get_type_c con c'
  in case tt' of
       Just t' -> case tt of 
                     Just (TypeArrow t1 t2) ->
                       if sametype t1 t' then
                         Just t2
                       else
                         Nothing
                     _ -> Nothing
       _ -> Nothing
```

## 后端：证明的输出

假如我们已经获取了以组合子表示的 Hilbert Style System 的证明，那么只需要在组合子项的语法树上递归，便可以生成其对应的“可读”的证明。

1. 对于 `S, K, D` 直接生成一行公理 
2. 对于 `CApp u v`，分别生成 `u` 和 `v` 的证明，记录它们最后一行的编号，并生成一行 MP Rule. 

在代码中，`generate_c`，`show_proof` 和 `show_theorem` 实现了这一步。

## 中端：证明的转化

假定现在已经有了一个用 λμ 项表示的自然演绎证明，考虑应当如何将其转化为一个类型相同的组合子项。注意到三个组合子项都可以被一个简明的 λμ 项表示（即从组合子项到 λμ 项的翻译是容易的）。
$$
\begin{align*}
S_{\varphi,\psi,\rho} &:= \lambda x:\varphi\to\psi\to\rho.\lambda y:\varphi\to\psi.\lambda z:\varphi.(x~z)~(y~z) \\
K_{\varphi,\psi} &:= \lambda x:\varphi.\lambda y:\psi.x \\
D_{\varphi} &:= \lambda x:\lnot\lnot\varphi.\mu y:\lnot\varphi.(x~y)
\end{align*}
$$
反过来，我们可以定义 
$$
I_{\varphi} = (S_{\varphi,\varphi\to\varphi,\varphi}~K_{\varphi,\varphi\to\varphi})~K_{\varphi,\varphi}
$$
容易说明 $I_\varphi:\varphi\to\varphi$。对于一个组合子项  $c:\varphi$ 和类型 $\psi$，$\lambda^{\star}x:\psi.c$ 表示生成一个新的组合子项 $c':\psi\to\varphi$。$\lambda^{\star}$ 的定义如下：
$$
\begin{align*}
\lambda^{\star}x:\varphi.x&:=I_{\varphi}\\
\lambda^{\star}x:\varphi.F&:=K_{\psi,\varphi}~F, & F=S/K/D\land F:\psi\\
\lambda^{\star}x:\varphi.F~G&:=S_{\varphi,\psi,\rho}~(\lambda^{\star}x.F)~(\lambda^{\star}x.G) & \Gamma,x:\varphi\vDash F:\psi\land G:\rho
\end{align*}
$$
容易证明该定义符合我们的描述。借助这个函数，我们便可以定义出转化函数  $[*]$。
$$
\begin{align*}
[x] & := x \\
[e~e'] & := [e]~[e']\\
[\lambda x:\varphi.e] &:= \lambda^{\star}x:\varphi.e \\
[\mu x:\lnot\varphi.e] &:= D_{\varphi}~(\lambda^{\star}x:\lnot \varphi. e)
\end{align*}
$$

转化算法正确性的证明是容易的。从某种意义上说，这种转换和 Deduction Theorem 的证明等价。

## 前端：交互

简单来说，证明的过程是一个从根向下、递归构建自然演绎系统的证明树（也就是对应的 λμ 项的语法树）的过程。在这里我们简要描述每种操作的实现。令 `con : Map Int Type ` 为假设表，`goal` 为当前的目标。

1. `intro u`：如果当前目标为 $\varphi\to\psi$，那么将 $\varphi$ 加入假设表，递归地证明 $\psi$，并得到一个 λμ 项 $e$。那么 $\lambda x:\varphi.e$ 便是原先目标对应的证明；
2. `apply u`：如果假设 `u` 为 $\varphi\to\psi$，目标为 $\rho$，那么首先建立一个子目标 $\varphi$ 并递归地证明，得到一个证明 $e_1$。然后建立新的目标 $\psi\to\rho$ 并递归地证明，得到一个证明 $e_2$。那么原先目标的证明便是 $(e_2~(u~e_1))$。
3. `just u`：证明为 $u$；
4. `contra u`：如果目标为 $\varphi$，将 $\lnot\varphi$ 加入假设表，递归地证明 $\perp$ 并得到一个 λμ 项 $e$。那么原先目标对应的证明便是 $\mu u:\lnot\varphi.e$。

# 代码实现

实现代码见 [prover.hs](/files/lambda-staff/prover.hs)。可以在 ghci 里调用 `theorem p ` 来开始证明，其中 `p` 是一个命题。一个简单的示例如下：

```
*Main> let p = TypeId 0
*Main> theorem (p-->p)
------------
goal:   (t0→t0)
> intro 1
1       :       t0
------------
goal:   t0
> just 1
Theorem : (t0→t0).
Proof.
1. Axiom 1      |- ((t0→((t0→t0)→t0))→((t0→(t0→t0))→(t0→t0)))
2. Axiom 2      |- (t0→((t0→t0)→t0))
3. MP 1,2       |- ((t0→(t0→t0))→(t0→t0))
4. Axiom 2      |- (t0→(t0→t0))
5. MP 3,4       |- (t0→t0)
Qed.
```

另外，可以实现的一个简单拓展是所谓“proof normalization”以简化最终输出的证明。这对应于 λμ 项和组合子项的规约。

