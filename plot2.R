#import data, subset, create useable "timedate" variable
library(lubridate)
hpc <- read.csv("~/coursera/ExplDataAnalysis/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
hpc48<-hpc[which(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007"),]
hpc48$datetime<-dmy_hms(paste(hpc48$Date, hpc48$Time, sep=" "))
#make plotting variable numeric
hpc48$Global_active_power <- as.numeric(hpc48$Global_active_power)
#plot
png(filename="plot2.png", width=480, height=480, type="cairo-png")
    plot(hpc48$datetime, hpc48$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()