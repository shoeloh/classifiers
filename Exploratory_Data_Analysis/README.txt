README.txt

Shane Zabel

Implement exploratory data analysis techniques on the Pima dataset.

-------------------
INCLUDED FILES (5):
-------------------
README.txt
REPORT.pdf
exploratory_analysis_wrapper.R
exploratory_analysis.R
/data/pima-indians-diabetes.data

------------------------
NOTES:
------------------------
Program was written in R

No compiling of R … its an interpreted language. 

Report.pdf contains detailed results.

Data is in the data directory.

Prints are sent to the RConsole.
Accuracies are printed to the RConsole.
Plots are sent to RGraphics

When using the wrapper script:
1) All RGraphics outputs are saved to Rplots.pdf
2) RConsole outputs are saved to Rconsole.txt

--------------------------------------------------------------------------------------------------------------------
How to run the code and a genric run command statement along with an example test cases below the general statement.
--------------------------------------------------------------------------------------------------------------------
No package dependencies

Run the code using the RScipt wrapper file: exploratory_analysis_wrapper.R 

Generic run command: Rscript exploratory_analysis_wrapper.R arg[1]

Wrapper takes one argument. 
Argument is the location of the data file 

Example using directory structure as unpacked:
$ Rscript exploratory_analysis_wrapper.R data/pima-indians-diabetes.data
