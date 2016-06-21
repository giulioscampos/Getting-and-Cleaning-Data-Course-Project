# The Code Book
The purpose of this file is to describe the variables, the data, and any transformations or work that you performed to clean up the data in reference.

In order to do so, it is mandatory to understand every aspect of the Data we are analysing, as shown below at *"Understanding the Data"* part. 

Worth noting that, although we describe the performed transformations/works done to clean up the data, we do it here as well. 

## 1. Understanding the Data

In any project or undertaking that involves data analysis, it is fundamental the understanding of the data collected/involved.
As mentioned at the `README.md` file, our data come from `UCI Machine Learning Repository Archives`, more specifically from the Databases Directory (folder nº 00240 - <http://archive.ics.uci.edu/ml/machine-learning-databases/00240/>).

### 1.1 General Information
      
The data is regarding an experience on Human Activity Recognition Using Smartphones.
This experience was performed by Jorge L. Reyes-Ortiz(a,b), Davide Anguita(a), Alessandro Ghio(a), Luca Oneto(a) and Xavier Parra(b)

a - Smartlab - Non-Linear Complex Systems Laboratory  
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 

b - CETpD - Technical Research Centre for Dependency Care and Autonomous Living  
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws 

**ABSTRACT:** Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors 

### 1.2 The Downloaded Data

The Downloaded Data consists of a ZIP file named *UCI HAR Dataset.zip*, and its content is composed by a Data Set of twenty-eight (28) `TXT files` as listed below. In order to get this file list, you must first "open" the ZIP file. You can do this through the `unzip()` R command (type `?unzip` on your RStudio Console to see more).

### 1.3. The Data Set

#### 1.3.1 Information
      The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
      
      The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.




## 2. The Variables

## 3. Work performed to clean up the data
