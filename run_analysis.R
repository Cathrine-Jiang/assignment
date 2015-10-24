## This script is use to analysis the data from the wearable computing
## project which will give out a tidy data set with the average of each 
## variable for each activity and each subject.

## download and unzip the dataset, if you have these done already, just
## simply skip these.
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "data.zip", mode = "wb")
unzip("data.zip")
## go to the directory and read in files
setwd("UCI HAR Dataset")
TEST <- dir("test", full.names = TRUE)
TRAIN <- dir("train", full.names = TRUE)
subject_test <- read.table(TEST[2])
x_test <- read.table(TEST[3])
y_test <- read.table(TEST[4])
subject_train <- read.table(TRAIN[2])
x_train <- read.table(TRAIN[3])
y_train <- read.table(TRAIN[4])
## merge the data sets together
test <- cbind(subject_test , y_test , x_test)
test[ ,ncol(test) + 1] <- rep("TEST" , nrow(test))
train <- cbind(subject_train , y_train , x_train)
train[ ,ncol(train) + 1] <- rep("TRAIN" , nrow(train))
sum <- rbind(test , train)
## give column names for each variable(in this case, names of features)
feature <- read.table("features.txt" , colClasses = "character")
colname <- c("ID" , "ACTIVITY" , feature$V2 , "GROUP")
colnames(sum) <- colname
## rename the label from number to activity
sum$ACTIVITY <- as.factor(sum$ACTIVITY)
levels(sum$ACTIVITY) <- list("walking" = 1,"waliking_upstais" = 2,
                             "walking_downstairs" = 3,"sitting" = 4,
                             "standing" = 5,"laying" = 6)
## extract the target variable
mean <- grep("mean()" , names(sum) , fixed = TRUE)
std <- grep("std()" , names(sum) , fixed = TRUE)
extra <- cbind(sum[ ,1:2] , sum[ ,mean] , sum[ ,std] , sum[ ,564])
## prepare for the output, which is the average of each variable for 
## each activity and each subject.
library(dplyr)
extra %>% group_by(ID,ACTIVITY) %>% summarize_each(funs(mean))
test <- write.table(extra , file = "test.txt" , row.names = FALSE)
## the output data is in the working directory, naming as "test.txt"
