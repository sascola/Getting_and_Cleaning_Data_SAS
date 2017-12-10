---
title: "GCD Code Book"
output: html_document
---


Analysis of Files

Create an R Script Merges the training and the test sets to create one data set. Extracts only the measurements on the mean and standard deviation for each measurement. Uses descriptive activity names to name the activities in the data set Appropriately labels the data set with descriptive variable names. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Script 1: Create a single dataset
##Packages

There are a number of packages that are useful for this exercise worth loading

    *readr: series of functions to easily read structured data into the R environment

    *data.table: provides extensions for data frames with functions for ordering and subsetting

    *dplyr: provides the most common verbs for data manipulation in tables

    *tidyr: variety of functions to clean up data in a table in order to make it “tidy”
    
    *stringer
    
    *replyr
    
    *shape
    
    *shape2

##Reading Files into R

Within the UCI_HAR Dataset there are three primary places where the data is extracted.

~~~~
path <- setwd("~/UCI_HAR_Dataset/")
~~~~

In the top directory there are two essential files:

~~~~
    activity_labels.txt: contains the six activity types measured during the experiment. The should be read and stored as factors.
~~~~

features.txt: contains 561 values that represent all of the measurements. These will become variable and column names for the readings which are divided up into training and test data. However, there are datapoints that are statistical derivations which should ultimately be separated in order to create cleaner data sets because they represent different types of observations.

~~~~
  activity_labels <- read_csv(file = "activity_labels.txt", col_names = FALSE)
  features <- read_delim("features.txt", "\t", escape_double = FALSE, col_names = FALSE, trim_ws = TRUE)
~~~~

Move down a directory level to the training data (or test data).

~~~~~
  setwd("./train)
~~~~~

or

~~~~~
  setwd("./test)
~~~~~

All of the data sets in the train and test sets will have 7352 and 2947 items, respectively, representing the entirety of the measures across all subjects in the experiment.

Two of the files can be read together together to form the first two columns to anchor the data set.

  *subject_train.txt: contains the reference to one of the 30 subjects or participants. The subject ID repeats for each of the measures in the set attributed to that subject.

  *y_train: contains a corresponding reference to one of the six activity types.

The following instructions will be repeated for both directories

~~~~~
  y_train <- read.table("y_train.txt", header = FALSE, sep = ",")'
  subject_train <- read.table("subject_train.txt", header = FALSE, sep = ",")'
  x_train_data <- read.table("X_train.txt", sep = "" , header = F , na.strings ="", stringsAsFactors= F)'
~~~~~

Also found in the directory is the X_train data set which represents all of the measurements.

The next step is to read in the X_train.txt data

Create the y_test and subject_test data sets

~~~~
  y_test <- read.table("y_test.txt", header = FALSE, sep = ",")
  subject_test <- read.table("subject_test.txt", header = FALSE, sep = ",")
~~~~

Create a single dataset

Create x_test data set

~~~~~
  x_test_data <- read.table("X_test.txt", sep = "" , header = F , na.strings ="", stringsAsFactors= F)
~~~~~

Create a single data set by row binding the two with test on top

~~~~
  test_data <- cbind( subject_test, y_test, x_test_data)
  train_data <- cbind( subject_train, y_train, x_train_data)
  all_data <- rbind(test_data, train_data)
~~~~

Column names are the subject ID, activity code, plus the readings as named in features.txt. The features can be tidied before creating before setting the names.



Set first two columns as factors

~~~~  
  factor(all_data$subject)
  factor(all_data$activity_code)
~~~~
  
#Script 2: Tidy Data and Summarization 

~~~~
  selected_data <- all_data
~~~~

Remove meta characters

~~~~
  feature_nospace <- sub(" ","", column_names)
  feature_columns <- tolower(feature_nospace)
  words_columns <- gsub("^[t]","total", feature_columns)
  words_columns <- gsub("^[f]", "fourier", words_columns)
  nochar_columns <-gsub("[/-]|[/(]|[/)]|[/,]", "", words_columns)

  colnames(selected_data) <- nochar_columns
~~~~

Create vector with the columns with data that represents mean and standard deviation

~~~~
var_mean <- grep("mean", names(selected_data), value = TRUE)
var_std <- grep("std", names(selected_data), value = TRUE)
~~~~

Subset a table with mean and standard deviation data

~~~~
  part_tidy_data <- select(selected_data, subject, activity_code, 
                        grep("mean", names(selected_data), value = TRUE),
                        grep("std", names(selected_data), value = TRUE))
~~~~

Melt the data set to have one observation per row and create a summary table

~~~~
  tidy_data <- melt(part_tidy_data, id = c("subject", "activity_code"))
  tidy_mean <- dcast(tidy_data, formula = subject + activity_code ~ variable)
~~~~
  
Write the table to a file for submission

~~~~
  setwd("..")  
  write.table(tidy_mean, file = "SCOLA_Tidy_File.csv")
~~~~
