d <- read.csv2("household_power_consumption.txt", dec = ".",stringsAsFactors=FALSE);

dat <- d[d$Date == "1/2/2007" | d$Date == "2/2/2007",];
dtime <- paste(dat$Date, dat$Time);
dt <- strptime(dtime, format = "%d/%m/%Y %H:%M:%S");

for(i in 3:9){
    dat[,i] = as.numeric(dat[,i])
}

D <- data.frame(DateTime = dt, dat[,3:9])

png(filename = "plot3.png")
with(D, plot(DateTime, Sub_metering_1, type = 'l', ylab = "Energy sub metering", xlab = ""))
lines(D$DateTime, D$Sub_metering_2, col = 'red')
lines(D$DateTime, D$Sub_metering_3, col = 'blue')
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1),col = c("black", "red", "blue"));
dev.off(4)