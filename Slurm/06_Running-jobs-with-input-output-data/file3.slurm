#!/bin/bash
#
# specification (required!)
#SBATCH --ntasks=1 --cpus-per-task=1 --mem=1g
# requested running time (required!)
#SBATCH --time=50:00
#
# redirect standard output (-o) and error (-e) (optional)
# if omitted, the name of the job (specified by -N) or
# a generic name (name of the script followed by .o or .e and 
# job number) will be used
#SBATCH --output=stdout.%j
#SBATCH --error=stderr.%j

# the program itself
echo Start Job
date
./file3.py
echo End Job
