# download dataset to working directory and the read the file into RStudio

data<- read.table("household_power_consumption.txt", sep=";", header = T, stringsAsFactors = FALSE, dec = ".")

# subset the required data

data<- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))

data$Global_active_power<- as.numeric(data$Global_active_power)

datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

data$Sub_metering_1<- as.numeric(data$Sub_metering_1)
data$Sub_metering_2<- as.numeric(data$Sub_metering_2)
data$Sub_metering_3<- as.numeric(data$Sub_metering_3)

# save the file as "plot3.png" in working directory and create plot

png("plot3.png", width = 480, height = 480)
with(data, {
  plot(datetime,data$Sub_metering_1, type="l",
       ylab="Energy sub metering")
  lines(datetime,data$Sub_metering_2,col='Red')
  lines(datetime,data$Sub_metering_3,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1, lwd = 2)

# dev is closed

dev.off()
