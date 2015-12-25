# get the script working directory
frame_files <- lapply(sys.frames(), function(x) x$ofile)
frame_files <- Filter(Negate(is.null), frame_files)
script_path <- dirname(frame_files[[length(frame_files)]])

# create variables where we will store our dataset
temp_dir = tempdir()
url_path = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dest_zip_path = file.path(temp_dir, "data.zip")
data_dir = file.path(script_path, "dataset")
data_default_path = file.path(script_path, "UCI HAR Dataset")
subject_name = "subject_%s.txt"
x_name = "X_%s.txt"
y_name = "y_%s.txt"
labels_name = "activity_labels.txt"
features_name = "features.txt"
test = "test"
train = "train"

# download if not there yet
if(!file.exists(data_dir)) {
  download.file(url_path, dest_zip_path, method='curl')
  unzip(dest_zip_path, exdir = script_path)
  file.rename(data_default_path, data_dir)
}

require(dplyr)

# merges the training and the test sets to create one data set.
s_test <- tbl_df(read.csv(file.path(data_dir, test, sprintf(subject_name, test)), header = FALSE, sep = ""))
x_test <- tbl_df(read.csv(file.path(data_dir, test, sprintf(x_name, test)), header = FALSE, sep = ""))
y_test <- tbl_df(read.csv(file.path(data_dir, test, sprintf(y_name, test)), header = FALSE, sep = ""))

s_train <- tbl_df(read.csv(file.path(data_dir, train, sprintf(subject_name, train)), header = FALSE, sep = ""))
x_train <- tbl_df(read.csv(file.path(data_dir, train, sprintf(x_name, train)), header = FALSE, sep = ""))
y_train <- tbl_df(read.csv(file.path(data_dir, train, sprintf(y_name, train)), header = FALSE, sep = ""))

s_data <- bind_rows(s_train, s_test)
x_data <- bind_rows(x_train, x_test)
y_data <- bind_rows(y_train, y_test)

data <- bind_cols(s_data, x_data, y_data)

# appropriately labels the data set with descriptive variable names
features <- tbl_df(read.csv(file.path(data_dir, features_name), header = FALSE, sep = ""))
names(data) <- str_replace(make.names(names=c("subject", as.character(features$V2), "activity"), unique=TRUE, allow_ = TRUE), "\\.+$", "")

# extracts only the measurements on the mean and standard deviation for each measurement
mstd <- data[,grep("subject|.*\\.mean\\..*|.*\\.std\\..*|activity", names(data))]

# uses descriptive activity names to name the activities in the data set
labels <- tbl_df(read.csv(file.path(data_dir, labels_name), header = FALSE, sep = ""))
mstd <- mutate(mstd, activity = labels[activity,]$V2)

# from the data set in last step, creates a second, independent tidy data set with the 
# average of each variable for each activity and each subject
tidy_set <- gather(mstd, variable, value, -subject, -activity)
summary_tidy_set <- summarise(group_by(tidy_set, subject, activity, variable), mean(value))
write.table(summary_tidy_set, "tidy.txt", row.names = FALSE, quote = FALSE)
