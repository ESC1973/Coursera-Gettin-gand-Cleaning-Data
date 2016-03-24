#CodeBook describing this project.


This file describes the data, an explanation of the variables, and finally all transformations to clean up the data. 
The data for the project was downloaded from :
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The source and the Data Set Information was obtained from: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

All credits of this data go to:

Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)

1 - Smartlab - Non-Linear Complex Systems Laboratory DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 

2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws 

#Introduction:

The involved R script for this assignment is “run_analysis.R”. The goal of this script is to take several datasets (data experiments from 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz and the respective labels) and finally give the requested output, which in this case it is the average values.

#Involved Steps

The following part corresponds to the involved steps.

##Step 1. Merges the training and the test sets to create one data set.

Step 1A. Set your working directory to the folder containing the unzipped files folder “Data”.

Step 1B. Load the different files. Load the files “X.train.txt”, “y_train.txt”, “subject_train.txt", “X_test.txt", “y_test.txt", and #“subject_test.txt".

Step 1C. Merge the training and the test sets to create one data set. Use command rbind. Since we are merging the several data sets, it is proposed to double check the dims.
 

##Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.

Step 2A. Load the "features.txt" file and check dims.

Step 2B. Extract only the mean and std-dev measurements.

Step 2C. Join JoinData with the Indices from mean and std-dev. Check dims.

Step 2D. Modify the variables according to: Remove "()" in Indices from mean and std-dev.  Remove "-" in JoinData. Turn capital M in mean and S in std dev also in JoinData.


##Step3. Uses descriptive activity names to name the activities in the data set.

Step 3A. Read "activity_labels.txt"

Step 3B. Modify tolower and remove "-" in activity_labels.

Step 3C. Motidy toupper data.frame activity.

Step 3D. Join activity to joinlabel.

Step 3E. Assign names activity in modified joinLabel.


##Step4. Appropriately labels the data set with descriptive activity names.

Step 4A. Create DataSet1 joining joinSubject, joinLabel, joinData. Check Dims.

Step 4B. Create "merged_data.txt" with command write.table.


##Step5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Step 5A. Create DataSet2 making a data.frame with dim nrow=subjectLen*activityLen and ncol=columnLen. Check Dims.

Step 5B. Fill the data.frame with colMeans of the variables.
Step 5D. Create "data_with_means.txt" with command write.table.

The file "data_with_means.txt" corresponds to the final cleaned result.

