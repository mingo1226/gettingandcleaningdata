# gettingandcleaningdata
Final Assignment

I have notes in the script too that further clarify what's happening in the code. 

I first, decided to clean the train and test data sets seprate from one another, and then merge them at the end. The following steps are repeated in the same order for both the test and the train set. 

Step 1: Read the test and train data sets into R

Step 2: Use the features.txt as the descriptive variable names. Transpose the data set for easy merge with the train and test data sets. Get rid of the extra row of numbers. Merge with the test and train data sets

Step 3: Use the subject_train/test.txt data sets as the subject ID. Re-name variable ID for easy identification later. 

Step 4: Use the activity_labels.txt as the label for specific activities 1 through 6. Use a for loop to loop through all the data and apply the specific activity names in place of the corrisponding number. 

Step 5: Subset data into a new set with only the mean and std.

Step 6: Merge the new data set with the subject ID and the activity names. 

Step 7: After repeating above for both test and train set, merge both test and train.

Step 8: Use dplyr's group_by to group data by subject ID and activity. 

Step 9: Use the summarize_all function in dplyr to run the mean on the groups created above. 

Step 10: write file into .txt

I used the variable names given in the download, which can be accessed here in the features.text file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
