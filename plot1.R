##First plot in Course Project
#setwd("C:/Users/Helen/Desktop/Senior Project/Exploratory Data Analysis/Course Project 1")
#Reading in data from txt file
elecpower <- read.table("household_power_consumption.txt", header=T, sep=";")

#Subsetting the Data to February 01 & 02 of 2007
elecpower_sub <- subset(elecpower, elecpower$Date=="2007-02-01" | 
                          elecpower$Date=="2007-02-02")
elecpower$Global_active_power <- as.numeric(as.character(elecpower$Global_active_power))
elecpower$Date <- strptime(elecpower$Date, "%d/%m/%Y")

#Making the plot
png(filename="plot1.png")
with(elecpower_sub, hist(Global_active_power, xlab="Global Active Power (kilowatts)",
     main="Global Active Power", col="red", axes=F))
axis(1, at=c(0,2,4,6))
axis(2, at=c(0,200,400,600,800,1000,1200))
dev.off()
