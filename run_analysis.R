
#install reshape2 & data.table package

if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

require("data.table")
require("reshape2")

# Fetch data column names
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

# Fetch activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]


# Fetch only the measurements on the mean and standard deviation for each measurement.
ext_features <- grepl("mean|std", features)

# Read X_train & y_train data.
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

names(X_train) = features

# Extract only the measurements on the mean and standard deviation for each measurement.
X_train = X_train[,ext_features]

# Load activity data
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

# Bind train data
train_info <- cbind(as.data.table(subject_train), y_train, X_train)

# Read X_test & y_test data.
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

names(X_test) = features

# Extract only the measurements on the mean and standard deviation for each measurement.
X_test = X_test[,ext_features]

# Load activity labels
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

# Bind test data
test_info <- cbind(as.data.table(subject_test), y_test, X_test)

# Merge test and train data
complete_data = rbind(test_info, train_info)

id_lbls   = c("subject", "Activity_ID", "Activity_Label")
data_lbls = setdiff(colnames(complete_data), id_lbls)
melt_data      = melt(complete_data, id = id_lbls, measure.vars = data_lbls)

# Calculate mean 
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)

#write table
write.table(tidy_data, file = "./tidy_data.txt", row.names= FALSE)

