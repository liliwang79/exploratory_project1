setwd("/Users/lwang/liliwang/coursera/R/exploratorydata/exploratory")
if(!file.exists("exdata-data-household_power_consumption.zip")) {
      temp <- tempfile()
      download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
      file <- unzip(temp)
      unlink(temp)
}


exploratory<-read.table(file, header=T, sep=";")
exploratory$Date<-as.Date(exploratory$Date,format="%d/%m/%Y")
extract<-exploratory[(exploratory$Date=="2007-02-01") | (exploratory$Date=="2007-02-02"),]
dim(extract)
rm(exploratory)
extract$Global_active_power<-as.numeric(as.character(extract$Global_active_power))
extract$Global_reactive_power <- as.numeric(as.character(extract$Global_reactive_power))
extract$Voltage <- as.numeric(as.character(extract$Voltage))
extract$Sub_metering_1<-as.numeric(extract$Sub_metering_1)
extract$Sub_metering_2<-as.numeric(extract$Sub_metering_2)
extract$Sub_metering_3<-as.numeric(extract$Sub_metering_3)
extract <- transform(extract, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
## plot1
plot1 <- function() {
      hist(extract$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
      dev.copy(png, file="plot1.png", width=480, height=480)
      dev.off()
      cat("Plot1.png has been saved in", getwd())
}
plot1()
