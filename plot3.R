source("loadDataset.R")

png(file = "plot3.png")

par(mfcol = c(1,1))

plot(df$DateTime, df$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
points(df$DateTime, df$Sub_metering_1, col = "black", type = "l")
points(df$DateTime, df$Sub_metering_2, col = "red", type = "l")
points(df$DateTime, df$Sub_metering_3, col = "blue", type = "l")

legend("topright",  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1, 1, 1))

dev.off()
