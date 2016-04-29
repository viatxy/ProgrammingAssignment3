---
title: "run_analysis.R"
author: "Tod Yates"
date: "April 29, 2016"
output: html_document
---
##CodeBook for the run_analysis.R project

The run_analysis.R script takes data from UCI and combines several disparate files into one data table for analysis. It delivers two outputs, titled tidy1.txt and Tidy2.txt.

Dependencies
-install.packages("reshape2")
-library(reshape2)
-install.packages("data.table")
-library(data.table)
setwd("~/Coursera/Course3/data")

There are 5 general steps to the script. Those steps and the transformation process are as follows:

Step 1
Acquire data
The data was downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip". While it can be done programmatically, in this case it was done manually. The data description is below:

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

Step 2
Read in the raw data from the text files in the data set. Each file is read into a table, resulting in 6 files, 3 from the test data set and 3 from the train data set. Those 6 files are then combined into one data.table named "data". Extraneous data not specified to be included in the project instructions is also removed during this process.

Step 3
Read in the labels from the data. The labels describe the activity that each subject was performing when the data was gathered. The labels are: subject, label, mean, and std_dev. The "subject" variable identifies the person being measured, the "label" variable identifies the activity the subject was performing, the "mean" variable shows the mean of the measurements taken for that observation, and the "std_dev" variable shows the standard deviation of the measurements taken for that observation.

Step 4 
Set the variable names in data to be descriptive. This step also makes all alphanumeric data lowercase for tidiness.

Step 5
This step sets the subject variable as a factor for use in the aggregate command. It then takes the data and transforms it using the aggregate command so that the mean and standard deviation for each activity is shown by the subject. 


