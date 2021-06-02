# Extended demo 3 for analysing log files, with aload

Make sure a software stack module with support for ``atools`` is loaded
(e.g., ``calcua/2020a``), and then:

  * Run [``demo.sh``](demo.sh),

or

  * Execute the [``submit1.sh``](submit1.sh) script
    Look at how ``arange`` is used to determine the array indices.
  * When all jobs have finished, execute the [``summary1.sh``](summary1.sh) script
    This will show how the log can be analyzed
  * Execute the [``submit2.sh``](submit2.sh) script to re-run for all failed or todo job items
  * When all jobs have finished, execute the [``summary2.sh``](summary2.sh)
    script to analyse the complete results and the
    results of the second script only.
  * Execute [``clean.sh``](clean.sh) to clean up before a new run.
