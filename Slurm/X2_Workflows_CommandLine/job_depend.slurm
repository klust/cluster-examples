#!/bin/bash
#SBATCH --ntasks=1 --cpus-per-task=1
#SBATCH --mem-per-cpu=1g
#SBATCH --time=10:00

mkdir mult-$1 ; cd mult-$1
number=$(cat ../outputfile)
echo $(($number*$1)) >outputfile; sleep 300
