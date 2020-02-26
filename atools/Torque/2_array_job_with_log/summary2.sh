#! /bin/bash
#

module load atools/torque

printf "\n\e[0;34mCalling arange with full options. All items should now be completed.\e[0m\n\n"
arange -t 1-100 --log logdemo1.pbs.log* logdemo2.pbs.log* --summary --list_completed --list_failed

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for the incomplete jobs only. This should print nothing.\e[0m\n\n"
echo -e "\e[0;34mStill incompleted:\e[0m " $(arange -t 1-100 --log logdemo1.pbs.log* logdemo2.pbs.log* )

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for failed and incomplete jobs. This should print nothing.\e[0m\n\n"
echo -e "\e[0;34mStill failed or incompleted:\e[0m " $(arange -t 1-100 --log logdemo1.pbs.log* logdemo2.pbs.log*  --redo)

printf "\n\e[0;34mChecking the output of arange as it would be used to list completed jobs for areduce. This should print 1-100.\e[0m\n\n"
echo -e "\e[0;34mCompleted:\e[0m " $(arange -t 1-100 --log logdemo1.pbs.log*  logdemo2.pbs.log* --list_completed)
