# Extract mean and standard deviation for each measurement

# Load libraries in case they are not already loaded
library(readr)
library(data.table)
library(dplyr)
library(tidyr)
library(stringr)
library(replyr)
library(reshape)

selected_data <- all_data

# Create vector with the columns with data that represents mean and standard deviation
var_mean <- grep("mean", names(selected_data), value = TRUE)
var_std <- grep("std", names(selected_data), value = TRUE)


# Calculate the
## Subset a table with mean and standard deviation data
part_tidy_data <- select(selected_data, subject, activity_code, 
                        grep("mean", names(selected_data), value = TRUE),
                        grep("std", names(selected_data), value = TRUE))

## Reset the activity column with the actual names for a readable table
factor(selected_data$activity_code)
#activity_match <- data.frame(match(selected_data$activity_code, grep("[1-6]",selected_data$activity_code, value = FALSE)))

# Melt the data set to have one observation per row
tidy_data <- melt(part_tidy_data, id = c("subject", "activity_code"))

tidy_mean_data <- split(tidy_data$variable, tidy_data$activity_code)
tidy_mean <- lapply(tidy_mean_data, mean)



#ddply(insectsprays,.(spray),summarize,sum=sum(count))    #plyr