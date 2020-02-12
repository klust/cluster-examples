#! /bin/bash
#

module load atools/torque

printf "\n\e[0;34mCalling arange with full options. It should list items with number higher than 80 as to do and a certain number of failed jobs.\e[0m\n\n"
arange -t 1-100 --log logdemo.pbs.log* --long_summary

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for the incomplete jobs only. This should list 81-100.\e[0m\n\n"
arange -t 1-100 --log logdemo.pbs.log*

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for failed and incomplete jobs.\e[0m\n\n"
arange -t 1-100 --log logdemo.pbs.log* --redo

printf "\n\e[0;34mChecking the output of arange as it would be used to list the successfully completed jobs.\e[0m\n\n"
arange -t 1-100 --log logdemo.pbs.log* --completed

printf "\n\e[0;34mAggregating results of all completed jobs in a .csv file:\e[0m\n\n"
areduce -t $(arange -t 1-100 --log logdemo.pbs.log* --completed) --pattern 'output-{t}.csv' --out output-agr.csv --mode csv
cat output-agr.csv

printf "\n\e[0;34mAggregating results of all completed job items using empty_body and reduce_body as provided by atools, should provide the same output as before except for the header line:\e[0m\n\n"
areduce -t $(arange -t 1-100 --log logdemo.pbs.log* --completed) --pattern 'output-{t}.csv' \
        --empty empty_body --reduce reduce_body --reduce_args '--h 1' --out output-test.csv
cat output-test.csv
