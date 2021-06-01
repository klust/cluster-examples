#!/bin/bash
# "name" of the job (optional)
#SBATCH --job-name=my_serial_job
#
# specification (required!)
#SBATCH --ntasks=1 --cpus-per-task=1 --mem-per-cpu=1g
# requested running time (required!)
#SBATCH --time=30:00
#
# send mail notification (optional)
#   FAIL   when job is aborted
#   BEGIN  when job begins
#   END    when job ends
#   ... and more, see the manual page of sbatch.
##SBATCH --mail-type=BEGIN,END
##SBATCH --mail-user=firstname.lastname@uantwerpen.be
#
# redirect standard output (-o) and error (-e) (optional)
# if omitted, the name of the job (specified by -N) or
# a generic name (name of the script followed by .o or .e and
# job number) will be used
#SBATCH --output=stdout.%j
#SBATCH --error=stderr.%j

# the program itself
echo Start Job
date
./file2.py
echo End Job
