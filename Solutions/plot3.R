####################
## Preprocessing
####################
## If we didn't already, read and process the file
if(!exists("hh_pwr_feb")) {
  ## Read the file
  hh_pwr <- read.table("household_power_consumption.txt", header=T, na.strings = "?", sep=";", colClasses=c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"), stringsAsFactors=FALSE)
  ## Replace the $Time and $Date columns with time and date objects
  hh_pwr$Time <- strptime(paste(hh_pwr$Date, hh_pwr$Time), format = "%d/%m/%Y %H:%M:%S")
  hh_pwr$Date <- as.Date(hh_pwr$Date, format="%d/%m/%Y")
  ## Extract the correct dates
  hh_pwr_feb <- subset(hh_pwr, hh_pwr$Date >= as.Date("2007-02-01") & hh_pwr$Date <= as.Date("2007-02-02"))
}
# End if

####################
## Graphing
####################
## Open the PNG file
png(filename="plot3.png")
## Blank axes
plot(hh_pwr_feb$Time, hh_pwr_feb$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
## Add three line plots
lines(hh_pwr_feb$Time, hh_pwr_feb$Sub_metering_1, col="black", type="l")
lines(hh_pwr_feb$Time, hh_pwr_feb$Sub_metering_2, col="red", type="l")
lines(hh_pwr_feb$Time, hh_pwr_feb$Sub_metering_3, col="blue", type="l")
## Add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), col=c("black", "red", "blue") )
## Close the file:
dev.off()