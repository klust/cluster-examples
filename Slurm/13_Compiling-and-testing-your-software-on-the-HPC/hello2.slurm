#!/bin/bash

#SBATCH -J hello
#SBATCH -n 1 -c 1 --mem-per-cpu=512mb
#SBATCH -t 2:00

# First create your executable, which is not included in this script
# E.g., 
# module load intel/2019b
# icc -O2 -xHost hello.c -o hello
#
# Then use this job script to run the program on the cluster.

# Build the environment
ml calcua/2019b
ml intel/2019b

# Run the program
./hello > output-slurm.$SLURM_JOB_ID

