#! /bin/bash
#

module load atools/torque

printf "\n\e[0;34mCalling arange with full options.\e[0m\n\n"
arange -t 1-100 --log logdemo.pbs.log* --summary --list_failed --list_completed

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for the incomplete jobs only.\e[0m\n\n"
arange -t 1-100 --log logdemo.pbs.log*

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for failed and incomplete jobs.\e[0m\n\n"
arange -t 1-100 --log logdemo.pbs.log* --redo

printf "\n\e[0;34mChecking the output of arange as it would be used to list the successfully completed jobs.\e[0m\n\n"
arange -t 1-100 --log logdemo.pbs.log* --list_completed

printf "\n\e[0;34mAggregating results of all completed jobs in a .csv file:\e[0m\n\n"
areduce -t $(arange -t 1-100 --log logdemo.pbs.log* --list_completed) --pattern 'output-{t}.csv' --out output-agr-csv.csv --mode csv
cat output-agr-csv.csv

printf "\n\e[0;34mAggregating results of all completed job items using using --mode body, which should provide the same output as before except for the header line:\e[0m\n\n"
areduce -t $(arange -t 1-100 --log logdemo.pbs.log* --list_completed) --pattern 'output-{t}.csv' --mode body --reduce_args '--h 1' --out output-agr-body.csv
cat output-agr-body.csv

printf "\n\e[0;34mChecking the difference between both aggregated files:\e[0m\n\n"
diff output-agr-csv.csv output-agr-body.csv
