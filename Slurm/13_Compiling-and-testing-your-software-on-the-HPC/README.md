# Chapter 13: Compiling and testing your programs on the HPC

## 13.3.1: A simple sequential program in C

[``hello.c'](hello.c) is a simple sequential C program that should compile
with practically any C compiler.

When compiling code, it is important to specify proper options for
code optimization
  * The Intel compilers default to a reasonable optimisation level but
    optimise for a generic (Pentium 4-level) processor which means that
    none of the modern vector instructions on our cluster are used. For
    many programs, and in particular floating point-intensive program though
    also an increasing number of integer-intensive programs, this is a lot
    of potential performance that you leave unused.
  * The GNU compilers are even worse. They default to the ``-O0`` optimisation
    level which is really optimisation for debugging. Behind this is a difference
    in philosophy between the Intel and GNU compilers. The GNU compilers are
    really targetting developers and assume that they know very well what they
    are doing. Since a developer spends most of their time debugging, the compile
    options for debugging are the default. The Intel compilers target regular users
    who get a code that they need to compile before they can use it, but do
    take into account that a user may compile on one and run on another machine,
    so the default is a pretty safe set of options that still offers a reasonable
    level of optimisation.

Both the GNU and the Intel compilers have a compiler option to produce a binary
that is optimal for the host. For the Intel compiler this option is ``-xHost``
and for the GNU compilers ``-march=native``. There is a big catch however:
``-xHost`` only works on Intel-made processors. On compatible x86 CPUs, it
falls back to the Pentium 4 code path. Hence on Vaughan or other AMD Epyc-based
systems in the VSC, you should use ``-march=core-avx2`` instead.

So now try to compile the ``hello.c`` program.

### Solution

  * With the Intel compilers, on AMD Rome systems such as vaughan:
    ``` bash
    module load calcua/2020a intel/2020a
    icc -O2 -march=core-avx2 hello.c -o hello
    ```
  * With the Intel compilers, on any system with an Intel-made CPU:
    ``` bash
    module load calcua/2020a intel/2020a
    icc -O2 -xHost hello.c -o hello
    ```
  * With the GNU compiler from the calcua/2020a software stack:
    ``` bash
    module load calcua/2020a GCC/9.3.0
    gcc -O3 -march=native hello.c -o hello
    ```

The [``hello1.slurm``](hello1.slurm) and [``hello2.slurm``](hello2.slurm) scripts
can then be used to launch a job running the program.


## 13.3.2. Compiling a parallel program in C/MPI

To compile a MPI program, one typically uses wrappers that automatically
add the appropriate options to find the MPI include files and link to the
appropriate libraries.

The precise names of those wrapper scripts depend on the MPI implementation
that you use and sometimes also on the compiler that those wrappers should
use. In other cases those compilers have to be specified through environment
variables. However, at UAntwerpen, the following should work:

  * Intel compilers with Intel MPI, through loading an Intel module:
      * ``mpiicc`` for compiling C programs
      * ``mpiicpc`` for compiling C++ programs
      * ``mpiifort`` for compiling Fortran programs
  * GNU compilers with Intel MPI, through loading an Intel module (which also
    provides the GNU compilers)
      * ``mpigcc`` for compiling C programs
      * ``mpigxx`` for compiling C++ programs
      * ``mpif77`` for compiling Fortran 77 programs with gfortran
      * ``mpif90`` for compiling Fortran 90 programs with gfortran
  * The standard wrappers of Intel MPI ``mpicc``, ``mpicxx`` and ``mpifc``
    default to the GNU compilers. Executing those commands without arguments
    will tell you how to select a different compiler.
  * Open MPI (in installed) provides the ``mpicc``, ``mpicxx`` and ``mpifort`` wrappers.

Now use this information to compile and run the [``mpihello.c``](mpihello.c)
example.

### Solution

  * With the Intel compilers, on AMD Rome systems such as vaughan:
    ``` bash
    module load calcua/2020a intel/2020a
    mpiicc -O2 -march=core-avx2 mpihello.c -o mpihello
    ```
  * With the Intel compilers, on any system with an Intel-made CPU:
    ``` bash
    module load calcua/2020a intel/2020a
    mpiicc -O2 -xHost mpihello.c -o mpihello
    ```
  * With Intel MPI but the GNU compilers:
    ``` bash
    module load calcua/2020a intel/2020a
    mpigcc -O3 -march=native mpihello.c -o mpihello
    ```

The [``mpihello1.slurm``](mpihello1.slurm) and [``mpihello2.slurm``](mpihello2.slurm) scripts
can then be used to launch a job running the program.
