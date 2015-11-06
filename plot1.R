setwd("~/datasciencecoursera/EDA")

res.data<-read.table("data/household_power_consumption.txt",sep=";",header=FALSE,
                     na.strings="?", 
                     colClasses = c("character","character","numeric","numeric","numeric","numeric",
                                    "numeric","numeric","numeric"),
                     skip=66637,nrows=2880,
                     col.names = c("Date","Time" ,"Global_active_power" ,
                                   "Global_reactive_power","Voltage" ,"Global_intensity" ,
                                   "Sub_metering_1" ,"Sub_metering_2" ,"Sub_metering_3"))

#change Date to date format
res.data[,1]<-as.Date(res.data[,1],"%d/%m/%Y")


## Plot1 
png(filename="plot1.png")
hist(res.data$Global_active_power,col="red",main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()