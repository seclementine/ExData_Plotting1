library(lubridate)
library(data.table)
library(utils)
mydata<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric", "numeric"))

mysub<-subset(mydata, Date == "2007-02-01"| Date =="2007-02-02")
mysub$Date<-as.Date(mysub$Date, "%d/%m/%Y")
mysub$datetime<-as.POSIXct(mysub$Time, origin = mysub$Date-hours(1))

par(mfrow = c(2,2), mar =c(4,4,4,4),cex = .5)
with(mysub, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = NA))
with(mysub, plot(datetime, Voltage, type = "l"))
with(mysub, plot(datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = NA))
lines(mysub$datetime, mysub$Sub_metering_2, col = "red")
lines(mysub$datetime, mysub$Sub_metering_3, col = "blue")
legend("topright",bty = "n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ), col = c("black", "red","blue" ), lwd = 1)
with(mysub, plot(datetime, Global_reactive_power, type = "l"))

dev.copy(png, file = "plot4.png")
dev.off()