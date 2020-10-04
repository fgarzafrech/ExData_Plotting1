### Plot 2

library(tidyverse)
### Read Data ###


household_power <- read.table(file ="household_power_consumption.txt", sep = ";", header = TRUE)
household_power <- household_power[household_power$Date %in% c("1/2/2007","2/2/2007") ,]

#Extract datetime and globalActivePower Variables
datetime <- strptime(paste(household_power$Date, household_power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(household_power$Global_active_power)

#Plot
png("Code&Plots/plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
