library(data.table)
setwd("C:/Users/wxt19/Rfiles/ExData_Plotting1")
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,destfile="data.zip")
data<-unzip("data.zip", exdir = getwd())
View(data)
data <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")
str(data)
head(data)
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
str(subsetdata)
globalactivepower <- as.numeric(subsetdata$Global_active_power)
globalreactivepower <- as.numeric(subsetdata$Global_reactive_power)
voltage <- as.numeric(subsetdata$Voltage)
subMetering1 <- as.numeric(subsetdata$Sub_metering_1)
subMetering2 <- as.numeric(subsetdata$Sub_metering_2)
subMetering3 <- as.numeric(subsetdata$Sub_metering_3)

##plot2
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png(file="plot2.png")
plot(datetime,globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()