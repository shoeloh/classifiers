# exploratory_analysis.R
#
# Implement various classification techniques on the Pima dataset.
# 
# Author: Shane Zabel
###############################################################################

#Use sink to output Console to file when runnng via RScript
sink(outfile,split=TRUE)

#Set output plot flag. TRUE saves plots to files. FALSE does not.
#Plots are sent to R Graphics in either case
plotflag<-TRUE 

###############################################################################
# I. Exploratory Data Analysis:
###############################################################################

#Load training data
trainingdata=read.csv(trdata,header=FALSE)

#1. Create the following plots: histogram, and barplot.	
hist(trainingdata$V1,plot=TRUE,main="Histogram of Number of times pregnant")
hist(trainingdata$V2,plot=TRUE,main="Histogram of Plasma glucose concentration a 2 hours in an oral glucose tolerance test")
hist(trainingdata$V3,plot=TRUE,main="Histogram of Diastolic blood pressure (mm Hg)")
hist(trainingdata$V4,plot=TRUE,main="Histogram of Triceps skin fold thickness (mm)")
hist(trainingdata$V5,plot=TRUE,main="Histogram of 2-Hour serum insulin (mu U/ml)")
hist(trainingdata$V6,plot=TRUE,main="Histogram of Body mass index (weight in kg/(height in m)^2)")
hist(trainingdata$V7,plot=TRUE,main="Histogram of Diabetes pedigree function")
hist(trainingdata$V8,plot=TRUE,main="Histogram of Age (years)")
hist(trainingdata$V9,plot=TRUE,main="Histogram of Class variable (0 or 1)")

#Save plots to file if flagged
if(plotflag==TRUE){
	jpeg('Histogram1.jpg')
	par(mar=c(2.0,2.0,2.0,2.0))
	hist(trainingdata$V1,plot=TRUE,main="Histogram of Number of times pregnant")
	dev.off()
	
	jpeg('Histogram2.jpg')
	par(mar=c(2.0,2.0,2.0,2.0))
	hist(trainingdata$V2,plot=TRUE,main="Histogram of Plasma glucose concentration at 2 hours")
	dev.off()
	
	jpeg('Histogram3.jpg')
	par(mar=c(2.0,2.0,2.0,2.0))
	hist(trainingdata$V3,plot=TRUE,main="Histogram of Diastolic blood pressure (mm Hg)")
	dev.off()
	
	jpeg('Histogram4.jpg')
	par(mar=c(2.0,2.0,2.0,2.0))
	hist(trainingdata$V4,plot=TRUE,main="Histogram of Triceps skin fold thickness (mm)")
	dev.off()
	
	jpeg('Histogram5.jpg')
	par(mar=c(2.0,2.0,2.0,2.0))
	hist(trainingdata$V5,plot=TRUE,main="Histogram of 2-Hour serum insulin (mu U/ml)")
	dev.off()
	
	jpeg('Histogram6.jpg')
	par(mar=c(2.0,2.0,2.0,2.0))
	hist(trainingdata$V6,plot=TRUE,main="Histogram of Body mass index (weight in kg/(height in m)^2)")
	dev.off()
	
	jpeg('Histogram7.jpg')
	par(mar=c(2.0,2.0,2.0,2.0))
	hist(trainingdata$V7,plot=TRUE,main="Histogram of Diabetes pedigree function")
	dev.off()
	
	jpeg('Histogram8.jpg')
	par(mar=c(2.0,2.0,2.0,2.0))
	hist(trainingdata$V8,plot=TRUE,main="Histogram of Age (years)")
	dev.off()
	
	jpeg('Histogram9.jpg')
	par(mar=c(2.0,2.0,2.0,2.0))
	hist(trainingdata$V9,plot=TRUE,main="Histogram of Class variable (0 or 1)")
	dev.off()
}

#Plot bar plots
barplot(trainingdata$V1,plot=TRUE,main="Bar plot of Number of times pregnant")
barplot(trainingdata$V2,plot=TRUE,main="Bar plot of Plasma glucose concentration at 2 hours")
barplot(trainingdata$V3,plot=TRUE,main="Bar plot of Diastolic blood pressure (mm Hg)")
barplot(trainingdata$V4,plot=TRUE,main="Bar plot of Triceps skin fold thickness (mm)")
barplot(trainingdata$V5,plot=TRUE,main="Bar plot of 2-Hour serum insulin (mu U/ml)")
barplot(trainingdata$V6,plot=TRUE,main="Bar plot of Body mass index (weight in kg/(height in m)^2)")
barplot(trainingdata$V7,plot=TRUE,main="Bar plot of Diabetes pedigree function")
barplot(trainingdata$V8,plot=TRUE,main="Bar plot of Age (years)")
barplot(trainingdata$V9,plot=TRUE,main="Bar plot of Class variable (0 or 1)")

#Save plots to file if flagged
if(plotflag==TRUE){
	jpeg('Bar1.jpg')
	par(mar=c(2.0,2.0,2.0,2.0))
	barplot(trainingdata$V1,plot=TRUE,main="Bar plot of Number of times pregnant")
	dev.off()
	
	jpeg('Bar2.jpg')
	par(mar=c(2.0,2.0,2.0,2.0))
	barplot(trainingdata$V2,plot=TRUE,main="Bar plot of Plasma glucose concentration at 2 hours")
	dev.off()
	
	jpeg('Bar3.jpg')
	par(mar=c(2.0,2.0,2.0,2.0))
	barplot(trainingdata$V3,plot=TRUE,main="Bar plot of Diastolic blood pressure (mm Hg)")
	dev.off()
	
	jpeg('Bar4.jpg')
	par(mar=c(2.0,2.0,2.0,2.0))
	barplot(trainingdata$V4,plot=TRUE,main="Bar plot of Triceps skin fold thickness (mm)")
	dev.off()
	
	jpeg('Bar5.jpg')
	par(mar=c(2.0,2.0,2.0,2.0))
	barplot(trainingdata$V5,plot=TRUE,main="Bar plot of 2-Hour serum insulin (mu U/ml)")
	dev.off()
	
	jpeg('Bar6.jpg')
	par(mar=c(2.0,2.0,2.0,2.0))
	barplot(trainingdata$V6,plot=TRUE,main="Bar plot of Body mass index (weight in kg/(height in m)^2)")
	dev.off()
	
	jpeg('Bar7.jpg')
	par(mar=c(2.0,2.0,2.0,2.0))
	barplot(trainingdata$V7,plot=TRUE,main="Bar plot of Diabetes pedigree function")
	dev.off()
	
	jpeg('Bar8.jpg')
	par(mar=c(2.0,2.0,2.0,2.0))
	barplot(trainingdata$V8,plot=TRUE,main="Bar plot of Age (years)")
	dev.off()
	
	jpeg('Bar9.jpg')
	par(mar=c(2.0,2.0,2.0,2.0))
	barplot(trainingdata$V9,plot=TRUE,main="Bar plot of Class variable (0 or 1)")
	dev.off()
}

#2. Find the correlation between each of the attributes and the class variable.

C19<-cor(x = trainingdata$V1, y = trainingdata$V9, use = "everything", method = "pearson")
C29<-cor(x = trainingdata$V2, y = trainingdata$V9, use = "everything", method = "pearson")
C39<-cor(x = trainingdata$V3, y = trainingdata$V9, use = "everything", method = "pearson")
C49<-cor(x = trainingdata$V4, y = trainingdata$V9, use = "everything", method = "pearson")
C59<-cor(x = trainingdata$V5, y = trainingdata$V9, use = "everything", method = "pearson")
C69<-cor(x = trainingdata$V6, y = trainingdata$V9, use = "everything", method = "pearson")
C79<-cor(x = trainingdata$V7, y = trainingdata$V9, use = "everything", method = "pearson")
C89<-cor(x = trainingdata$V8, y = trainingdata$V9, use = "everything", method = "pearson")
corVals<-c(C19,C29,C39,C49,C59,C69,C79,C89)

#Make pretty for display
repDisplayAns<-c("Table Containing the Correlation Between Each of the Attributes and the Class Variable.")
print(repDisplayAns,quote=FALSE)
corArray<-array(data=corVals,dim=length(corVals))
dimnames(corArray) <- list( 
	c("Att 1", "Att 2", "Att 3", "Att 4", "Att 5", "Att 6", "Att 7", "Att 8") # column names
)  
print(corArray)

#3. Compute the correlation between all pairs of the 8 attributes. Which two attributes have the highest mutual correlation?
C<-cor(x = trainingdata[,1:8], use = "everything", method = "pearson")
maxC<-0
maxrow<-0
maxcol<-0
for (i in 1:nrow(C) ) {
	for (j in 1:ncol(C) ) {
		if(i!=j){
			if(C[i,j]>maxC){
				maxC<-C[i,j]
				maxrow<-i
				maxcol<-j
			}
		}
	}
}
maxCor<-c(maxC,maxrow,maxcol)

#Make pretty for display
repDisplayAns<-c("Table Containing the Highest Mutual Correlation Between All Pairs of the 8 Attributes.")
print(repDisplayAns,quote=FALSE)
maxArray<-array(data=maxCor,dim=length(maxCor))
dimnames(maxArray) <- list( 
		c("Correlation Value", "Attribute 1", "Attribute  2") # column names
)  
print(maxArray)
