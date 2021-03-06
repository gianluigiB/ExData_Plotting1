# Load zip file from working directory, read data, plot a subset of it and store it on png file

plot3 <- function () {

# Read file into data frame 
data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header = TRUE, sep=";", na.strings="?")
data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

# Add dateTime variable to data frame
dateTime<-strptime(paste(data$Date, data$Time), "%d/%m/%Y%H:%M:%S")
data<-cbind(data,dateTime)

# Create png graphic device and plot on it. Set English locale for required day names
png(filename = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12, type = "cairo")
Sys.setlocale("LC_ALL", "English")
with(data, plot(dateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(data,lines(dateTime, Sub_metering_2, col="red"))
with(data,lines(dateTime, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.off()

}