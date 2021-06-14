#!/bin/bash

# Compute resources
# - Number of tasks
# - Numer of lCPUs per task (1 CPU = 1 hardware thread for Slurm)
#SBATCH --ntasks=4 --cpus-per-task=7

# Memory
#SBATCH --mem-per-cpu=1g

# Walltime: The maximum time a job can run before being stopped.
# If not used a default of a few minutes is used.
# Use this flag to prevent jobs that go bad running for hundreds of hours.
# Format is HH:MM:SS
#SBATCH --time=4:00:00

# Give your job a unique name
#SBATCH --job-name=galaxies1234

# Specifying a partition when not using the default
#SBATCH --partition=short

# redirect standard output (-o) and error (-e) (optional).
# By default Slurm will merge both in a single file
# called slurm-<jobid>.out.
# By specifying
# if omitted, the name of the job (specified by -N) or
# a generic name (name of the script followed by .o or .e and
# job number) will be used
#SBATCH --output=stdout.%j
#SBATCH --error=stderr.%j

# send mail notification (optional)
#   START    when job begins
#   END      when job ends
#   FAIL     when job is aborted
#   M        your e-mail address
#SBATCH --mailtype=FAIL,END
#SBATCH --mail-user=firstname.lastname@uantwerpen.be

# Start with a clean environment
#SBATCH --export=NONE

# Using Slurm - Environment Variables :
#
# When a batch job starts execution, a number of environment variables are
# predefined, which include:
#      Variables seen by sbatch if --export=NONE is not specified
#      Variables explitly exported from the submission host with
#                --export
#      Exported variables of your .bash_profile if --export=NONE is used
#      Variables defined by Slurm.
#
# SLURM_JOB_ID   The job's Slurm identifier
# SLURM_JOB_NAME The job's name.


# First load the appropriate cluster module
# Then, activate the appropriate software packages
module purge
module load cluster/version
module load Package1 Package2 Package3

# If you want to see which variables are defined, use this bit of code:
echo -e "\nSLURM environment variables:\n$(env | grep ^SLURM_)\n"
echo -e "VSC environment variables:\n$(env | grep ^VSC_)\n"
echo -e "EasyBuild-defined environment variables:\n$(env | egrep "EBROOT|EBVERSION" | sort)\n"

# Start the job, which runs in the directory in which you executed sbatch
echo Start Job
date
./your_executable <your-arguments>
echo End Job


