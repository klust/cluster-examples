# Job array example in Slurm

In this example, we run the [``test_set``](test_set) script for a number of files
in the ``input`` subdirectory. ``test_set`` will create the ``output`` subdirectory
and then do some processing on the input file and put the result in a corresponding
file in the ``output`` subdirectory.

The example job script is [``job_array.slurm``](job_array.slurm). To start, use
``` bash
sbatch --array 1-100 job_array.slurm
```

Note that the resource specifications in the job script are for a single job in the
array and not as was the case for Worker, for the overall process.
