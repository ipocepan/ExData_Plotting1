# this script creates the third plot
# for more details check ReadMe file

# variable openDevice determines where the image will be printed,
# T (default) - in png file, F - on the screen

plot3 <- function(openDevice = TRUE, bty = "o"){
        
        # import read_data() function
        source("read_data.R")
        # if data set was already loaded, don't load it again
        # otherwise, load it and cache it
        if(!exists("pw_data")){      
                pw_data <<- read_data()
        }
        
        if(openDevice){
                png("plot3.png", width = 480, height = 480, bg = "transparent")
        }
        # plot the graph
        with(pw_data, plot(Time, Sub_metering_1, 
                           xlab = "", 
                           ylab = "Energy sub metering", 
                           type = "l")
             )
        with(pw_data, lines(Time, Sub_metering_2, col = "red"))
        with(pw_data, lines(Time, Sub_metering_3, col = "blue"))
        # add the legend
        legend("topright", 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               col = c("black", "red", "blue"), 
               lwd = 1,
               bty = bty)
        
        if(openDevice) dev.off()   
}

if(!exists("openDevice")) plot3() 
if(exists("openDevice")) plot3(openDevice)