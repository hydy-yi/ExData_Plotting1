## Plot1 Histogram of Global Active Power over 2/1 and 2/2 in 2007

pdata <- read.table("household_power_consumption.txt",sep = ";", 
                    nrows = 69516, header = TRUE)

powerdata <- subset(pdata, pdata$Date == "1/2/2007"|pdata$Date == "2/2/2007")

powerdata$Global_active_power <- as.numeric(as.character(powerdata$Global_active_power))

hist(powerdata$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

dev.copy(png, "plot1.png", width = 480, height = 480)

dev.off()