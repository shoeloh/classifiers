# KNN.R Wrapper
#
# KNN Classifier on the Pima dataset.
# 
# Author: Shane Zabel
#  
###############################################################################

#Wrapper takes one argument. 
#Argument is the location of the data file.

#Example:
#$ Rscript KNN_wrapper.R data/pima-indians-diabetes.data

args <- commandArgs(TRUE)
trdata <- args[1]

outfile <- "Rconsole.txt"

#Run the R program with the file locations set

source("KNN.R")

