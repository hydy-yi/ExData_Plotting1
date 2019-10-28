## Plot3 Submetering power consumptions change over 2/1 and 2/2 in 2007


pdata <- read.table("household_power_consumption.txt",sep = ";", 
                    nrows = 69516, header = TRUE)

powerdata <- subset(pdata, pdata$Date == "1/2/2007"|pdata$Date == "2/2/2007")

powerdata$Time <- with(powerdata, paste(Date, Time, sep = " "))

powerdata$Time <- strptime(powerdata$Time, format = "%e/%m/%Y %H:%M:%S")

for (i in 7:9) powerdata[ ,i] <- as.numeric(as.character(powerdata[ ,i]))

subnames <- colnames(powerdata)

with(powerdata, {
    plot(Time, Sub_metering_1, type="l", col="black", xlab = " ", ylab="Energy sub metering")
    lines(Time, Sub_metering_2, type="l", col="red")
    lines(Time, Sub_metering_3, type="l", col="blue")

legend("topright",legend = subnames[7:9], lty = c(1,1,1), col=c("black", "red", "blue"))
})
dev.copy(png, "plot3.png", width = 480, height = 480)

dev.off()
