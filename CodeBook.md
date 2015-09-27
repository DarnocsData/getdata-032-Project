#Code Book
This code book describes the data fields in the file tidydata.txt. 


A full description of the initial data is available at the site where the data was obtained: 

<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">The UCI Machine Learning Repository</a>

Here are the data for the project: 

<a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">The source data for this project can be found here.</a>


This data was processed using the run_analysis.R script to create the tidydata.txt file. 


#Fields:

subject - The ID of the test subject. This can be any number between 1 and 30 corresponding to one of the 30 subjects.
activity - this can take one of six values corresponding to the type of activity being performed. These six values are:
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

#Variables

* The following features come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
* The acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ).
* X,Y and Z correspond to the x, y and z components. Mag is the magnitude of these three components.
* Mean corresponds to the mean, std corresponds to the std dev of the signals.
* The freq domain signals (denoted with an f in front of the names were obtained by taking a Fast Fourier Transform of the time signals)
* Units: Features are normalized and bounded within [-1,1]

##Time Domain data

###Body Acc:

* tBodyAcc_mean_XYZ
* tBodyAcc_mean_Mag
* tBodyAcc_std_XYZ
* tBodyAcc_std_Mag

###Body Acc Jerk:

* tBodyAccJerk_mean_XYZ
* tBodyAccJerk_mean_Mag
* tBodyAccJerk_std_XYZ
* tBodyAccJerk_std_Mag

###Gravity Acc:

* tGravityAcc_mean_XYZ
* tGravityAcc_mean_Mag
* tGravityAcc_std_XYZ
* tGravityAcc_std_Mag

###Body Gyro:

* tBodyGyro_mean_XYZ
* tBodyGyro_mean_Mag
* tBodyGyro_std_XYZ
* tBodyGyro_std_Mag

###Body Gyro Jerk:

* tBodyGyroJerk_mean_XYZ
* tBodyGyroJerk_mean_Mag
* tBodyGyroJerk_std_XYZ
* tBodyGyroJerk_std_Mag


##Freq Domain Data

###Body Acc

* fBodyAcc_mean_XYZ
* fBodyAcc_mean_Mag
* fBodyAcc_std_XYZ
* fBodyAcc_std_Mag

###Body Acc Jerk

* fBodyAccJerk_mean_XYZ
* fBodyAccJerk_mean_Mag
* fBodyAccJerk_std_XYZ
* fBodyAccJerk_std_Mag

###Body Gyro

* fBodyGyro_mean_XYZ
* fBodyGyro_mean_Mag
* fBodyGyro_std_XYZ
* fBodyGyro_std_Mag

###Body Gyro Jerk

* fBodyGyroJerk_mean_Mag
* fBodyGyroJerk_std_Mag


#Cleaning the data

The data was processed using the run_analysis.R script. It undertakes the following steps:

* Loads the raw data
* Joins the test and training data together
* Adds the subject and activity data
* Selects only the std and mean values
* Renames some variables into a R friendly format
* Recasts the data by the the average for each subject and activity to create a final tidy dataset
* Saves this tidy data as tidydata.txt

