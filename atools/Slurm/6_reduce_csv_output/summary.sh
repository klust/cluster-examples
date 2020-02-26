#! /bin/bash
#

module load atools/slurm

printf "\e[0;34mAggregating results of all completed jobs in a output-agr.csv using --mode csv\e[0m\n\n"
areduce -t 1-100 --pattern 'output-{t}.csv' --out output-agr-csv.csv --mode csv
cat output-agr-csv.csv

printf "\n\e[0;34mAggregating results of all completed jobs in a output-agr-text.csv using --mode text\e[0m\n\n"
areduce -t 1-100 --pattern 'output-{t}.csv' --out output-agr-text.csv --mode text
cat output-agr-text.csv

printf "\n\e[0;34mAggregating results of all completed jobs in a output-agr-body.csv using --mode body --reduce_args '--h 1'\e[0m\n\n"
areduce -t 1-100 --pattern 'output-{t}.csv' --out output-agr-body.csv --mode body --reduce_args '--h 1'
cat output-agr-body.csv

printf "\n\e[0;34mAggregating results of all completed jobs in a output-agr-noMode.csv without the --mode argument\e[0m\n\n"
areduce -t 1-100 --pattern 'output-{t}.csv' --out output-agr-noMode.csv
cat output-agr-noMode.csv

printf "\n\e[0;34moutput-agr-text.csv and output-agr-nomode.csv should be the same, so there should be no output:\e[0m\n\n"
diff output-agr-text.csv output-agr-noMode.csv

printf "\n\e[0;34moutput-agr-csv.csv and output-agr-body.csv should be the same, except for the first line of the former missing in the latter:\e[0m\n\n"
diff output-agr-csv.csv output-agr-body.csv
