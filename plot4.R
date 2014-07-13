# Read file
power = read.table("household_power_consumption.txt", header = TRUE,
                   sep = ";", na.strings = "?");
power$Date = as.Date(power$Date, format = "%d/%m/%Y");
powerFeb = subset(power, Date == "2007-02-01" | Date == "2007-02-02");
datetime = paste(powerFeb$Date, powerFeb$Time);
powerFeb$datetime = strptime(datetime, format = "%Y-%m-%d %H:%M:%S");

## Plot 4

png(filename = "plot4.png",
    width = 480, height = 480, units = "px", bg = "white")

par(mfrow = c(2,2))

# Plot 4.1.1 = Plot 2
plot(powerFeb$datetime, powerFeb$Global_active_power,
     type = "l", xlab = NA, ylab = "Global Active Power(kilowatts)")

# Plot 4.1.2 
with(powerFeb, plot(datetime, Voltage, type ="l"))

# Plot 4.2.1 ¡Ö Plot 3 (no legend box)
with(powerFeb, plot(datetime, Sub_metering_1, col = "black", type = "l",
     xlab = NA, ylab = "Energy sub metering"))
with(powerFeb, lines(datetime, Sub_metering_2, col = "red", type = "l"))
with(powerFeb, lines(datetime, Sub_metering_3, col = "blue", type = "l"))
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

# Plot 4.2.2
with(powerFeb, plot(datetime, Global_reactive_power, type ="l"))

dev.off();