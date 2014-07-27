Read Me for Get and Clean Data
==============================
Introduction
------------------------------------------------

This repository contains my work for the course project for the Coursera course "Getting and Cleaning data", part of the Data Science specialization. What follows first are the introduction to the original data in my project.

About the raw data
----------------------------------------------

The features for the test set can be found in the x_test.txt. The activity labels can be found in the y_test.txt file. The test subjects can be found in the subject_test.txt file. The same holds for the training set.

About the script and the tidy dataset
---------------------------------------------

I created a script called GetandCleanData.R which will merge the test and training sets together. Prerequisites for this script:

1. the UCI HAR Dataset must be extracted 
2. the UCI HAR Dataset must be availble in a directory called "UCI HAR Dataset".

After merging the testing sets and the training sets, the abels are added and only the columns that have to do with the mean value and the standard deviation are kept.

Lastly, the script will create a tidy data set containing the means of all the columns per test data-set and per activity. This tidy data will be written to a tab-delimited file which called TidyData.txt, which can also be found in this repository.

About the Code Book
---------------------------------------------

The CodeBook.md file explains the detail  performance and the related data and variables.
 

