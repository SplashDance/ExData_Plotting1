# R script for Project 1, Exploratory Data Analysis
# Plot #3  -- Tri-Color Line graph


# Sets the Working Directory:
setwd("~/Desktop/MOOCs/Coursera/Data Science/Exploratory Data Analysis/Assignment-1")

# Loads the column names of the data frame:
datafile <- 'household_power_consumption.txt'
column_names <- colnames(read.table(datafile, nrow = 1, header = TRUE, sep=";"))

# Reads in the data frame, skipping the unneeded rows:
df <- read.table(datafile, skip=66637, nrow=2880, sep=";",
	col.names=column_names)

# Creates new column "DateTime" for use in plots:
df$DateTime <- strptime(paste(df$Date, df$Time), format='%d/%m/%Y %H:%M:%S')

# Sets text size to 80% of default value:
par(cex=0.8)

# Creates plot with three different lines, each with a different color
# and sends the result to a PNG file:
png(filename="plot3.png", width=480, height=480)
plot(df$DateTime, df$Sub_metering_1, type="l", xlab="",
	ylab="Energy sub metering")
lines(df$DateTime, df$Sub_metering_2, type="l", xlab="", col="red")
lines(df$DateTime, df$Sub_metering_3, type="l", xlab="", col="blue")
legend(x="topright", col=c("black", "red", "blue"), lty=1,
	legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()