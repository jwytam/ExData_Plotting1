# Plot 2
# Note: Ensure that "household_power_consumption.txt" is stored in the current working directory

# Load package sqldf
require("sqldf")

# Create SELECT statement to select data where the date is between 1/2/2007 and 2/2/2007
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"

# Read the data file
myData <- read.csv2.sql("./household_power_consumption.txt", sql=mySql)

# Create new column and convert to datetime datatype
myData["Datetime"] <- NA
myData$Datetime <- strptime(paste(z$Date, z$Time), format='%d/%m/%Y %T')

# Create the diagram
png(file="plot2.png", width=480, height=480)
plot(myData$Datetime, myData$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(myData$Datetime, myData$Global_active_power)
dev.off()