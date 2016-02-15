
##plot2
plot2 <- function() {
      plot(extract$timestamp,extract$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
      dev.copy(png, file="plot2.png", width=480, height=480)
      dev.off()
      cat("plot2.png has been saved in", getwd())
}
plot2()

