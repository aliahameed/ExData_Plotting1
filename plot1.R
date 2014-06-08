library(data.table);
DT = fread("household_power_consumption.txt", stringsAsFactors=F);
sub <- subset(DT, Date %in% c("1/2/2007", "2/2/2007"));
hist(as.numeric(sub$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)");
dev.copy(png, file="plot1.png")
dev.off()