#!/bin/bash
# Example of a worker parameter sweep job
#
#SBATCH --ntasks=1 --cpus-per-task=1 --mem-per-cpu=512M
#SBATCH --time=10:00
#
# The idea of this script is to run 41 tasks.
# * The first 30 will show random failures
# * The next 5 will start but not produce a failed or completed log line
#   as if they got interrupted during execution.
# * Task 36 and further will not even show up with a start line in the 
#   log file as if they were never executed.
#
# Of course, in a real world script you wouldn't have the tests on 
# SLURM_ARRAY_TASK_ID; their only purpose here is to simulate certain
# types of failure.
#

ml atools/slurm

# log start of work item execution
if (( $SLURM_ARRAY_TASK_ID <= 35 )); then
  alog --state start
fi

source <(aenv --data datalog.csv)
./weatherlog -t $temperature -p $pressure -v $volume -l 400
exit_code=$?

if (( $SLURM_ARRAY_TASK_ID <= 30 )); then
  # log end of work item execution
  alog --state end --exit "$exit_code"
fi
