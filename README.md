# GettingAndCleaningData
Peer-graded Assignment: Getting and Cleaning Data Course Project

## Data source
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## The script
Before you run the script, make sure that your working directory ends with: "/UCI HAR Dataset". 
The script performs the following steps:
## Install and load packages 
## Load input
  # Load column names
  # Load X_test.txt in variable testX with column names found in features
  # Load y_test.txt in variable testy
  # Load subject_test.txt in variable testSubject
  # Load X_train.txt in variable trainX with column names found in features
  # Load y_train.txt in variable trainy
  # Load subject_train.txt in variable trainSubject
  # Load activity names

## Step 1: Merges the training and the test sets to create one data set called dataset.
## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
  # Find column headers that contain "mean" or "std" and use select to overwrite the variable dataset
## Step 3: Uses descriptive activity names to name the activities in the data set
## Step 4: Appropriately labels the data set with descriptive variable names.
## Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

