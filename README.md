GettingAndCleaningData
======================

Project Getting and Cleaning Data - Data Science Specialization Track 3

This repo supports the course project for Getting and Cleaning Data. 
Using provided data from mobile data to characterize human actvity, 
the script performs the following tasks:
•Loads training and test data with sensible labels for the datasets
•Filters on the mean() and std() variables of interest (see Codebook.md for more info).
•Reshapes data into a tidy dataset with average values for included metrics by subject and activity.

The output file is a tab-separated file called "tidy_average.txt" placed in the working dir.

3 files in this repo:
•  README.md      - this file
•  Codebook.md    - description of tidy dataset and transformations performed on the raw dataset
•  run_analysis.R - R script to load raw data in subdir "UCI HAR Dataset", process it and save as "tidy_average.txt".

Execute this script: 
1. place "run_analysis.R" in the working dir
2. •Download the data set and extract in subdir "UCI HAR Dataset"
3. > Source("run_analysis.R")
4. > main()
