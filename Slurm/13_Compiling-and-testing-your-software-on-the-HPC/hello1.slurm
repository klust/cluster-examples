#!/bin/bash

#SBATCH --job-name=hello
#SBATCH --ntasks=1 --cpus-per-task=1 --mem-per-cpu=512mb
#SBATCH --time=2:00

# First create your executable, which is not included in this script
# E.g., 
# module load intel/2019b
# icc -O2 -xHost hello.c -o hello
#
# Then use this job script to run the program on the cluster.

# Build the environment
module load calcua/2019b
module load intel/2019b

# Run the program
./hello > output-slurm.$SLURM_JOB_ID
