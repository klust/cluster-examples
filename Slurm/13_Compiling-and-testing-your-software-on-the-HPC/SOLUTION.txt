Example programs for chapter 13 of the tutorial text.

* hello.c: Simple single core "Hello, world"-program.
  - Compiling with Intel compilers:
    + Load the appropriate Intel compiler module
    + icc -O2 -xHost hello.c -o hello
    + hello1.slurm and hello2.slurm are two example jobscripts showing how
      to run that executable with slurm (sbatch hello1.slurm).
    + hello.pbs is the equivalent Torque job script
  - Compiling with GCC:
    + Load the appropriate GCC module
    + gcc -O3 -march=native hello.c -o hello
* mpihello.c: A very basic MPI "Hello, world"-program
  - Compiling with the Intel compilers:
    + Load the appropriate Intel compiler module
    + mpiicc -O2 -xHost mpihello.c -o mpihello
    + mpihello1.slurm and mpihello2.slurm are two example jobscripts showing how
      to run that executable with Slurm.
  - Compiling with Intel MPI and the GCC compilers
    + Load the appropriate Intel compiler module
    + mpigcc -O3 -march=native mpihello.c -o mpihello
    + mpihello1.slurm and mpihello2.slurm also work for this executable on Slurm
      sytems.
    + mpihello.pbs also works for this executable on system running Torque.
