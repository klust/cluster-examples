#! /bin/bash
#

module load atools/torque

qsub -t $(arange --data datalog.csv --log weatherlog1.pbs.log* --redo) weatherlog2.pbs
