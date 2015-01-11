library(lubridate)

#Read in full data 
household_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                             stringsAsFactors=FALSE, na.strings="?")

# Subset for the 2 days we need: 1/2/2007 & 2/2/2007
subset_data <- household_data[household_data$Date == "1/2/2007" | household_data$Date == "2/2/2007", ]

# clean up superfluous dataframe
rm("household_data") 

subset_data$Date <- dmy(subset_data$Date) # convert to days, months, years w/ lubridate function
subset_data$Time <- hms(subset_data$Time) # convert to hours, minutes, seconds w/ lubridate function

# Combine date and time into one field
subset_data$datetime <- subset_data$Date + subset_data$Time

# Open PNG device
png("plot3.png")

# create plot
plot(subset_data$datetime, subset_data$Sub_metering_1, type="l", xaxt = "n",
     ylab = "Energy sub metering", xlab = "")
lines(subset_data$datetime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$datetime, subset_data$Sub_metering_3, col = "blue")
axis.POSIXct(1, as.POSIXct(subset_data$datetime))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Write to device and close it up
dev.off()