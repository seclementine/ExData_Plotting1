library(lubridate)
library(data.table)
library(utils)
mydata<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric", "numeric"))

mysub<-subset(mydata, Date == "2007-02-01"| Date =="2007-02-02")
mysub$Date<-as.Date(mysub$Date, "%d/%m/%Y")
mysub$datetime<-as.POSIXct(mysub$Time, origin = mysub$Date-hours(1))

par(mar = c(6,6,2,8), cex = .75)
with(mysub, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = NA))

dev.copy(png, file = "plot2.png")
dev.off()