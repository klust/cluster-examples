#! /bin/bash
#

module load atools/slurm

#
# Analyzing completed jobs
#
printf "\n\e[0;34mCalling arange with full options. All items should now be completed.\e[0m\n\n"
arange -t 1-100 --log logdemo1.slurm.log* logdemo2.slurm.log* --summary --list_completed --list_failed

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for the incomplete jobs only. This should print an empty line.\e[0m\n\n"
arange -t 1-100 --log logdemo1.slurm.log* logdemo2.slurm.log*

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for failed and incomplete jobs. This should print an empty line.\e[0m\n\n"
arange -t 1-100 --log logdemo1.slurm.log* logdemo2.slurm.log* --redo

#
# Load analysis of the second batch of jobs
#
printf "\n\e[0;34mThe following command will print an overview of the nodes used to run the second job.\e[0m\n\n"
aload --log logdemo2.slurm.log* --list_slaves

printf "\n\e[0;34mNow we print an overview of all work items of the second job, where they were executed and how much time it took.\e[0m\n\n"
aload --log logdemo2.slurm.log* --list_tasks

printf "\n\e[0;34mThe output of aload for the log file of the second jobwithout further arguments besides the log file.\e[0m\n\n"
aload --log logdemo2.slurm.log*

#
# Load analysis of the first and second batches of jobs
#
printf "\n\e[0;34mDoes not work: The following command will print an overview of the nodes used to run the job. The number of items should sum up to 80.\e[0m\n\n"
aload --log logdemo1.slurm.log* logdemo2.slurm.log* --list_slaves

printf "\n\e[0;34mDoes not work: Now we print an overview of all work items, where they were executed and how much time it took.\e[0m\n\n"
aload --log logdemo1.slurm.log* logdemo2.slurm.log* --list_tasks

printf "\n\e[0;34mDoes not work: The output of aload without further arguments besides the log file.\e[0m\n\n"
aload --log logdemo1.slurm.log* logdemo2.slurm.log*
