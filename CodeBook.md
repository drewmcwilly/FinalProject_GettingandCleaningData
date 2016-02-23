# CodeBook

## Data for Analysis
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone
The following files provided in for analysis are as located in the compressed file: Final_Proj.zip, under the folder UCI HAR Dataset

* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

## Variables
The data set includes accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The script run_analysis.R focuses on extracting the signals that calculated:
mean(): Mean value
std(): Standard deviation

while ignoring all other variables in the sets

## Transformations
To perform the transformation steps the library dplyr was used to augment the base R library
* two data sets were created that merged the y_train.txt and y_test.txt files to add the corresponding labels from the activity.txt file
* Both the training and testing set were read in, using the features.txt file to populate the column names
* The id for the test subject and activity label are added to both the test and train sets
* Test and train sets are combined to form a single set
* unneeded variables are stripped from the combined set
* The set is grouped by by activity/subject and the mean is performed on the remaining variables
* column names are renamed from the resulting set in the following manner:

