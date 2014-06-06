# Load zip file from working directory, read subset of data through data.table, plot it and store it on png file

plot2_faster <- function () {

#uncomment following row if you do not have data.table package already installed    
#install.packages("data.table")
library("data.table")
unzip("exdata_data_household_power_consumption.zip")

#read and subset on Date in one go into a data.table
options(warn=-1)
data <- fread(unzip("exdata_data_household_power_consumption.zip", list=TRUE)$Name, na.strings="?")[Date=="1/2/2007" | Date=="2/2/2007",]
options(warn=0)

# Create png graphic device and plot on it. Set English locale for required day names (cast first them to POSIXlt)
Sys.setlocale("LC_ALL", "English")
png(filename = "plot2_faster.png")
with(data, plot(strptime(paste(data$Date, data$Time), "%d/%m/%Y%H:%M:%S"), Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()

}