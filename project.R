# Load needed librairies
library(data.table)

# 1. Merges the training and the test sets to create one data set.

file1 <- read.table("./data_sets_project/train/X_train.txt")
file2 <- read.table("./data_sets_project/test/X_test.txt")
X <- rbind(file1, file2)

file1 <- read.table("./data_sets_project/train/subject_train.txt")
file2 <- read.table("./data_sets_project/test/subject_test.txt")
Subject <- rbind(file1, file2)

file1 <- read.table("./data_sets_project/train/y_train.txt")
file2 <- read.table("./data_sets_project/test/y_test.txt")
Y <- rbind(file1, file2)

# Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("./data_sets_project/features.txt")
indices_of_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, indices_of_features]
names(X) <- features[indices_of_features, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

# 3. Uses descriptive activity names to name the activities in the data set.

activities <- read.table("./data_sets_project/activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.

names(Subject) <- "subject"
cleaned_data <- cbind(Subject, Y, X)
write.table(cleaned_data, "./merged_clean_data.txt")

uniqueSubjects = unique(Subject)[,1]
numSubjects = length(unique(Subject)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned_data)[2]
result = cleaned_data[1:(numSubjects*numActivities), ]

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    result[row, 1] = uniqueSubjects[s]
    result[row, 2] = activities[a, 2]
    tmp <- cleaned_data[cleaned_data$subject==s & cleaned_data$activity==activities[a, 2], ]
    result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}

write.table(result, "data_set_with_the_averages.txt")
