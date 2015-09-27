#Getting and Cleaning Data - Project 1

#Clear memory
rm(list=ls())

filename <- "getdata_dataset.zip"

#Download and unzip the dataset
#Not needed for this project as we can assume we have already downloaded the file
#But included for completeness
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

#Load the features and activities files
features_all<-read.table("UCI HAR Dataset/features.txt")
features<-as.character(features_all[,2])
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")

#Step 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
#Select only those features with either std or mean in their names. Remove the meanFreq columns as
#I am assuming we want those variables which have BOTH a mean and a std value
features_index<-intersect(grep("mean|std", features),grep("meanFreq", features,invert=TRUE))
features_names<-features[features_index]
rm(features_all,features)

#Step 4) Appropriately labels the data set with descriptive variable names. 
#Remove brackets and replace dashes with underscores
features_names<-gsub("[()]","",features_names)
features_names<-gsub("-","_",features_names)
#Change the names below just to be consistent with the format of the other names
features_names<-gsub("Mag_mean","_mean_Mag",features_names)
features_names<-gsub("Mag_std","_std_Mag",features_names)
features_names<-gsub("BodyBody","Body",features_names)

#Step 1) Merges the training and the test sets to create one data set
#Load other files
test<-read.table("UCI HAR Dataset/test/X_test.txt")[features_index]
test<-cbind(test,read.table("UCI HAR Dataset/test/y_test.txt"))
test<-cbind(test,read.table("UCI HAR Dataset/test/subject_test.txt"))

train<-read.table("UCI HAR Dataset/train/X_train.txt")[features_index]
train<-cbind(train,read.table("UCI HAR Dataset/train/y_train.txt"))
train<-cbind(train,read.table("UCI HAR Dataset/train/subject_train.txt"))

#Now join the data files
data<-rbind(test,train)
colnames(data)<-c( features_names,"activity","subject")

#Step 3) Uses descriptive activity names to name the activities in the data set
#Convert activities into factors
data$activity<-activity_labels[data$activity,2]
data$subject <- as.factor(data$subject)

#Step 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(reshape2)
#Now 'melt' the data by subject and activity
data_melt <- melt(data,id=c("subject","activity"))
#Recast by the the average for each subject and activity
data_mean <- dcast(data_melt, subject+activity ~ variable, mean)

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
write.table(data_mean, "tidydata.txt", row.names = FALSE, quote = FALSE)

#Check
df <- read.table("tidydata.txt", header = TRUE)
View(df)




