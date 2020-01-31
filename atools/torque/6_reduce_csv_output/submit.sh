#! /bin/bash
#

module load atools/torque

qsub -t 1-100 logdemo.pbs

