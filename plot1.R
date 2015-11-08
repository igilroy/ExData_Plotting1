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


## Plot1 

png(filename="plot1.png")   ## open output file

## draw histogram of Global Active Power readings, colour teh columns red, 
## add a title for teh graph, and rename the X axis label.

hist(res.data$Global_active_power,col="red",main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()   ##  CLose the output file
