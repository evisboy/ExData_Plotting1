#Read in full data 
household_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                             stringsAsFactors=FALSE, na.strings="?")

# Subset for the 2 days we need: 1/2/2007 & 2/2/2007
subset_data <- household_data[household_data$Date == "1/2/2007" | household_data$Date == "2/2/2007", ]

# clean up superfluous dataframe
rm("household_data") 

