#!/bin/bash
# Test the weather program
#SBATCH --tasks=1 --cpus-per-task=1 --mem-per-cpu=512M
#SBATCH --time=01:00:00

./weather -t 20 -p 1.05 -v 4.3
