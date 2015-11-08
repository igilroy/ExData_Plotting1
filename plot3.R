setwd("~/datasciencecoursera/EDA")   ## Set the working directory to read data and store plot file(s)

## Install required packages and libraries
install.packages("dplyr")
library(dplyr)
install.packages("lubridate")
library(lubridate)

##  read in household power consumption data into a data frame for Feb 1-2 2007
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

## Plot 3

png(filename="plot3.png")   ## Open the output file

## Create a 3 overlayed line graphs of the three sub-metering readings across the two days
##  Colour the lines black, red and blue
##  add a legend, remove the X axis label, and change the Y axis label

with(res.data, plot(Date_Time, Sub_metering_1,type = "l",col="black",
                    xlab="", ylab="Energy sub metering"))
with(res.data,lines(Date_Time, Sub_metering_2,type = "l",col="red"))
with(res.data,lines(Date_Time, Sub_metering_3,type = "l",col="blue"))
legend("topright", pch = "-", lwd=3, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()    ##  Close the output file