# Chapter 11: Fine-tuning job specifications

This directory contains 3 test programs:

  * [``eat_mem.c``](eat_mem.c) is a test program that simulates growing memory use
    so that you can see how to detect memory use and see when a program crashes. It
    is discussed in chapter 11.2. ``eat_mem`` is also included in the
    ``vsc-tutorial`` module.

  * [``eat_cpu.c``]()eat_cpu.c) is a test program that simulates CPU use so that you
    can experiment with tools to monitor CPU usage. It is discussed in chapter 11.3.

  * [``eat_disk.c``](eat_disk.c) is a simple program that generates a large file so
    that you can experiment with tools that monitor disk use.

Though we generally advise against the use of the system compiler to compile programs
as the compiler that comes with the OS is usually old and does not always support all
CPU features of newer machines, for these 3 programs it really doesn't matter at all
so you can compile them with the system gcc as indicated in the tutorial:

``` bash
gcc -O3 -march=native -o eat_mem eat_mem.c
gcc -O3 -march=native -o eat_cpu eat_cpu.c
gcc -O3 -march=native -o eat_disk eat_disk.c
```
