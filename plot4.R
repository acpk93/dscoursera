#change to .png graphic device
png(filename = "plot4.png")

#set up 2x2 arrangement of plots
par(mfrow = c(2,2))

#change around format of data so it displays properly 
mydata$Voltage <- as.numeric(as.character(mydata$Voltage))
mydata$Global_reactive_power <- as.numeric(as.character(mydata$Global_reactive_power))

#first plot
with(mydata, plot(posix, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)"))
with(mydata, lines(posix, Global_active_power))

#second plot 
with(mydata, plot(posix, Voltage, type = "n", xlab = "datettime"))
with(mydata, lines(posix, Voltage))

#third plot
with(mydata, plot(posix, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))
with(mydata, lines(posix, as.numeric(Sub_metering_1), col = "black"))
with(mydata, lines(posix, as.numeric(Sub_metering_2), col = "red"))
with(mydata, lines(posix, as.numeric(Sub_metering_3), col = "blue"))
leg <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
co <- c("black", "red", "blue")
legend("topright", legend = leg, col = co, lty = c(1,1,1))

#fourth plot 
with(mydata, plot(posix, Global_reactive_power, type = "n", xlab = "datettime"))
with(mydata, lines(posix, Global_reactive_power))

#close graphic device
dev.off()