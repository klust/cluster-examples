# A more advanced areduce example

In this demo ``areduce`` is used to reduce the output files of a job to a
single .csv file. This demo demonstrates how reduce can still be used to
reduce the output of a series of jobs of which some did not end successfully.

Make sure a software stack module with support for ``atools`` is loaded
(e.g., ``calcua/2020a``), and then:

  * Run [``demo.sh``](demo.sh),

or

  * Execute the [``submit.sh](submit.sh) script
  * When all jobs have finished, run the [``summary.sh``](summary.sh) script
    to see the use of ``areduce``.
  * Execute [``clean.sh``](clean.sh) to clean up before a new run.
