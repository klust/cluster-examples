#! /bin/bash
#

module load atools/torque

printf "\n\e[0;34mCalling arange with full options. It should list items 22 completed, 8 failed and 11 jobs to do.\e[0m\n\n"
arange --data datalog.csv --log weatherlog1.pbs.log* --summary --list_completed --list_failed --list_todo

printf "\n\e[0;34mAs the .csv file is only used to determine the task id range, we could use the follwing construct as well:\e[0m\n\n"
arange -t $(arange --data datalog.csv) --log weatherlog1.pbs.log* --summary --list_completed --list_failed --list_todo

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for the incomplete jobs only. This should list 81-100.\e[0m\n\n"
arange --data datalog.csv --log weatherlog1.pbs.log*

printf "\n\e[0;34mChecking the output of arange as it would be used to restart for failed and incomplete jobs.\e[0m\n\n"
arange --data datalog.csv --log weatherlog1.pbs.log* --redo
