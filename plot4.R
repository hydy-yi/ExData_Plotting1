## Plot4 Plot grid


pdata <- read.table("household_power_consumption.txt",sep = ";", 
                    nrows = 69516, header = TRUE)

powerdata <- subset(pdata, pdata$Date == "1/2/2007"|pdata$Date == "2/2/2007")

powerdata$Time <- with(powerdata, paste(Date, Time, sep = " "))

powerdata$Time <- strptime(powerdata$Time, format = "%e/%m/%Y %H:%M:%S")

for (i in 3:9) powerdata[ ,i] <- as.numeric(as.character(powerdata[ ,i]))

subnames <- colnames(powerdata)

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(powerdata,{
  
  plot(Time, Global_active_power, type = "l", 
       xlab = " ", ylab = "Global Active Power (kilowatts)")
  
  plot(Time, Voltage, type ="l", xlab = "datetime", ylab = "Voltage")
  
  plot(Time, Sub_metering_1,type="l", col="black", xlab = " ", 
       ylab="Energy sub metering")
  lines(Time, Sub_metering_2,type="l",col="red")
  lines(Time, Sub_metering_3,type="l",col="blue")
  
  legend("topright",legend = subnames[7:9], bty = "n", cex = par("cex"),
         lty = c(1,1,1), col=c("black", "red", "blue"))
  
  plot(Time, Global_reactive_power, type ="l", xlab = "datetime")
  
  }
     )
dev.copy(png, "plot4.png", width = 480, height = 480)

dev.off()
