#!/bin/bash
#   Specify the "name" of the job
#SBATCH --job-name=my_serial_job         
#SBATCH --ntasks=1 --cpus-per-task=1 --mem=100m
#SBATCH --time=5:00
#SBATCH --output=%x-%j.out
#SBATCH --error=%x-%j.err

# the program itself
echo Start Job
date
./file1.py
echo End Job
