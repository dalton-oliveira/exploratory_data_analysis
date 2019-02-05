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

png(file = "plot1.png")

par(mfcol = c(1,1))
hist(df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
