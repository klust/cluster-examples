#! /bin/bash

echo -e "\e[0;34mBlue: comments, \e[0;31mred: command, \e[0mblack: output.\n"
function execute { echo -e "\e[0;31m$1\e[0m"; eval $1; }

execute 'module load atools/slurm'

#
# Submitting the first batch of jobs
#
printf "\n\e[0;34mSubmitting the first job. The --wait is only there for demo purposes, it makes sure the script waits to do the analysis.\e[0m\n\n"
execute 'sbatch --wait --array $(arange --data datalog.csv) weatherlog1.slurm'

#
# Analysing the first batch of jobs.
#
printf "\n\e[0;34mCalling arange with full options. It should list items 22 completed, 8 failed and 11 jobs to do.\e[0m\n\n"
execute 'arange --data datalog.csv --log weatherlog1.slurm.log* --summary --list_completed --list_failed'

printf "\n\e[0;34mAs the .csv file is only used to determine the task id range, we could use the follwing construct as well:\e[0m\n\n"
execute 'arange -t $(arange --data datalog.csv) --log weatherlog1.slurm.log* --summary --list_completed --list_failed'

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for the incomplete jobs only. This should list 81-100.\e[0m\n\n"
execute 'arange --data datalog.csv --log weatherlog1.slurm.log*'

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for failed and incomplete jobs.\e[0m\n\n"
execute 'arange --data datalog.csv --log weatherlog1.slurm.log* --redo'

printf "\n\e[0;34mListing only the completed items which is useful for areduce.\e[0m\n\n"
execute 'arange --data datalog.csv --log weatherlog1.slurm.log* --list_completed'

#
# Submitting the second batch of jobs
#
printf "\n\e[0;34mSubmitting the second job. Note how we indicate for which elements the computations should be done again. The --wait is only there for demo purposes, it makes sure the script waits to do the analysis.\e[0m\n\n"
execute 'sbatch --wait --array $(arange --data datalog.csv --log weatherlog1.slurm.log* --redo) weatherlog2.slurm'

#
# Analysing the combined results
#
printf "\n\e[0;34mCalling arange with full options. All items should now be completed.\e[0m\n\n"
execute 'arange --data datalog.csv --log weatherlog1.slurm.log* weatherlog2.slurm.log* --summary --list_completed --list_failed'

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for the incomplete jobs only. This should print an empty line.\e[0m\n\n"
execute 'arange --data datalog.csv --log weatherlog1.slurm.log* weatherlog2.slurm.log*'

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for failed and incomplete jobs. This should print an empty line.\e[0m\n\n"
execute 'arange --data datalog.csv --log weatherlog1.slurm.log* weatherlog2.slurm.log* --redo'

printf "\n\e[0;34mChecking the output of arange as it would be used to get the completed jobs for areduce. This should print 1-41.\e[0m\n\n"
execute 'arange --data datalog.csv --log weatherlog1.slurm.log* weatherlog2.slurm.log* --list_completed'

printf "\n\e[0;34mTo analyse only the second run, we need to use arange -t.\e[0m\n\n"
execute 'arange -t $(arange --data datalog.csv --log weatherlog1.slurm.log*) --log weatherlog2.slurm.log* --summary --list_completed --list_failed'

#
# Cleaning up
#
/bin/rm slurm-*.out weatherlog*.slurm.log*
