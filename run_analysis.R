train <- read.table("./train/X_train.txt")
test <- read.table("./test/X_test.txt")

#cleaning the train set first. Will repeat the same code for the test set
#take features.txt and use it to create descriptive variable names in train set
features <- read.table("features.txt", header = FALSE)
features <- t(features)
features <- features[-c(1),]
names(train) <- features

#read subjects file and add ID as header
subjecttrain <- read.table("./train/subject_train.txt")
names(subjecttrain) <- c("ID")

#replace activity number with activity name
activitylabels <- read.table("./activity_labels.txt")
activitytrain <- read.table("./train/y_train.txt")
names(activitytrain) <- c("activity")
#for loop replaces activty code with descriptive activity name
for (i in 1:6) {
  activitytrain$activity <- gsub(activitylabels[i,1], activitylabels[i,2], activitytrain$activity)
}

#pull out only mean and standard deviation
meanstdmergetrain <- train[,grepl("mean", names(train)) | grepl("std", names(train))]

#combine mean and std merge with subject # and activity names
trainmerge <- cbind(subjecttrain, activitytrain, meanstdmergetrain)

#now, repeat the same stesps as above to clean the test set
#features.txt is same dataframe for both trian and test.
names(test) <- features

#add subjects ID to test set
subjecttest <- read.table("./test/subject_test.txt")
names(subjecttest) <- c("ID")

#replace activity number with activity name
activitytest <- read.table("./test/y_test.txt")
names(activitytest) <- c("activity")
#for loop replaces activty code with descriptive activity name
for (i in 1:6) {
  activitytest$activity <- gsub(activitylabels[i,1], activitylabels[i,2], activitytest$activity)
}

#pull out only mean and standard deviation
meanstdmergetest <- test[,grepl("mean", names(test)) | grepl("std", names(test))]

#combine mean and std merge with subject # and activity names
testmerge <- cbind(subjecttest, activitytest, meanstdmergetest)

##combine test and train sets
cleandata <- rbind(testmerge, trainmerge)

#part 5 of assignment - creates a second, independent tidy data set with the 
#average of each variable for each activity and each subject.
library(dplyr)
cleandata <- group_by(cleandata, ID, activity)
cleandatamean <- summarize_all(cleandata, function(x) mean(x))

write.table(cleandata, "Clean Data.txt", row.names = FALSE)
