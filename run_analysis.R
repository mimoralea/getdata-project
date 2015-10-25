library(reshape2)

# get training data
tr_x <- read.table("UCI HAR Dataset/train/X_train.txt")
tr_y <- read.table("UCI HAR Dataset/train/y_train.txt")
tr_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")

# get testing data
te_x <- read.table("UCI HAR Dataset/test/X_test.txt")
te_y <- read.table("UCI HAR Dataset/test/y_test.txt")
te_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

# get activity labels data
a_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# get features data
features <- read.table("UCI HAR Dataset/features.txt")

# tidy up datasets
a_labels[,2] <- as.character(a_labels[,2])
features[,2] <- as.character(features[,2])
x_data <- rbind(tr_x, te_x)[, grep(".*mean.*|.*std.*", features[,2])]
names(x_data) <- features[grep(".*mean.*|.*std.*", features[,2]), 2]
y_data <- rbind(tr_y, te_y)
y_data[, 1] <- a_labels[y_data[, 1], 2]
names(y_data) <- "activity"
s_data <- rbind(tr_subjects, te_subjects)
names(s_data) <- "subjects"

# merge cleaned dataset
dataset <- cbind(x_data, y_data, s_data)

# tidy up dataset
dataset$activity <- factor(dataset$activity, levels = a_labels[,1], labels = a_labels[,2])
dataset$subject <- as.factor(dataset$subject)
dataset.melted <- melt(dataset, id = c("subject", "activity"))
dataset.mean <- dcast(dataset.melted, subject + activity ~ variable, mean)

# export file
write.table(dataset.mean, "tidy.txt", row.names = FALSE, quote = FALSE)
