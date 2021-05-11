#!/bin/bash
first=$(qsub -N job_leader job_first.pbs)
qsub -N job_mult_5  -v multiplier=5  -W depend=afterany:$first job_depend.pbs
qsub -N job_mult_10 -v multiplier=10 -W depend=afterany:$first job_depend.pbs
