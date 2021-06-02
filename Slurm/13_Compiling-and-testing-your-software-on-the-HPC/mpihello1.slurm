#!/bin/bash

#SBATCH --job-name=mpihello
#SBATCH --time=00:05:00
# assume a 64 core job
#SBATCH --ntasks=64 --cpus-per-task=1 --mem-per-cpu=512m

# First create your executable, which is not included in this script
# E.g., on leibniz
# module load intel/2020a
# mpiicc -O2 -xHost mpihello.c -o mpihello
# and on Vaughan
# module load intel/2020a
# mpiicc -O2 -march=core-avx2 mpihello.c -o mpihello
#
# Then use this job script to run the program on the cluster.

# Build the environment
module load calcua/2020a
module load intel/2020a

# Run the MPI program
srun ./mpihello
