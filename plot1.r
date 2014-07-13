
##########################################
# Read in Data                           #
##########################################
r1 <- read.table('household_power_consumption.txt', header = TRUE, sep = ';',na.strings = '?',dec = '.',stringsAsFactors=FALSE)
r1 <- na.omit(r1)
###########################################
# Subset Data                             #
###########################################
data <- r1[grep('^1/2/2007|^2/2/2007' ,r1[,1]),]
#############################################
# Convert Date and Time                     #
#############################################

data["dateTime"] <- NA
data$dateTime <- strptime( paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")
############################################

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12)

hist(data$Global_active_power,    # apply the hist function 
  right=FALSE,    # intervals closed on the left 
   col="red",     # set the color palette 
  main="Global Active Power", # the main title 
   xlab="Global Active Power (kilowatts)")  
   dev.off()