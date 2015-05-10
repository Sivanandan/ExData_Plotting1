# getting the complete dataset
UCI_poll <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", nrows = 2072529,check.names = F, stringsAsFactors = F)
#Specifying the date format
UCI_poll$Date <- as.Date(UCI_poll$Date, format="%d/%m/%Y")
#subset the complete data
UCI_poll_ss <- subset(UCI_poll, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## remove the complete data
rm(UCI_poll)
# converting Date and Time to POSIX variable before plotting
datetime <- paste(as.Date(UCI_poll_ss$Date), UCI_poll_ss$Time)
UCI_poll_ss$DateTime <- as.POSIXct(datetime)

#### Plotting and Saving the file
with(UCI_poll_ss, {
  plot(Sub_metering_1~DateTime, type="l",xlab = "", ylab="Global Active Power (kilowatts)")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Plotting
dev.copy(png, file="plot3.png")
dev.off()