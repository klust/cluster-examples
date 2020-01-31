#!/bin/bash
#
#SBATCH --ntasks=1 --cpus-per-task=1 --mem-per-cpu=512M
#SBATCH --time=10:00
#
# Idea: Assuming the random number generator does a decent job,
# roughly 60% of the jobs will complete as intended, roughly 20%
# will fail, 20% will be incomplete with a start record but no
# end record and 20% will have nothing in the log file.
# 

module load atools/slurm

mode=$(( $RANDOM % 5 ))

case $mode in

0)
  # These jobs simply fail without producing any output.
  exit
  ;;

1)
  # These jobs have a start record but nothing else.
  alog --state start
  ;;

2)
  # These jobs fail.
  alog --state start
  sleep $(( $RANDOM % 5 ))
  alog --state end --exit 1
  ;;

*)
  # These jobs run as intended.
  alog --state start
  echo -e "\"Item\", \"Job name\", \"array job id\", \"job id\"" \
          "\n$SLURM_ARRAY_TASK_ID, $SLURM_JOB_NAME, $SLURM_ARRAY_JOB_ID, $SLURM_JOB_ID" \
       >output-${SLURM_ARRAY_TASK_ID}.csv
  sleep $(( 1 + $RANDOM % 5 ))
  alog --state end --exit 0

esac
