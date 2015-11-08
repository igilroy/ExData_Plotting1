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

## create Plot example # 4
png(filename="plot4.png")  ## Open output file

par(mfrow = c(2, 2))  ## Specify that plots will be arranged in 2 rows of 2 plots

## create 1st plot of four:  a line graph of Global Active Power readings across the two days, 
## changing the Y axis label, and removing the X axis label
with(res.data, plot(Date_Time,Global_active_power,
                    type="l",ylab="Global Active Power",xlab="" ))

## create 2nd plot of four: a line graph of Voltage readings across the two days
with(res.data, plot(Date_Time,Voltage, type="l",xlab="datetime" ))

## create 3rd plot of four: 3 overlayed line graphs of the three sub-metering readings 
## across the two days, colour the lines black, red and blue
##  add a legend, remove the X axis label, and change the Y axis label
## Note:  we are turning "off" the box around the legend

with(res.data, plot(Date_Time, Sub_metering_1,type = "l",col="black",
                    xlab="", ylab="Energy sub metering"))
with(res.data,lines(Date_Time, Sub_metering_2,type = "l",col="red"))
with(res.data,lines(Date_Time, Sub_metering_3,type = "l",col="blue"))
legend("topright", pch = "-", lwd=3, col = c("black", "red", "blue"), bty="n",
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

## create 4th plot of four: a line graph of Global reactive power readings across the two days
with(res.data, plot(Date_Time,Global_reactive_power,
                    type="l", xlab="datetime" ))

dev.off()  ## close output fle

