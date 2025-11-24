# plot4.R

# Load the data
data <- read.table("household_power_consumption.txt",
                   sep=";", header=TRUE, na.strings="?",
                   stringsAsFactors=FALSE)

# Convert Date column
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Filter only the two required days
subset <- data[data$Date == as.Date("2007-02-01") | 
                 data$Date == as.Date("2007-02-02"), ]

# Create combined date-time column
subset$Datetime <- as.POSIXct(paste(subset$Date, subset$Time),
                              format="%Y-%m-%d %H:%M:%S")

# Create PNG file
png("plot4.png", width=480, height=480)

# 2x2 layout
par(mfrow=c(2,2))

# Top-left plot
plot(subset$Datetime, subset$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")

# Top-right plot
plot(subset$Datetime, subset$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# Bottom-left plot (3 lines + legend)
plot(subset$Datetime, subset$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(subset$Datetime, subset$Sub_metering_2, col="red")
lines(subset$Datetime, subset$Sub_metering_3, col="blue")
legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, bty="n")

# Bottom-right plot
plot(subset$Datetime, subset$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global Reactive Power")

dev.off()

