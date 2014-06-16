GettingAndCleaningData
======================

##Course Project Getting and Cleaning Data

This repo supports the course project for Getting and Cleaning Data, 
using provided smartphone data to characterize human actvity. 

The script performs the following actions:
1. Load training and test data 
2. Assign sensible labels 
3. Filter the mean() and std() variables of interest (see Codebook.md for more info).
4. Reshapes data into tidy dataset with average values for included metrics by subject and activity.

The output file is a tab-separated file called "tidy_average.txt" placed in the working dir.

3 files in this repo:
1.   README.md      - this file
2.   Codebook.md    - description of tidy dataset and transformations performed on the raw dataset
3.   Run_analysis.R - R script loads raw data from subdir "UCI HAR Dataset", processes and saves it as "tidy_average.txt".

Execute this script: 
1. place "run_analysis.R" in the working dir
2. Download the data set: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
3. extract in subdir "UCI HAR Dataset"
4. in R > Source("run_analysis.R")
5. In R > main()
