library(dplyr)

## Reading Data from local system were download the the test data

setwd("C:/Users/Admin/Documents/Course4")
dt <- read.table(file = "./household_power_consumption.txt",
                 sep = ";",
                 header = TRUE,
                 stringsAsFactors = FALSE
                 )

## converting data and time formate respectively and subsetting on the basis of date:

dt$Date <- as.Date(dt$Date, format = "%d/%m/%Y")
activeData <- dt %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")
activeData$Time <- strptime(activeData$Time, format = "%H:%M:%S")


## Ploting and creating the plot on the PNG graphices device:

png("plot2.png")
plot(as.numeric(activeData$Time),as.numeric(activeData$Global_active_power),
     type = "l",
     ylab = "Global Active Powe (kilowatts)",
     xlab = "",
     axes = FALSE)
axis(1, 
     c(as.numeric(activeData$Time[1]),
       mean(as.numeric(activeData$Time)),
       as.numeric(activeData$Time[length(activeData$Time)])),
     c("Thru","Fri","Sat")
     )
axis(2)
box()

dev.off()

