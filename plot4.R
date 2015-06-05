## Set working directory if needed. The household_power_consumption.txt file
## needs to be in the working directory.
## setwd('.../ExData_Plotting1');

# data contains empty cells so we convert the data to specific format after reading
data <- read.csv('household_power_consumption.txt', header=T, sep=';', dec = ".");
# Get the date in right format
data$Date <- as.Date(data$Date, "%d/%m/%Y");
# Subset the data
subset <- data[data$Date >= "2007-02-01" & data$Date <= '2007-02-02', ]
# Remove the data so that it does not eat memory
rm(data)

# generate timestamp from date and time for the plot
timestamp <- paste(subset$Date, subset$Time)
timestamp <- strptime(timestamp, '%Y-%m-%d %H:%M:%S')

subset$Sub_metering_1 <- as.numeric(as.character(subset$Sub_metering_1))
subset$Sub_metering_2 <- as.numeric(as.character(subset$Sub_metering_2))
subset$Sub_metering_3 <- as.numeric(as.character(subset$Sub_metering_3))

# make numbers numbers for active power
subset$Global_active_power <- as.numeric(as.character(subset$Global_active_power))
# Make numbers numbers for voltage
subset$Voltage <- as.numeric(as.character(subset$Voltage))
# Make numbers numbers for global reactive power
subset$Global_reactive_power <- as.numeric(as.character(subset$Global_reactive_power))

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(airquality, {
### Different plots
# Plot 1,1
plot(timestamp, subset$Global_active_power, type='l', ylab="Global Active Power", xlab=NA)
# Plot 1,2
plot(timestamp, subset$Voltage, type='l', ylab="Voltage", xlab="datetime")
# Plot 2,1
plot(timestamp, subset$Sub_metering_1,type="l", ylab="Energy sub metering", xlab=NA, col="black")
lines(timestamp, subset$Sub_metering_2, type="l", col="red");
lines(timestamp, subset$Sub_metering_3, type="l", col="blue");
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = colnames(subset[7:9]))
# Plot 2,2
plot(timestamp, subset$Global_reactive_power, type='l', ylab="Global_reactive_power", xlab="datetime")
})
dev.off()
