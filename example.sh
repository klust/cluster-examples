#!/bin/bash

# "name" of the job (optional)
#PBS -N my_serial_job         

# Specification (required!)
# - Number of tasks
# - Numer of logical processors per task
# - Amound of swap space per task
#PBS -L tasks=1:lprocs=1:swap=1gb

# requested running time (required!)
#PBS -l walltime=01:00:00

# send mail notification (optional)
#   a        when job is aborted
#   b        when job begins
#   e        when job ends
#   M        your e-mail address (should always be specified)
#PBS -m e
#PBS -M stefan.becuwe@ua.ac.be

# redirect standard output (-o) and error (-e) (optional)
# if omitted, the name of the job (specified by -N) or
# a generic name (name of the script followed by .o or .e and 
# job number) will be used
#PBS -o stdout
#PBS -e stderr


# go to the (current) working directory (optional, if this is the
# directory where you submitted the job)
cd "$PBS_O_WORKDIR"


# the program itself
echo Start Job
date
hostname
echo End Job
