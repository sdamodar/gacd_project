
### Preparation

#  Load packages
library(plyr)
library(dplyr)

### (1) Create column names from features.txt file
#  Read raw data
featuretxt <- read.table("./data/features.txt",header=FALSE)


### (2) Create Test dataset (2947 rows, 563 columns)
# Load activity id and subject id for test data from files
testActivityId <- read.csv("./data/y_test.txt", header = FALSE)
testSubjectId <- read.csv("./data/subject_test.txt", header = FALSE)

# Rename columns with labels
testActivityId <- rename(testActivityId, Activity=V1)
testSubjectId <- rename(testSubjectId, Subject=V1)

# Create test dataset body 
testdsbody <- read.table("./data/X_test.txt", header = FALSE)

# Rename the columns to feature names
colnames(testdsbody) <- featuretxt$V2

#Integrate test data rowids and test data body to get test dataset
testds <- cbind(testActivityId, testSubjectId,testdsbody)

### (3) Create Train dataset (7352 rows, 563 columns)
# Load activity id and subject id for train data from files
trainActivityId <- read.csv("./data/y_train.txt", header = FALSE)
trainSubjectId <- read.csv("./data/subject_train.txt", header = FALSE)

# Rename columns with labels
trainActivityId <- rename(trainActivityId, Activity=V1)
trainSubjectId <- rename(trainSubjectId, Subject=V1)

# Create train dataset body 
traindsbody <- read.table("./data/X_train.txt", header = FALSE)

# Rename the columns to feature names
colnames(traindsbody) <- featuretxt$V2

#Integrate train data rowids and train data body to get test dataset
trainds <- cbind(trainActivityId, trainSubjectId,traindsbody)

### (4) Merge Test dataset and Train dataset to create Full dataset
###     (10299 rows, 563 columns)
fullds <- rbind(trainds, testds)

# Replace activity ids with activity name
fullds$Activity <- sub("1", "WALKING", fullds$Activity)
fullds$Activity <- sub("2", "WALKING_UPSTAIRS", fullds$Activity)
fullds$Activity <- sub("3", "WALKING_DOWNSTAIRS", fullds$Activity)
fullds$Activity <- sub("4", "SITTING", fullds$Activity)
fullds$Activity <- sub("5", "STANDING", fullds$Activity)
fullds$Activity <- sub("6", "LAYING", fullds$Activity)

# Identify columns with mean and std
mean_std_cols <- grep("([Mm]ean|std)", names(fullds))

# Create the tidyds
tidyds <- fullds[ ,c(1:2,mean_std_cols)]

### (5) Create a new dataset with the average of each variable
### for each activity and each subject
tidydsResult <- ddply(tidyds, .(Activity,Subject), colwise(mean))

#  Write the output to a file
write.table(tidydsResult,"./data/tidydsresult.txt", row.names = FALSE)
