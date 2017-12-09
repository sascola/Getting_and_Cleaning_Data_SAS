---
title: "Readme"
output: html_document
---
#Assignment Submission
My submission includes:

The data files as downloaded, plus:


  *Code Book describring the code
  
  *Two scripts to execute the assignment instructions
  

##Description of Data
	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Data
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Measure activity of 30 people under six states: 
	*Walking
	*Walking Upstairs 
	*Walking Downstairs 
	*Sitting
	*Standing 
	*Laying

	http://www.youtube.com/watch?v=XOEN9W05_4A


The measurements were taken from the accelerometer and gyroscope included:

  *3 axial linear acceleration to estimate body acceleration
  
  *3 axial angular velocity 561-feature vectors with time and frequency
	
  *Label for the activity Subject identifier

  *tBodyAcc-XYZ

  *tGravityAcc-XYZ

  *tBodyAccJerk-XYZ

  *tBodyGyro-XYZ

  *tBodyGyroJerk-XYZ

  *tBodyAccMag

  *tGravityAccMag

  *tBodyAccJerkMag

  *tBodyGyroMag

  *tBodyGyroJerkMag

  *fBodyAcc-XYZ

  *fBodyAccJerk-XYZ

  *fBodyGyro-XYZ

  *fBodyAccMag

  *fBodyAccJerkMag

  *fBodyGyroMag

  *fBodyGyroJerkMag



The set of variables that were estimated from these signals are: 

  *mean(): Mean value

  *std(): Standard deviation

  *mad(): Median absolute deviation 

  *max(): Largest value in array

  *min(): Smallest value in array

  *sma(): Signal magnitude area

  *energy(): Energy measure. Sum of the squares divided by the number of values

  *iqr(): Interquartile range 

  *entropy(): Signal entropy

  *arCoeff(): Autorregresion coefficients with Burg order equal to 4

  *correlation(): correlation coefficient between two signals

  *maxInds(): index of the frequency component with largest magnitude

  *meanFreq(): Weighted average of the frequency components to obtain a mean frequency

  *skewness(): skewness of the frequency domain signal 

  *kurtosis(): kurtosis of the frequency domain signal 

  *bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window

  *angle(): Angle between to vectors.


Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

  *gravityMean

  *tBodyAccMean

  *tBodyAccJerkMean

  *tBodyGyroMean

  *tBodyGyroJerkMean



The data was divided into training and test data

  *Subject: subject_train.txt Inertial Signals: total_acc_x_train.txt (_y,_z)
  
  *Acceleration Signals: total_acc_x_train.txt  (_y, _z)
  
  *Acceleration - Gravity: body_acc_train.txt Angular Velocity: body_gyro_x_train.txt  (_y, _z)
  

