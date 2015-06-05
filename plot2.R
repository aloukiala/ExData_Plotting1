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

# make numbers numbers for active power
subset$Global_active_power <- as.numeric(as.character(subset$Global_active_power))
# generate the png file
png("plot2.png",  width = 480, height = 480)
plot(timestamp, subset$Global_active_power, type='l', ylab="Global Active Power (kilowatts)", xlab=NA)
dev.off()
