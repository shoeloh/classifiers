# SVM.R
#
# SVM Classifier	
# 
# Author: Shane Zabel
# 
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
# 3. Use the training data to build a SVM model 
#    and then use the model to find the prediction on the test data.
#	 Repeat this experiment 10 times using different samples each time.
###############################################################################

#Load training data. trdata is a command line parameter from the wrapper file.
trainingdata=read.csv(trdata,header=FALSE)

ans1 <- NULL # Creates empty storage container
ans2 <- NULL
ans3 <- NULL 
ans4 <- NULL 

for(i in 1:10){
	#Divide the dataset into two parts. 90% for training data and 10% for test data
	train90 <- sample(nrow(trainingdata),size=nrow(trainingdata)*0.9)
	trainingData90 <- trainingdata[train90,]
	testData10 <- trainingdata[-train90,]
	
	#Use the training data to build a Support Vector Machine model using the "e1071" package: svm function
	#Repeat for linear, polynomial, radial basis and sigmoid kernels
	model1 <- svm(as.factor(V9) ~ ., data=trainingData90, kernel="linear")
	model2 <- svm(as.factor(V9) ~ ., data=trainingData90, kernel="polynomial")
	model3 <- svm(as.factor(V9) ~ ., data=trainingData90, kernel="radial")
	model4 <- svm(as.factor(V9) ~ ., data=trainingData90, kernel="sigmoid")
	
	#Use the models to find the predictions on the test data
	pred1 <- predict(model1, testData10)
	pred2 <- predict(model2, testData10)
	pred3 <- predict(model3, testData10)
	pred4 <- predict(model4, testData10)
	
	#Calculate the accuracies of the models using the "caret" package: confusionMatrix function
	acc1 <- confusionMatrix(pred1, testData10$V9)
	acc2 <- confusionMatrix(pred2, testData10$V9)
	acc3 <- confusionMatrix(pred3, testData10$V9)
	acc4 <- confusionMatrix(pred4, testData10$V9)
	
	#Store accuracies
	ans1 <- c(ans1,acc1$overall[1])
	ans2 <- c(ans2,acc2$overall[1])
	ans3 <- c(ans3,acc3$overall[1])
	ans4 <- c(ans4,acc4$overall[1])
}

#Calculate the Average Accuracies
avgAcc1 <- sum(ans1)/10
avgAcc2 <- sum(ans2)/10
avgAcc3 <- sum(ans3)/10
avgAcc4 <- sum(ans4)/10
avgAcc <- c(avgAcc1,avgAcc2,avgAcc3,avgAcc4)

#Report the Accuracy on the 10 Different Training Samples for the Default(linear) Kernel 
repDisplayAns1<-c("Table Containing Accuracies for 10 Experiments for the Default SVM Kernel")
print(repDisplayAns1,quote=FALSE)
displayAns1 <- matrix(c(1:10,ans1),ncol=2,byrow=FALSE)
colnames(displayAns1) <- c("Experiment","Accuracy")
rownames(displayAns1) <- NULL
print(displayAns1,quote=FALSE)

#Report the Average Accuracy
repAvgAcc1 <- c("Overall Accuracy = ",avgAcc1)
print(repAvgAcc1,quote=FALSE)

#Report the Average Accuracy Over the 10 Different Training Samples for the Four Kernels 
repDisplayAns<-c("Table Containing Average Accuracies Over 10 Experiments for Each SVM Kernel")
print(repDisplayAns,quote=FALSE)
displayAns <- matrix(c(1:4,avgAcc),ncol=2,byrow=FALSE)
colnames(displayAns) <- c("Kernel","Average Accuracy of 10 Experiments")
rownames(displayAns) <- c("Linear","Polynomial","Radial","Sigmoid")
print(displayAns,quote=FALSE)
