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

oldarameter <- par()
par(mfrow = c(2,2))

##subPlot1:
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

##subPlot2
plot(as.numeric(activeData$Time),as.numeric(activeData$Voltage),
     type = "l",
     xlab = "datetime",
     ylab = "Voltage",
     axes = FALSE
     )
axis(1, c(as.numeric(activeData$Time[1]),
            mean(as.numeric(activeData$Time)),
            as.numeric(activeData$Time[length(activeData$Time)])),
            c("Thru","Fri","Sat")
       )
axis(2)
box()

##subPlot3

plot(as.numeric(activeData$Time),as.numeric(activeData$Sub_metering_1), type = "l", axes = FALSE, ylab = "Energy sub mettring", xlab = "")
lines(as.numeric(activeData$Time), as.numeric(activeData$Sub_metering_2), type = "l", col = "red")
lines(as.numeric(activeData$Time), activeData$Sub_metering_3, type = "l", col = "blue")

axis(1, 
     c(as.numeric(activeData$Time[1]),
       mean(as.numeric(activeData$Time)),
       as.numeric(activeData$Time[length(activeData$Time)])),
     c("Thru","Fri","Sat")
)
axis(2)
box()
legend("topright",
       col= c("black","red","blue"),
       legend = c("Submetering_1", "Submetering_2", "Submetering_3"),
       lty = 1, cex = 0.4 )

##subPlot4:

plot(as.numeric(activeData$Time),as.numeric(activeData$Global_reactive_power),type = "l", xlab = "datatime",ylab = "Global_reactive_power", axes = FALSE)
axis(1, c(as.numeric(activeData$Time[1]),
        mean(as.numeric(activeData$Time)),
        as.numeric(activeData$Time[length(activeData$Time)])),
        c("Thru","Fri","Sat")
    )
axis(2)
box()
dev.off()
