# plot2.R
# Read the data (assumes household_power_consumption.txt is in working directory)
data <- read.table("household_power_consumption.txt",
                   sep=";", header=TRUE, na.strings="?",
                   stringsAsFactors=FALSE)

# Convert Date column and filter the two days
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subset <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"), ]

# Create a proper datetime column (POSIXct)
subset$Datetime <- as.POSIXct(paste(subset$Date, subset$Time),
                              format="%Y-%m-%d %H:%M:%S")

# Create the PNG file
png("plot2.png", width=480, height=480)

# Plot: Global Active Power over time (line plot)
plot(subset$Datetime, subset$Global_active_power,
     type="l",
     xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.off()

