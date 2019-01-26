library(dplyr)

#loading data, set na.string = "??
data <- read.table(file = "data/household_power_consumption.txt", sep = ";",
                   header = TRUE, stringsAsFactors = FALSE,
                   colClasses = c("character", "character", "numeric",

                                                        "numeric", "numeric", "numeric", "numeric",
                                  "numeric", "numeric"), na.strings = "?")

# filter for dates : 1/2/2007 and 2/2/2007
df <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

# free mem
rm(data)

#formatting date, time
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$Time <- strptime(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")

#plotting
png(file = "plot1.png", width = 480, height = 480)
hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
