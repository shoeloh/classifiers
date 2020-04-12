# ABOUT
In this code I implement various classification techniques on the Pima dataset.  

More information on this dataset can be obtained at:  
https://archive.ics.uci.edu/ml/datasets/Pima+Indians+Diabetes  

## I. Exploratory Data Analysis:	 
In the first phase I analyze the independent variables or attributes and examine their properties such as range, variation and distribution.  

Note that the independent variables are also referred to as attributes and refer to the variables other than the class variables.  

1. Create the following plots: histogram and bar plot. Write a short note on the distribution of the variables that I observe from the plots.  

2. Find the correlation between each of the attributes and the class variable. Convert the factor variable to a numeric variable to perform this calculation.  
 

3. Compute the correlation between all pairs of the 8 attributes. Which two have the highest mutual correlation?  
 
  
## II. Naïve Bayesian Classifier:  
In the second phase I build a naive Bayesian classifier for the Pima dataset.  

1. Find a good R package that does the naive Bayesian classification.  

2. Using a random number generator, split the Pima dataset into a 90:10 training:testing split. Use the training data to build a naive Bayesian model and then use the model to find the prediction of the test data. Repeat this experiment 10 times using different samples each time.  

3. For each experiment, compute the accuracy. Also compute the average accuracy over the 10 experiments. Accuracy is defined as = Number of correct predictions / Total instances in the test data.  

## III. SVM Classifier:  
In the third phase I repeat for a SVM classifier.  

1. Repeat the steps in Part II, but this time with a SVM classifier using default kernel.  

2. Report the accuracy on 10 different training samples and also the average accuracy.  

3. Change the value of the kernel from the default to a) linear b) polynomial c) RBF d) sigmoid. Carry out 10 different experiments using different samples and each of the kernels above. Report the average accuracy in each case.  

## IV. K-Nearest Neighbor (KNN) Classifier:  
In the fourth phase I repeat for a KNN classifier.  

1. Choose 5 different values of k (3, 5, 7, 9, and 11) and carry out 10 experiments each using different samples of training and test data.  

# COMPILING, INSTALLATION AND RUNNING  
Program files are exploratory_analysis.R, naive_bayes.R, SVM.R and KNN.R.  

## Compiling:  

No compiling of R … its an interpreted language.  

## How to run the code and a genric run command statement along with an example test cases below the general statement.  

Assumes RPart is installed. If not run:  
> install.packages("rpart", dependencies=TRUE)  

Run the code using the RScipt wrapper files.  

Generic run command: Rscript exploratory_analysis_wrapper.R arg[1]  

Example using directory structure as unpacked:  
$ Rscript exploratory_analysis_wrapper.R data/pima-indians-diabetes.data  

## RESULTS  

Results are shown in the Results.pdf files  

Results are also sent to the Console.  

## LICENSE  
[MIT License](https://github.com/shoeloh/classifiers/blob/master/LICENSE)  

