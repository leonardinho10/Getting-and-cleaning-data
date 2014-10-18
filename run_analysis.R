dataxtest <- read.table("./test/X_test.txt") #retrieves the x test set from the folder
dataxtrain <- read.table("./train/X_train.txt") #retrieves the x train set from the folder

dataytest <- read.table("./test/y_test.txt") #retrieves the y test set from the folder
dataytrain <- read.table("./train/y_train.txt") #retrieves the y train set from the folder

data.subj.test <- read.table("./test/subject_test.txt") #retrieves the subjects test set from the folder
data.subj.train <- read.table("./train/subject_train.txt") #retrieves the subjects train set from the folder

#merging x, y and subject test set together
datatest <- cbind(data.subj.test, dataytest, dataxtest)

#merging x, y and subject train set together
datatrain <- cbind(data.subj.train, dataytrain, dataxtrain)

#merging test and train together
data <- rbind(datatrain, datatest)

features <- read.table("./features.txt")
#find all column numbers with the word "mean()"
col_mean_index <- grep("mean()",features[,2])

#find all column numbers with the word "std()"
col_std_index <- grep("std()",features[,2])

col_index <- sort(c(col_mean_index, col_std_index))

#Task 2: Extracting only the measurements on the mean and standard deviation for each measurement. This will mean taking all features with mean() and std() at the end. 
#The first two columns are subject and y respectively.
data <- data[,c(1,2,(col_index+2))]

#Task3: Uses descriptive activity names to name the activities in the data set
activities <- read.table('./activity_labels.txt')
for (i in 1:6){  
  data[,2] <- gsub(i, activities[i,2], data[,2])
}

#Task 4: Appropriately labels the data set with descriptive variable names. 
features_i_need <- as.character(features[col_index,2])
names(data) <- c("subject_number", "activity", features_i_need)


#Task 5: From the data set in step 4, creates a second, independent 
#tidy data set with the average of each variable for each activity and each subject.
tidydata <- aggregate(.~subject_number+activity,data,mean)
print(tidydata)

