# Universal Unitary Purification

Supporting material for *Distilling Qubit Unitary Operations:
A No-Go Theorem and Minimal Realization*.

## ICO upper bound

- [AppendixB_ICO_constraints.ipynb](AppendixB/AppendixB_ICO_constraints.ipynb):
  Derivation of the 166 affine constraints and exact verification
  of Eq. (S28) and certificate positivity.

- [Certificates.md](AppendixB/Certificates.md):
  Explicit matrices used in the analytic certificate.

- [Gmatrix_exact.npy](AppendixB/Gmatrix_exact.npy):
  Saved exact CG matrix used by the verification notebook.

- [Gmatrix.ipynb](AppendixB/Gmatrix.ipynb):
  Construction of the Clebsch–Gordan (CG) transformation $G$
  used in Theorem 2 (Appendix B).

- [Omega_Tilde_Symbolic_d2_N3.pkl](AppendixB/Omega_Tilde_Symbolic_d2_N3.pkl):
  Symbolic matrix representation of the 3-slot performance operator
  in the CG basis.

## Parallel 3-slot strategy and circuit implementation

The parallel strategy attains the upper bound in Theorem 2.
Its circuit implementation is described in Appendix C.

- [AppendixC_fidelity.ipynb](AppendixC/AppendixC_fidelity.ipynb):
  Exact fidelity calculation from the encoder and decoder isometries.

- [AppendixC_circuits.ipynb](AppendixC/AppendixC_circuits.ipynb):
  Qiskit circuits for Figs. S1 and S2, including isometry extraction
  and comparison with the reference matrices.

## Theorem 1

- [tildeGmatrix.ipynb](AppendixA/tildeGmatrix.ipynb):
  Explicit entries of the Schur-basis transformation $\tilde{G}$
  used in the 2-slot no-go proof (Appendix A).

## Figure 4

- [Figure4.m](figure4/Figure4.m):
  MATLAB code for the finite-gate-set optimization and plot.
  Requires CVX and QETLAB for the SDP calculation.

- [summary.csv](figure4/summary.csv):
  Optimal average fidelities and solver diagnostics.

- [per_gate_fidelities.csv](figure4/per_gate_fidelities.csv):
  Individual fidelities for the six gates under each common optimized strategy.

Run `Figure4` in MATLAB with CVX and QETLAB on the path.
The plotting section can also run separately using the saved CSV data.
