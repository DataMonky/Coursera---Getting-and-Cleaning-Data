# Environments
Operating System: Windows 7 SP1 <br />
RStudio 3.2.1

# Working Directory and File Structure
1. The working directory is located directly in the folder UCI HAR Dataset, where test folder and train folder are located.
2. In my laptop, it's located at E:/Downloads/UCI HAR Dataset, so I used setwd("E:/Downloads/UCI HAR Dataset") to set the working directory

# Logic flow
1. Load library dplyr, because later on a lot of data manipulation work will use the functions provided by dplyr
2. Making sure working directory is set up correctly
3. Read data to variables,  one file one variable
4. Finding the relations among files by checking the content
5. Combine related data together - e.g.: train.x and train.y; test.x and test.y
6. Get column names for different variables. e.g.: it's found that data in features match the main data set in trian.x and test.x
7. Combine train and test
8. Combine activity and main data set
9. Filter out only data with varialbles haivng 'mean' and 'std'
10. Group data and summarise.  Note, it's found summarise_each can easily summarise all columns

Notes in code
--
//Load additional libraries
library(dplyr)

//Read data from txt files
//working directory set to under 'UCI HAR Dataset' folder, same path as train folder and test folder
//setwd("E:/Downloads/UCI HAR Dataset")

//load data from txt file
train.x.df <- read.table("train/X_train.txt")
test.x.df <- read.table("test/X_test.txt")

train.y.df <- read.table("train/y_train.txt")
test.y.df <- read.table("test/y_test.txt")
features <- read.table("features.txt")
activity.labels <- read.table("activity_labels.txt")

//give meaning column names
names(train.y.df) <- "activity_id"
names(test.y.df) <- "activity_id"

//Step 4: Appropriately labels the data set with descriptive variable names. 
//Appropriately labels the data set with descriptive variable names. 
names(train.x.df) <- features$V2
names(test.x.df) <- features$V2
names(activity.labels) <- c("activity.id", "activity.name")

//merge acitiviy and measurement
train.df <- cbind(train.y.df, train.x.df)
test.df <- cbind(test.y.df, test.x.df)

//Step 1: Merges the training and the test sets to create one data set.
merge.df <- rbind(train.df, test.df)

//Step 3 Uses descriptive activity names to name the activities in the data set
//Uses descriptive activity names to name the activities in the data set
merge.df <- merge(activity.labels, merge.df, by.x = "activity.id", by.y = "activity_id")

//Step 2: After another try, select-contains is working
activity <- select(merge.df, 1:2)
means <- select(merge.df, contains("mean"))
stds <- select(merge.df, contains("std"))
merge.df.narrow <- cbind(activity, means, stds)

//Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
by_activty <- group_by(merge.df.narrow, activity.name)
by_activty <- select(by_activty, -(activity.id))
summarise_each(by_activty, funs(mean))
