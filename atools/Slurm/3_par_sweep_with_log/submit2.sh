#! /bin/bash
#

module load atools/slurm

sbatch --array $(arange --data datalog.csv --log weatherlog1.slurm.log* --redo) weatherlog2.slurm
