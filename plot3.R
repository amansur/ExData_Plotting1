data <- read.table("household_power_consumption.txt", header = T, sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")
data <- transform(data, DateTime = as.POSIXct(paste(Date,Time), f= "%d/%m/%Y %H:%M:%S"))
data <- subset(subset(data, DateTime >= as.POSIXct("2007-02-01 00:00:00", f="%Y-%m-%d %H:%M:%S")), DateTime <= as.POSIXct("2007-02-02 23:59:00", f="%Y-%m-%d %H:%M:%S"))
png(file="plot3.png", width=480, height=480)
par(oma=c(0,2,0,0))
with(data, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"), mar = c(5.1,5.1,4.1,2.1))
with(data, lines(DateTime, Sub_metering_2, col="red", type="l"))
with(data, lines(DateTime, Sub_metering_3, col="blue", type="l"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty = 1)
dev.off()