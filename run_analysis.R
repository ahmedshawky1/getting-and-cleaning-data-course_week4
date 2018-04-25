cat("\014")  # to clear screen
library(reshape2)
library(plyr)
#1-Merges the training and the test sets to create one data set.
  
  #Read All Files
subject_train <- read.table("./C4_4/train/subject_train.txt")
subject_test <- read.table("./C4_4/test/subject_test.txt")
X_train <- read.table("./C4_4/train/X_train.txt")
X_test <- read.table("./C4_4/test/X_test.txt")
Y_train <- read.table("./C4_4/train/y_train.txt")
Y_test <- read.table("./C4_4/test/y_test.txt")
activity_labels <- read.table("./C4_4/activity_labels.txt")
colnames(activity_labels)<-c("Activity_ID","Activity_Name")
print(activity_labels)
features <- read.table("./C4_4/features.txt")
names(X_train) <- features$V2
names(X_test) <- features$V2
ALL_train <- cbind(subject_train, y_train, X_train)
ALL_test <- cbind(subject_test, y_test, X_test)
ALL_DATA <- rbind(ALL_train, ALL_test);  #req 1



#####################################################################

#2-Extracts only the measurements on the mean and standard deviation for each measurement
req_col <-grepl("mean|std|subject|Activity_ID",names(ALL_DATA));
ALL_DATA_Filtered <- ALL_DATA[, req_col] #req2

#####################################################################

#3-Uses descriptive activity names to name the activities in the data set
#4-Appropriately labels the data set with descriptive variable names. 


final <- join(ALL_DATA_Filtered, activity_labels, by = "Activity_ID", match = "first")

#final <-final[,-1] #req 3 ,4


#5-From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

write.table(final,file="data.txt")





