#!/bin/bash

#SBATCH -J mpihello
#SBATCH -t 00:05:00
# assume a 64 core job
#SBATCH -n 64 -c 1 --mem-per-cpu=512m

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
ml calcua/2020a
ml intel/2020b

# Run the MPI program
srun ./mpihello
