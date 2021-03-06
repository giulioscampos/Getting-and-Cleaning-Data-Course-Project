# The Code Book
The purpose of this file is to describe the variables, the data, and any transformations or work that were performed to clean up the data in reference.

In order to do so, it is mandatory understand every aspect of the Data being analysed, as shown below at *"Understanding the Data"* part. 

Worth noting that, although the performed transformations/works to clean up the data are well described on the `run_analysis.R` file. 

## 1. Understanding the Data

In any project or undertaking that involves data analysis, it is fundamental the detailed understanding of the data collected/involved.

As mentioned at the `README.md` file, this data come from `UCI Machine Learning Repository Archives`, more specifically from the Databases Directory (folder nº 00240 - <http://archive.ics.uci.edu/ml/machine-learning-databases/00240/>).

### 1.1 General Information
      
The data refres to an experience on Human Activity Recognition Using Smartphones.
This experience was performed by Jorge L. Reyes-Ortiz(a,b), Davide Anguita(a), Alessandro Ghio(a), Luca Oneto(a) and Xavier Parra(b)

a - Smartlab - Non-Linear Complex Systems Laboratory  
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 

b - CETpD - Technical Research Centre for Dependency Care and Autonomous Living  
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws 

**ABSTRACT:** Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors 

### 1.2 The Downloaded Data

The Downloaded Data consists of a ZIP file named *UCI HAR Dataset.zip*, and its content is composed by a Data Set of twenty-eight (28) `TXT files` as listed below. In order to get this file list, you must first "open" the ZIP file. You can do this through the `unzip()` R command (type `?unzip` on your RStudio Console to see more).

*File List*  
```
##  [1] "activity_labels.txt"                         
##  [2] "features_info.txt"                           
##  [3] "features.txt"                                
##  [4] "README.txt"                                  
##  [5] "test/Inertial Signals/body_acc_x_test.txt"   
##  [6] "test/Inertial Signals/body_acc_y_test.txt"   
##  [7] "test/Inertial Signals/body_acc_z_test.txt"   
##  [8] "test/Inertial Signals/body_gyro_x_test.txt"  
##  [9] "test/Inertial Signals/body_gyro_y_test.txt"  
## [10] "test/Inertial Signals/body_gyro_z_test.txt"  
## [11] "test/Inertial Signals/total_acc_x_test.txt"  
## [12] "test/Inertial Signals/total_acc_y_test.txt"  
## [13] "test/Inertial Signals/total_acc_z_test.txt"  
## [14] "test/subject_test.txt"                       
## [15] "test/X_test.txt"                             
## [16] "test/y_test.txt"                             
## [17] "train/Inertial Signals/body_acc_x_train.txt"  
## [18] "train/Inertial Signals/body_acc_y_train.txt"  
## [19] "train/Inertial Signals/body_acc_z_train.txt"  
## [20] "train/Inertial Signals/body_gyro_x_train.txt"  
## [21] "train/Inertial Signals/body_gyro_y_train.txt"  
## [22] "train/Inertial Signals/body_gyro_z_train.txt"  
## [23] "train/Inertial Signals/total_acc_x_train.txt"  
## [24] "train/Inertial Signals/total_acc_y_train.txt"  
## [25] "train/Inertial Signals/total_acc_z_train.txt"  
## [26] "train/subject_train.txt"                     
## [27] "train/X_train.txt"                           
## [28] "train/y_train.txt"
```

### 1.3. The Data Set

#### 1.3.1 Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, captured 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
      
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

#### 1.3.2 General Characteristics
 DESCRIPTION                  | VALUE 
------------------------------| --------------------------
Data Set Characteristics:     | Multivariate, Time-Series
Number of Instances:          | 10,299
Number of Attributes:         | 561
Attribute Characteristics:    | N/A
Associated Tasks:             | Classification, Clustering 
Missing Values?:              | N/A

#### 1.3.3 Breaking down the experience (and, consequently, the Data)

As we have seen on the item 1.3.1 above, the experience captured 3-axial linear acceleration (XYZ, using the accelerometer) and 3-axial angular velocity (XYZ, using the gyroscopethe) for each of the six activities (1- WALKING, 2- WALKING_UPSTAIRS, 3- WALKING_DOWNSTAIRS, 4- SITTING, 5- STANDING, 6- LAYING) each of the 30 volunteers/person did.

It is also informed that the sensor acceleration signal was separated into body acceleration and gravity.

Number [2] file above (`features_info.txt`) reports that the body linear acceleration and angular velocity were derived in time to obtain Jerk signals and that the magnitude of these three-dimensional signals were calculated (using the Euclidean norm).

It also reports that a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency domain signals.

I have elaborated `figure 1` below to better illustrate how all these signals are linked together and how they have produced all variables mentioned in item 3 (*The Variables*) below.

Noteworthy on figure 1 is that the signals marked with number three are 3-dimensional while those marked with number one are coming from the calculated magnitude (an one-dimensional number).

As we can see, we have `thirty-three` signals measures for each activity a volunteer took.

`FIGURE 1`

![] (https://github.com/giulioscampos/Getting-and-Cleaning-Data-Course-Project/blob/master/Experience%20Signals.png)

Going further on the Data analyses, `features_info.txt` reveals that `'XYZ'` is used to denote 3-axial signals in the X, Y and Z directions and the set of variables that were estimated from these signals are as listed below. Time and Frequency columns indicate which domain the variables were calculated from, including if they were calculated in all three directions (3D) or not.

| #  | VARIABLE        | DESCRIPTION                                                                 | TIME   | FREQUENCY
|:--:|-----------------|-----------------------------------------------------------------------------|:------:|:---------: 
| 1  | mean():         | Mean value                                                                  | 3D     | 3D
| 2  | std():          | Standard deviation                                                          | 3D     | 3D
| 3  | mad():          | Median absolute deviation                                                   | 3D     | 3D     
| 4  | max():          | Largest value in array                                                      | 3D     | 3D    
| 5  | min():          | Smallest value in array                                                     | 3D     | 3D    
| 6  | sma():          | Signal magnitude area                                                       | 1D     | 1D     
| 7  | energy():       | Energy measure. Sum of the squares divided by the number of values          | 3D     | 3D     
| 8  | iqr():          | Interquartile range                                                         | 3D     | 3D     
| 9  | entropy():      | Signal entropy                                                              | 3D     | 3D     
| 10 | arCoeff():      | Autorregresion coefficients with Burg order equal to 4                      | 3D (4 measures for dimension) |
| 11 | correlation():  | correlation coefficient between two signals                                 | 3D (not for magnitude signals) |
| 12 | maxInds():      | index of the frequency component with largest magnitude                     |        | 3D
| 13 | meanFreq():     | Weighted average of the frequency components to obtain a mean frequency     |        | 3D
| 14 | skewness():     | skewness of the frequency domain signal                                     |        | 3D
| 15 | kurtosis():     | kurtosis of the frequency domain signal                                     |        | 3D
| 16 | bandsEnergy():  | Energy of a frequency interval within the 64 bins of the FFT of each window |        | 3D (4 measures for dimension, not for magnitude signals)
| 17 | angle():        | Angle between to vectors                                                    | (*)    | (*) 
(*) For 07 different pairs of vectors were taken 07 differente angles measures (one for each pair)


With all these information in hand, it is possible determinate how many VARIABLES are expected in our Data Set. Considering the thity-three signals and the table above, it is expected an array of `561` variables in the Data Set. Figure 3 below, displayed ate item 2 - The Variables, gives more information on the subject.

If we take a closer look at the *General Characteristics* (1.3.2 item above), we can see this number (561) matches with the Number of Attributes. Thus we can assume 561 columns in a Data Frame.

It is important to remember that *the obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data*. Again, lokking at the *General Characteristics* we know there has been 10,299 Number of Instances, meaning there was 10,299 observations and, therefore, it is possible to assume the same number of rows for the entire Data Set. For the Training Data we can expect approximately 7,210 rows whereas for teh Test Data approximately 3,090.

Reading number [15] file `"test/X_test.txt"` (through `read.table()` R command) and looking at its properties (through `read.table()` R command), we find out a Data Frame object with 561 variables (as expected) and 2,947 observations (rows), representing 28,61% of total rows (close to 30%).

Analogously, as we do the same procedure on number [27] file `"train/X_train.txt"`, we will see a Data Frame object with 561 variables and 7,352 observations (rows), representing 71,39% of total rows (close to 70%).

By applying `read.table()` R command on the files listed below we get:

| #  | FILE                            | PROPRIETIES                       | OBS
|:--:|---------------------------------|-----------------------------------|--------------------------------------------- 
| 1  | [1] "activity_labels.txt"       | data.frame 6 obs. 2 variables     | V1: int 1 to 6 (for each activity) and V2: factor w/ 6 levels (regarding all activities)
| 2  | [3] "features.txt"              | data.frame 561 obs. 2 variables   | V1: 1 to 561 (for each variable) and V2: factor w/ 477 levels (regarding variables names)
| 3  | [14] "test/subject_test.txt"    | data.frame 2,947 obs. 1 variable  | V1: int 1 to 30 (for each subject/volunteer)
| 4  | [16] "test/y_test.txt"          | data.frame 2,947 obs. 1 variable  | V1: int 1 to 6 (for each activity)
| 5  | [26] "train/subject_train.txt"  | data.frame 7,352 obs. 1 variable  | V1: int 1 to 30 (for each subject/volunteer)
| 6  | [28] "train/y_train.txt"        | data.frame 7,352 obs. 1 variable  | V1: int 1 to 6 (for each activity)

## 2. What files will we use to write our R script `run_analysis.R` 

Taking into account all that has been seen so far, the files that will be utilized for this Project are?

* To extract informartion on the Data:
      + [4] "README.txt"
      + [2] "features_info.txt"

* To Build our Project Data:
      + [1] "activity_labels.txt"
      + [3] "features.txt"
      + [14] "test/subject_test.txt"
      + [15] "test/X_test.txt"
      + [16] "test/y_test.txt"
      + [26] "train/subject_train.txt"
      + [27] "train/X_train.txt"
      + [28] "train/y_train.txt"

In order to build the Data Project it is crucial to understand how all this files are connected. David Hood (2014) posted on forum (`Community TA`) a digram, represented on `Figure 2` below, linking all files for building our Data Set.

`FIGURE 2`

![] (https://github.com/giulioscampos/Getting-and-Cleaning-Data-Course-Project/blob/master/Diagram.png)

For this project we are not interested in the Inertial Signals and, hence, we won't be using files number [5] to [13] and [17] to [25]. 

## 3. The Variables

By merging X_train and X_test files, we come up with a data set composed by one data frame of `561` Variables and 10,299 rows. Beside those variables, we will have two more coming from de Subject and Activities related files, resulting in a `563`total variables.

To better illustrate how this `561`variables were defined, I developed the followig table (shown in `Figue 3`), linking all the Signals from Picture 1 aforementioned and set of 17 calculated variables.

`FIGURE 3`

![] (https://github.com/giulioscampos/Getting-and-Cleaning-Data-Course-Project/blob/master/Figure 3.png)

In this Figure are not accounted the `angles()` variables. For experience they measured the angle between seven (07) different pairs of vectors, as shown on `"features.txt"`file.

Our project will focus on extracting only the measurements on the mean and standard deviation for each measurement, highlighted on Figure 3 with a thick red line.

Thus, our project will have `66` (mean and std) + `2`(Subject and Activity) = `68 VARIABLES` (columns) for 10,299 observations (rows).
