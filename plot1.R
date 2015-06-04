# this script creates the first plot
# for more details check ReadMe file

# variable openDevice determines where the image will be printed,
# T (default) - in png file, F - on the screen

plot1 <- function(openDevice = TRUE){
        
        # import read_data() function
        source("read_data.R")
        # if data set was already loaded, don't load it again
        # otherwise, load it and cache it
        if(!exists("pw_data")){      
                pw_data <<- read_data()
        }
        
        if(openDevice){
                png("plot1.png", width = 480, height = 480, bg = "transparent")
        }
        # plot the histogram
        with(pw_data, hist(Global_active_power, 
                           xlab="Global Active Power (kilowatts)", 
                           main="Global Active Power", 
                           col="red")
             )
        
        if(openDevice) dev.off()
}

if(!exists("openDevice")) plot1() 
if(exists("openDevice")) plot1(openDevice)