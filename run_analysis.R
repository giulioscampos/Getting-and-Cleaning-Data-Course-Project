## Setting Working Directory:
setwd("C:/Users/Data Science/Johns Hopkins/Curso 3 - Getting and Cleaning data/Week 4/Assigment")

## Checking if folder "Downloaded Data" exists. If not, creates the folder:
if(!file.exists("Downloaded Data")){
        dir.create("Downloaded Data")
}

## Downloading the data for the project into "Downloaded Data" folder
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "C:\\Users\\Data Science\\Johns Hopkins\\Curso 3 - Getting and Cleaning data\\Week 4\\Assigment\\Downloaded Data\\UCI HAR Dataset.zip")

## Setting New Working Directory (inside "Downloaded Data" folder)
setwd("C:/Users/Data Science/Johns Hopkins/Curso 3 - Getting and Cleaning data/Week 4/Assigment/Downloaded Data")

## Unziping the downloaded data
unzip(zipfile = "UCI HAR Dataset.zip")

## Loading into R all seven files we are using for the project
ActivityTest  <- read.table("UCI HAR Dataset/test/y_test.txt")
ActivityTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
SubjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
SubjectTest  <- read.table("UCI HAR Dataset/test/subject_test.txt")
DataTest  <- read.table("UCI HAR Dataset/test/X_test.txt" )
DataTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
ActivityLabels<-read.table("UCI HAR Dataset/activity_labels.txt")
FeatureNames<-read.table("UCI HAR Dataset/features.txt")

## Merging the training and the test sets
DataActivity<-rbind(ActivityTest,ActivityTrain)
DataSubject<-rbind(SubjectTest,SubjectTrain)
Data<-rbind(DataTest,DataTrain)

## Loading DPLYR package
library(dplyr)

## Inserting Activity Labels at DataActivity Set
DataActivity<-merge(DataActivity,ActivityLabels,"V1")

## Renaming V2 variable and Excluding V1 variable from DataActivity Set
DataActivity<- rename(DataActivity, Activity = V2)
DataActivity<-select(DataActivity, Activity)

## Renaming DataSubject Set
DataSubject<-rename(DataSubject, Subject = V1)

## Setting Data Set Variables Names using FeatureNames
DataColNames<-as.character(FeatureNames$V2)
Data<-`colnames<-`(Data,DataColNames)

## Merging DataActivity, DataSubject and Data to create one Data Set
DataSubAct<-cbind(DataSubject,DataActivity)
DataTotal<-cbind(DataSubAct,Data)

## Extracting only the measurements on the mean and standard deviation for each measurement
SelectedCol<-as.character(FeatureNames$V2[grep("mean\\(\\)|std\\(\\)",FeatureNames$V2)])
DataTotalSub<-DataTotal[c("Activity","Subject",SelectedCol)]

## Creating a second, independent tidy data set with the average of each variable for each activity and each subject
TidyData<-aggregate(. ~Subject + Activity, DataTotalSub, mean)
TidyData<-arrange(TidyData, Subject, Activity)
View(DataTotalSub)
View(TidyData)
write.table(TidyData, file = "tidydata.txt",row.name=FALSE)
