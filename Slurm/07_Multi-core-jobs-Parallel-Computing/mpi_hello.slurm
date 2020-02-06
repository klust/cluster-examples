#!/bin/bash

#SBATCH --job-name=mpihello
# Assume a 40-core job
#SBATCH --ntasks=40 --cpus-per-task=1 --mem-per-cpu=512m
#SBATCH --time=5:00

# Build the environment
ml calcua/2019b
ml intel/2019b

# Run the MPI program
srun ./mpi_hello
