### Get and read source file with data in R
source_file <- "household_power_consumption.txt"
source_data <- read.table(source_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset_source_data <- source_data[source_data$Date %in% c("1/2/2007","2/2/2007"), ]

### Converting Date and Time 
date_time <- strptime(paste(subset_source_data$Date, subset_source_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power <- as.numeric(subset_source_data$Global_active_power)

### Sub_Metering 1 - 3
sub_metering_1 <- as.numeric(subset_source_data$Sub_metering_1)
sub_metering_2 <- as.numeric(subset_source_data$Sub_metering_2)
sub_metering_3 <- as.numeric(subset_source_data$Sub_metering_3)

### Creating plot3.png
png("plot3.png", width=480, height=480)
plot(date_time, sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, sub_metering_2, type="l", col="red")
lines(date_time, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()