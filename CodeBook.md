Getting and Cleaning Data project Code Book

This project original data are coming from the source 
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The full description of the data
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The script named "run_analysis.R" performed the cleaning of the data, as follow:

1. variable data1 and data2 are used to bind the related data from UCI HAR Dataset folder using read.table() function 
   and it is named X, ST, and Y variables.
   
2. load the features.txt file to extract the measurements on the mean and standard deviation for each deviation. 

3. load the activity_labels.txt file and give the descriptive activity nanes:
    	  V1	V2
    1	  1	walking
    2	  2	walkingupstairs
    3	  3	walkingdownstairs
    4	  4	sitting
    5	  5	standing
    6	  6	laying
    
4. The run_analysis.R script also appropriately labels with descriptive variable names. After it is appropriately labeled, 
   the results is saved into a file names clean_data.txt
   
5. Finally, from clean_data.txt data sets, it is once again sorted into independent tidy data with average of each variable for
   each activity and each subject. The results is saved into a file named data-set-with-average.txt

  
