# Read household data
household =  read.csv("household_power_consumption.txt"
                      , header = TRUE
                      , sep = ";"
                      , colClasses = c("character","character","double","double","double","double","double","double","numeric")
                      , na.strings = "?")

# Convert Date and Time column to a DateTime field
household$DateTime = paste(household$Date, household$Time, sep = " ")
household$DateTime = as.POSIXlt(household$DateTime, format="%d/%m/%Y %H:%M:%S")

# Subset the data as We will only be using data from the dates 2007-02-01 and 2007-02-02
subHousehold = subset(household
                      , DateTime$year == (2007-1900)
                      & DateTime$mon == (2-1)
                      & (DateTime$mday == 1 | DateTime$mday == 2))

# Initiate file device
png(filename = 'plot3.png')

# Make plot
plot(subHousehold$DateTime, subHousehold$Sub_metering_1, type = 'l'
     , xlab = '', ylab = 'Energy sub metering')
lines(subHousehold$DateTime, subHousehold$Sub_metering_2, col='red')
lines(subHousehold$DateTime, subHousehold$Sub_metering_3, col='blue')
legend('topright'
       , legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
       , col = c('black', 'red', 'blue')
       , lty = 'solid')

# Dispose file device
dev.off()