#! /bin/bash

echo -e "\e[0;34mBlue: comments, \e[0;31mred: command, \e[0mblack: output.\n"
function execute { echo -e "\e[0;31m$1\e[0m"; eval $1; }

execute 'module load atools/slurm'

printf "\n\e[0;34mSubmitting the first job. The --wait is only there for demo purposes, it makes sure the script waits to do the analysis.\e[0m\n\n"
execute 'sbatch --wait --array $(arange --data datalog.csv) weatherlog1.slurm'

printf "\n\e[0;34mCalling arange with full options. It should list i22 completed items, 8 failed ones and 11 jobs to do.\e[0m\n\n"
execute 'arange --data datalog.csv --log weatherlog1.slurm.log* --summary --list_completed --list_failed --list_todo'

printf "\n\e[0;34mAs the .csv file is only used to determine the task id range, we could use the follwing construct as well:\e[0m\n\n"
execute 'arange -t $(arange --data datalog.csv) --log weatherlog1.slurm.log* --summary --list_completed --list_failed --list_todo'

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for the incomplete jobs only. This should list 31-41.\e[0m\n\n"
execute 'arange --data datalog.csv --log weatherlog1.slurm.log*'

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for failed and incomplete jobs.\e[0m\n\n"
execute 'arange --data datalog.csv --log weatherlog1.slurm.log* --redo'

printf "\n\e[0;34mSubmitting the second job. Note how we indicate for which elements the computations should be done again. The --wait is only there for demo purposes, it makes sure the script waits to do the analysis.\e[0m\n\n"
execute 'sbatch --wait --array $(arange --data datalog.csv --log weatherlog1.slurm.log* --redo) weatherlog2.slurm'

printf "\n\e[0;34mCalling arange with full options. All items should now be completed.\e[0m\n\n"
execute 'arange --data datalog.csv --log weatherlog1.slurm.log* weatherlog2.slurm.log* --summary --list_completed --list_failed --list_todo'

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for the incomplete jobs only. This should print nothing.\e[0m\n\n"
execute 'arange --data datalog.csv --log weatherlog1.slurm.log* weatherlog2.slurm.log*'

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for failed and incomplete jobs. This should print nothing.\e[0m\n\n"
execute 'arange --data datalog.csv --log weatherlog1.slurm.log* weatherlog2.slurm.log* --redo'

printf "\n\e[0;34mTo analyse only the second run, we need to use arange -t.\e[0m\n\n"
execute 'arange -t $(arange --data datalog.csv --log weatherlog1.slurm.log*) --log weatherlog2.slurm.log* --summary --list_completed --list_failed --list_todo'

/bin/rm slurm-*.out weatherlog*.slurm.log*
