library(lubridate)
library(data.table)
library(utils)
mydata<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric", "numeric"))

mysub<-subset(mydata, Date == "2007-02-01"| Date =="2007-02-02")
mysub$Date<-as.Date(mysub$Date, "%d/%m/%Y")
mysub$DateTime<-as.POSIXct(mysub$Time, origin = mysub$Date-hours(1))

par(mar = c(6,6,2,8), cex = .75)
hist(mysub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", ylim = c(0,1200))

dev.copy(png, file = "plot1.png")
dev.off()
