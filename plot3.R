library(data.table)
library(lubridate)
options(digits = 16)

if (!file.exists("data/household_power_consumption.txt")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "data/household_power_consumption.zip")
  unzip(zipfile = "data/household_power_consumption.zip", exdir = "data/")
  file.remove("data/household_power_consumption.zip")
}

df <- fread("data/household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
df <- subset(df,df$Date=="1/2/2007" | df$Date == "2/2/2007")
df$DateTime <- dmy_hms(paste(df$Date, df$Time))

png(file = "plot3.png")

par(mfcol = c(1,1))

plot(df$DateTime, df$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
points(df$DateTime, df$Sub_metering_1, col = "black", type = "l")
points(df$DateTime, df$Sub_metering_2, col = "red", type = "l")
points(df$DateTime, df$Sub_metering_3, col = "blue", type = "l")

legend("topright",  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1, 1, 1))

dev.off()
