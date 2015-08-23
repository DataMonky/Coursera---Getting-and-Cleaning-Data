##List of work done
1. Load library dplyr
2. Read data from .txt to variables (I used .df to refer to 'Data.Frame')
3. Row combine and Column combine
4. Give column names (It is useful for merging/linking activity_labels to major data set)
5. Merging two data set together
6. Filter out only 'mean' and 'std' measurements
7. Group by activity and summarise the data to get the average value for each measurment

##Variables definition
1. train.x.df: variable to hold data reaad from "train/X_train.txt"
2. test.x.df: variable to hold data reaad from "test/X_test.txt"
3. train.y.df: variable to hold data reaad from "train/y_train.txt"
4. test.y.df: variable to hold data reaad from "test/y_test.txt"
5. features: variable to hold data reaad from "features.txt"
6. activity.labels: variable to hold data reaad from "activity_labels.txt"
7. train.df: variable to hold column-combined data for trainig data set
8. test.df: variable to hold column-combined data for testing data set
9. merge.df: variable to hold row-combined data from 'train' and 'test' data set
10. activity: variable to hold activity id and name columns from merged.df
11. means: variable to hold measurement columns with 'mean' in the name
12. stds: variable to hold measurement columns with 'std' in the name
13. merge.df.narrow: variable to hold filterd columns only from activity, means, and stds

##Give meaningful column names
Because y_train and y_test data set data ranges 1 to 6, looks mapping to activity_labels data set
1. names(train.y.df) <- "activity_id"
2. names(test.y.df) <- "activity_id"

Because X.train and X.test data set have the same number of rows as data set in features data set, looks mapping
1. names(train.x.df) <- features$V2
2. names(test.x.df) <- features$V2

This naming is for Step 3, which rquires names to be descriptive and need to link to the main data set
names(activity.labels) <- c("activity.id", "activity.name")

##Uses descriptive activity names to name the activities in the data set
Merge activity_labels and merge.df to add 'activity.name' accordingly to make the data set more readable

##Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
1. group data set by activity_name //by_activty <- group_by(merge.df.narrow, activity.name)
2. remove 'activity.id' column //by_activty <- select(by_activty, -(activity.id))
3. calculate average of each variable //summarise_each(by_activty, funs(mean))
Note: summarise_each can directly apply the selected function to all columns, so there is no need to specific each column
