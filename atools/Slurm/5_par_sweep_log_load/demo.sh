#! /bin/bash

echo -e "\e[0;34mBlue: comments, \e[0;31mred: command, \e[0mblack: output.\n"
function execute { echo -e "\e[0;31m$1\e[0m"; eval $1; }

execute 'module load atools/slurm'

#
# Submitting the first batch of jobs
#
printf "\n\e[0;34mSubmitting the first job. The --wait is only there for demo purposes, it makes\nsure the script waits to do the analysis.\e[0m\n\n"
execute 'sbatch --wait --array $(arange --data datalog.csv) weatherlog1.slurm'

#
# Analyzing the first batch of jobs
#
printf "\n\e[0;34mCalling arange with full options. It should list items 22 completed, 8 failed and 11 jobs to do.\e[0m\n\n"
execute 'arange --data datalog.csv --log weatherlog1.slurm.log* --summary --list_completed --list_failed'

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for the incomplete jobs only.\nThis should list 31-41.\e[0m\n\n"
execute 'arange --data datalog.csv --log weatherlog1.slurm.log*'

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for failed and incomplete jobs.\e[0m\n\n"
execute 'arange --data datalog.csv --log weatherlog1.slurm.log* --redo'

printf "\n\e[0;34mThe following command will print an overview of the nodes used to run the job.\nThe number of items should sum up to 30.\e[0m\n\n"
execute 'aload --log weatherlog1.slurm.log* --list_slaves'

printf "\n\e[0;34mNow we print an overview of all work items, where they were executed and how much time it took.\e[0m\n\n"
execute 'aload --log weatherlog1.slurm.log* --list_tasks'

printf "\n\e[0;34mThe output of aload without further arguments besides the log file.\e[0m\n\n"
execute 'aload --log weatherlog1.slurm.log*'

#
# Submitting the second batch of jobs
#
printf "\n\e[0;34mSubmitting the second job. Note how we indicate for which elements the computations should be done again.\nThe --wait is only there for demo purposes, it makes sure the script waits to do the analysis.\e[0m\n\n"
execute 'sbatch --wait --array $(arange --data datalog.csv --log weatherlog1.slurm.log* --redo) weatherlog2.slurm'

#
# Analysing all resuts
#
#
# Analyzing completed jobs
#
printf "\n\e[0;34mCalling arange with full options. It should now only list completed jobs.\e[0m\n\n"
execute 'arange --data datalog.csv --log weatherlog1.slurm.log* weatherlog2.slurm.log* --summary --list_completed --list_failed'

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for the incomplete jobs only.\nThis should print an empty line.\e[0m\n\n"
execute 'arange --data datalog.csv --log weatherlog1.slurm.log* weatherlog2.slurm.log*'

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for failed and incomplete jobs.\nThis should again print an empty line.\e[0m\n\n"
execute 'arange --data datalog.csv --log weatherlog1.slurm.log* weatherlog2.slurm.log* --redo'

#
# Load analysis of the second batch of jobs
#
printf "\n\e[0;34mThe following command will print an overview of the nodes used to run the second job.\e[0m\n\n"
execute 'aload --log weatherlog2.slurm.log* --list_slaves'

printf "\n\e[0;34mNow we print an overview of all work items of the second job, where they were executed\nand how much time it took.\e[0m\n\n"
execute 'aload --log weatherlog2.slurm.log* --list_tasks'

printf "\n\e[0;34mThe output of aload for the log file of the second job without further arguments\nbesides the log file.\e[0m\n\n"
execute 'aload --log weatherlog2.slurm.log*'

#
# Load analysis of the first and second batches of jobs
#
printf "\n\e[0;34mDoes not work (atools bug): The following command will print an overview of the nodes used to run the job.\e[0m\n\n"
execute 'aload --log weatherlog1.slurm.log* weatherlog2.slurm.log* --list_slaves'

printf "\n\e[0;34mDoes not work (atools bug): Now we print an overview of all work items, where they were executed\nand how much time it took.\e[0m\n\n"
execute 'aload --log weatherlog1.slurm.log* weatherlog2.slurm.log* --list_tasks'

printf "\n\e[0;34mDoes not work (atools bug): The output of aload without further arguments besides the log file.\e[0m\n\n"
execute 'aload --log weatherlog1.slurm.log* weatherlog2.slurm.log*'

#
# Cleaning up
#
/bin/rm slurm-*.out weatherlog*.slurm.log*
