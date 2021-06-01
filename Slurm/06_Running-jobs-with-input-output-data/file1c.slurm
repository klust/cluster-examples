#!/bin/bash
#   Specify the "name" of the job
#SBATCH --ntasks=1 --cpus-per-task=1 --mem-per-cpu=100m
#SBATCH --time=5:00
#SBATCH --output=stdout.%j
#SBATCH --error=stderr.%j

# the program itself
echo Start Job
date
./file1.py
echo End Job
