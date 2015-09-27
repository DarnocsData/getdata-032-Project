# Course Project for the John Hopkins Getting and Cleaning Data paper

The aim of this project was to create a tidy dataset from data collected from the accelerometers in the Samsung Galaxy S smartphone. These data were collected from 30 different subjects and assigned to one of six different activities: 1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING.


A full description is available at the site where the data was obtained: 

<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">The UCI Machine Learning Repository</a>

Here are the data for the project: 

<a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">The source data for this project can be found here.</a>

An R script called run_analysis.R was created that does the following. 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

This repository contains:
* The resultant tidy dataset tidydata.txt
* the R code run_analysis.R  used to create the tidy dataset above.
* a code book CodeBook.md  describing the variables, the data, and the  transformations performed to clean up the data
* this Readme.md document


