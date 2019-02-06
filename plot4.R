source("loadDataset.R")

png(file = "plot4.png")

par(mfrow = c(2,2))

hist(df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

plot(df$DateTime, df$Voltage, xlab="datetime", ylab="Voltage", type="l")

plot(df$DateTime, df$Sub_metering_1, xlab="datetime", ylab="Energy sub metering", type="l")
points(df$DateTime, df$Sub_metering_2, col = "red", type = "l")
points(df$DateTime, df$Sub_metering_3, col = "blue", type = "l")

legend("topright",  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1, 1, 1), bty = "n", lwd = 2)

plot(df$DateTime, df$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()
