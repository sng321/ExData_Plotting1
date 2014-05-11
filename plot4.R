##read data
data = read.csv("household_power_consumption.txt",sep=";")

##convert date and retain data for only 2007-02-01 and 2007-02-02
data$Date = as.Date(as.character(data$Date),"%d/%m/%Y")
data = subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

##convert date and time using strptime
datetime = strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S")

##plot
par(mfcol=c(2,2)) 
plot(datetime,as.numeric(as.character(data$Global_active_power)),cex = 0.7,type="n",ylab="Global Active Power",xlab="")
lines(datetime,as.numeric(as.character(data$Global_active_power)))

plot(datetime,as.numeric(as.character(data$Sub_metering_1)),cex = 0.7,type="n",ylab="Energy sub metering",xlab="")
lines(datetime,as.numeric(as.character(data$Sub_metering_1)),col="black")
lines(datetime,as.numeric(as.character(data$Sub_metering_2)),col="red")
lines(datetime,as.numeric(as.character(data$Sub_metering_3)),col="blue")
legend("topright",cex=0.5,bty="n",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(datetime,as.numeric(as.character(data$Voltage)),cex = 0.7,type="n",ylab="Voltage",xlab="datetime")
lines(datetime,as.numeric(as.character(data$Voltage)))

plot(datetime,as.numeric(as.character(data$Global_reactive_power)),cex = 0.7,type="n",ylab="Global_reactive_power",xlab="datetime")
lines(datetime,as.numeric(as.character(data$Global_reactive_power)))

#save plot
dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()