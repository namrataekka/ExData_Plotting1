# Load data
data <- read.table("household_power_consumption.txt",
                   sep=";", header=TRUE, na.strings="?", 
                   stringsAsFactors=FALSE)

# Convert Date column
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Filter only the required dates
subset <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]

# Create PNG file
png("plot1.png", width=480, height=480)

# Plot histogram
hist(subset$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

# Close device
dev.off()
