## 1. Run as script using:
## Rscript run_analysis.r
## 2. Load and run using:
## Source("run_analysis.r")
## main()

require(reshape2)

data_dir <- "UCI HAR Dataset"

main <- function() {
    if (data_available()) {
		# merge train and test datasets to create one dataset
        merged <- get_merged()
		
		# Extract only mean and std measurements for each measurement
        mean_and_std <- get_mean_and_std(merged)

		# assign descriptive activity names and descriptive labels
        with_activities <- set_activitynames(mean_and_std)

		# assign for each measurement
        average_df <- activities_average(with_activities)
		
		# create tidy dataset with average of each variable for each activity and each subject
        write.table(average_df, file="tidy_average.txt", row.names=FALSE)

        print("Done. tidy_average.txt contains average activities.")
    } else {
        print("error")
    }
}

data_available <- function() {
	# checks availability raw data 
    if (file.exists(data_dir)) {
        TRUE
    } else {
        print(paste("Data is missing in the ",  data_dir, "directory."))
        FALSE
    }
}

get_merged <- function() {
    ## merges train and tests datasets into one file.

    # read necessary files
    features <- read.table(file.path(data_dir, "features.txt"),)
    train_X <- read.table(
        file.path(data_dir, "train", "X_train.txt"),
        header=FALSE)
    test_X <- read.table(
        file.path(data_dir, "test", "X_test.txt"),
        header=FALSE)

    train_y <- read.table(
        file.path(data_dir, "train", "y_train.txt"),
        header=FALSE)
    test_y <- read.table(
        file.path(data_dir, "test", "y_test.txt"),
        header=FALSE)

    train_subject <- read.table(
        file.path(data_dir, "train", "subject_train.txt"),
        header=FALSE)
    test_subject <- read.table(
        file.path(data_dir, "test", "subject_test.txt"),
        header=FALSE)

    # merge train and test data
    merged_X <- rbind(train_X, test_X)
    merged_y <- rbind(train_y, test_y)
    merged_subject <- rbind(train_subject, test_subject)

    # assign descriptive column names
    colnames(merged_X) <- features[, 2]
    colnames(merged_y) <- c("Activity_id")
    colnames(merged_subject) <- c("subject_id")

    # return merged train and test data
    merged <- cbind(merged_X, merged_subject, merged_y)
    merged
}

get_mean_and_std <- function(df) {
    # filter columns with main or std in column name
    valid_columns <- grep("mean|std|subject_id|Activity_id", names(df), value=TRUE)

    # return df filtered by valid_columns
    subset(df, select=valid_columns)
}

set_activitynames <- function(df) {
    # replaces activity codes in the given data frame with their names
    # df - data frame with Activity_id column containing activity codes
    activity_df <- read.table(
        file.path(data_dir, "activity_labels.txt"),
        header=FALSE)
    names(activity_df) <- c("id", "Activity")
    activity_df <- merge(df, activity_df, by.x="Activity_id", by.y="id")

    # clear activity codes
    activity_df$Activity_id <- NULL

    activity_df
}

activities_average <- function(df) {
    # gets dataframe, returns dataframe with average of each variable for each activity and each subject. 

    # add columns with activities
    ids <- c("subject_id", "Activity")
    all_except_ids <- Filter(function(x) !(x %in% ids), names(df))
    activities_melt <- melt(df, id=ids, measure.vars=all_except_ids)
	
	# return average values for each variable for each activity and subject
    average_df <- dcast(activities_melt, subject_id + Activity ~ variable, mean)
    average_df
}

# if running as script do the job. If imported with require, do nothing.
arg <- sub(".*=", "", commandArgs()[4])

if (!is.na(arg) & arg == "run_analysis.R") {
    # running as script, do the job
    main()
} else {
    # was imported using require, do nothing
    ;
}
