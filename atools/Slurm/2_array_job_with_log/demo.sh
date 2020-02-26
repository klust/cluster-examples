#! /bin/bash

echo -e "\e[0;34mBlue: comments, \e[0;31mred: command, \e[0mblack: output.\n"
function execute { echo -e "\e[0;31m$1\e[0m"; eval $1; }

execute 'module load atools/slurm'

#
# Submit first batch of jobs
#
printf "\n\e[0;34mSubmitting the first job. The --wait is only there for demo purposes, it makes sure the script waits to do the analysis.\e[0m\n\n"
execute 'sbatch --wait --array 1-100 logdemo1.slurm'

#
# Analyse the results of the first batch of jobs
#
printf "\n\e[0;34mCalling arange with full options. It should list items with number higher than 80 as to do and a certain number of failed jobs.\e[0m\n\n"
execute 'arange -t 1-100 --log logdemo1.slurm.log* --summary --list_completed --list_failed'

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for the incomplete jobs only. This should list 81-100.\e[0m\n\n"
execute 'arange -t 1-100 --log logdemo1.slurm.log*'

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for failed and incomplete jobs.\e[0m\n\n"
execute 'arange -t 1-100 --log logdemo1.slurm.log* --redo'

printf "\n\e[0;34mListing only the completed items which is useful for areduce.\e[0m\n\n"
execute 'arange -t 1-100 --log logdemo1.slurm.log* --list_completed'

#
# Submit second batch of jobs
#
printf "\n\e[0;34mSubmitting the second job: Re-run for failed and todo task items. The --wait is only there for demo purposes, it makes sure the script waits to do the analysis.\e[0m\n\n"
execute 'sbatch --wait --array $(arange -t 1-100 --log logdemo1.slurm.log* --redo) logdemo2.slurm'

#
# Analyse the results of the first and second batch of jobs
#
printf "\n\e[0;34mCalling arange with full options. All items should now be completed.\e[0m\n\n"
execute 'arange -t 1-100 --log logdemo1.slurm.log* logdemo2.slurm.log* --summary --list_completed --list_failed'

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for the incomplete jobs only. This should print nothing.\e[0m\n\n"
execute 'arange -t 1-100 --log logdemo1.slurm.log* logdemo2.slurm.log*'

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for failed and incomplete jobs. This should print nothing.\e[0m\n\n"
execute 'arange -t 1-100 --log logdemo1.slurm.log*  logdemo2.slurm.log* --redo'

printf "\n\e[0;34mChecking the output of arange as it would be used to list completed jobs for areduce. This should print 1-100.\e[0m\n\n"
execute 'arange -t 1-100 --log logdemo1.slurm.log*  logdemo2.slurm.log* --list_completed'

#
# Clean-up
#
/bin/rm slurm-*.out logdemo*.slurm.log*
