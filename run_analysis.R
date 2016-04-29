#Step 1
#Acquire data
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Course 3 Project run_analysis.R
#install.packages("reshape2")
#library(reshape2)
#install.packages("data.table")
#library(data.table)
setwd("~/Coursera/Course3/data")

## Step2
## Read in raw data
te.lab <- read.table("UCIdata/test/y_test.txt", col.names="label")
te.sub <- read.table("UCIdata/test/subject_test.txt", col.names="subject")
te.dat <- read.table("UCIdata/test/X_test.txt")
te.dat <- te.dat [,1:2] #keep only the first 2 cols (mean and std dev)
tr.lab <- read.table("UCIdata/train/y_train.txt", col.names="label")
tr.sub <- read.table("UCIdata/train/subject_train.txt", col.names="subject")
tr.dat <- read.table("UCIdata/train/X_train.txt")
tr.dat <- tr.dat [,1:2] #keep only the first 2 cols (mean and std dev)

## Assemble data into a single table
data <- rbind(cbind(te.sub, te.lab, te.dat),
              cbind(tr.sub, tr.lab, tr.dat))

## Check for missing values
#missingVals <- sum(is.na(data))
#print(missingVals)

## Step 3
## Read activities labels and replace numbers in data with text
labels <- read.table("UCIdata/activity_labels.txt", stringsAsFactors = FALSE)
data$label <- labels[data$label, 2]

## Step 4
## set variables to descriptive names
good.colnames <- c("subject", "label", "mean", "std_dev")
colnames(data) <- good.colnames
## make all alphanumeric data lowercase
data$label <- tolower(data$label)
write.table(data, row.name=FALSE, "tidy1.txt")

## Step 5
## Firstly, let us set subject as a factor variable
data$subject <- as.factor(data$subject)
data <- data.table(data)
##We create tidyData as a data set with average for each activity and subject.
##Then, we order the enties in tidyData and write it into data file Tidy2.txt
## that contains the processed data.
tidyData <- aggregate(. ~subject + label, data, mean)
tidyData <- tidyData[order(tidyData$subject,tidyData$label),]
write.table(tidyData, file = "Tidy2.txt", row.names = FALSE)