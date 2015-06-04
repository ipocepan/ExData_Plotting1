# this script creates the second plot
# for more details check ReadMe file

# variable openDevice determines where the image will be printed,
# T (default) - in png file, F - on the screen

plot2 <- function(openDevice = TRUE, ylab = "Global Active Power (kilowatts)"){
        
        # import read_data() function
        source("read_data.R")
        # if data set was already loaded, don't load it again
        # otherwise, load it and cache it
        if(!exists("pw_data")){      
                pw_data <<- read_data()
        }
        
        if(openDevice){
                png("plot2.png", width = 480, height = 480, bg = "transparent")
        }
        # plot the graph
        with(pw_data, plot(Time, Global_active_power, 
                           xlab = "", 
                           ylab = ylab,
                           type="l")
             )
        
        if(openDevice) dev.off()
      
}

if(!exists("openDevice")) plot2() 
if(exists("openDevice")) plot2(openDevice)