### Get and read source file with data in R
source_file <- "household_power_consumption.txt"
source_data <- read.table(source_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset_source_data <- source_data[source_data$Date %in% c("1/2/2007","2/2/2007") ,]

### Creating plot1.png
global_active_power <- as.numeric(subset_source_data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()