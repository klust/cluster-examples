#! /bin/bash
#

module load atools/torque

qsub -t $(arange --data data.csv) weather.pbs
