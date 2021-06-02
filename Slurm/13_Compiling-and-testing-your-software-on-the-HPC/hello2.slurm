#!/bin/bash

#SBATCH -J hello
#SBATCH -n 1 -c 1 --mem-per-cpu=512mb
#SBATCH -t 2:00

# First create your executable, which is not included in this script
# E.g., on leibniz
# module load intel/2020a
# icc -O2 -xHost hello.c -o hello
# or on vaughan
# icc -O2 -march=core-avx2 hello.c -o hello
#
# Then use this job script to run the program on the cluster.

# Build the environment
ml calcua/2020a
ml intel/2020a

# Run the program
./hello > output-slurm.$SLURM_JOB_ID

