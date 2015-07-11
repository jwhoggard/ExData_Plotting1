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
png(filename="plot1.png")
## Plot the histogram
hist(hh_pwr_feb$Global_active_power, breaks=12, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="Red", ylab="Frequency")
## Close the file
dev.off()