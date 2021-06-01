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

*These examples do not currently work.*

### Example: message.py

``message.py`` is a simple Python script that displays a simple message box on the
screen using X11.

### Example: fibo2.m

``fibo2.m`` is a simple Matlab script. The purpose of this exercise is to get Matlab
running and then run a simple Matlab program.
