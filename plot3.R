library(dplyr)

# loading data, set na.string = "??
data <- read.table(
  file = "data/household_power_consumption.txt", sep = ";",
  header = TRUE, stringsAsFactors = FALSE,
  colClasses = c(
    "character", "character", "numeric",
    "numeric", "numeric", "numeric", "numeric",
    "numeric", "numeric"
  ), na.strings = "?"
)

# filter for dates : 1/2/2007 and 2/2/2007
df <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

# free mem
rm(data)

# formatting date, time
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$Time <- strptime(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")

# plotting
png(file = "plot3.png", width = 480, height = 480)

# Add a first line
plot(
  x = df$Time, y = df$Sub_metering_1, type = "l", xlab = "",
  ylab = "Energy sub metering"
)
# Add a second line
lines(
  x = df$Time, y = df$Sub_metering_2, type = "l", col = "red"
)
# Add a third line
lines(
  x = df$Time, y = df$Sub_metering_3, type = "l", col = "blue"
)
# Add a legend to the plot
legend("topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"), lty = 1
)

dev.off()
