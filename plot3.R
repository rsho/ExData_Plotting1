library(lubridate)
hpc <- read.csv("~/coursera/ExplDataAnalysis/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
hpc48<-hpc[which(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007"),]
hpc48$datetime<-dmy_hms(paste(hpc48$Date, hpc48$Time, sep=" "))
#make plotting variables numeric
hpc48$Sub_metering_1 <- as.numeric(hpc48$Sub_metering_1)
hpc48$Sub_metering_2 <- as.numeric(hpc48$Sub_metering_2)
hpc48$Sub_metering_3 <- as.numeric(hpc48$Sub_metering_3)
#plot
png(filename="plot3.png", width=480, height=480, type="cairo-png")
    plot(hpc48$datetime, hpc48$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
    lines(hpc48$datetime, hpc48$Sub_metering_1, col="black")
    lines(hpc48$datetime, hpc48$Sub_metering_2, col="red")
    lines(hpc48$datetime, hpc48$Sub_metering_3, col="blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()