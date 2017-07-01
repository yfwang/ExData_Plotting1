loadData <- function() {
  setwd("C:\\Big data\\Course4\\week1")
  file <- ".\\household_power_consumption.txt"
  powerData <- read.table(file,header=T, sep=";", na.strings="?")
  
  finalData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007"),]
  SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
  finalData <- cbind(SetTime, finalData)
}

finalData <- loadData()
png(filename='plot3.png', width=480, height=480, units='px')

linecolors <- c("black","red","blue")
linelabels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(finalData$SetTime, finalData$Sub_metering_1, type="l", col=linecolors[1], xlab="", ylab="Energy sub metering")
lines(finalData$SetTime, finalData$Sub_metering_2, col=linecolors[2])
lines(finalData$SetTime, finalData$Sub_metering_3, col=linecolors[3])
legend("topright", legend=linelabels, col=linecolors, lty="solid")

dev.off()