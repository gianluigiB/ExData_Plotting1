# Load zip file from working directory, read data, plot a subset of it and store it on png file

plot2 <- function () {
tab5rows <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header = TRUE, nrows = 5, sep=";")
classes <- sapply(tab5rows, class)
png(filename = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12, type = "cairo")

data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header = TRUE, colClasses = classes, sep=";", na.strings="?")
data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
dateTime<-strptime(paste(data$Date, data$Time), "%d/%m/%Y%H:%M:%S")
data<-cbind(data,dateTime)

Sys.setlocale("LC_ALL", "English")
with(data, plot(dateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
}