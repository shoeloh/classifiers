README.txt

Shane Zabel

Naïve Bayesian Classifier on the Pima dataset.

-------------------
INCLUDED FILES (5):
-------------------
README.txt
Report.pdf
naive_bayes_wrapper.R
naive_bayes.R
/data/pima-indians-diabetes.data

--------------------------------
NOTES:
--------------------------------
Program was written in R

No compiling of R … its an interpreted language. 

REPORT.pdf contains detailed results.

Data is in the data directory.

Prints are sent to the Console.
Accuracies are printed to the Console.
Plots are sent to RGraphics

When using the wrapper script:
1) All RGraphics outputs are saved to Rplots.pdf
2) RConsole outputs are saved to Rconsole.txt

--------------------------------------------------------------------------------------------------------------------
How to run the code and a genric run command statement along with an example test cases below the general statement.
--------------------------------------------------------------------------------------------------------------------
Assumes the "e1071" and "caret" packages are installed. If not run:
install.packages("e1071", dependencies=TRUE)
install.packages("caret", dependencies=TRUE)

Run the code using the RScipt wrapper file: naive_bayes_wrapper.R 

Generic run command: naive_bayes_wrapper.R arg[1]

Wrapper takes one argument. 
Argument is the location of the data file 

Example using directory structure as unpacked:
$ Rscript naive_bayes_wrapper.R data/pima-indians-diabetes.data
