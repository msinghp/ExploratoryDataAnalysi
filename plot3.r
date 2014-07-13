
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
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12)

 plot(data$dateTime,data$Sub_metering_1,type="n",
 ylab="Energy Sub Meetering",
 xlab=""
 )
 with(data,{

 lines(dateTime,as.numeric(Sub_metering_1))

 lines(dateTime,as.numeric(Sub_metering_2),col="red")

 lines(dateTime,as.numeric(Sub_metering_3),col="blue")

  })

legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),box.col="black",cex=.7)

dev.off()