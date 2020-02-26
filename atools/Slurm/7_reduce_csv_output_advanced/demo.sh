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
printf "\n\e[0;34mCalling arange with full options.\e[0m\n\n"
execute 'arange -t 1-100 --log logdemo.slurm.log* --summary --list_completed --list_failed'

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for the incomplete jobs only.\e[0m\n\n"
execute 'arange -t 1-100 --log logdemo.slurm.log*'

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for failed and incomplete jobs.\e[0m\n\n"
execute 'arange -t 1-100 --log logdemo.slurm.log* --redo'

printf "\n\e[0;34mChecking the output of arange as it would be used to list the successfully completed jobs.\e[0m\n\n"
execute 'arange -t 1-100 --log logdemo.slurm.log* --list_completed'

printf "\n\e[0;34mAggregating results of all completed jobs in a .csv file:\e[0m\n\n"
execute 'areduce -t $(arange -t 1-100 --log logdemo.slurm.log* --list_completed) --pattern '\''output-{t}.csv'\'' --out output-agr-csv.csv --mode csv'
execute 'cat output-agr-csv.csv'

printf "\n\e[0;34mAggregating results of all completed job items using using --mode body, which should provide the same output as before except for the header line:\e[0m\n\n"
execute 'areduce -t $(arange -t 1-100 --log logdemo.slurm.log* --list_completed) --pattern '\''output-{t}.csv'\'' --mode body --reduce_args '\''--h 1'\'' --out output-agr-body.csv'
execute 'cat output-agr-body.csv'

printf "\n\e[0;34mChecking the difference between both aggregated files:\e[0m\n\n"
execute 'diff output-agr-csv.csv output-agr-body.csv'

#
# Clean up
#
/bin/rm slurm-*.out output-*.csv logdemo*.slurm.log*
