#! /bin/bash
#

module load atools/slurm

sbatch --array $(arange --data data.csv) weather.slurm
