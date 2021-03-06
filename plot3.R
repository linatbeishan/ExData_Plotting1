hp <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
head(hp)
nrow(hp)
ncol(hp)
twoDays <- subset(hp, Date=="1/2/2007"|Date=="2/2/2007")
nrow(twoDays)
ncol(twoDays)
twoDays$Date <- factor(twoDays$Date)
levels(twoDays$Date)
temp <- paste(twoDays$Date, twoDays$Time)
formatedTime <- strptime(temp, "%d/%m/%Y %T")
png("plot3.png")
plot(formatedTime, as.numeric(as.character(twoDays$Sub_metering_1)), type="l", ylab="Energy sub metering", xlab="")
lines(formatedTime, as.numeric(as.character(twoDays$Sub_metering_2)), col="red")
lines(formatedTime, as.numeric(as.character(twoDays$Sub_metering_3)), col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.off()