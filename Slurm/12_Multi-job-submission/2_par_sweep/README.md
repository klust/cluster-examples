# Parameter sweep example with atools in Slurm.

In this example we run the [``weather``](weather) script for a number of
input values given in the spreadsheet [``data.csv``](data.csv).

The example script [``weather_p01.slurm``](weather_p01.slurm) shows how
to run the ``weather`` script for a single set of inputs, coded into the
job script.

We use ``atools`` in two places:

  * The job script [``weather.slurm``](weather.slurm) is meant to be used
    in an array job and does the computations for the line of the spreadsheet
    pointed to by the environment variable ``SLURM_ARRAY_TASK_ID``, even
    though that variable is not mentioned explicitly in the job script. It is
    used by the ``aenv`` command to know which line of the spreadsheet it
    should read.

  * However, we also need to load the ``atools`` module to launch the array
    job as we can then use the ``arange`` command which will generate the
    range of array elements corresponding to the spreadsheet file:
    ``` batch
    module load calcua/2020a
    module load atools/1.4.7-slurm
    sbatch --array $(arange --data data.csv) weather.slurm
    ```
