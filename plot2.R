setwd("~/datasciencecoursera/EDA")
install.packages("dplyr")
library(dplyr)
install.packages("lubridate")
library(lubridate)
res.data<-read.table("data/household_power_consumption.txt",sep=";",header=FALSE,
                     na.strings="?", 
                     colClasses = c("character","character","numeric","numeric","numeric","numeric",
                                    "numeric","numeric","numeric"),
                     skip=66637,nrows=2880,
                     col.names = c("Date","Time" ,"Global_active_power" ,
                                   "Global_reactive_power","Voltage" ,"Global_intensity" ,
                                   "Sub_metering_1" ,"Sub_metering_2" ,"Sub_metering_3"))

#combine Date and Time into a new variable
res.data<-mutate(res.data,Date_Time=paste(Date,Time,sep = " "))

#change Date_Time to date format
res.data[,"Date_Time"]<-dmy_hms(res.data[,"Date_Time"])

## Plot 2
png(filename="plot2.png")
plot(res.data$Date_Time,res.data$Global_active_power,
     type="l",ylab="Global Active Power (kilowatts)", xlab="")

dev.off()