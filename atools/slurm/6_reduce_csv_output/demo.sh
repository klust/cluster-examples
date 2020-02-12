#! /bin/bash

echo -e "\e[0;34mBlue: comments, \e[0;31mred: command, \e[0mblack: output.\n"
function execute { echo -e "\e[0;31m$1\e[0m"; eval $1; }

execute 'module load atools/slurm'

#
# Submit the jobs
#
printf "\n\e[0;34mSubmitting the job. The --wait is only there for demo purposes, it makes sure the script waits to do the analysis.\e[0m\n\n"
execute 'sbatch --wait --array 1-100 logdemo.slurm'

#
# Analyse the results
#
printf "\e[0;34mAggregating results of all completed jobs in a output-agr.csv using --mode csv\e[0m\n\n"
execute 'areduce -t 1-100 --pattern '\''output-{t}.csv'\'' --out output-agr-csv.csv --mode csv'
execute 'cat output-agr-csv.csv'

printf "\n\e[0;34mAggregating results of all completed jobs in a output-agr-text.csv using --mode text\e[0m\n\n"
execute 'areduce -t 1-100 --pattern '\''output-{t}.csv'\'' --out output-agr-text.csv --mode text'
execute 'cat output-agr-text.csv'

printf "\n\e[0;34mAggregating results of all completed jobs in a output-agr-body.csv using --mode body --reduce_args '--h 1'\e[0m\n\n"
execute 'areduce -t 1-100 --pattern '\''output-{t}.csv'\'' --out output-agr-body.csv --mode body --reduce_args '\''--h 1'\'''
execute 'cat output-agr-body.csv'

printf "\n\e[0;34mAggregating results of all completed jobs in a output-agr-noMode.csv without the --mode argument\e[0m\n\n"
execute 'areduce -t 1-100 --pattern '\''output-{t}.csv'\'' --out output-agr-noMode.csv'
execute 'cat output-agr-noMode.csv'

printf "\n\e[0;34moutput-agr-text.csv and output-agr-nomode.csv should be the same, so there should be no output:\e[0m\n\n"
execute 'diff output-agr-text.csv output-agr-noMode.csv'

printf "\n\e[0;34moutput-agr-csv.csv and output-agr-body.csv should be the same, except for the first line of the former missing in the latter:\e[0m\n\n"
execute 'diff output-agr-csv.csv output-agr-body.csv'

#
# Clean up
#
/bin/rm slurm-*.out output-*.csv
