## Plot2 Global Active Power consumption change over 2/1 and 2/2 in 2007

pdata <- read.table("household_power_consumption.txt",sep = ";", 
                    nrows = 69516, header = TRUE)

powerdata <- subset(pdata, pdata$Date == "1/2/2007"|pdata$Date == "2/2/2007")

powerdata$Time <- with(powerdata, paste(Date, Time, sep = " "))

powerdata$Time <- strptime(powerdata$Time, format = "%e/%m/%Y %H:%M:%S")

powerdata$Global_active_power <- as.numeric(as.character(powerdata$Global_active_power))

plot(powerdata$Time, powerdata$Global_active_power, type = "l", 
     xlab = " ", ylab = "Global Active Power (kilowatts)")

dev.copy(png, "plot2.png", width = 480, height = 480)

dev.off()



