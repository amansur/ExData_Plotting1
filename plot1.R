data <- read.table("household_power_consumption.txt", header = T, sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")
data <- transform(data, Date = as.Date(Date, "%d/%m/%Y"))
data <- subset(subset(data, Date >= as.Date("2007-02-01")), Date <= as.Date("2007-02-02"))
png(file="plot1.png", width=480, height=480)
par(oma=c(0,2,0,0))
hist(data$Global_active_power, col="red", main="Global Active Power", xlab ="Global Active Power (kilowatts)", mar = c(5.1,5.1,4.1,2.1))
dev.off()