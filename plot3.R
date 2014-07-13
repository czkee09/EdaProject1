# Read file
power = read.table("household_power_consumption.txt", header = TRUE,
                   sep = ";", na.strings = "?");
power$Date = as.Date(power$Date, format = "%d/%m/%Y");
powerFeb = subset(power, Date == "2007-02-01" | Date == "2007-02-02");
datetime = paste(powerFeb$Date, powerFeb$Time);
powerFeb$datetime = strptime(datetime, format = "%Y-%m-%d %H:%M:%S");

## Plot 3 

png(filename = "plot3.png",
    width = 480, height = 480, units = "px", bg = "white")

with(powerFeb, plot(datetime, Sub_metering_1, col = "black", type = "l",
     xlab = NA, ylab = "Energy sub metering"))
with(powerFeb, lines(datetime, Sub_metering_2, col = "red", type = "l"))
with(powerFeb, lines(datetime, Sub_metering_3, col = "blue", type = "l"))
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off();