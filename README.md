# Universal Unitary Purification

Supporting material for *Distilling Qubit Unitary Operations:
A No-Go Theorem and Minimal Realization*.

## ICO upper bound (v3)

- [v3_THEOREM2_ICO_PROOF.md](v3_THEOREM2_ICO_PROOF.md):
  Analytic proof of the 3-slot ICO upper bound in Theorem 2.

- [v3_CERTIFICATE_MATRICES.md](v3_CERTIFICATE_MATRICES.md):
  Explicit matrices used in the analytic certificate.

- [v3_ICO_S3_constraints.txt](v3_ICO_S3_constraints.txt):
  The 166 independent affine equalities on the Hermitian block
  coordinates, obtained from the ICO normalization conditions
  and $S_3$ symmetry.

- [Gmatrix.ipynb](Gmatrix.ipynb):
  Construction of the Clebsch–Gordan (CG) transformation $G$
  used in Theorem 2 (Appendix B).

- [Omega_Tilde_Symbolic_d2_N3.pkl](Omega_Tilde_Symbolic_d2_N3.pkl):
  Symbolic matrix representation of the 3-slot performance operator
  in the CG basis.

## Parallel 3-slot strategy and circuit implementation

The parallel strategy attains the upper bound in Theorem 2.
Its circuit implementation is described in Appendix C.

- [parallel_encoder_decoder_isometries.ipynb](parallel_encoder_decoder_isometries.ipynb):
  Explicit matrices of the encoder isometry $V_{\mathrm{enc}}$
  and decoder isometry $V_{\mathrm{dec}}$, including their
  subsystem ordering.

## Theorem 1

- [tildeGmatrix.ipynb](tildeGmatrix.ipynb):
  Explicit entries of the Schur-basis transformation $\tilde{G}$
  used in the 2-slot no-go proof (Appendix A).
