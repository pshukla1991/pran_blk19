Course Project: Getting and Cleaning Data

Data for Project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Project Description:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Project:
You should create one R script called run_analysis.R that does the following.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Steps:
1. Download data using above url into your local drive. Keep the folder sttructure same.
2. Make the parent folder  of this whole data your working directory by using command setwd()
3. Run the script run_analysis.R in R studio
4. It will create tidy_data.txt file in same working directory. This file will contain the final result.
