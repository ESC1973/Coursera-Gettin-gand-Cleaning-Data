# Coursera-Gettin-gand-Cleaning-Data

This Readme file describes the Assignment: Getting and Cleaning Data Course Project, the files involved, and the different script files to solve it.
Preparation:
1. First you will need to download the Samsung data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Unzip the downloaded file and rename the folder to "Data".

3. Copy the R script file “run_analysis.R” and place it in the same folder “Data”. Optionally, take the second R script file “Insights results.R” to make dplyr stuff and see how data is structured. This last script is just for practice dplyr.

4. In Rstudio use source("run_analysis.R")

5. If everything goes well you should obtain two files:

merged_data.txt:  the first data frame called DataSet1.

data_with_means.txt: the second data frame called DataSet2.

This DataSet2 with dims 180 rows (6 activities x 30 subjects) and 66  features 
