#! /bin/bash
#

module load atools/slurm

printf "\e[0;34mAggregating results of all completed jobs in a output-agr.csv\e[0m\n\n"
areduce -t 1-100 --pattern 'output-{t}.csv' --out output-agr.csv --mode csv
cat output-agr.csv

printf "\n\e[0;34mAggregating results of all completed jobs in a output-agr.csv without the --mode argument\e[0m\n\n"
areduce -t 1-100 --pattern 'output-{t}.csv' --out output-agr-noMode.csv
cat output-agr-noMode.csv
