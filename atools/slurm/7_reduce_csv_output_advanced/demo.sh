#! /bin/bash

echo -e "\e[0;34mBlue: comments, \e[0;31mred: command, \e[0mblack: output.\n"
function execute { echo -e "\e[0;31m$1\e[0m"; eval $1; }

execute 'module load atools/slurm'

printf "\n\e[0;34mSubmitting the job. The --wait is only there for demo purposes, it makes sure the script waits to do the analysis.\e[0m\n\n"
execute 'sbatch --wait --array 1-100 logdemo.slurm'

printf "\n\e[0;34mCalling arange with full options. It should list items with number higher than 80 as to do and a certain number of failed jobs.\e[0m\n\n"
execute 'arange -t 1-100 --log logdemo.slurm.log* --long_summary'

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for the incomplete jobs only. This should list 81-100.\e[0m\n\n"
execute 'arange -t 1-100 --log logdemo.slurm.log*'

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for failed and incomplete jobs.\e[0m\n\n"
execute 'arange -t 1-100 --log logdemo.slurm.log* --redo'

printf "\n\e[0;34mChecking the output of arange as it would be used to list the successfully completed jobs.\e[0m\n\n"
execute 'arange -t 1-100 --log logdemo.slurm.log* --completed'

printf "\n\e[0;34mAggregating results of all completed jobs in a .csv file:\e[0m\n\n"
execute 'areduce -t $(arange -t 1-100 --log logdemo.slurm.log* --completed) --pattern '\''output-{t}.csv'\'' --out output-agr.csv --mode csv'
execute 'cat output-agr.csv'

printf "\n\e[0;34mAggregating results of all completed job items using empty_body and reduce_body as provided by atools, should provide the same output as before except for the header line:\e[0m\n\n"
execute 'areduce -t $(arange -t 1-100 --log logdemo.slurm.log* --completed) --pattern '\''output-{t}.csv'\'' --empty empty_body --reduce reduce_body --reduce_args '\''--h 1'\'' --out output-test.csv'
execute 'cat output-test.csv'

/bin/rm slurm-*.out output-*.csv logdemo*.slurm.log*
