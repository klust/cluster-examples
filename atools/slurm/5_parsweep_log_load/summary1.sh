#! /bin/bash
#

module load atools/slurm

printf "\n\e[0;34mCalling arange with full options. It should list items 22 completed, 8 failed and 11 jobs to do.\e[0m\n\n"
arange --data datalog.csv --log weatherlog1.slurm.log* --summary --list_completed --list_failed

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for the incomplete jobs only.\nThis should list 31-41.\e[0m\n\n"
arange --data datalog.csv --log weatherlog1.slurm.log*

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for failed and incomplete jobs.\e[0m\n\n"
arange --data datalog.csv --log weatherlog1.slurm.log* --redo

printf "\n\e[0;34mThe following command will print an overview of the nodes used to run the job.\nThe number of items should sum up to 30.\e[0m\n\n"
aload --log weatherlog1.slurm.log* --list_slaves

printf "\n\e[0;34mNow we print an overview of all work items, where they were executed and how much time it took.\e[0m\n\n"
aload --log weatherlog1.slurm.log* --list_tasks

printf "\n\e[0;34mThe output of aload without further arguments besides the log file.\e[0m\n\n"
aload --log weatherlog1.slurm.log*
