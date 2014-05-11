# Plot 4
# Note: Ensure that "household_power_consumption.txt" is stored in the current working directory

# Load package sqldf
require("sqldf")

# Create SELECT statement to select data where the date is between 1/2/2007 and 2/2/2007
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"

# Read the data file
myData <- read.csv2.sql("./household_power_consumption.txt", sql=mySql)

# Create new column and convert to datetime datatype
myData["Datetime"] <- NA
myData$Datetime <- strptime(paste(myData$Date, myData$Time), format='%d/%m/%Y %T')

# Create the diagram
png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# First Graph (i.e. Plot 2)
plot(myData$Datetime, myData$Global_active_power, type="n", xlab="", ylab="Global Active Power")
lines(myData$Datetime, myData$Global_active_power)

# Second Graph
plot(myData$Datetime, myData$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(myData$Datetime, myData$Voltage)

# Third Graph (i.e. Plot 3)
plot(myData$Datetime, myData$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(myData$Datetime, myData$Sub_metering_1)
lines(myData$Datetime, myData$Sub_metering_2, col="red")
lines(myData$Datetime, myData$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=1.0, lwd=1.0, bty="n", col=c("black", "red", "blue"))

# Fourth Graph
plot(myData$Datetime, myData$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(myData$Datetime, myData$Global_reactive_power)

dev.off()