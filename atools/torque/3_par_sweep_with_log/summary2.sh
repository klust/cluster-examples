#! /bin/bash
#

module load atools/torque

printf "\n\e[0;34mCalling arange with full options. All items should now be completed.\e[0m\n\n"
arange --data datalog.csv --log weatherlog1.pbs.log* weatherlog2.pbs.log* --summary --list_completed --list_failed

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for the incomplete jobs only. This should print an empty line.\e[0m\n\n"
arange --data datalog.csv --log weatherlog1.pbs.log* weatherlog2.pbs.log*

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for failed and incomplete jobs. This should print an empty line.\e[0m\n\n"
arange --data datalog.csv --log weatherlog1.pbs.log* weatherlog2.pbs.log* --redo

printf "\n\e[0;34mTo analyse only the second run, we need to use arange -t.\e[0m\n\n"
arange -t $(arange --data datalog.csv --log weatherlog1.pbs.log*) --log weatherlog2.pbs.log* --summary --list_completed --list_failed
