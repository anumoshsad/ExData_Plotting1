#assuming that you have downloaded the txt file in your working directory
d <- read.csv2("household_power_consumption.txt", dec = ".",stringsAsFactors=FALSE);

dat <- d[d$Date == "1/2/2007" | d$Date == "2/2/2007",];
dtime <- paste(dat$Date, dat$Time);
dt <- strptime(dtime, format = "%d/%m/%Y %H:%M:%S");

# here ? will automatically turn into NA, you will get warning though.
for(i in 3:9){
    dat[,i] = as.numeric(dat[,i])
}

D <- data.frame(DateTime = dt, dat[,3:9])

png(filename = "plot1.png")
hist(dat$Global_active_power, col = 'red', 
        main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off(4)
