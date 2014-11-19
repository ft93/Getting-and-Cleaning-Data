## Question 1 ---  merging all data from train and test to create one data sets
## bind it using "rbind" function

data1 <- read.table("test/X_test.txt")
data2 <- read.table("train/X_train.txt")
X <- rbind(data1, data2)

data1 <- read.table("test/subject_test.txt")
data2 <- read.table("train/subject_train.txt")
ST <- rbind(data1, data2)

data1 <- read.table("test/Y_test.txt")
data2 <- read.table("train/Y_train.txt")
Y <- rbind(data1, data2)

## Question 2 --- Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")
indices_of_good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, indices_of_good_features]
names(X) <- features[indices_of_good_features, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

## Question 3 --- Uses descriptive activity names to name the activities in the data set.

activity_label <- read.table("activity_labels.txt")
activity_label[, 2] = gsub("_", "", tolower(as.character(activity_label[, 2])))
Y[,1] = activity_label[Y[,1], 2]
names(Y) <- "activity"

## Question 4 --- Appropriately labels the data set with descriptive variable names. 
names(ST) <- "subject"
cleanedData <- cbind(ST, Y, X)
write.table(cleanedData, "clean_data.txt")

## Question 5 --- From the data set in step 4, creates a second, 
##independent tidy data set with the average of each variable for each activity and each subject.

uniqueSubjects = unique(ST)[,1]
numSubjects = length(unique(ST)[,1])
numActivities = length(activity_label[,1])
numCols = dim(CleanedData)[2]
result = CleanedData[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    result[row, 1] = uniqueSubjects[s]
    result[row, 2] = activity_label[a, 2]
    tmp <- CleanedData[CleanedData$subject==s & CleanedData$activity==activity_label[a, 2], ]
    result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}
write.table(result, "data-set-with-average.txt")