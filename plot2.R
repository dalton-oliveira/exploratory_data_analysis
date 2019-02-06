source("loadDataset.R")

png(file = "plot2.png")

par(mfcol = c(1,1))
plot(df$DateTime, df$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")

dev.off()
