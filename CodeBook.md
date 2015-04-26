---
Title: "Getting and Cleaning Data - Project Week 3"
Author: "elloumil"
Date: "April 2015"

---

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The content of the zip file is extracted.

Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The R script "project.R" is the project's script for getting and cleaning the data. The following is the description of  the variables, the data, and any transformations or work performed to clean up the data:

1. The script merges the follwing pairs of file:

  - "train/X_train.txt" and "test/X_test.txt" to get the data frame X
  - "train/subject_train.txt" and "test/subject_test.txt" to get the data frame Subject
  - "train/y_train.txt" and "test/y_test.txt" to get the data frame Y<br/>
  X has 10299 observations of 561 variables.<br/>
  Subject has 10299 observation of 1 variables.<br/>
  Y has 10299 observation of 1 variables.<br/>

2. Then the script reads the file "features.txt" into the data frame features (features has 561 observation of 2 variables) and extracts only the measurements (indices_of_features) on the mean and standard deviation for each measurement.indices_of_features is a vector of 66 values.<br/>
Then X gets updated and contains only the measurements on the mean and standard deviation for each measurement. X becomes a data frame of 10299 of 66 variables<br/>
Then the script affects the proper names of columns to the data frame X (and cleans the names and puts it all in lowecase).<br/>
  Result (first 6 columns' names of X):
    ```
>head(names(X))
[1] "tbodyacc-mean-x" "tbodyacc-mean-y" "tbodyacc-mean-z" "tbodyacc-std-x"  "tbodyacc-std-y"  "tbodyacc-std-z" 
```

3. The script reads the file activity_labels.txt and create a data frame activities (with 6 observations of 2 variables) which contains the list of possible activities and their IDs.<br/>
Then applied a descriptive activity names to the data set Y for the names of activities, and a name "activity" to the column of Y.<br/>
Here is a small overview what Y looks like (column name, first and last observations, and the activities' list):
    ```
>names(Y)
[1] "activity"
>head(Y)
  activity
1 standing
2 standing
3 standing
4 standing
5 standing
6 standing
>tail(Y)
             activity
10294 walkingupstairs
10295 walkingupstairs
10296 walkingupstairs
10297 walkingupstairs
10298 walkingupstairs
10299 walkingupstairs
>unique(Y)
             activity
1            standing
28            sitting
52             laying
79            walking
126 walkingdownstairs
151   walkingupstairs
```

4. Then the script appropriately labels the data set with descriptive activity names.<br/>
Then it merges the Y data frame containing features with X data frames containing activity labels and subject IDs. The result is saved as "merged_clean_data.txt". The cleaned_data data frame comtains 10299 observations of 68 variables.
    ```
>head(names(cleaned_data))
[1] "subject"         "activity"        "tbodyacc-mean-x" "tbodyacc-mean-y" "tbodyacc-mean-z"
[6] "tbodyacc-std-x" 
>tail(names(cleaned_data))
[1] "fbodybodyaccjerkmag-mean"  "fbodybodyaccjerkmag-std"   "fbodybodygyromag-mean"    
[4] "fbodybodygyromag-std"      "fbodybodygyrojerkmag-mean" "fbodybodygyrojerkmag-std"
```

5. The script creates a second, independent tidy data set with the average of each variable for each activity and each subject.<br/>
Resulting data frame (result) contains 180 observations of 68 variabless.
```
>head(names(result))
[1] "subject"         "activity"        "tbodyacc-mean-x" "tbodyacc-mean-y" "tbodyacc-mean-z"
[6] "tbodyacc-std-x" 
>tail(names(result))
[1] "fbodybodyaccjerkmag-mean"  "fbodybodyaccjerkmag-std"   "fbodybodygyromag-mean"    
[4] "fbodybodygyromag-std"      "fbodybodygyrojerkmag-mean" "fbodybodygyrojerkmag-std"
```
The first column of the data frame "result" contains subject IDs, the second column contains activity names, and then the rest of columns are the mean values.<br/>
The resulting data frame is saved in the file "data_set_with_the_averages.txt".