# download dataset to working directory and the read the file 

data <- read.table("household_power_consumption.txt", sep=";", header = T, stringsAsFactors = FALSE, dec = ".")

# subset the required data

data <- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))

data$Global_active_power <- as.numeric(data$Global_active_power)

# save the file as "plot1.png" in working directory 

png("Plot_1.png", width = 480, height = 480)

# create histogram

hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "frequency", col = "red")

# dev is closed

dev.off()
