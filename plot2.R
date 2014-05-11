# R script for Project 1, Exploratory Data Analysis
# Plot #2  -- Line graph


# Sets the Working Directory:
setwd("~/Desktop/MOOCs/Coursera/Data Science/Exploratory Data Analysis/Assignment-1")

## Note: This approach to loading the data into the data frame was suggested 
## on the Coursera discussion boards as a way to speed up load times by
## skipping dates unrelated to project:
# Loads the column names of a data frame:
datafile <- 'household_power_consumption.txt'
column_names <- colnames(read.table(datafile, nrow = 1, header = TRUE, sep=";"))
df <- read.table(datafile, skip=66637, nrow=2880, sep=";", col.names=column_names)

# Creates a "DateTime" column:
df$DateTime <- strptime(paste(df$Date, df$Time), format='%d/%m/%Y %H:%M:%S')

# Shrinks text size to 80% of default:
par(cex=0.8)

# Creates PNG file of specified line plot:
png(filename="plot2.png", width=480, height=480)
plot(df$DateTime, df$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()
