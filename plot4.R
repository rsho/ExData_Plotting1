#import data, subset, create useable "timedate" variable
library(lubridate)
hpc <- read.csv("~/coursera/ExplDataAnalysis/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
hpc48 <- hpc[which(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007"),]
hpc48$datetime <- dmy_hms(paste(hpc48$Date, hpc48$Time, sep=" "))

#make plotting variables numeric
hpc48$Global_active_power <- as.numeric(hpc48$Global_active_power)
hpc48$Voltage <- as.numeric(hpc48$Voltage)
hpc48$Sub_metering_1 <- as.numeric(hpc48$Sub_metering_1)
hpc48$Sub_metering_2 <- as.numeric(hpc48$Sub_metering_2)
hpc48$Sub_metering_3 <- as.numeric(hpc48$Sub_metering_3)
hpc48$Global_reactive_power <- as.numeric(hpc48$Global_reactive_power)

#plot
png(filename="plot4.png", width=480, height=480, type="cairo-png")
    par(mfrow=c(2,2))
    plot(hpc48$datetime, hpc48$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
    plot(hpc48$datetime, hpc48$Voltage, xlab="datetime", ylab="Voltage", type="l", main=NULL)
    plot(hpc48$datetime, hpc48$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
        lines(hpc48$datetime, hpc48$Sub_metering_1, col="black")
        lines(hpc48$datetime, hpc48$Sub_metering_2, col="red")
        lines(hpc48$datetime, hpc48$Sub_metering_3, col="blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
    plot(hpc48$datetime, hpc48$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", main=NULL, type="l")
dev.off()
