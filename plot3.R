datafile <- "household_power_consumption.txt";
dt <- read.table(datafile, sep=";",header=T, na.strings="?")
sub <- subset(dt, Date %in% c("1/2/2007", "2/2/2007"));
sub$Datetime <- strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S")
par(mar=c(5,4,3,2))
plot(sub$Datetime, sub$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(sub$Sub_metering_3, type="l",col="red")
lines(sub$Datetime, sub$Sub_metering_2, type="l",col="red")
lines(sub$Datetime, sub$Sub_metering_3, type="l",col="blue")
legend("topright", lty=c(1,1), col = c("black","red", "blue"), legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "))
dev.copy(png, file="plot3.png")
dev.off()