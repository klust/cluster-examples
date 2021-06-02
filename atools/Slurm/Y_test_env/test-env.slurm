#!/bin/bash
#
#SBATCH --ntasks=1 --cpus-per-task=1 --mem-per-cpu=512M
#SBATCH --time=10:00

echo "Job name: $SLURM_JOB_NAME, array job id: $SLURM_ARRAY_JOB_ID, job id: $SLURM_JOB_ID, array index: $SLURM_ARRAY_TASK_ID."

env | grep SLURM

