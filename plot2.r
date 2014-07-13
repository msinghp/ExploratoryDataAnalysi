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

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12)
	
plot(data$dateTime,data$Global_active_power,type="l",
 ylab="Global Active Power (kilowats)",
 xlab=""
 )
 
 dev.off()