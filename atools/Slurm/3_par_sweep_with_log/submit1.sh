#! /bin/bash
#SBATCH --ntasks=1 --cpus-per-task=1 --mem-per-cpu=512M
#SBATCH --time=5:00
#

module load atools/slurm

sbatch --array $(arange --data datalog.csv) weatherlog1.slurm
