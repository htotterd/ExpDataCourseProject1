#Third Plot

#Reading in the Data
elecpower <- read.table("household_power_consumption.txt", header=T, sep=";")

#Subsetting the Data
elecpower_sub <- subset(elecpower, elecpower$Date=="2007-02-01" | 
                          elecpower$Date=="2007-02-02")

#Making Date Time Variable
elecpower_sub$DateTime=paste(elecpower_sub$Date, elecpower_sub$Time)
elecpower_sub$DateTime=strptime(elecpower_sub$DateTime, format="%Y-%m-%d %H:%M:%S")

elecpower_sub$Sub_metering_1 <- as.numeric(as.character(elecpower_sub$Sub_metering_1))
elecpower_sub$Sub_metering_2 <- as.numeric(as.character(elecpower_sub$Sub_metering_2))
elecpower_sub$Sub_metering_3 <- as.numeric(as.character(elecpower_sub$Sub_metering_3))

#Making the Plot
png("plot3.png")
with(elecpower_sub, plot(DateTime, Sub_metering_1, type="l", xlab="",
                         ylab="Energy sub metering", yaxt='n', ylim=c(-2, 40)))
par(new=T)
with(elecpower_sub, plot(DateTime, Sub_metering_2, type="l", xlab="", col="red",
                         ylab="", yaxt='n', ylim=c(-2,40)))
par(new=T)
with(elecpower_sub, plot(DateTime, Sub_metering_3, type="l", xlab="", col="blue",
                         ylab="", yaxt='n', ylim=c(-2,40)))
axis(2, at=c(0, 10, 20, 30))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=1)
dev.off()