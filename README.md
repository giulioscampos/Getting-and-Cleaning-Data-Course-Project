# Getting-and-Cleaning-Data-Course-Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 

1. a tidy data set as described below, 
2. a link to a Github repository with your script for performing the analysis, and 
3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

You should create one R script called ```run_analysis```.
R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
## Review criteria

1. *The submitted data set is tidy.*
2. *The Github repo contains the required scripts.*
3. *GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.*
4. *The README that explains the analysis files is clear and understandable.*
5. *The work submitted for this project is the work of the student who submitted it*

## The Project's Data

For this Project we will use the `University of California Irvine Machine Learning Repository` Archives to download the required Data. This is the link for the data we need:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

A full description is available at the site where the data was obtained:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

*Part of the Code Book file (`CodeBook.md`) is dedicated to understand the Project's Data* 

## How does `run_analysis.R`work?

The following steps explain how our script works. They are also displayed inside the script.

Step 1) Sets Working Directory  
Step 2) Checks if folder "Downloaded Data" exists. If not, creates the folder  
Step 3) Downloads data for the project into "Downloaded Data" folder  
Step 4) Sets New Working Directory (inside "Downloaded Data" folder)  
Step 5) Unzips the downloaded data  
Step 6) Loads into R all seven files we are using for the project  
Step 6) Merges the training and the test sets  
Step 7) Loads DPLYR package  
Step 8) Inserts Activity Labels at DataActivity Set  
Step 9) Renames V2 variable and Excluding V1 variable from DataActivity Set  
Step 10) Renames DataSubject Set variables  
Step 11) Sets Data Set variables names using FeatureNames  
Step12) Merges DataActivity, DataSubject and Data to create one Data Set  
Step13) Extracts only the measurements on the mean and standard deviation for each measurement  
Step14) Creats a second, independent tidy data set with the average of each variable for each activity and each subject  
