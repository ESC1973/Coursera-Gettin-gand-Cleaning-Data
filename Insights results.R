#This is an additional file to take a look at the Dataset2.
#I have very little knowledge about making plots, so do not expect 
#here High-tech.

#First structure and some subsetting to see the Dataset2 from previous FUN
str(Dataset2)
Dataset2[1:8, 1:6]
library(dplyr)
Red <- select(Dataset2, 2:9)

#Some plots to check the relatiopnship between AccMean and AccStd
plot(Red$tBodyAccMeanY, Red$tBodyAccStdY)
plot(Red$tBodyAccMeanX, Red$tBodyAccStdX)

#It seems that there are two major groups when we plot them together.
#Like if sitting/standing would not be simmilar to other moving criteria.
attach(Red)
names(Red)
Red <- mutate(Red,facactivity =factor(activity,
                                      labels= c("laying","sitting","standing",
                                                "walking","walkingDownstairs",
                                                "walkingUpstairs")))

#I know, this is not tidy data format, but I want to make the variables short
#otherwise they occupy to much screen.

Act<- group_by(Red,facactivity)
summarize(Act, BAMeanX=mean(tBodyAccMeanX),
          BAStdX=mean(tBodyAccStdX),
          BAMeanY=mean(tBodyAccMeanY),
          BAStdY=mean(tBodyAccStdY),
          BAMeanZ=mean(tBodyAccMeanZ),
          BAStdZ=mean(tBodyAccStdZ))
#Then taking a look at the previous plots, we know how they are distributed.
#All still positions have the lowest Std values.
plot(result$tBodyAccMeanY, result$tBodyAccStdY)
plot(result$tBodyAccMeanX, result$tBodyAccStdX)


