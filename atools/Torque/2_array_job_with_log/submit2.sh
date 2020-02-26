#! /bin/bash
#

module load atools/torque

qsub -t $(arange -t 1-100 --log logdemo1.pbs.log* --redo)  logdemo2.pbs
