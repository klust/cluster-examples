#!/bin/bash
# Alternative:
# first=$(sbatch --job-name job_leader job_first.slurm | sed -e 's/Submitted batch job //')
first=$(sbatch --parsable --job-name job_leader job_first.slurm)
sbatch --job-name job_mult_5  --dependency=afterok:$first job_depend.slurm 5
sbatch --job-name job_mult_10 --dependency=afterok:$first job_depend.slurm 10
