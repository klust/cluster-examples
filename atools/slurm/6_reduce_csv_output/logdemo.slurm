#!/bin/bash
#
#SBATCH --ntasks=1 --cpus-per-task=1 --mem-per-cpu=512M
#SBATCH --time=10:00
#

echo -e "\"Item\", \"Job name\", \"array job id\", \"job id\"" \
        "\n$SLURM_ARRAY_TASK_ID, $SLURM_JOB_NAME, $SLURM_ARRAY_JOB_ID, $SLURM_JOB_ID" \
     >output-${SLURM_ARRAY_TASK_ID}.csv
