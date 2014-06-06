# Load zip file from working directory, read data, plot a subset of it and store it on png file

plot1 <- function () {

# Read file into data frame    
tab5rows <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header = TRUE, nrows = 5, sep=";")
classes <- sapply(tab5rows, class)
data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header = TRUE, colClasses = classes, sep=";", na.strings="?")
data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

# Create png graphic device and plot on it
png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, type = "cairo")
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

}