#!/bin/bash
#
#SBATCH --ntasks=1 --cpus-per-task=1 --mem-per-cpu=512M
#SBATCH --time=10:00
#
# The idea is that all jobs simply complete with a start and completed
# line in the log files.
#

ml atools/slurm

# log start of work item execution
alog --state start

# This is for the second run, we'll now make sure they all succeed.
exit_code=0

# Do some work
echo "Item: $SLURM_ARRAY_TASK_ID: Job name: $SLURM_JOB_NAME, array job id: $SLURM_ARRAY_JOB_ID, job id: $SLURM_JOB_ID, exit code: $exit_code."
sleep $(( 1 + $RANDOM % 4 ))

# log end of work item execution
alog --state end --exit "$exit_code"
