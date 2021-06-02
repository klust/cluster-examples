#! /bin/bash
#

module load atools/slurm

sbatch --array $(arange --data datalog.csv) weatherlog1.slurm
