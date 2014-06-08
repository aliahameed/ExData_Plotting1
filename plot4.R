datafile <- "household_power_consumption.txt";
dt <- read.table(datafile, sep=";",header=T, na.strings="?")
sub <- subset(dt, Date %in% c("1/2/2007", "2/2/2007"));
sub$datetime <- strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S")
par(mfrow = c(2,2))
par(mar=c(5,4,3,1))
with (sub, { 
	plot(datetime, Global_active_power, type="l", ylab="Global Active Power", xlab=""); 
	plot(datetime, Voltage, type="l", ylab="Voltage"); 
	plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""); 
	lines(datetime, Sub_metering_2, type="l",col="red"); 
	lines(datetime, Sub_metering_3, type="l",col="blue");
	legend("topright", lty=c(1,1), col = c("black","red", "blue"), legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "))
	plot(datetime, Global_reactive_power, type="l"); 
} )
dev.copy(png, file="plot4.png")
dev.off()