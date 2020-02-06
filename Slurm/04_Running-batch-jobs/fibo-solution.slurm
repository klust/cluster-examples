#!/bin/bash
#
#SBATCH --ntasks=1 --cpus-per-task=1 --mem=1g
#SBATCH --time=5:00

./fibo.pl
