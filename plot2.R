#Second Plot
#Reading in the Data
elecpower <- read.table("household_power_consumption.txt", header=T, sep=";")

#Subsetting the Data
elecpower_sub <- subset(elecpower, elecpower$Date=="2007-02-01" | 
                          elecpower$Date=="2007-02-02")

#Making the Date Time Variable
elecpower_sub$DateTime=paste(elecpower_sub$Date, elecpower_sub$Time)
elecpower_sub$DateTime=strptime(elecpower_sub$DateTime, format="%Y-%m-%d %H:%M:%S")

#Making the plot
png("plot2.png")
with(elecpower_sub, plot(elecpower_sub$DateTime, Global_active_power, type="l",
                    ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()