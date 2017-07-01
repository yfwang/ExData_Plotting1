
loadData <- function() {
  setwd("C:\\Big data\\Course4\\week1")
  file <- ".\\household_power_consumption.txt"
  powerData <- read.table(file,header=T, sep=";", na.strings="?")
  
  finalData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007"),]
  SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
  finalData <- cbind(SetTime, finalData)
}

finalData <- loadData()
png(filename='plot1.png', width=480, height=480, units='px')
hist(finalData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power(Kilowatts)")
dev.off()