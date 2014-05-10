#
#
# plot1.R : File to create the plots required for Programming Assignment #1 of
#           the Exploratory Data Analysis course. Written on 5/9/2014
#
#           This file should be run out of the Project One sub-directory within 
#           the Exploratory Data Analysis Course folder.

setwd("C:/Users/owner/Desktop/Coursera R Code/Exploratory Data Analysis Course/EDA Project One")

# Step 1:   Read in the household_power_consumption table and then modify the
#           the following columns:
#              Date : Transform hpc$Date to the Date class
#              Time : Transform hpc$Time to the POSIXIt class
#              

file.name = "household_power_consumption.txt"
hpc <- read.table(file.name, sep = ";", na.strings = "?", header = TRUE)

combined.date.time = paste( hpc$Date, hpc$Time )

hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc$Time <- as.POSIXct(strptime(combined.date.time, "%d/%m/%Y %H:%M:%S"))

# Step 2:   Reduce the data set down to the two dates specified in the assignment

valid.dates = as.Date( c( "2007-02-01" , "2007-02-02" ) )
hpc <- hpc[ (hpc$Date %in% valid.dates),  ]

# Step 3:   Exploratory Plots

# Second Plot

png( filename = "plot2.png", width = 480, height = 480 )
plot(hpc$Time, hpc$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)",
        xlab = "" )
lines(hpc$Time, hpc$Global_active_power)
dev.off()

