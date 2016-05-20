Data files:
	UCI HAR Dataset\activity_labels.txt
	UCI HAR Dataset\features.txt  (contains labels for features/variables)
	UCI HAR Dataset\x_test.txt (test data)
	UCI HAR Dataset\test\y_test.txt (activity index for test data)
	UCI HAR Dataset\test\subject_test.txt (subject index for test data)
	UCI HAR Dataset\train\x_train.txt (train data)
	UCI HAR Dataset\train\y_train.txt (activity index for train data)
	UCI HAR Dataset\train\subject_train.txt (subject index for train data)

Variables:
	featuretxt: data frame to store data from features.txt.  row count: 561. column count: 2
	
	testActivityId: data frame to store data from y_test.txt.  row count: 2947. column count: 1
	
	testSubjectId: data frame to store data from subject_test.txt.  row count: 2947. column count:1
	
	testdsbody: data frame to store data from x_test.txt.  row count: 2947. column count: 561
	
	testds: data frame to store the merged columns from testActivityId, testSubjectId and testdsbody.  row count: 2947. column count: 563
	
	trainActivityId: data frame to store data from y_train.txt.  row count: 7352. column count: 1
	
	trainSubjectId: data frame to store data from subject_train.txt.  row count: 7352. column count:1
	
	traindsbody: data frame to store data from x_train.txt.  row count: 7352. column count: 561
	
	trainds: data frame to store the merged columns from trainActivityID, trainSubjectId and traindsbody.  row count: 7352. column count: 563
	
	fullds: data frame to store the merged rows from trainds and testds.  row count: 10299; column count: 563
	tidyds: data frame to store measures of mean and std from fullds.  row count: 10299; column count: 88

	tidydsResult: data frame to store the result of the average of each variable for each activity and each subject.  row count: 180 (6 activities * 30 subjects).  column count: 88
	
Transformations  Steps
Create feature column names from features.txt file
	- Read data from features.txt and store it in featurestxt data frame.  column V1 contains the row number and column V2 contains the feature name.   

Create test data set
	- Load activity id from  y_test.txt file into data frame testActitivyId.
	- Load subject id for subject_test.txt file into data frame testSubjectId.
	- Create the test dataset body by loading data from x_test.txt file into data frame testdsbody.
	- Rename the generic columns names (V1, V2..) of test dataset body with feature names (featuretxt)
	- Create the test dataset by merging columns from testActivityId, testSubjecId and testdsbody.

Create train data set
	- Load activity id from  y_train.txt file into data frame trainActitivyId.
	- Load subject id for subject_train.txt file into data frame trainSubjectId.
	- Create the train dataset body by loading data from x_train.txt file into data frame traindsbody.
	- Rename the generic columns names (V1, V2..) of train dataset body with feature names (featuretxt)
	- Create the train dataset by merging columns from trainActivityId, trainSubjectId and traindsbody.
	
Create full data set
	- Create the full data set by merging rows from testds and trainds into data frame fullds

Create tidy data set from full data set
	- Create a tidy ds from full ds by filtering (using grep) on columns with 'mean' or 'std'

Calculate the average of each variable for each activity and each subject
	- Use ddply function on tidy data set to calculate the average of each variable for each activity & each subject and store the output in dataframe tidydsresult.

