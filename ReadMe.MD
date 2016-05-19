Create a directory called 'dcProject' for code.
Create a subdirectory 'data' under 'dcProject' for data files
Copy following files to dcProject\data:
	UCI HAR Dataset\activity_labels.txt
	UCI HAR Dataset\features.txt
	UCI HAR Dataset\x_test.txt
	UCI HAR Dataset\test\y_test.txt
	UCI HAR Dataset\test\subject_test.txt
	UCI HAR Dataset\train\x_train.txt
	UCI HAR Dataset\train\y_train.txt
	UCI HAR Dataset\train\subject_train.txt
	
Copy the R script file (runanalysis.R) to dcProject folder

Open R or Rstudio console.

Set working directory to 'dcProject' directory by providing the absolute path of 'dcProject' as parameter in setwd().

Run: source("runanalysis.R").
This will execute all the steps and assign the output to "tidydsresult" data frame.  Also writes the output tidyresultsds.txt file.

Run ls() to list the objects created by the script file.
