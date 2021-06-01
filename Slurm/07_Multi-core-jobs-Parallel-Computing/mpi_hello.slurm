#!/bin/bash

#SBATCH --job-name=mpihello
# Assume a 40-core job
#SBATCH --ntasks=40 --cpus-per-task=1 --mem-per-cpu=512m
#SBATCH --time=5:00

# Build the environment
module purge
ml calcua/2020a
ml intel/2020a

# Run the MPI program
srun ./mpi_hello
