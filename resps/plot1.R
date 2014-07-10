## This code creates plot1.png according to the project1 especifications

## First, read the data
## (data should be placed in the ./data folder within the working directory)
plot_data <- read.table("./data/household_power_consumption.txt",header = TRUE, 
                        sep = ";",na.strings ="?")

## Now convert column 1 (Date) to date format
plot_data$Date <- as.Date(plot_data$Date,"%d/%m/%Y")

## and convert column 2 (Time) to time format
## Concatenate date and time to use strptime
DateTime <- paste(plot_data$Date, plot_data$Time, sep = " ")
plot_data$Date_and_Time <- strptime(DateTime, format = "%Y-%m-%d %H:%M:%S")
rm(DateTime)  ## Removing supporting variable no longer needed

## subset only important data
only_2_days <- (plot_data$Date == "2007-02-01") | (plot_data$Date == "2007-02-02")
plot_data <- plot_data[only_2_days,]
## now let's free some memory
rm(only_2_days)

## Plotting the first plot
## This plot is a histogram
## 1 create the graphics device (png file)
png(filename = "plot1.png", width = 480, height = 480, units = "px")
## Now the plot
hist(plot_data$Global_active_power, col = "red", breaks = 12,
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     ylab = "Frecuency")
## Finally, closing the graphics device
dev.off()


