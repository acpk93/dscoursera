#change to .png graphic device
png(filename = "plot2.png")

#make sure we are printing only one chart
par(mfrow = c(1,1))

#create a date/time variable for x-axis
posix <- as.POSIXlt(paste(mydata$Date, mydata$Time))
mydata <- cbind(mydata, posix)

#draw plot
with(mydata, plot(posix, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)"))
with(mydata, lines(posix, Global_active_power))

#turn off graphic device
dev.off()