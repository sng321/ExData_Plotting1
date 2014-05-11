##read data
data = read.csv("household_power_consumption.txt",sep=";")

##convert date and time and retain data for only 2007-02-01 and 2007-02-02
data$Date = as.Date(as.character(data$Date),"%d/%m/%Y")
data = subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

#historgram of Global Active Power
hist(as.numeric(as.character(data$Global_active_power)),main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")

#save plot
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()