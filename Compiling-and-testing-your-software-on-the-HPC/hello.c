/*
 * VSC        : Flemish Supercomputing Centre
 * Tutorial   : Introduction to HPC
 * Description: Print 10 numbers, whilst waiting 1 second in between
 */
#include <stdio.h>
#include <unistd.h>

int main( int argc, char *argv[] )
{
  int i;
  for (i=0; i<10; i++)
  {
    printf("Hello #%d\n", i);
    fflush(stdout);
    sleep(1);
  }
}

