GettingAndCleaningData
======================

##Course Project Getting and Cleaning Data

This repo supports the course project for Getting and Cleaning Data, 
using provided smartphone data to characterize human actvity. 

### The script performs the following actions:
1. Load training and test data 
2. Assign sensible labels 
3. Filter the mean() and std() variables of interest (see Codebook.md for more info).
4. Reshapes data into tidy dataset with average values for included metrics by subject and activity.

### The output is a tab-separated file called "tidy_average.txt" in the working dir.

### 3 files in this repo:
1.   README.md      - this file
2.   Codebook.md    - description of tidy dataset and transformations performed on the raw dataset
3.   Run_analysis.R - R script loads raw data from subdir "UCI HAR Dataset", processes and saves it as "tidy_average.txt".

### Run the script:
1. Clone this repository
2. Download the [data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
3. extract dataset in subdir "UCI HAR Dataset" creating subfolders train and test 
4. Change current directory to directory containing subdirectory "UCI HAR Dataset"
4. Place "run_analysis.R" in current directory
5. Run "Rscript <path to>/run_analysis.r" or from R command > Source("run_analysis.R") then main()
6. Tidy dataset should get created in the current directory as "tidy_average.txt"
- Code book for the tidy dataset is available [here](CodeBook.md)

### Assumptions:

1. The training and test data are available in folders named "train" and "test".
2. For each of these datasets:
    - Measurements are available in "X_<dataset>.txt" file
    - Subject information is available in "subject_<dataset>.txt" file
    - Activity codes are available in "y_<dataset>.txt" file
3. All activity codes and their labels are available in "activity_labels.txt" file 
4. Names of all measurements are available in "features.txt" file in same order as in "X_<dataset>.txt" files.
5. All columnnames containing *mean* represent mean values.
6. All columns containing *std* represent standard deviations values.
