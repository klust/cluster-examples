# Chapter 6: Running jobs with input/output data

## Chapter 6.1.1-6.1.3: Default file names: file1.py example

The script ``file1.py`` writes some text to the file ``Hello.txt`` in whatever
directory the script is running in, to stdout and to stderr.

Demonstration of I/O redirection in job scripts:

### Simple output

  * [``file1a.slurm``](file1a.slurm) only generates two files: The file ``Hello.txt``
    file of the form ``slurm-<jobid>.out``. The latter contains all output sent to
    stdout and stderr. By default, these are sent to the same file in
    Slurm.

  * [``file1aa.slurm``](file1aa.slurm) solves this problem by adding the line
     ``` bash
     #SBATCH --error=slurm-%j.err
     ```
     to the job script. Now stdout is sent to a file of the form
     slurm-<jobid>.out and stderr is sent to a file of the form
     slurm-<jobid>.err.

### Job name in the name of the output files

In Slurm it requires a some work to include the job name in
the name of the output files. We now used ``--job-name`` to change the name of the
job, but also needed to specify two file name templates for stdout and stderr.
See [``file1b.slurm``](file1b.slurm):
``` bash
#SBATCH --output=%x-%j.out
#SBATCH --error=%x-%j.err
```
%x in this template stands for the name of the job, %j for the job id, so we
will get the files ``my_serial_job-<jobid>.out`` and ``my_serial_job-<jobid>.err``
with stdout and stderr respectively.

### Explicit names for the output files

[``file1c.slurm``](file1c.slurm) generates the same three files ``Hello.txt``,
``stdout.<jobid>`` and ``stderr.<jobid>``. However, the name of the file is
given through a template with various codes for jobid etc. and not using
SLURM_ environment variables. Those codes can be found in the
[manual page for ``sbatch``](https://slurm.schedmd.com/sbatch.html).


## Chapter 6.3: Writing output files: file2.py example

[``file2,py``](file2.py) is a Python script that generates some CPU- and disk-I/O load by
taking a random number between 1 and 2000, calculate all primes up to that limit
and repeat this action 30000 times. The output is written to a file in ``VSC_SCRATCH``;
this is hard-coded in the ``file2.py`` script and cannot be changed from the job
script.

Note that this is not really an example of a good code as it does many small outputs.
However, as the file is only opened at the start and closed again at the end, the
operating system can do a lot of buffering keeping the load on the file system
reasonable.

The [``file2.slurm``](file2.slurm) script is an example job script to run this program.
It will create separate files for stdout and stderr.


## Chapter 6.4: Reading input files: file3.py example

[``file3.py``](file3.py) is an extension of the previous example. The script
first generates the ``primes_1.txt`` file on ``$VSC_SCRATCH`` just as ``file2.py``,
then reads it again and does some processing on the data.

[``file3.slurm``](file3.slurm) is the corresponding job script.

