#! /bin/bash
#
# This is only a test script for the UAntwerp-proposed changes.

module load atools/slurm

printf "\n\e[0;34mCalling arange with full options. All items should now be completed.\e[0m\n\n"
arange --data datalog.csv --log weatherlog1.slurm.log* weatherlog2.slurm.log* --summary --list_completed --list_failed --list_todo

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for the incomplete jobs only. This should print an empty line.\e[0m\n\n"
arange --data datalog.csv --log weatherlog1.slurm.log* weatherlog2.slurm.log*

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for failed and incomplete jobs. This should print an empty line.\e[0m\n\n"
arange --data datalog.csv --log weatherlog1.slurm.log* weatherlog2.slurm.log* --redo

printf "\n\e[0;34mTo analyse only the second run, we need to use arange -t.\e[0m\n\n"
arange -t $(arange --data datalog.csv --log weatherlog1.slurm.log*) --log weatherlog2.slurm.log* --summary --list_completed --list_failed --list_todo
