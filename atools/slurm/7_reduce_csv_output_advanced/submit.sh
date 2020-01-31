#! /bin/bash
#

module load atools/slurm

sbatch --array 1-100 logdemo.slurm

