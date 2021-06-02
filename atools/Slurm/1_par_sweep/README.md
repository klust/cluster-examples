# Simple parameter sweep demo with atools.

This example runs the [``weather``](weather) script for a range of input values
specified as rows in a comma-separated spreadsheet file.

  * Make sure a software stack module with support for ``atools`` is loaded
    (e.g./, ``calcua/2020a``), and then:
  * Execute the submit script [``submit.sh``](submit.sh)
    Look at how ``arange`` is used to determine the array indices in
    that script.
  * Observe the output that is generated.
  * [``clean.sh``](clean.sh) can then be used to clean the directory again.
