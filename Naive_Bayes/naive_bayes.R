# naive_bayes.R
#
# Naïve	Bayesian Classifier	
# 
# Author: Shane Zabel
###############################################################################

#Use sink to output Console to file when runnng via RScript
sink(outfile,split=TRUE)

###############################################################################
# 1. Find a	good R	package that does naïve	Bayesian classification
###############################################################################

#Uncomment line below if e1071 package is not installed
#install.packages("e1071", dependencies=TRUE)
#Uncomment line below if caret package is not installed
#install.packages("caret", dependencies=TRUE)

#Load and attach the e1071 package
library(e1071)
#Load and attach the caret package
library(caret)

###############################################################################
# 2. Split the Pima data into a 90:10 ratio for training and testing
###############################################################################
###############################################################################
# 3. Use the training data to build a naïve Bayesian model 
#    and then use the model to find the prediction on the test data.
#	 Repeat this experiment 10 times using different samples each time.
###############################################################################

#Load training data
trainingdata=read.csv(trdata,header=FALSE)

acc <- NULL # Creates empty storage container
ans <- NULL # Creates empty storage container

for(i in 1:10){
	#Divide the dataset into two parts. 90% for training data and 10% for test data
	train90<-sample(nrow(trainingdata),size=nrow(trainingdata)*0.9)
	trainingData90<-trainingdata[train90,]
	testData10<-trainingdata[-train90,]
	
	#Use the training data to build a naïve Bayesian model using the "e1071" package: naiveBayes function
	model <- naiveBayes(as.factor(V9) ~ .,data=trainingData90)

	#Use the model to find the prediction on the test data
	pred <- predict(model, testData10)

	#Calculate the accuracy of the model using the "caret" package: confusionMatrix function
	acc <- confusionMatrix(pred, testData10$V9)
	ans <- c(ans,acc$overall[1])
}

#Report the Output in a Table
repDisplayAns <- c("Table Containing Accuracies for Each Experiment")
print(repDisplayAns,quote=FALSE)
displayAns <- matrix(c(1:10,ans),ncol=2,byrow=FALSE)
colnames(displayAns) <- c("Experiment","Accuracy")
rownames(displayAns) <- NULL
print(displayAns,quote=FALSE)

#Report the Average Accuracy
avgAcc <- sum(ans)/10
repAvgAcc <- c("Overall Accuracy = ",avgAcc)
print(repAvgAcc,quote=FALSE)
