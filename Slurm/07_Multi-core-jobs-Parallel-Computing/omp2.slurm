#!/bin/bash

#SBATCH --job-name=omp-demo2
# This is a 10 core job
#SBATCH --ntasks=1 --cpus-per-task=10 --mem-per-cpu=2g
#SBATCH --time=05:00

# Build the environment
module load calcua/2020a
module load intel/2020a

# The next line is not needed when using Intel OpenMP; the runtime detects
# the correct number of threads.
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

# Run the program
./omp2
