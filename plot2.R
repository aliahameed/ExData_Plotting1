datafile <- "household_power_consumption.txt";
dt <- read.table(datafile, sep=";",header=T, na.strings="?")
sub <- subset(dt, Date %in% c("1/2/2007", "2/2/2007"));
sub$Datetime <- strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S")
par(mar=c(5,4,3,2))
plot(sub$Datetime, sub$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png")
dev.off()