# A first areduce example

In this demo ``areduce`` is used to reduce the output files of a job to a
single .csv file. This demo is the simple case, where all jobs are supposed
to have completed successfully.

Make sure a software stack module with support for ``atools`` is loaded
(e.g., ``calcua/2020a``), and then:

  * Run [``demo.sh``](demo.sh),

or

  * Execute the [``submit.sh](submit.sh) script
  * When all jobs have finished, run the [``summary.sh``](summary.sh) script
    to see the use of ``areduce``.
  * Execute [``clean.sh``](clean.sh) to clean up before a new run.

