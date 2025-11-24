# plot3.R

# Load the data
data <- read.table("household_power_consumption.txt",
                   sep=";", header=TRUE, na.strings="?",
                   stringsAsFactors=FALSE)

# Convert the Date column and filter the dates
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subset <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"), ]

# Create a combined Datetime column
subset$Datetime <- as.POSIXct(paste(subset$Date, subset$Time),
                              format="%Y-%m-%d %H:%M:%S")

# Create the PNG file
png("plot3.png", width=480, height=480)

# Plot all three sub-meterings
plot(subset$Datetime, subset$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")

lines(subset$Datetime, subset$Sub_metering_2, col="red")
lines(subset$Datetime, subset$Sub_metering_3, col="blue")

legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty=1)

dev.off()
