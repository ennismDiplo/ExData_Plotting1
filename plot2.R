### Get and read source file with data in R
source_file <- "household_power_consumption.txt"
source_data <- read.table(source_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset_source_data <- source_data[source_data$Date %in% c("1/2/2007","2/2/2007"), ]

### Creating plot2.png
date_time <- strptime(paste(subset_source_data$Date, subset_source_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power <- as.numeric(subset_source_data$Global_active_power)
png("plot2.png", width=480, height=480)
plot(date_time, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()




