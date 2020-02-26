#!/bin/bash
# Example of a worker parameter sweep job
#
#SBATCH --ntasks=1 --cpus-per-task=1 --mem-per-cpu=512M
#SBATCH --time=10:00
#
# Now all tasks should complete without problems.
#

ml atools/slurm

# log start of work item execution
alog --state start

source <(aenv --data datalog.csv)
./weatherlog -t $temperature -p $pressure -v $volume -l 420
exit_code=$?

# log end of work item execution
alog --state end --exit "$exit_code"
