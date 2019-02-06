source("loadDataset.R")

png(file = "plot1.png")

par(mfcol = c(1,1))
hist(df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
