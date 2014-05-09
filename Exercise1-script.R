# R script for Project 1, Exploratory Data Analysis

# Sets the Working Directory and loads in dataframe as "df"
setwd("~/Desktop/MOOCs/Coursera/Data Science/Exploratory Data Analysis/Assignment-1")
dataset <- read.csv('household_power_consumption.txt', header=TRUE, sep=';', 
         na.strings='?', dec='.')

dataset$Date <- as.Date(dataset$Date, '%d/%m/%Y')
dataset$Time <- strptime(dataset$Time, "%H:%M:%S")

# Adds a new "DateTime" column:
dataset <- within(dataset, { DateTime=format(as.POSIXct(paste(Date, Time)),
                                              "%m/%d/%Y %H:%M:%S") })

df <- subset(dataset, (Date == "2007-02-01") | (Date == "2007-02-02"))

# Create first histogram plot:
hist(df$Global_active_power, xlab="Global Active Power (kilowatts)", col='red',
     main='Global Active Power')

# Second line plot:

## NOTE: Incorrect plotting -- FIX NEEDED
plot(df$Time, df$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
