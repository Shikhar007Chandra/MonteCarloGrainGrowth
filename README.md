# Monte Carlo Grain Growth Simulation (MATLAB)

## Overview
This repository contains a MATLAB implementation of Monte Carlo grain growth
in polycrystalline materials using a 2D Potts model and Metropolis algorithm.

## Physical Background
Grain boundaries possess excess energy. The microstructure evolves to minimize
total grain boundary energy, leading to grain coarsening over time.

## Model Description
- 2D lattice representation of grains
- Discrete grain orientations (Potts model)
- Nearest-neighbor interactions
- Metropolis Monte Carlo acceptance criterion

## Governing Equation
E = J * Σ (1 - δ_si_sj)

## Numerical Method
At each Monte Carlo step:
1. A random lattice site is selected
2. A neighboring grain orientation is proposed
3. Energy change is computed
4. The move is accepted using the Metropolis criterion

## Results
The simulation demonstrates grain coarsening and reduction in grain boundary
area with increasing Monte Carlo steps.
