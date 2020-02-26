Demo for analysing log files of a regular array job.

* Run demo.sh, or

* Execute the submit1 script
  This is written in such a way that some jobs will actually produce a failure
  note in the log file, and that only the first 80 jobs end and the first 90
  produce a start line in the log file.
* Run summary1 to analyse the results
* Execute the submit2 script.
  The job script should now only produce successful runs.
* Run summary2 to verify the results.
  Note that now arange will use two log files.
* Run the cleanup script for your scheduler.
  Don't test again without doing this!
