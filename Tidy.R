# Load libraries
library(readr)
library(data.table)
library(dplyr)
library(tidyr)
library(stringr)
library(replyr)
library(reshape)

# Set working directory to assignment parent
path <- setwd("~/Desktop/UCI_HAR_Dataset/")

# Read labels and features to create column names
activity_labels <- read_csv(file = "activity_labels.txt", col_names = FALSE)
features <- read_delim("features.txt", "\t", escape_double = FALSE, col_names = FALSE, trim_ws = TRUE)


# Set working directory to "train"
#setwd("~/Desktop/UCI_HAR_Dataset/train/")
setwd("./train")

# Read files from training data directory
y_train <- read.table("y_train.txt", header = FALSE, sep = ",")
subject_train <- read.table("subject_train.txt", header = FALSE, sep = ",")
# Create x_train data set
x_train_data <- read.table("X_train.txt", sep = "" , header = F , na.strings ="", stringsAsFactors= F)

# Read files from the test directory
## Switch to the test directory; move up to parent directory and then open the test directory
setwd("..")
setwd("./test")

## Create the y_test and subject_test data sets
y_test <- read.table("y_test.txt", header = FALSE, sep = ",")
subject_test <- read.table("subject_test.txt", header = FALSE, sep = ",")

## Create x_test data set
x_test_data <- read.table("X_test.txt", sep = "" , header = F , na.strings ="", stringsAsFactors= F)

# Create a single data set
## Combine the test data
test_data <- cbind( subject_test, y_test, x_test_data)

## Combine the train data
train_data <- cbind( subject_train, y_train, x_train_data)

## Create a single data set by row binding the two with test on top
all_data <- rbind(test_data, train_data)

## Add column names
## Column names are the subject ID, activity code, plus the readings as named in features.txt
feature_list <- unlist(features, use.names = FALSE)
feature_nospace <- sub(" ","", feature_list)
feature_nonum <- gsub("^[1-9,0]+|^[1-9,0]+|^[1-9,0]", "", feature_nospace)
feature_columns <- tolower(feature_nonum)
words_columns <- gsub("^[t]","total", feature_columns)
words_columns <- gsub("^[f]", "fourier", words_columns)
nochar_columns <-gsub("[/-]|[/(]|[/)]|[/-]|[/,]", "", words_columns)
column_names <- c("subject", "activity_code",nochar_columns)
colnames(all_data) <- column_names

# Set first two columns as factors
## Set subject as factor
factor(all_data$subject)

## Set activity_code as factor
factor(all_data$activity_code)


