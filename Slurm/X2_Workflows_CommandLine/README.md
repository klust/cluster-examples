# Workflow example passing information using a command line argument

## Original script: job.slurm

  * The first task is modeled by writing 10 to the file ``outputfile``.

  * Then there are two blocks modeling solvimg a perturbed problem by
    multiplying the value read from ``outputfile`` by 5 and 10 respectively,
    doing that in separate work directories so that in principle those two
    tasks could have run in parallel.

  * Submit the job script [``job.slurm``](job.slurm) with ``sbatch job.slurm``

## Solution with workflow

  * [``job_first.slurm``](job_first.slurm) is the job script that performs the first task.

  * [``job_depend.slurm``](job_depend.slurm) is the job script to solve one perturbed problem.
    The "perturbation" is passed to it through the environment variable
    ``multiplier``.

  * [``job_launch.sh``](job_launch.sh) shows how to launch these three jobs as a workflow.
    Note the position of the arguments for ``sbatch``(before the name of the
    job script) and the arguments for the job script (after the name of the
    job script).
