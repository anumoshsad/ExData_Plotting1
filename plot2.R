d <- read.csv2("household_power_consumption.txt", dec = ".",stringsAsFactors=FALSE);

dat <- d[d$Date == "1/2/2007" | d$Date == "2/2/2007",];
dtime <- paste(dat$Date, dat$Time);
dt <- strptime(dtime, format = "%d/%m/%Y %H:%M:%S");

for(i in 3:9){
    dat[,i] = as.numeric(dat[,i])
}

D <- data.frame(DateTime = dt, dat[,3:9])


png(filename = "plot2.png")
plot(D$DateTime, D$Global_active_power, type = 'l', 
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off(4)