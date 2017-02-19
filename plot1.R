# INTRO ---
rm(list = ls())
options(stringsAsFactors = FALSE)

setwd("~/Dropbox/coursera/04_exploratory_analysis/W01/quiz1/")

fileUrl <- "./data/household_power_consumption.txt"
data_set <- read.table(fileUrl, header = TRUE, sep = ";", nrows = 1)
labels <- colnames(data_set)
data_set <- read.table(fileUrl, header = FALSE, sep = ";", skip = 66637, nrows = 2880)
colnames(data_set) <- labels

datetime <- paste(data_set$Date, data_set$Time)
datetime <- strptime(as.character(datetime), format = "%d/%m/%Y %H:%M:%S")
data_set <- cbind(datetime, data_set)

# Plot 1
png("plot1.png", width = 480, height = 480)
hist(data_set$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global active power (kilowatts)")
dev.off()
