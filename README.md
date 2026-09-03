# Universal Unitary Purification

This repository contains the computational notebooks written for Universal Unitary Purification. It primarily includes the matrices and constraint verifications required for the mathematical proofs in our work.

## Repository Structure

### `tildeGmatrix.ipynb`
- **Purpose:** Provides the explicit LaTeX code for the non-zero elements of the matrix $\tilde{G}$. 
- **Content:** To save space in the main manuscript, the massive mathematical expressions of $\tilde{G}$ are omitted from the paper. This file contains the raw LaTeX code, allowing readers to directly copy, paste, and compile the exact matrix used in our proof of **Theorem 1**.

### `Gmatrix.ipynb`
- **Purpose:** This notebook calculates the G matrix used in the CG (Clebsch-Gordan) decomposition for the proof of **Theorem 2**.
- **Output:** It automatically prints the non-zero elements of the resulting matrix in LaTeX format, making it easy to copy and paste directly into the manuscript.


### `parallel_encoder_decoder_isometries.ipynb`
- **Content:** Provides the explicit matrix entries of the parallel encoder and decoder isometries $V_{\mathrm{enc}}$ and $V_{\mathrm{dec}}$.


### `AppendixC_matrices.ipynb`
- **Purpose:** This notebook details the isometry matrices ($V_1, V_2, V_3, V_4$) and their expanded full unitary matrices (e.g., $U_4$) used for the quantum circuit synthesis in Appendix C.
- **Content:** The exact, explicit forms of these matrices are provided directly in LaTeX format within the notebook's Markdown cells.
