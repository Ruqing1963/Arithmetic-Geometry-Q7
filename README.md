# Arithmetic Geometry of Q₇(x)

**Decomposition of the Jacobian and the Tate–Shafarevich Group in Quadratic Twists of y² = Q₇(x)**

Ruqing Chen — GUT Geoservice Inc., Montréal, QC, Canada

## Overview

This repository contains the paper, computational scripts, and output data for a study of the arithmetic geometry of the hyperelliptic curve C₇: y² = x⁷ − (x−1)⁷ over ℚ.

**Main results:**

1. The splitting field of Q₇(x) has Galois group C₆, enabling an algebraic decomposition of Jac(C₇) via a hyperelliptic involution, yielding the quotient elliptic curve E₁: Y² = X³ + 14X² + 49X + 49.
2. Through systematic 2-descent on the quadratic twist family E₁^(D), a non-trivial Tate–Shafarevich group is rigorously established at D = 167: Ш(E₁^(167)/ℚ)[2] ≅ (ℤ/2ℤ)², constituting an explicit failure of the Hasse principle.
3. The proof is unconditional (independent of BSD), relying on Kolyvagin's theorem and explicit torsor construction.

## Repository Structure

```
├── paper/
│   ├── paper.tex          # LaTeX source
│   └── paper.pdf          # Compiled paper
├── scripts/
│   ├── titan_galois_q7_v2.sage          # Galois group computation (SageMath)
│   ├── sha_detector_q7_split.sage       # 2-Selmer scan for E₁ twists, D ≤ 47 (SageMath)
│   ├── sha_deep_scan_q7.sage            # Deep Sha detection scan, D up to ~200 (SageMath)
│   ├── sha_detector_q5.sage             # Comparative scan for q=5 (SageMath)
│   └── sha_explicit_torsor_D167.m       # Explicit 2-descent & torsor verification (Magma)
├── data/
│   ├── result_titan_galois_q7.txt       # Galois group output: Gal(Q₇) ≅ C₆
│   ├── result_sha_detector_q7_split.txt # Selmer scan output for D ≤ 47
│   ├── result_sha_deep_scan_q7.txt      # Deep scan output: Sha detected at D = 167
│   ├── result_sha_detector_q5.txt       # Comparative q=5 scan output
│   └── result_sha_explicit_torsor_D167.txt  # Magma 2-descent verification output
└── README.md
```

## Software Requirements

- **SageMath** ≥ 9.0 — for Galois group computation and 2-Selmer analysis
- **Magma** — for rigorous 2-descent and explicit torsor construction (used for the D = 167 verification)

## Reproducing the Results

### Galois group of Q₇(x)
```bash
sage scripts/titan_galois_q7_v2.sage
```

### 2-Selmer scan (small twists)
```bash
sage scripts/sha_detector_q7_split.sage
```

### Deep Sha detection
```bash
sage scripts/sha_deep_scan_q7.sage
```

### Explicit torsor verification (Magma)
```
magma scripts/sha_explicit_torsor_D167.m
```

## Citation

```bibtex
@article{Chen2026ArithGeomQ7,
  author  = {Chen, Ruqing},
  title   = {Arithmetic Geometry of Polynomial Curves: Decomposition of the Jacobian
             and the {T}ate--{S}hafarevich Group in Quadratic Twists of $y^2 = Q_7(x)$},
  year    = {2026},
  note    = {Available at \url{https://github.com/Ruqing1963/Arithmetic-Geometry-Q7}}
}
```

## License

This project is released under the MIT License.
