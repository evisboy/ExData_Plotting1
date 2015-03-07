# read in data
household_data <- read.table("household_power_consumption.txt",
                             header=T,
                             sep=";",
                             colClasses=c("character","character","double","double","double","double","double","double","numeric"),
                             na.strings="?")
# prepare data
household_data$DateTime = paste(household_data$Date, household_data$Time)
household_data$DateTime = as.POSIXlt(household_data$DateTime,
                                     format="%d/%m/%Y %H:%M:%S")
household_data$Date = NULL
household_data$Time = NULL

# subset data
subset_data <- subset(household_data,
                      DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

# clean up superfluous dataframe
rm("household_data") 

# Open PNG device
png("PNG/plot2.png")

# create plot
plot(x=(subset_data$DateTime),y=subset_data$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

# Write to device and close it up
dev.off()