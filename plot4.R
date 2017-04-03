### Get and read source file with data in R
source_file <- "household_power_consumption.txt"
source_data <- read.table(source_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset_source_data <- source_data[source_data$Date %in% c("1/2/2007","2/2/2007"), ]

### Converting Date and Time, etc.
date_time <- strptime(paste(subset_source_data$Date, subset_source_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power <- as.numeric(subset_source_data$Global_active_power)

global_reactive_power <- as.numeric(subset_source_data$Global_reactive_power)
voltage <- as.numeric(subset_source_data$Voltage)

### Sub_Metering 1 - 3
sub_metering_1 <- as.numeric(subset_source_data$Sub_metering_1)
sub_metering_2 <- as.numeric(subset_source_data$Sub_metering_2)
sub_metering_3 <- as.numeric(subset_source_data$Sub_metering_3)

### Creating plot4.png
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(date_time, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(date_time, sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, sub_metering_2, type="l", col="red")
lines(date_time, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(date_time, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()