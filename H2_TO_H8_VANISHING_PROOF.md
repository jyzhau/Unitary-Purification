# Exact certificate forcing the high Schur blocks to vanish

## Claim

Fix $0<\gamma<1$. Let $\check C_{P I^{3} O^{3} F}$ be an optimal deterministic
three-slot full-ICO strategy. After the $\mathrm{SU}(2)\times\mathrm{SU}(2)$ and $S_3$ twirls,
write the resulting operator as $\bar C_{P I^{3} O^{3} F}$. In the coupled basis
used in the manuscript,

$$
H_2=H_3=\cdots=H_7=h_8=0.
$$

The certificate files index the final one-dimensional block as

$$
H_8:=[h_8].
\qquad\mathrm{(1)}
$$

Thus their conclusion $H_2=\cdots=H_8=0$ is the same statement.

## 1. Normalized performance operator

Use the unnormalized Choi convention

$$
J_U:=\lvert U\rangle\!\rangle\langle\!\langle U\rvert,
\qquad
\Phi_U:=J_U^{T}
=\lvert U^{\ast}\rangle\!\rangle\langle\!\langle U^{\ast}\rvert.
$$

The Choi operator of one noisy call is $(1-\gamma)J_U+(\gamma/2)I_4$.
For a three-slot strategy $\bar C$, the link-product identity gives

$$
\begin{aligned}
&\mathbb{E}_U\frac{1}{4}\mathrm{Tr}\!\left[
\left(\bar C*\big((1-\gamma)J_U+\frac{\gamma}{2}I_4\big)^{\otimes 3}\right)J_U
\right]\\
&\qquad=\mathrm{Tr}(\Omega_\gamma\bar C),
\end{aligned}
\qquad\mathrm{(2)}
$$

where the factor $1/4=1/d^{2}$ is the qubit channel-fidelity normalization and

$$
\Omega_\gamma
:=
\frac{1}{4}\mathbb{E}_U\!\left[
\left((1-\gamma)\Phi_U+\frac{\gamma}{2}I_4\right)^{\otimes 3}_{I^{3}O^{3}}
\otimes(J_U)_{PF}
\right].
\qquad\mathrm{(3)}
$$

Thus $\mathrm{Tr}(\Omega_\gamma\bar C)$ is exactly the Haar-averaged
channel overlap in Eq. (2); no separate symbol for it is needed.

After the covariance twirl, the Schur decomposition is

$$
\begin{aligned}
G^{\dagger}\bar C G
=\mathrm{diag}\big(&H_0\otimes I_1,H_1\otimes I_3,
H_2\otimes I_5,H_3\otimes I_3,H_4\otimes I_9,\\
&H_5\otimes I_{15},H_6\otimes I_5,H_7\otimes I_{15},h_8I_{25}\big).
\end{aligned}
\qquad\mathrm{(4)}
$$

The block dimensions are

$$
(\dim H_0,\ldots,\dim H_8)=(4,6,2,6,9,3,2,3,1),
$$

and every $H_k$ is positive semidefinite.

## 2. Symmetry and the affine domain

For any subsystem $X$, use the normalized replacement notation of the
manuscript,

$$
{}_{X}C:=\frac{I_X}{d_X}\otimes\mathrm{Tr}_X C.
$$

The deterministic full-ICO constraints and the objective in Eq. (2) are
preserved by the $\mathrm{SU}(2)\times\mathrm{SU}(2)$ covariance twirl and by simultaneous
permutations of the three slots. Hence twirling an optimal strategy preserves
both feasibility and its objective value. The optimum can therefore be
written as the following symmetry-reduced full-ICO SDP:

$$
\begin{aligned}
\max_{\bar C}\quad
&\mathrm{Tr}(\Omega_\gamma\bar C)\\
\mathrm{s.t.}\quad
&\begin{cases}
\bar C\succeq0,\\
\displaystyle
\sum_{S'\subseteq S}(-1)^{|S'|}
{}_{I_{\bar S}O_{\bar S}O_{S'}F}\bar C=0,
&\emptyset\ne S\subseteq\{1,2,3\},\\
{}_{I^{3}O^{3}F}\bar C={}_{PI^{3}O^{3}F}\bar C,\\
\mathrm{Tr}\bar C=16,\\
[\bar C,U_{V,W}]=0,
&V,W\in\mathrm{SU}(2),\\
\bar C=P_{12}\bar C P_{12}^{\dagger},\\
\bar C=P_{23}\bar C P_{23}^{\dagger}.
\end{cases}
\end{aligned}
$$

Here $\bar S=\{1,2,3\}\setminus S$; $P_{12}$ and $P_{23}$ simultaneously
swap the corresponding input-output slot pairs; and

$$
U_{V,W}
=V_P\otimes V_{I^{3}}^{\ast\otimes 3}
\otimes W_{O^{3}}^{\ast\otimes 3}\otimes W_F.
$$

The covariance constraint is already incorporated by the nine-block form in
Eq. (4). Together, the nine Hermitian blocks contain 196 real scalar entries.
Expressing the remaining full-ICO normalization and
$S_3$ constraints in these block variables gives 166 linearly independent
real affine equations and leaves a 30-dimensional affine space.
Positivity is not included in this dimension count; it is the separate
condition $H_k\succeq0$ for every $k$.

After imposing the full-ICO and symmetry constraints above, the exact
matrices $R_k^{(m)}$ satisfy Eq. (12) for every allowed block tuple.

## 3. The four active-count components

Before changing basis, expand the three noisy slot factors explicitly:

$$
\begin{aligned}
&\left((1-\gamma)\Phi_U+\frac{\gamma}{2}I_4\right)^{\otimes 3}\\
={}&\left(\frac{\gamma}{2}\right)^{3} I_4\otimes I_4\otimes I_4\\
&+(1-\gamma)\left(\frac{\gamma}{2}\right)^{2}
\big(\Phi_U\otimes I_4\otimes I_4
+I_4\otimes\Phi_U\otimes I_4
+I_4\otimes I_4\otimes\Phi_U\big)\\
&+(1-\gamma)^{2}\left(\frac{\gamma}{2}\right)
\big(\Phi_U\otimes\Phi_U\otimes I_4
+\Phi_U\otimes I_4\otimes\Phi_U
+I_4\otimes\Phi_U\otimes\Phi_U\big)\\
&+(1-\gamma)^{3}\Phi_U\otimes\Phi_U\otimes\Phi_U.
\end{aligned}
\qquad\mathrm{(5)}
$$

Let $\Omega^{(m)}$ be the normalized Haar average of the group containing
exactly $m$ copies of $\Phi_U$, with the average over its three positions for
$m=1,2$:

$$
\begin{aligned}
\Omega^{(0)}&=\frac{1}{4}\mathbb{E}_U[I_4^{\otimes 3}\otimes J_U],\\
\Omega^{(1)}&=\frac{1}{12}\mathbb{E}_U[(\Phi_U\otimes I_4\otimes I_4
+I_4\otimes\Phi_U\otimes I_4+I_4\otimes I_4\otimes\Phi_U)\otimes J_U],\\
\Omega^{(2)}&=\frac{1}{12}\mathbb{E}_U[(\Phi_U\otimes\Phi_U\otimes I_4
+\Phi_U\otimes I_4\otimes\Phi_U+I_4\otimes\Phi_U\otimes\Phi_U)\otimes J_U],\\
\Omega^{(3)}&=\frac{1}{4}\mathbb{E}_U[\Phi_U^{\otimes 3}\otimes J_U].
\end{aligned}
\qquad\mathrm{(6)}
$$

Then

$$
\begin{aligned}
\Omega_\gamma={}&
\left(\frac{\gamma}{2}\right)^{3}\Omega^{(0)}
+3(1-\gamma)\left(\frac{\gamma}{2}\right)^{2}\Omega^{(1)}\\
&+3(1-\gamma)^{2}\left(\frac{\gamma}{2}\right)\Omega^{(2)}
+(1-\gamma)^{3}\Omega^{(3)}.
\end{aligned}
\qquad\mathrm{(7)}
$$

For each component, write

$$
G^{\dagger}\Omega^{(m)}G
=\bigoplus_{k=0}^{8}(\Omega_k^{(m)}\otimes I_{d_k}),
\qquad W_k^{(m)}:=d_k\Omega_k^{(m)}.
$$

The physical-space overlap and its block expression are identical:

$$
\mathrm{Tr}(\Omega^{(m)}\bar C)
=\sum_{k=0}^{8}\mathrm{Tr}(W_k^{(m)}H_k).
\qquad\mathrm{(8)}
$$

## 4. Why $m=0$ and $m=3$ need no certificate

For $m=0$, all three slots contain the completely depolarizing channel with
Choi operator $J^{\mathcal{D}}=I_4/2$. Linking these channels to $\bar C$ gives
the $P\to F$ output

$$
J_{\mathrm{out}}^{(0)}
=\bar C*(J^{\mathcal{D}})^{\otimes 3}
=\frac{1}{8}\mathrm{Tr}_{I^{3}O^{3}}\bar C.
$$

Determinism of $\bar C$ makes this a valid qubit channel. Its trace also
follows directly from $\mathrm{Tr}\bar C=16$:

$$
\mathrm{Tr}J_{\mathrm{out}}^{(0)}
=\frac{1}{8}\mathrm{Tr}\bar C=2.
$$

It is independent of $U$, and

$$
\mathbb{E}_U[J_U]=\frac{I_{PF}}2,
\qquad
\mathbb{E}_U\frac{1}{4}\mathrm{Tr}(J_{\mathrm{out}}^{(0)}J_U)
=\frac{1}{4}.
$$

Because $\Omega^{(0)}$ uses $I_4^{\otimes 3}=8(J^{\mathcal{D}})^{\otimes 3}$,

$$
\mathrm{Tr}(\Omega^{(0)}\bar C)=8\times\frac{1}{4}=2=:A_0.
\qquad\mathrm{(9)}
$$

For $m=3$, linking three unitary channels gives

$$
J_{\mathrm{out}}^{(3)}(U)=\bar C*J_U^{\otimes 3}.
$$

This is a valid qubit channel for every $U$, so its channel fidelity with
$J_U$ is at most one. By Eqs. (2) and (6),

$$
\mathrm{Tr}(\Omega^{(3)}\bar C)
=\mathbb{E}_U\frac{1}{4}\mathrm{Tr}(J_{\mathrm{out}}^{(3)}(U)J_U)
\le1=:A_3.
\qquad\mathrm{(10)}
$$

Thus $m=0$ follows from normalization and the first Haar moment, while $m=3$
follows from channel fidelity being at most one. These two bounds need no
matrix certificates. They also supply no strictly positive penalty on the
high Schur blocks.

## 5. Exact certificates for $m=1,2$

For the two mixed components, define

$$
A_1=\frac{27+8\sqrt{2}}{18},
\qquad
A_2=\frac{21+8\sqrt{2}}{18},
\qquad
t_1=\frac{1}{256},
\qquad
t_2=\frac{1}{64}.
\qquad\mathrm{(11)}
$$

The exact certificates supply positive-semidefinite matrices
$R_k^{(m)}$, $k=0,\ldots,8$, satisfying, for $m=1,2$,

$$
\boxed{
A_m-\mathrm{Tr}(\Omega^{(m)}\bar C)
=t_m\sum_{k=2}^{8}\mathrm{Tr}H_k
+\sum_{k=0}^{8}\mathrm{Tr}(R_k^{(m)}H_k).
}
\qquad\mathrm{(12)}
$$

The matrices stored in the exact certificate files are positive semidefinite
and satisfy Eq. (12) identically on the full affine space. Since
$R_k^{(m)}\succeq0$ and $H_k\succeq0$,

$$
A_m-\mathrm{Tr}(\Omega^{(m)}\bar C)
\ge t_m\sum_{k=2}^{8}\mathrm{Tr}H_k,
\qquad m=1,2.
\qquad\mathrm{(13)}
$$

## 6. Combining the four components

Set

$$
\begin{aligned}
F_{\mathrm{ub}}
:={}&\left(\frac{\gamma}{2}\right)^{3}A_0
+3(1-\gamma)\left(\frac{\gamma}{2}\right)^{2}A_1\\
&+3(1-\gamma)^{2}\left(\frac{\gamma}{2}\right)A_2
+(1-\gamma)^{3}A_3\\
={}&\frac{1}{24}(2-\gamma)
\left[12+(8\sqrt{2}-9)\gamma+(3-8\sqrt{2})\gamma^{2}\right].
\end{aligned}
\qquad\mathrm{(14)}
$$

Using Eq. (7), the gap is exactly

$$
\begin{aligned}
F_{\mathrm{ub}}-\mathrm{Tr}(\Omega_\gamma\bar C)
={}&\left(\frac{\gamma}{2}\right)^{3}
\left[A_0-\mathrm{Tr}(\Omega^{(0)}\bar C)\right]\\
&+3(1-\gamma)\left(\frac{\gamma}{2}\right)^{2}
\left[A_1-\mathrm{Tr}(\Omega^{(1)}\bar C)\right]\\
&+3(1-\gamma)^{2}\left(\frac{\gamma}{2}\right)
\left[A_2-\mathrm{Tr}(\Omega^{(2)}\bar C)\right]\\
&+(1-\gamma)^{3}
\left[A_3-\mathrm{Tr}(\Omega^{(3)}\bar C)\right].
\end{aligned}
$$

The first bracket is zero by Eq. (9), the last is nonnegative by Eq. (10),
and the two middle brackets obey Eq. (13). Therefore

$$
\boxed{
F_{\mathrm{ub}}-\mathrm{Tr}(\Omega_\gamma\bar C)
\ge
\frac{3\gamma(1-\gamma)(8-7\gamma)}{1024}
\sum_{k=2}^{8}\mathrm{Tr}H_k.
}
\qquad\mathrm{(15)}
$$

The explicit parallel strategy in the manuscript attains $F_{\mathrm{ub}}$.
Since every parallel strategy is a full-ICO strategy, Eq. (15) is a tight
upper bound for the full-ICO optimum. Hence an optimal twirled $\bar C$ obeys

$$
\mathrm{Tr}(\Omega_\gamma\bar C)=F_{\mathrm{ub}}.
$$

For $0<\gamma<1$, the coefficient in Eq. (15) is strictly positive. Therefore

$$
\sum_{k=2}^{8}\mathrm{Tr}H_k=0.
$$

Every summand is nonnegative because $H_k\succeq0$. Thus
$\mathrm{Tr}H_k=0$ for every $k=2,\ldots,8$. A positive-semidefinite
matrix with zero trace is zero, proving

$$
\boxed{H_2=H_3=\cdots=H_7=h_8=0.}
$$

## 7. Exact data

The matrices $R_k^{(m)}$ are stored in

- `exact_all_high_exposer_m1.json`;
- `exact_all_high_exposer_m2.json`.

Together with the attainability of $F_{\mathrm{ub}}$, Eq. (15) proves the
optimal-strategy collapse used in the manuscript: every optimal twirled
full-ICO strategy is supported only on the $H_0$ and $H_1$ Schur sectors.
