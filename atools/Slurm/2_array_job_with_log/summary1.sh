#! /bin/bash
#

module load atools/slurm

printf "\n\e[0;34mCalling arange with full options. It should list items with number higher than 80 as to do and a certain number of failed jobs.\e[0m\n\n"
arange -t 1-100 --log logdemo1.slurm.log* --summary --list_completed --list_failed

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for the incomplete jobs only. This should list 81-100.\e[0m\n\n"
arange -t 1-100 --log logdemo1.slurm.log*

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for failed and incomplete jobs.\e[0m\n\n"
arange -t 1-100 --log logdemo1.slurm.log* --redo

printf "\n\e[0;34mListing only the completed items which is useful for areduce.\e[0m\n\n"
arange -t 1-100 --log logdemo1.slurm.log* --list_completed
