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

png("plot3.png",  width = 480, height = 480)
plot(timestamp, subset$Sub_metering_1,type="l", ylab="Energy sub metering", xlab=NA, col="black")
lines(timestamp, subset$Sub_metering_2, type="l", col="red");
lines(timestamp, subset$Sub_metering_3, type="l", col="blue");
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = colnames(subset[7:9]))
dev.off()
