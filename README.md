GettingAndCleaningData
======================

##Course Project Getting and Cleaning Data

This repo contains the course project files for Getting and Cleaning Data, 
using provided smartphone data to characterize human actvity. 

The script performs the following actions:
•Loads training and test data 
•Assigns sensible labels 
•Filters the mean() and std() variables of interest (see Codebook.md for more info).
•Reshapes data into a tidy dataset with average values for included metrics by subject and activity.

The output file is a tab-separated file called "tidy_average.txt" placed in the working dir.

3 files in this repo:
•  README.md      - this file
•  Codebook.md    - description of tidy dataset and transformations performed on the raw dataset
•  run_analysis.R - R script to load raw data in subdir "UCI HAR Dataset", process it and save as "tidy_average.txt".

Execute this script: 
1. place "run_analysis.R" in the working dir
2. Download the data set: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
3. extract in subdir "UCI HAR Dataset"
4. > Source("run_analysis.R")
5. > main()
