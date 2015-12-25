# CodeBook

## Processing:

- Read all 6 data from both test and train folders
- Join the subject, X and y accross the each test and train
- Join the test and train dataset
- Read the features file to get column names
- Create valid column names by parsing invalid characters
- Create a new dataset with only columns that have mean and std
- Read the activity labels file
- Replace the activity id by the activity name
- Create new tall dataset with the combination of variable and values per each subject and activity
- Create new summary dataset with mean values accross subject, activity and variable
- Export the new file

## Variables

* tBodyAccMean()-Y
* tBodyAccMean()-X
* tBodyAccMean()-Z
* tBodyAccSTD()-X
* tBodyAccSTD()-Y
* tBodyAccSTD()-Z
* tGravityAccMean()-X
* tGravityAccMean()-Y
* tGravityAccMean()-Z
* tGravityAccSTD()-X
* tGravityAccSTD()-Y
* tGravityAccSTD()-Z
* tBodyAccJerkMean()-X
* tBodyAccJerkMean()-Y
* tBodyAccJerkMean()-Z
* tBodyAccJerkSTD()-X
* tBodyAccJerkSTD()-Y
* tBodyAccJerkSTD()-Z
* tBodyGyroMean()-X
* tBodyGyroMean()-Y
* tBodyGyroMean()-Z
* tBodyGyroSTD()-X
* tBodyGyroSTD()-Y
* tBodyGyroSTD()-Z
* tBodyGyroJerkMean()-X
* tBodyGyroJerkMean()-Y
* tBodyGyroJerkMean()-Z
* tBodyGyroJerkSTD()-X
* tBodyGyroJerkSTD()-Y
* tBodyGyroJerkSTD()-Z
* tBodyAccMagMean()
* tBodyAccMagS()
* tGravityAccMagMean()
* tGravityAccMagSTD()
* tBodyAccJerkMagMean()
* tBodyAccJerkMagSTD()
* tBodyGyroMagMean()
* tBodyGyroMagSTD()
* tBodyGyroJerkMagMean()
* tBodyGyroJerkMagSTD()
* fBodyAccMean()-X
* fBodyAccMean()-Y
* fBodyAccMean()-Z
* fBodyAccSTD()-X
* fBodyAccSTD()-Y
* fBodyAccSTD()-Z
* fBodyAccMeanFreq()-X
* fBodyAccMeanFreq()-Y
* fBodyAccMeanFreq()-Z
* fBodyAccJerkMean()-X
* fBodyAccJerkMean()-Y
* fBodyAccJerkMean()-Z
* fBodyAccJerkSTD()-X
* fBodyAccJerkSTD()-Y
* fBodyAccJerkSTD()-Z
* fBodyAccJerkMeanFreq()-X
* fBodyAccJerkMeanFreq()-Y
* fBodyAccJerkMeanFreq()-Z
* fBodyGyroMean()-X
* fBodyGyroMean()-Y
* fBodyGyroMean()-Z
* fBodyGyroSTD()-X
* fBodyGyroSTD()-Y
* fBodyGyroSTD()-Z
* fBodyGyroMeanFreq()-X
* fBodyGyroMeanFreq()-Y
* fBodyGyroMeanFreq()-Z
* fBodyAccMagMean()
* fBodyAccMagSTD()
* fBodyAccMagMeanFreq()
* fBodyBodyAccJerkMagMean()
* fBodyBodyAccJerkMagSTD()
* fBodyBodyAccJerkMagMeanFreq()
* fBodyBodyGyroMagMean()
* fBodyBodyGyroMagSTD()
* fBodyBodyGyroMagMeanFreq()
* fBodyBodyGyroJerkMagMean()
* fBodyBodyGyroJerkMagSTD()
* fBodyBodyGyroJerkMagMeanFreq()

## Activities

* WALKING (value 1): subject was walking during the test
* WALKING_UPSTAIRS (value 2): subject was walking up a staircase during the test
* WALKING_DOWNSTAIRS (value 3): subject was walking down a staircase during the test
* SITTING (value 4): subject was sitting during the test
* STANDING (value 5): subject was standing during the test
* LAYING (value 6): subject was laying down during the test