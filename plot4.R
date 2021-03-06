# title: Peer-graded Assignment: Course Project 1 - plot4
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

# Plot 4

png(
  filename = "plot4.png",
  width = 480,
  height = 480
)

par(mfrow = c(2, 2))

# plot 4a (plot 2 w/o units on ylab)

with(epc2, 
  plot(
    DateTime,
    Global_active_power, 
    xlab = "",
    ylab = "Global Active Power",
    type = "l"
  )
)

# plot 4b

with(epc2, 
  plot(
    DateTime,
    Voltage, 
    xlab = "datetime",
    type = "l"
  )
)

# plot 4c (plot 3 w/o box around legend)
with(epc2, 
  plot(
    DateTime,
    Sub_metering_1, 
    xlab = "",
    ylab = "Energy sub metering",
    type = "l"
  )
)
with(epc2, lines(DateTime, Sub_metering_2, col = "red"))
with(epc2, lines(DateTime, Sub_metering_3, col = "blue"))
legend(
  "topright", 
  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
  lty = 1, 
  col = c("black", "red", "blue"), 
  bty = "n"
)

# plot 4d
with(epc2, 
  plot(
    DateTime,
    Global_reactive_power, 
    xlab = "datetime",
    type = "l"
  )
)

dev.off()
