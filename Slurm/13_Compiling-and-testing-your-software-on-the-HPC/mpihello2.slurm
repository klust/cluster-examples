#!/bin/bash

#SBATCH -J mpihello
#SBATCH -t 00:05:00
# assume a 40 core job
#SBATCH -n 40 -c 1 --mem-per-cpu=512m

# First create your executable, which is not included in this script
# E.g., 
# module load intel/2019b
# mpiicc -O2 -xHost hello.c -o hello
#
# Then use this job script to run the program on the cluster.

# Build the environment
ml calcua/2019b
ml intel/2019b

# Run the MPI program
srun ./mpihello
