#! /bin/bash
#

module load atools/torque

qsub -t $(arange --data datalog.csv) weatherlog1.pbs
