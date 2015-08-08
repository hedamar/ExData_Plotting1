data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

plot_data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007" , drop = TRUE)
rm(data)

plot_data$DateTime <- paste(plot_data$Date, plot_data$Time)

plot_data$Date <- strptime(plot_data$Date, "%d/%m/%Y")
plot_data$DateTime <- strptime(plot_data$DateTime, "%d/%m/%Y  %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480)
plot(plot_data$DateTime, plot_data$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(plot_data$DateTime, plot_data$Sub_metering_1)
lines(plot_data$DateTime, plot_data$Sub_metering_2, col = "red")
lines(plot_data$DateTime, plot_data$Sub_metering_3, col = "blue")
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
