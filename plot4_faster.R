# Load zip file from working directory, read subset of data through data.table, plot it and store it on png file

plot4_faster <- function () {

#uncomment following row if you do not have data.table package already installed    
#install.packages("data.table")
library("data.table")
unzip("exdata_data_household_power_consumption.zip")

#read and subset on Date in one go into a data.table
options(warn=-1)
data <- fread(unzip("exdata_data_household_power_consumption.zip", list=TRUE)$Name, na.strings="?")[Date=="1/2/2007" | Date=="2/2/2007",]
options(warn=0)

# Create dateTime variable for plot
dateTime<-strptime(paste(data$Date, data$Time), "%d/%m/%Y%H:%M:%S")

# Create png graphic device and plot 2x2 times on it. Set English locale for required day names
png(filename = "plot4_faster.png")
Sys.setlocale("LC_ALL", "English")
par(mfcol = c(2,2))

#plot 1,1
with(data, plot(dateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

#plot 2,1
with(data, plot(dateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(data,lines(dateTime, Sub_metering_2, col="red"))
with(data,lines(dateTime, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n")

#plot 1,2
with(data, plot(dateTime, Voltage, type="l", xlab="datetime"))

#plot 2,2
with(data, plot(dateTime, Global_reactive_power, type="l", xlab="datetime"))

dev.off()
}