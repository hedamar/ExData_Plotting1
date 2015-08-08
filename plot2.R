data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

plot_data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007" , drop = TRUE)
rm(data)

plot_data$DateTime <- paste(plot_data$Date, plot_data$Time)

plot_data$Date <- strptime(plot_data$Date, "%d/%m/%Y")
plot_data$DateTime <- strptime(plot_data$DateTime, "%d/%m/%Y  %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)
plot(plot_data$DateTime, plot_data$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(plot_data$DateTime, plot_data$Global_active_power)
dev.off()
