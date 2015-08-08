data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

plot_data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007" , drop = TRUE)
rm(data)

plot_data$DateTime <- paste(plot_data$Date, plot_data$Time)

plot_data$Date <- strptime(plot_data$Date, "%d/%m/%Y")
plot_data$DateTime <- strptime(plot_data$DateTime, "%d/%m/%Y  %H:%M:%S")

png(filename = "plot1.png", width = 480, height = 480)
plot_data$Global_active_power <- as.numeric(plot_data$Global_active_power)
hist(plot_data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()