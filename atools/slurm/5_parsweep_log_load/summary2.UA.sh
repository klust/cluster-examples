#! /bin/bash
#
# This is only a test script for the UAntwerp-proposed changes.

module load atools/slurm

#
# Analyzing completed jobs
#
printf "\n\e[0;34mCalling arange with full options. It should now only list completed jobs.\e[0m\n\n"
arange --data datalog.csv --log weatherlog1.slurm.log* weatherlog2.slurm.log* --summary --list_completed --list_failed --list_todo

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for the incomplete jobs only.\nThis should print an empty line.\e[0m\n\n"
arange --data datalog.csv --log weatherlog1.slurm.log* weatherlog2.slurm.log*

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for failed and incomplete jobs.\nThis should again print an empty line.\e[0m\n\n"
arange --data datalog.csv --log weatherlog1.slurm.log* weatherlog2.slurm.log* --redo

#
# Load analysis of the second batch of jobs
#
printf "\n\e[0;34mThe following command will print an overview of the nodes used to run the second job.\e[0m\n\n"
aload --log weatherlog2.slurm.log* --list_slaves

printf "\n\e[0;34mNow we print an overview of all work items of the second job, where they were executed\nand how much time it took.\e[0m\n\n"
aload --log weatherlog2.slurm.log* --list_tasks

printf "\n\e[0;34mThe output of aload for the log file of the second job without further arguments\nbesides the log file.\e[0m\n\n"
aload --log weatherlog2.slurm.log*

#
# Load analysis of the first and second batches of jobs
#
printf "\n\e[0;34mDoes not work: The following command will print an overview of the nodes used to run the job.\e[0m\n\n"
aload --log weatherlog1.slurm.log* weatherlog2.slurm.log* --list_slaves

printf "\n\e[0;34mDoes not work: Now we print an overview of all work items, where they were executed\nand how much time it took.\e[0m\n\n"
aload --log weatherlog1.slurm.log* weatherlog2.slurm.log* --list_tasks

printf "\n\e[0;34mDoes not work: The output of aload without further arguments besides the log file.\e[0m\n\n"
aload --log weatherlog1.slurm.log* weatherlog2.slurm.log*
