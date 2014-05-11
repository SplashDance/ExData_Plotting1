# R script for Project 1, Exploratory Data Analysis
# Plot #4  -- 4-panel Graph


# Sets the Working Directory:
setwd("~/Desktop/MOOCs/Coursera/Data Science/Exploratory Data Analysis/Assignment-1")

## Note: This approach to loading the data into the data frame was suggested 
## on the Coursera discussion boards as a faster alternative to the one I
## implemented in plot1.R:
# Loads the column names of a data frame:
datafile <- 'household_power_consumption.txt'
column_names <- colnames(read.table(datafile, nrow = 1, header = TRUE, sep=";"))

# Reads in the table and saves the result to data frame "df":
df <- read.table(datafile, skip=66637, nrow=2880, sep=";",
	col.names=column_names)

# Creates new column, "DateTime", for use in plot function:
df$DateTime <- strptime(paste(df$Date, df$Time), format='%d/%m/%Y %H:%M:%S')


# Alters global plotting parameters:
png(filename="plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

# Plot 1 - Upper Left, Line plot:
plot(x=df$DateTime, y=df$Global_active_power, xlab="",
	ylab='Global Active Power', type='l')

# Plot 2 - Upper Right, Line plot:
plot(x=df$DateTime, y=df$Voltage, type='l', ylab="Voltage", xlab='datetime')

# Plot 3 - Lower Left, Line plot:
plot(df$DateTime, df$Sub_metering_1, type="l", xlab="",
	ylab="Energy sub metering")
lines(df$DateTime, df$Sub_metering_2, type="l", xlab="", col="red")
lines(df$DateTime, df$Sub_metering_3, type="l", xlab="", col="blue")
legend(x="topright", col=c("black", "red", "blue"), lty=1, bty='n',
	legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot 4 - Lower Right, Line plot:
plot(x=df$DateTime, y=df$Global_reactive_power, xlab='datetime',
	ylab='Global_reactive_power', type='l')

#dev.copy(png, 'plot4.png', width=480, height=480)
dev.off()