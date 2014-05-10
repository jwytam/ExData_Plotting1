# Plot 1

# Create SELECT statement to select data where the date is between 1/2/2007 and 2/2/2007
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"

# Read the data file
myData <- read.csv2.sql("./household_power_consumption.txt", sql=mySql)

# Create the histogram of Global Active Power
png(file="plot1.png",width=480,height=480)
hist(myData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()