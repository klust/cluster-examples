#! /bin/bash

echo -e "\e[0;34mBlue: comments, \e[0;31mred: command, \e[0mblack: output.\n"
function execute { echo -e "\e[0;31m$1\e[0m"; eval $1; }

execute 'module load atools/slurm'

printf "\n\e[0;34mSubmitting the job. The --wait is only there for demo purposes, it makes sure the script waits to do the analysis.\e[0m\n\n"
execute 'sbatch --wait --array 1-100 logdemo.slurm'

printf "\e[0;34mAggregating results of all completed jobs in a output-agr.csv\e[0m\n\n"
execute 'areduce -t 1-100 --pattern '\''output-{t}.csv'\'' --out output-agr.csv --mode csv'
execute 'cat output-agr.csv'

printf "\n\e[0;34mAggregating results of all completed jobs in a output-agr.csv without the --mode argument\e[0m\n\n"
execute 'areduce -t 1-100 --pattern '\''output-{t}.csv'\'' --out output-agr-noMode.csv'
execute 'cat output-agr-noMode.csv'

/bin/rm slurm-*.out output-*.csv
