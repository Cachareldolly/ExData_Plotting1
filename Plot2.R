dataset_Url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset_Url, "Exdata_plotting1.zip")
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
data$Date <-as.Date(data$Date, format= "%d%m%Y")
data1 <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- strptime(paste(data1$Date, data1$Time), format =" %Y-%m-%d %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(datetime, data1$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()