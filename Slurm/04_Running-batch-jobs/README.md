# Chapter 4: Running batch jobs

## The example of section 4.3

### Task

Have a look at the script [``fibo.slurm``](fibo.slurm). This is an incomplete script to start the
Perl script [``fibo.pl``](fibo.pl) (that you don't need to change). Turn this into a better job
script that does not rely on default values.

### Solution

Add at least the wall time, CPU and memory to the requested resources to avoid using the defaults:

``` bash
#!/bin/bash
#
#SBATCH --ntasks=1 --cpus-per-task=1 --mem=1g
#SBATCH --time=5:00

./fibo.pl
```
(See [``fibo-solution.slurm``](fibo-solution.slurm))