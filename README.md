# Environments
Operating System: Windows 7 SP1 <br />
RStudio 3.2.1

# Working Directory and File Structure
The working directory is located directly in the folder UCI HAR Dataset, where test folder and train folder are located.  In my laptop, it's located at E:/Downloads/UCI HAR Dataset, so I used setwd("E:/Downloads/UCI HAR Dataset") to set the working directory

# Steps in the Assignment
Step 2 is not done because I got 'duplicate column name' error and could not fix it by due date <br />
Things that I have tried: <br />
1. I was trying to use 'select' function with 'contains' parameter provided by library 'dplyr', I learnt it from swirl course <br />
//merge.df.narrow <- merge.df %>% select(contains("mean") | contains("str")) <br />
2. I also tried two functions make.names(), and tolower(), after reading forum and googling around <br />
3. Perhaps I need to do some column name cleaning <br />

