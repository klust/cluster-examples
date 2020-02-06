#!/bin/bash

#SBATCH --job-name=omp-demo1
# This is a 10 core job
#SBATCH --ntasks=1 --cpus-per-task=10 --mem=2g
#SBATCH --time=05:00

# Build the environment
module load calcua/2019b
module load intel/2019b

# The next line is not needed when using Intel OpenMP; the runtime detects
# the correct number of threads.
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

# Run the program
./omp1
