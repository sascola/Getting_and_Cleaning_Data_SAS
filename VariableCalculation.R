# Extract mean and standard deviation for each measurement

# Load libraries in case they are not already loaded
library(readr)
library(data.table)
library(dplyr)
library(tidyr)
library(stringr)
library(replyr)
library(reshape)
library(reshape2)

selected_data <- all_data

# Remove meta characters
feature_nospace <- sub(" ","", column_names)
feature_columns <- tolower(feature_nospace)
words_columns <- gsub("^[t]","total", feature_columns)
words_columns <- gsub("^[f]", "fourier", words_columns)
nochar_columns <-gsub("[/-]|[/(]|[/)]|[/,]", "", words_columns)

colnames(selected_data) <- nochar_columns

# Create vector with the columns with data that represents mean and standard deviation
var_mean <- grep("mean", names(selected_data), value = TRUE)
var_std <- grep("std", names(selected_data), value = TRUE)

## Subset a table with mean and standard deviation data
part_tidy_data <- select(selected_data, subject, activity_code, 
                        grep("mean", names(selected_data), value = TRUE),
                        grep("std", names(selected_data), value = TRUE))

#feature_nonum <- gsub("^[1-9,0]+|^[1-9,0]+|^[1-9,0]", "", feature_nospace)     Did not use because it created duplicates.

as.factor(selected_data$activity_code)
#activity_match <- data.frame(match(selected_data$activity_code, grep("[1-6]",selected_data$activity_code, value = FALSE)))

# Melt the data set to have one observation per row
tidy_data <- melt(part_tidy_data, id = c("subject", "activity_code"))
tidy_mean <- dcast(tidy_data, formula = subject + activity_code ~ variable)


#Write the table to a file for submission
~~~
  setwd("..")
  write.table(tidy_mean, file = "SCOLA_Tidy_File.csv")
~~~
#######################
#colnames(tidy_data) <- c("subject", "activitycode", "measure", "reading")
#tidy_mean_data <- data.table(split(tidy_data$measure, tidy_data$activitycode))
#tidy_mean <- lapply(tidy_mean_data, mean)
#ddply(insectsprays,.(spray),summarize,sum=sum(count))    #plyr