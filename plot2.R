# getting the complete dataset
UCI_poll <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", nrows = 2072529,check.names = F, stringsAsFactors = F)
#Specifying the date format
UCI_poll$Date <- as.Date(UCI_poll$Date, format="%d/%m/%Y")
#subset the complete data
UCI_poll_ss <- subset(UCI_poll, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## remove the complete data
rm(UCI_poll)
##Plot1 ...histogram
hist(UCI_poll_ss$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
## Saving file as png
dev.copy(png, file="plot1.png", height = 480, width = 480)
dev.off()