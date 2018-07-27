library(dplyr)

#######################################################################################
## ## Reading Data from local system were download the the test data

setwd("C:/Users/Admin/Documents/Course4")
dt <- read.table(file = "./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

#######################################################################################
#### converting data and time formate respectively and subsetting on the basis of date:

dt$Date <- as.Date(dt$Date, format = "%d/%m/%Y")
# dt$Time <- strptime(dt$Time, format = "%H:%M:%S")

## Filtering the data using filter verb of the dplyr package.

activeData <- dt %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")

###########################################################################################
#### Ploting and creating the plot on the PNG graphices device:
activePower <- as.numeric(activeData$Global_active_power)
##starting the graphic device:
png("plot1.png")
#Initialzing plot
hist(as.numeric(activePower))
#annotating the Plot
hist(as.numeric(activePower),
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power",
     col = "red")
##stoping the graphic device:
dev.off()
