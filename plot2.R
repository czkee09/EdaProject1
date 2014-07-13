# Read file
power = read.table("household_power_consumption.txt", header = TRUE,
                   sep = ";", na.strings = "?");
power$Date = as.Date(power$Date, format = "%d/%m/%Y");
powerFeb = subset(power, Date == "2007-02-01" | Date == "2007-02-02");
datetime = paste(powerFeb$Date, powerFeb$Time);
powerFeb$datetime = strptime(datetime, format = "%Y-%m-%d %H:%M:%S");

## Plot 2 Global Active Power vs. Time
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", bg = "white")
plot(powerFeb$datetime, powerFeb$Global_active_power,
     type = "l", xlab = NA, ylab = "Global Active Power(kilowatts)")
dev.off();