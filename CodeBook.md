---
title: "CodeBook"
output: pdf_document
date: "2026-04-03"
---

LIST OF VARIABLES FOR EACH COLUMN variables of the feature vector for each pattern:\
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ tGravityAcc-XYZ tBodyAccJerk-XYZ tBodyGyro-XYZ tBodyGyroJerk-XYZ tBodyAccMag tGravityAccMag tBodyAccJerkMag tBodyGyroMag tBodyGyroJerkMag fBodyAcc-XYZ fBodyAccJerk-XYZ fBodyGyro-XYZ fBodyAccMag fBodyAccJerkMag fBodyGyroMag fBodyGyroJerkMag

The set of variables that were estimated from these signals are:

mean(): Mean value std(): Standard deviation

Activity: The action person was performing while being recorded Subject: ID of the person (Out of 30)

```         
meanstdIndices <- grep("mean\\(|std\\(", features)
```

this was used to extract all variables of calculated mean and standard deviation

```         
tidyData <- sortedData %>% group_by(Subject = sortedData$Subject, Activity = sortedData$Activity) %>% summarise(across(everything(), mean), .groups = "drop")
```

This line of code was used to categorise the dataframe based on subject and activity, then finding the mean of each colum except the category column
