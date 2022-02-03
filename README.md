# qpricesim-jl

This is a Julia implementation of a simulation study in which Q-learning agents compete in a market environment with
inelastic demand.

It was initially developed for my paper ["Algorithmic and Human Collusion"](https://tofewe.github.io/Algorithmic_and_Human_Collusion_Tobias_Werner.pdf). 
Due to restrictions on the local high performance cluster, I switched to Python to implement the main simulations that are used in the paper. 

## Features
- The five julia files implement the main functions and types.
- The notebook training.ipynb implements a training routine

## Other resources
- The python implementation that is used in the paper is [here](https://github.com/ToFeWe/qpricesim)
  - Even though it uses numba, it is (obviously ?) slower than the Julia implementation
  - It more thoroughly tests than the julia version
- More resources on the project are provided on my webpage: https://www.tfwerner.com/algohumancollusion