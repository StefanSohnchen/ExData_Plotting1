# download dataset to working directory and the read the file into RStudio

data<- read.table("household_power_consumption.txt", sep=";", header = T, stringsAsFactors = FALSE, dec = ".")

# subset the required data

data<- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))

data$Global_active_power<- as.numeric(data$Global_active_power)

datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# save the file as "plot2.png" in working directory 

png("plot2.png", width = 480, height = 480)

# create plot

plot(datetime,data$Global_active_power,type = "l", ylab = "Global Active Power(kilowatts)")

# dev is closed

dev.off()
