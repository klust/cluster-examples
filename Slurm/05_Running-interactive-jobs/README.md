# Chapter 5: Running interactive jobs

## Section 5.2 Interactive jobs, without X support, primes.py example

``primes.py`` is a simple Python script that can be run using the system Python.
There is no need to load a Python module for this example. Try to run it on the
command line of a compute node anc compute all prime numbers between 1 and 20.

### Solution

This is not a parallel program at all, so we really need only one core. The best
way to get this, is through ``srun``. Assuming you're running from the directory
that contains ``primes.py``:

``` bash
login$ srun -n 1 -c 1 -t 15:00 --pty bash
r3c01cn3$ ./primes.py
This program calculates all primes between 1 and your upper limit.
Enter your upper limit (>1): 20
Start Time:  2021-06-01 15:36:23
[Prime#1] = 2
[Prime#2] = 3
[Prime#3] = 5
[Prime#4] = 7
[Prime#5] = 11
[Prime#6] = 13
[Prime#7] = 17
[Prime#8] = 19
End Time:  2021-06-01 15:36:23
Duration:  0 seconds.
r3c01cn3$ exit
```

The ``exit`` command at the end leaves the interactive shell on the compute node
and returns to the login node.

## Section 5.3 Interactive jobs, with graphical support

One way to run an interactive job with X11 on a compute node is by using ``salloc``
to create an allocation and then use ``ssh -X $SLURM_NODELIST``, or if that fails,
``ssh -Y $SLURM_NODELIST``. The latter is less secure but may be necessary depending
on how you have set up security for X11.

In this setup it is essential that you effectively allocate only CPUs on a single node.
Otherwise you'll need to extract the first node from $LURM_NODELIST. Moreover, X11
programs usually are single core or shared memory programs so more than one task doesn't
make sense in those scenarios.


### Example: message.py

``message.py`` is a simple Python script that displays a simple message box on the
screen using X11.

#### Solution

``` bash
login$ salloc -n 1 -c 1 -t 15:00
login$ ssh -Y $SLURM_NODELIST
rXcYYcnZ$ cd /apps/antwerpen/examples/Slurm/05_Running-interactive-jobs
rXcYYcnZ$ ./message.py
```
If it succeeds, you'll get a message box asking you if you want to see a cow, and
if you click "yes" you'll get a cow in ASCII-art in your terminal window. If the
program fails to use X11 it'll just print an error message and then show the cow
in ASCII art.


### Example: fibo2.m

Note that we do not advise to use Matlab on the cluster with graphics. It will be a
very unpleasant experience. Running X programs over long distance high latency connections
doesn't work very well. Using a VNC session on the login nodes (not yet supported on
Vaughan) is the most acceptable way to get some performance, and you can execute the
commands below also from a terminal window in your VNC session.

``fibo2.m`` is a simple Matlab script. The purpose of this exercise is to get Matlab
running and then run a simple Matlab program.

**MATLAB graphics does not currently work on the compute nodes of Vaughan.**

#### Solution

On Leibniz (future, when Slurm is set up over there), assuming that some work will be
done in Matlab that parallelizes well so requesting all cores of a node:

``` bash
login$ salloc -n 1 -c 28 -t 1:00:00
login$ ssh -Y $SLURM_NODELIST
rXcYYcnZ$ cd /apps/antwerpen/examples/Slurm/05_Running-interactive-jobs
rXcYYcnZ$ module load calcua/2020a MATLAB/R2020a
rXcYYcnZ$ matlab
```
and you can then run ``fibo2`` in Matlab. It should show a series of numbers and then
plot them in a figure window.
