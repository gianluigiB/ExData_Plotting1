# Load zip file from working directory, read subset of data through data.table, plot it and store it on png file

plot1_faster <- function () {

#uncomment following row if you do not have data.table package already installed    
#install.packages("data.table")
library("data.table")
unzip("exdata_data_household_power_consumption.zip")

#read and subset on Date in one go into a data.table
options(warn=-1)
data <- fread(unzip("exdata_data_household_power_consumption.zip", list=TRUE)$Name, na.strings="?")[Date=="1/2/2007" | Date=="2/2/2007",]
options(warn=0)

#cast variable to numeric and write plot to png (default png() settings match already the requirements)
png(filename = "plot1_faster.png")
with(data, hist(as.numeric(Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()

}