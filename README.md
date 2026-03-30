# Universal Unitary Purification

This repository contains the computational notebooks written for Universal Unitary Purification. It primarily includes the matrices and constraint verifications required for the mathematical proofs in our work.

## Repository Structure

### `tildeGmatrix.ipynb`
- **Purpose:** Provides the explicit LaTeX code for the non-zero elements of the matrix $\tilde{G}$. 
- **Content:** To save space in the main manuscript, the massive mathematical expressions of $\tilde{G}$ are omitted from the paper. This file contains the raw LaTeX code, allowing readers to directly copy, paste, and compile the exact matrix used in our proof of **Theorem 1**.

### `Gmatrix.ipynb`
- **Purpose:** This notebook calculates the G matrix used in the CG (Clebsch-Gordan) decomposition for the proof of **Theorem 2**.
- **Output:** It automatically prints the non-zero elements of the resulting matrix in LaTeX format, making it easy to copy and paste directly into the manuscript.

### `constraints.ipynb`
- **Purpose:** This notebook computes, simplifies, and verifies the constraint relationships required for **Theorem 2**.
- **Workflow:**
  1. Computes the initial (first) set of constraint conditions for Theorem 2.
  2. Identifies and calculates the redundant variables within the system.
  3. Fixes a specific portion of these redundant variables to simplify the solution space.
  4. Verifies the inclusion relationship: it proves that the first set of constraints can successfully derive the second set of constraints presented in Theorem 2.
