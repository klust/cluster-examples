#! /bin/bash
#

module load atools/slurm

sbatch --array $(arange -t 1-100 --log logdemo1.slurm.log* --redo) logdemo2.slurm

