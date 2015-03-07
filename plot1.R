#import data, subset
hpc <- read.csv("~/coursera/ExplDataAnalysis/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE
hpc48<-hpc[which(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007"),]
hpc48$Global_active_power<-as.numeric(hpc48$Global_active_power)
#plot
png(filename="plot1.png", width=480, height=480, type="cairo-png")
    hist(hpc48$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
