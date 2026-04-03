# GettingAndCleaningDataCourseProject
The project for the course "Getting and Cleaning Data" on Coursera


The run_analysis.R file takes the Subject, X and Y .txt files from train and test folder and merges them to form a new data frame

Only mean and standard deviation measurements are taken from the features.txt file via regular expression

Then the Activity labels are given to each numerical value in activity column

Then the file uses the dplyr module to categorise the dataframe by subject and activity and finds the mean of all the columns and outputs the new dataframe as tidyData.csv
