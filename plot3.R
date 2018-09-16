#change to .png graphic device
png(filename = "plot3.png")

#make sure we are printing only 1 chart
par(mfrow = c(1,1))

#edit data format to make sure it displays properly
mydata$Sub_metering_1 <- as.numeric(as.character(mydata$Sub_metering_1))
mydata$Sub_metering_2 <- as.numeric(as.character(mydata$Sub_metering_2))
mydata$Sub_metering_3 <- as.numeric(as.character(mydata$Sub_metering_3))

#create plot
with(mydata, plot(posix, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))

#draw lines
with(mydata, lines(posix, as.numeric(Sub_metering_1), col = "black"))
with(mydata, lines(posix, as.numeric(Sub_metering_2), col = "red"))
with(mydata, lines(posix, as.numeric(Sub_metering_3), col = "blue"))

#draw legend
leg <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
co <- c("black", "red", "blue")
legend("topright", legend = leg, col = co, lty = c(1,1,1))

#close graphic device
dev.off()