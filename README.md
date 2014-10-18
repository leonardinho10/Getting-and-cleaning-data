Getting-and-cleaning-data
=========================
This project requires the understanding of the Samsung experiment.

By merging both test and training sets from the Samsung folder, we are able to access the whole group of participants in the users and variables included in the above dataset are selected from the features highlighted in features.txt of the Samsung folder. Features chosen include only those that have mean() and std() in the variable names as that was required of us. Features numbered 555 to 561 with names like angle(tBodyAccMean,gravity) were not included as we are not sure how that mean is defined.

This repo includes the following files:
=========================================

- 'README.md'

- 'R script titled run_analysis.R': This script does the following processes.
      1. Merges the training and the test sets to create one data set.
      2. Extracts only the measurements on the mean and standard deviation for each measurement. 
      3. Uses descriptive activity names to name the activities in the data set
      4. Appropriately labels the data set with descriptive variable names. 
      5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each               activity and each subject.

- 'Codebook.md': describing the variables


========================================
The X_test, X_train, y_test, y_train, subject_test, subject_train, files were all read into R and the training data were all combined under rbind() so subject_train will be a new column and so on.This is then done for the test sets. While the test and training data were then later combined together using cbind().

Next, features.txt was then read into R to choose which columns we want for our data set as we only have to extract measurements on the mean and standard deviation for each measurement. These features were chosen by looking at their names if they have mean() or std() in them.

activity_labels were then read into R to replace the numbers in the activity feature to descriptive words like "WALKING".

Names of the features were then modified from "V1", "V2" etc to more descriptive labels.

Lastly an aggregate function was used on that dataset to create a second, independent tidy data set with the average of each variable for each activity and each subject.

