##Load additional libraries
library(dplyr)

##Read data from txt files
##working directory set to under 'UCI HAR Dataset' folder, same path as train folder and test folder
##setwd("E:/Downloads/UCI HAR Dataset")

##load data from txt file
train.x.df <- read.table("train/X_train.txt")
test.x.df <- read.table("test/X_test.txt")

train.y.df <- read.table("train/y_train.txt")
test.y.df <- read.table("test/y_test.txt")
features <- read.table("features.txt")
activity.labels <- read.table("activity_labels.txt")

##give meaning column names
names(train.y.df) <- "activity_id"
names(test.y.df) <- "activity_id"

##Step 4: Appropriately labels the data set with descriptive variable names. 
##Appropriately labels the data set with descriptive variable names. 
names(train.x.df) <- features$V2
names(test.x.df) <- features$V2
names(activity.labels) <- c("activity.id", "activity.name")

##merge acitiviy and measurement
train.df <- cbind(train.y.df, train.x.df)
test.df <- cbind(test.y.df, test.x.df)

##Step 1: Merges the training and the test sets to create one data set.
merge.df <- rbind(train.df, test.df)

##Step 2: Extracts only the measurements on the mean and standard deviation for each measurement
##merge.df.narrow <- merge.df %>% select(contains("mean") | contains("str"))

##Step 3 Uses descriptive activity names to name the activities in the data set
##Uses descriptive activity names to name the activities in the data set
merge.df <- merge(activity.labels, merge.df, by.x = "activity.id", by.y = "activity_id")

##Step 2: After another try, select-contains is working
activity <- select(merge.df, 1:2)
means <- select(merge.df, contains("mean"))
stds <- select(merge.df, contains("std"))
merge.df.narrow <- cbind(activity, means, stds)


