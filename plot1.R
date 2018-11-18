# title: Peer-graded Assignment: Course Project 1 - plot1
# input: CSV file
# output: png file

library(tidyverse)

## Import

# Electric Power Consumption data set
# Note that in this dataset missing values are coded as `?`
epc <- read.csv("~/GitHub/ExData_Plotting1/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", as.is = TRUE)

## Tidy (N/A)

## Transform

# "We will only be using data from the dates 2007-02-01 (1/2/2007) and 2007-02-02 (2/2/207)"
epc2 <- epc %>% dplyr::filter(., Date %in% c("1/2/2007", "2/2/2007"))

# You may find it useful to convert the Date and Time variables to Date/Time classes in R using 
# the `strptime()` and  `as.Date()` functions

epc2$DateTime <- with(
  epc2,
  strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")
) 

## Visualize

# Plot 1

png(
  filename = "plot1.png",
  width = 480, 
  height = 480
)

hist(
  epc2$Global_active_power, 
  main = "Global Active Power", 
  xlab = "Global Active Power (kilowatts)",
  col = "red"
)

dev.off()
