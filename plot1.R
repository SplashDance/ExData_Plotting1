# R script for Project 1, Exploratory Data Analysis
# Plot #1  -- Histogram

# Sets the Working Directory and loads in dataframe as "dataset"
setwd("~/Desktop/MOOCs/Coursera/Data Science/Exploratory Data Analysis/Assignment-1")
dataset <- read.csv('household_power_consumption.txt', header=TRUE, sep=';', 
         na.strings='?', dec='.')

dataset$Date <- as.Date(dataset$Date, '%d/%m/%Y')
dataset$Time <- strptime(dataset$Time, "%H:%M:%S")

# Adds a new "DateTime" column:
dataset <- within(dataset, { DateTime=format(as.POSIXct(paste(Date, Time)),
                                              "%m/%d/%Y %H:%M:%S") })

# Subsets data used in analysis:
df <- subset(dataset, (Date == "2007-02-01") | (Date == "2007-02-02"))

# Creates histogram as a PNG file:
png(filename="plot1.png", width=480, height=480)
# par(cex=0.8)

with(df, 
	hist(df$Global_active_power, xlab="Global Active Power (kilowatts)",
       col='red', main='Global Active Power'))
dev.off()
