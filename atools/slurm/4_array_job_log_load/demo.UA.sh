#! /bin/bash
#
# This is only a test script for the UAntwerp-proposed changes.

echo -e "\e[0;34mBlue: comments, \e[0;31mred: command, \e[0mblack: output.\n"
function execute { echo -e "\e[0;31m$1\e[0m"; eval $1; }

execute 'module load atools/slurm'

printf "\n\e[0;34mSubmitting the first job. The --wait is only there for demo purposes, it makes sure the script waits to do the analysis.\e[0m\n\n"
execute 'sbatch --wait --array 1-100 logdemo1.slurm'

printf "\n\e[0;34mCalling arange with full options. It should list items with number higher than 80 as to do and a certain number of failed jobs.\e[0m\n\n"
execute 'arange -t 1-100 --log logdemo1.slurm.log* --summary --list_completed --list_failed --list_todo'

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for the incomplete jobs only. This should list 81-100.\e[0m\n\n"
execute 'arange -t 1-100 --log logdemo1.slurm.log*'

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for failed and incomplete jobs.\e[0m\n\n"
execute 'arange -t 1-100 --log logdemo1.slurm.log* --redo'

printf "\n\e[0;34mThe following command will print an overview of the nodes used to run the job. The number of items should sum up to 80.\e[0m\n\n"
execute 'aload --log logdemo1.slurm.log* --list_slaves'

printf "\n\e[0;34mNow we print an overview of all work items, where they were executed and how much time it took.\e[0m\n\n"
execute 'aload --log logdemo1.slurm.log* --list_tasks'

printf "\n\e[0;34mThe output of aload without further arguments besides the log file.\e[0m\n\n"
execute 'aload --log logdemo1.slurm.log*'

printf "\n\e[0;34mSubmitting the second job: Re-run for failed and todo task items. The --wait is only there for demo purposes, it makes sure the script waits to do the analysis.\e[0m\n\n"
execute 'sbatch --wait --array $(arange -t 1-100 --log logdemo1.slurm.log* --redo) logdemo2.slurm'

#
# Analyzing completed jobs
#
printf "\n\e[0;34mCalling arange with full options. All items should now be completed.\e[0m\n\n"
execute 'arange -t 1-100 --log logdemo1.slurm.log* logdemo2.slurm.log* --summary --list_completed --list_failed --list_todo'

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for the incomplete jobs only. This should print an empty line.\e[0m\n\n"
execute 'arange -t 1-100 --log logdemo1.slurm.log* logdemo2.slurm.log*'

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for failed and incomplete jobs. This should print an empty line.\e[0m\n\n"
execute 'arange -t 1-100 --log logdemo1.slurm.log* logdemo2.slurm.log* --redo'

#
# Load analysis of the second batch of jobs
#
printf "\n\e[0;34mThe following command will print an overview of the nodes used to run the second job.\e[0m\n\n"
execute 'aload --log logdemo2.slurm.log* --list_slaves'

printf "\n\e[0;34mNow we print an overview of all work items of the second job, where they were executed and how much time it took.\e[0m\n\n"
execute 'aload --log logdemo2.slurm.log* --list_tasks'

printf "\n\e[0;34mThe output of aload for the log file of the second jobwithout further arguments besides the log file.\e[0m\n\n"
execute 'aload --log logdemo2.slurm.log*'

#
# Load analysis of the first and second batches of jobs
#
printf "\n\e[0;34mDoes not work: The following command will print an overview of the nodes used to run the job. The number of items should sum up to 80.\e[0m\n\n"
execute 'aload --log logdemo1.slurm.log* logdemo2.slurm.log* --list_slaves'

printf "\n\e[0;34mDoes not work: Now we print an overview of all work items, where they were executed and how much time it took.\e[0m\n\n"
execute 'aload --log logdemo1.slurm.log* logdemo2.slurm.log* --list_tasks'

printf "\n\e[0;34mDoes not work: The output of aload without further arguments besides the log file.\e[0m\n\n"
execute 'aload --log logdemo1.slurm.log* logdemo2.slurm.log*'

/bin/rm slurm-*.out logdemo*.slurm.log*
