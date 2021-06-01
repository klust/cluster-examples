#!/bin/bash
#SBATCH --ntasks=1 --cpus-per-task=1 --mem-per-cpu=100m
#SBATCH --time=5:00

# the program itself
echo Start Job
date
./file1.py
echo End Job
