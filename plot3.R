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

# Plot 3
png("plot3.png", width = 480, height = 480)
plot(data_set$Sub_metering_1, type = "l", ylab = "Energy sub metering", col = "black", xlab = "")
lines(data_set$Sub_metering_2, type = "l", col = "red")
lines(data_set$Sub_metering_3, type = "l", col = "blue")
legend(2600, 35, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black", "red", "blue"),
       xjust = 1, bty = "n") # gives the legend lines the correct color and width
dev.off()
