##read data
data = read.csv("household_power_consumption.txt",sep=";")

##convert date and retain data for only 2007-02-01 and 2007-02-02
data$Date = as.Date(as.character(data$Date),"%d/%m/%Y")
data = subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

##convert date and time using strptime
datetime = strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S")

##plot
plot(datetime,as.numeric(as.character(data$Global_active_power)),type="n",ylab="Global Active Power (kilowatts)",xlab="")
lines(datetime,as.numeric(as.character(data$Global_active_power)))

#save plot
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()