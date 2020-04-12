# KNN.R
#
# KNN Classifier	
# 
# Author: Shane Zabel
#  
###############################################################################

#Use sink to output Console to file when runnng via RScript
sink(outfile,split=TRUE)

###############################################################################
# 1. Find a	good R	package that does naïve	Bayesian classification
###############################################################################

#Uncomment line below if caret package is not installed
#install.packages("caret", dependencies=TRUE)

#Load and attach the class package
library(class)
#Load and attach the caret package
library(caret)

###############################################################################
# 2. Split the Pima data into a 90:10 ratio for training and testing
###############################################################################
###############################################################################
# 3. Use the training data to build a KNN model 
#    and then use the model to find the prediction on the test data.
#	 Repeat this experiment 10 times using different samples each time.
###############################################################################

#Load training data
trainingdata <- read.csv(trdata,header=FALSE)

# Create empty storage containers
ans1 <- NULL 
ans2 <- NULL
ans3 <- NULL 
ans4 <- NULL 
ans5 <- NULL

for(i in 1:10){
	#Divide the dataset into two parts. 90% for training data and 10% for test data
	train90 <- sample(nrow(trainingdata),size=nrow(trainingdata)*0.9)
	trainingData90 <- trainingdata[train90,]
	testData10 <- trainingdata[-train90,]
	
	#Use the training data to build a K-Nearest Neighbor model using the "class" package: knn function
	#Repeat for k-values of 3,5,7,9, and 11
	model1 <- knn(trainingData90,testData10,as.factor(trainingData90$V9),k=3)
	model2 <- knn(trainingData90,testData10,as.factor(trainingData90$V9),k=5)
	model3 <- knn(trainingData90,testData10,as.factor(trainingData90$V9),k=7)
	model4 <- knn(trainingData90,testData10,as.factor(trainingData90$V9),k=9)
	model5 <- knn(trainingData90,testData10,as.factor(trainingData90$V9),k=11)
	
	#Calculate the accuracies of the models using the "caret" package: confusionMatrix function
	acc1 <- confusionMatrix(model1, testData10$V9)
	acc2 <- confusionMatrix(model2, testData10$V9)
	acc3 <- confusionMatrix(model3, testData10$V9)
	acc4 <- confusionMatrix(model4, testData10$V9)
	acc5 <- confusionMatrix(model5, testData10$V9)
	
	#Store accuracies
	ans1 <- c(ans1,acc1$overall[1])
	ans2 <- c(ans2,acc2$overall[1])
	ans3 <- c(ans3,acc3$overall[1])
	ans4 <- c(ans4,acc4$overall[1])
	ans5 <- c(ans5,acc5$overall[1])
}

#Calculate the Average Accuracies
avgAcc1 <- sum(ans1)/10
avgAcc2 <- sum(ans2)/10
avgAcc3 <- sum(ans3)/10
avgAcc4 <- sum(ans4)/10
avgAcc5 <- sum(ans5)/10
avgAcc <- c(avgAcc1,avgAcc2,avgAcc3,avgAcc4,avgAcc5)

#Report the Output in a Table
repDisplayAns <- c("Table Containing Accuracies for 10 Experiments for Each k-value")
print(repDisplayAns,quote=FALSE)
displayAns <- matrix(c(3,5,7,9,11,avgAcc),ncol=2,byrow=FALSE)
colnames(displayAns) <- c("k","Average Accuracy of 10 Experiments")
rownames(displayAns) <- NULL
print(displayAns,quote=FALSE)
