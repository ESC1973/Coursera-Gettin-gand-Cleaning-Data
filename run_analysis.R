#This R.function purpose is to conduct the operations described in the CodeBook 
#and ReadMe files .
#Step 1. Merges the training and the test sets to create one data set.
#Step 1A. Set your working directory to the folder containing the unzipped
#files folder “Data”.
#Step 1B. Load the different files.
#Load the files “X.train.txt”, “y_train.txt”, “subject_train.txt", 
#“X_test.txt", “y_test.txt", and #“subject_test.txt".
#Step 1C. Merge the training and the test sets to create one data set. 
#Use command rbind.
#Since we are merging the several data sets, it is proposed to double check the dims.

#setwd("~/Documents/Coursera/Data Spezialization/Data Cleaning/week4/MyPeer")

trainData <- read.table("./Data/train/X_train.txt")
dim(trainData) # 7352x561
head(trainData)
trainLabel <- read.table("./Data/train/y_train.txt")
table(trainLabel)
trainSubject <- read.table("./Data/train/subject_train.txt")
testData <- read.table("./Data/test/X_test.txt")
dim(testData) # 2947x561
testLabel <- read.table("./Data/test/y_test.txt") 
table(testLabel) 
testSubject <- read.table("./Data/test/subject_test.txt")
joinData <- rbind(trainData, testData) 
dim(joinData) # . It should be rows= 7352+2947=10299xcol=561
joinLabel <- rbind(trainLabel, testLabel)
dim(joinLabel) # It should be rows= 7352+2947=10299xcol=1
joinSubject <- rbind(trainSubject, testSubject)
dim(joinSubject) # It should be rows= 7352+2947=10299xcol=1

#Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#Step 2A. Load the "features.txt" file and check dims.
#Step 2B. Extract only the mean and std-dev measurements.
#Step 2C. Join JoinData with the Indices from mean and std-dev. Check dims.
#Step 2D. Modify the variables according to:
# Remove "()" in Indices from mean and std-dev.
# Remove "-" in JoinData.
# Turn capital M in mean and S in std dev also in JoinData.

features <- read.table("./Data/features.txt")
dim(features)  # Dim 561x2
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
length(meanStdIndices) # length 66
joinData <- joinData[, meanStdIndices]
dim(joinData) # Dim 10299x66
names(joinData) <- gsub("\\(\\)", "", features[meanStdIndices, 2]) 
names(joinData) <- gsub("mean", "Mean", names(joinData)) 
names(joinData) <- gsub("std", "Std", names(joinData)) 
names(joinData) <- gsub("-", "", names(joinData))  

#Step3. Uses descriptive activity names to name the activities in the data set.
#Step 3A. Read "activity_labels.txt"
#Step 3B. Modify tolower and remove "-" in activity_labels.
#Step 3C. Motidy toupper data.frame activity.
#Step 3D. Join activity to joinlabel.
#Step 3E. Assign names activity in modified joinLabel.

activity <- read.table("./Data/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[joinLabel[, 1], 2]
joinLabel[, 1] <- activityLabel
names(joinLabel) <- "activity"

#Step4. Appropriately labels the data set with descriptive activity names.
#Step 4A. Create DataSet1 joining joinSubject, joinLabel, joinData. Check Dims.
#Step 4B. Create "merged_data.txt" with command write.table.
names(joinSubject) <- "subject"
Dataset1 <- cbind(joinSubject, joinLabel, joinData)
dim(Dataset1) # Dim 10299x68
write.table(Dataset1, "merged_data.txt")

#Step5. Creates a second, independent tidy data set with the average of 
#each variable for each activity and each subject.
#Step 5A. Create DataSet2 making a data.frame with dim nrow=subjectLen*activityLen
#and ncol=columnLen. Check Dims.
#Step 5B. Fill the data.frame with colMeans of the variables.
#Step 5D. Create "data_with_means.txt" with command write.table.
subjectLen <- length(table(joinSubject)) # lenth 30
activityLen <- dim(activity)[1] # Dim 6
columnLen <- dim(Dataset1)[2]
Dataset2 <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen) 
Dataset2 <- as.data.frame(Dataset2)
colnames(Dataset2) <- colnames(Dataset1)
row <- 1
for(i in 1:subjectLen) {
  for(j in 1:activityLen) {
    Dataset2[row, 1] <- sort(unique(joinSubject)[, 1])[i]
    Dataset2[row, 2] <- activity[j, 2]
    bool1 <- i == Dataset1$subject
    bool2 <- activity[j, 2] == Dataset1$activity
    Dataset2[row, 3:columnLen] <- colMeans(Dataset1[bool1&bool2, 3:columnLen])
    row <- row + 1
  }
}
head(Dataset2)
write.table(Dataset2, "data_with_means.txt")
