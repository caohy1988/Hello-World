setwd("~/datascience/GetandCleanData/Project/")
train = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
train[,562] = read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
train[,563] = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

test = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
test[,562] = read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
test[,563] = read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

activityLabels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

# Read features
features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

# Merge training and test sets
MergeData = rbind(training, testing)

# Get the data on mean and std. dev.
colsWeWant <- grep(".*Mean.*|.*Std.*", features[,2])
# First reduce the features table to what we want
features <- features[colsWeWant,]
# Now add the last two columns "subject" and "activity"
colsWeWant <- c(colsWeWant, 562, 563)
# And remove the unwanted columns from MergeData
allData <- MergeData[,colsWeWant]
# Add the column names "features" to allData
colnames(MergeData) <- c(features$V2, "Activity", "Subject")
colnames(MergeData) <- tolower(colnames(allData))

currentActivity = 1
for (currentActivityLabel in activityLabels$V2) {
  MergeData$activity <- gsub(currentActivity, currentActivityLabel, MergeData$activity)
  currentActivity <- currentActivity + 1
}

MergeData$activity <- as.factor(MergeData$activity)
MergeData$subject <- as.factor(MergeData$subject)

tidy = aggregate(allData, by=list(activity = MergeData$activity, subject=MergeData$subject), mean)
# Remove the subject and activity column
tidyData[,90] = NULL
tidyData[,89] = NULL
write.table(tidyData, "TidyData.txt", sep="\t")