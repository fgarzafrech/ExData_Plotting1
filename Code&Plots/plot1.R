
#Plot 1

library(tidyverse)
### Read Data ###


household_power <- read.table(file ="household_power_consumption.txt", sep = ";", header = TRUE)


#Format Date
household_power$Date <- lubridate::dmy(household_power$Date) 

#Format Time
household_power$Time <- strptime(household_power$Time, "%H:%M:%S")
    
str(household_power)  

#Extract 2 day data

household_power <- household_power %>%
                    filter(Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
#plot 1
household_power$Global_active_power <- as.numeric(household_power$Global_active_power)

dir.create("./Code&Plots")

png(filename = "Code&Plots/plot1.png", width = 480, height = 480)

plot1 <- hist(household_power$Global_active_power, 
     col = "red", 
     yaxp = c(0,1200,4),
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()



