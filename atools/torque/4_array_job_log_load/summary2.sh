#! /bin/bash
#

module load atools/torque

#
# Analyzing completed jobs
#
printf "\n\e[0;34mCalling arange with full options. It should list items with number higher than 80 as to do and a certain number of failed jobs.\e[0m\n\n"
arange -t 1-100 --log logdemo1.pbs.log* logdemo2.pbs.log* --summary --list_completed --list_failed

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for the incomplete jobs only. This should print nothing.\e[0m\n\n"
arange -t 1-100 --log logdemo1.pbs.log* logdemo2.pbs.log*

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for failed and incomplete jobs. This should print nothing.\e[0m\n\n"
arange -t 1-100 --log logdemo1.pbs.log* logdemo2.pbs.log* --redo

#
# Load analysis of the second batch of jobs
#
printf "\n\e[0;34mThe following command will print an overview of the nodes used to run the second job.\e[0m\n\n"
aload --log logdemo2.pbs.log* --list_slaves

printf "\n\e[0;34mNow we print an overview of all work items of the second job, where they were executed and how much time it took.\e[0m\n\n"
aload --log logdemo2.pbs.log* --list_tasks

printf "\nT\e[0;34mhe output of aload for the log file of the second jobwithout further arguments besides the log file.\e[0m\n\n"
aload --log logdemo2.pbs.log*

#
# Load analysis of the first and second batches of jobs
#
printf "\n\e[0;34mDoes not work: The following command will print an overview of the nodes used to run the job. The number of items should sum up to 80.\e[0m\n\n"
aload --log logdemo1.pbs.log* logdemo2.pbs.log* --list_slaves

printf "\n\e[0;34mDoes not work: Now we print an overview of all work items, where they were executed and how much time it took.\e[0m\n\n"
aload --log logdemo1.pbs.log* logdemo2.pbs.log* --list_tasks

printf "\n\e[0;34mDoes not work: The output of aload without further arguments besides the log file.\e[0m\n\n"
aload --log logdemo1.pbs.log* logdemo2.pbs.log*
