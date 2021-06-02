# Chapter 7: Multi core jobs / parallel computing

## Chapter 7.2: Parallel computing with (Posix) threads

Example program code: [``T_hello.c``](T_hello.c).

  * Compiling with the Intel compilers:
      * Load an intel module
      * ``icc -O2 -lpthread T_hello.c -o T_hello``
        The -lpthread flag adds the pthread library to the list of libraries that
        need to be linked into the code.
  * Compiling with the GNU compilers
      * Load a GCC, foss or intel module (all three contain the gcc compiler)
      * ``gcc -O3 -march=native -lpthread T_hello.c -o T_hello``
  * Run with the included job script [``T_hello.slurm``](T_hello.slurm) (Intel
    compiler or GCC from the Intel module, replace modules for other compilers).
  * Note that in this example, the number of threads is hard-coded in the
    source file ``T_hello.c``! Requesting more cores than the program requires,
    doesn't make sense.


## Chapter 7.3: Parallel Computing with OpenMP

Example 1: [``omp1.c``](omp1.c): A for-loop parallelized with OpenMP

  * Compiling with the Intel compilers:
      *  Load an intel module
      *  ``icc -O2 -qopenmp omp1.c -o omp1``
         The ``-qopenmp`` flag enables OpenMP parallelisation by the compiler.
  * Compiling with the GNU compilers
      * Load a GCC, foss or intel module (all three contain the gcc compiler)
      * ``gcc -O3 -march=native --openmp omp1.c -o omp1``
  * Run with the included job script [``omp1.slurm``](omp1.slurm) (Intel compiler or GCC
    from the Intel module, replace modules for other compilers).
  * In principle, OpenMP programs get the number of threads they should use
    through the environment variable OMP_NUM_THREADS. IF not specified, the
    default in most programs is the number of cores on the node and the program
    usually fails to see that not all cores are allocated to it. However, Intel
    OpenMP usually manages to get the correct number of threads from Slurm so
    when using Slurm, ``OMP_NUM_THREADS`` is not really needed in this example.


Example 2: [``omp2.c``](omp2.c): More advanced use of OpenMP, demonstrating a critical
section and thread-private variables

  * Compiling with the Intel compilers:
      * Load an intel module
      * ``icc -O2 -qopenmp omp2.c -o omp2``
  * Compiling with the GNU compilers
      * Load a GCC, foss or intel module (all three contain the gcc compiler)
      * ``gcc -O3 -march=native --openmp omp2.c -o omp2``
  * Run with the included job script [``omp2.slurm``](omp2.slurm) (Intel
    compiler or GCC from the Intel module, replace modules for other compilers).

Example 3: [``omp3.c``](omp3.c): Demonstrates reductions done through OpenMP pragmas

  * Compiling with the Intel compilers:
      * Load an intel module
      * ``icc -O2 -qopenmp omp3.c -o omp3``
  * Compiling with the GNU compilers
      * Load a GCC, foss or intel module (all three contain the gcc compiler)
      * ``gcc -O3 -march=native --openmp omp3.c -o omp3``
  * Run with the included job script [``omp3.slurm``](omp3.slurm) (Intel compiler
    or GCC from the Intel module, replace modules for other compilers)


## Chapter 7.4: Parallel computing with MPI

[``mpi_hello.c``](mpi_hello.c) is a simple "Hello, world"-program using MPI with
some simple communication.

  * Compiling with the Intel compilers for Intel MPI:
      * Load an intel module
      * ``mpiicc -O2 mpi_hello.c -o mpi_hello``
      * Run with the included job script [``mpi_hello.slurm``](mpi_hello.slurm).
  * Compiling with gcc and Intel MPI:
      * Load an intel module.
      * ``mpigcc -O3 -march=native mpi_hello.c -o mpi_hello``
      * Run with the included job script (same as above).
