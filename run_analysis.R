##########################################
# CODE FOR MERGED DATAFRAME

library(dplyr)

# Extracting feature names from features.txt
featureFile <- readLines("UCI HAR Dataset/features.txt")
features <- gsub("[0-9]?[0-9]?[0-9] ", "", featureFile)

# identifying the indices of mean and SD measurements in features
meanstdIndices <- grep("mean\\(|std\\(", features)

# Creating a vector of activity names
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")[,2]

# convert all the test text data into dataframe and merge them
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
activityTest <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "Activity")
xTest <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features)
testFrame <- cbind(subjectTest, activityTest, xTest[,meanstdIndices])

# convert all the train text data into dataframe and merge them
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
activityTrain <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "Activity")
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features)
trainFrame <- cbind(subjectTrain, activityTrain, xTrain[,meanstdIndices])

# merging test and train dataframes and sorting
mergedData <- rbind(testFrame, trainFrame)
sortedData <- arrange(mergedData, mergedData$Subject, mergedData$Activity)

# relabelling the Activity parameters
sortedData$Activity <- replace(sortedData$Activity, sortedData$Activity == 1, activityLabels[1])
sortedData$Activity <- replace(sortedData$Activity, sortedData$Activity == 2, activityLabels[2])
sortedData$Activity <- replace(sortedData$Activity, sortedData$Activity == 3, activityLabels[3])
sortedData$Activity <- replace(sortedData$Activity, sortedData$Activity == 4, activityLabels[4])
sortedData$Activity <- replace(sortedData$Activity, sortedData$Activity == 5, activityLabels[5])
sortedData$Activity <- replace(sortedData$Activity, sortedData$Activity == 6, activityLabels[6])

########################################################
# CODE FOR TIDY DATAFRAME

# preparing grouped dataframe and calculating mean of each
tidyData <- sortedData %>% group_by(Subject = sortedData$Subject, Activity = sortedData$Activity) %>% summarise(across(everything(), mean), .groups = "drop")

write.csv(tidyData, file="tidyData.csv")