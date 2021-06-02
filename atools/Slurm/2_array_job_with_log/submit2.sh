#! /bin/bash
#SBATCH --ntasks=1 --cpus-per-task=1 --mem-per-cpu=512M
#SBATCH --time=5:00
#

module load atools/slurm

sbatch --array $(arange -t 1-100 --log logdemo1.slurm.log* --redo) logdemo2.slurm

