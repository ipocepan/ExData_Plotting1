# this script creates the fourth plot
# for more details check ReadMe file

# variable openDevice determines where the image will be printed,
# T (default) - in png file, F - on the screen

plot4 <- function(openDevice4 = TRUE){
        
        # import read_data() function
        source("read_data.R")
        # if data set was already loaded, don't load it again
        # otherwise, load it and cache it
        if(!exists("pw_data")){      
                pw_data <<- read_data()
        }
        
        # disable plotting to file
        openDevice <- FALSE
        # import functions for second and third plot
        source("plot2.R")
        source("plot3.R")
        
        if(openDevice4){
                png("plot4.png", width = 480, height = 480, bg = "transparent")
        }
        # adjust graphical parameters to create multiple plots in one figure
        par(mfrow = c(2,2))
        # plot the top left graph
        plot2(openDevice, "Global Active Power")
        # plot the top right graph
        with(pw_data, plot(Time, Voltage, 
                           xlab = "datetime", 
                           ylab = "Voltage", 
                           type = "l")
             )
        # plot the bottom left graph
        plot3(openDevice, "n")
        # plot the bottom right graph
        with(pw_data, plot(Time, Global_reactive_power, 
                           xlab = "datetime", 
                           type = "l")
             )
        
        if(openDevice4)  dev.off()
        par(mfrow = c(1,1))
}

if(!exists("openDevice")) plot4() 
if(exists("openDevice")) plot4(openDevice)