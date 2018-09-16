#read in all data
fulldata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#change date to the same format as in assignment statement
fulldata$Date <- as.Date(as.character(fulldata$Date), format = "%d/%m/%Y")

#turn on .png graphic device
png(filename = "plot1.png")

#subset data to the two relevant days
mydata <- subset(fulldata, fulldata$Date == "2007-02-01" | fulldata$Date == "2007-02-02")

#edit format of data so it displays properly
mydata$Global_active_power <- as.numeric(as.character(mydata$Global_active_power))

#make sure we are only printing one chart
par(mfrow = c(1,1))

#write chart
with(mydata, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))

#turn off alternative graphic device
dev.off()