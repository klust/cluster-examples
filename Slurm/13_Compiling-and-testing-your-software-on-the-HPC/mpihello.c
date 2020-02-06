/*
 * VSC        : Flemish Supercomputing Centre
 * Tutorial   : Introduction to HPC
 * Description: Example program, to compile with MPI
 */
#include <stdio.h>
#include <mpi.h>

void main(int argc, char **argv)
{
  int rank, i, j;
  float f;

  MPI_Init(&argc,&argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
   
  printf("Hello World from MPI rank %d.\n", rank);
  for (i=0; i<=100000; i++)
    f=i*2.718281828*i+i+i*3.141592654;

  MPI_Finalize();
}
