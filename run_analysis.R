## Install and load packages 
install.packages("dplyr")
require(dplyr)
install.packages("data.table")
require("data.table")


## Load input
# Load column names in variable called features
features <- fread("features.txt", 
    header = FALSE)
features <- paste(c(1:561), features$V2)
# Load X_test.txt in variable testX with column names found in features
testX <- fread(paste(getwd(), "/test/X_test.txt", sep = ""),  
    header = FALSE, col.names = features)
# Load y_test.txt in variable testy
testy <- fread(paste(getwd(), "/test/y_test.txt", sep = ""), 
    header = FALSE, col.names = "y")
# Load subject_test.txt in variable testSubject
testSubject <- fread(paste(getwd(), "/test/subject_test.txt", sep = ""), 
    header = FALSE, col.names = "subjects")
# Load X_train.txt in variable trainX with column names found in features
trainX <- fread(paste(getwd(), "/train/X_train.txt", sep = ""), 
    header = FALSE, col.names = features)
# Load y_train.txt in variable trainy
trainy <- fread(paste(getwd(), "/train/y_train.txt", sep = ""),  
    header = FALSE, col.names = "y")
# Load subject_train.txt in variable trainSubject
trainSubject <- fread(paste(getwd(), "/train/subject_train.txt", sep = ""), 
    header = FALSE, col.names =  "subjects")
# Load activity names
activity <- fread("activity_labels.txt", 
    header = FALSE, col.names = c("ID", "activityName"))


## Step 1: Merges the training and the test sets to create one data set called dataset.
dataset <- rbind(cbind(trainX, trainSubject, trainy), cbind(testX, testSubject, testy))

## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
# Find column headers that contain "mean" or "std" and use select to overwrite the variable dataset
dataset <- dataset %>% select(matches("(mean|std)\\(\\)"), "subjects", "y")

## Step 3: Uses descriptive activity names to name the activities in the data set
dataset$y <- activity[dataset$y, 2]

## Step 4: Appropriately labels the data set with descriptive variable names.
colnames(dataset) <- gsub("[0-9]+|\\ |\\(\\)|\\-", "", colnames(dataset))
colnames(dataset) <- gsub("BodyBody", "Body", colnames(dataset))
colnames(dataset) <- gsub("mean", "Mean", colnames(dataset))
colnames(dataset) <- gsub("std", "Std", colnames(dataset))
colnames(dataset)[68] <- "activity"

## Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each 
## variable for each activity and each subject.
datasetSummary <- dataset %>% 
    group_by(activity, subjects) %>%
    summarise_all(funs(mean))

