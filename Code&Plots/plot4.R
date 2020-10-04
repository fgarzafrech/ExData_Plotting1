### Plot 4

library(tidyverse)
### Read Data ###


household_power <- read.table(file ="household_power_consumption.txt", sep = ";", header = TRUE)
household_power <- household_power[household_power$Date %in% c("1/2/2007","2/2/2007") ,]

#Extract required variables
datetime <- strptime(paste(household_power$Date, household_power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

Sub1 <- as.numeric(household_power$Sub_metering_1)
Sub2 <- as.numeric(household_power$Sub_metering_2)
Sub3 <- as.numeric(household_power$Sub_metering_3)

globalActPower <- as.numeric(household_power$Global_active_power)

volt <- as.numeric(household_power$Voltage)

globalReaPower <- as.numeric(household_power$Global_reactive_power)

#Plot
png("Code&Plots/plot4.png", width=480, height=480)
par(mfrow = c(2,2))

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(datetime, volt, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, Sub1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub2, type="l", col="red")
lines(datetime, Sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(datetime, globalReaPower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
