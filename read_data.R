# this script downloads and reads the required data set
# for more details check ReadMe file

read_data <- function(){
        
        # if data file is not downloaded, download the zip file and unzip it
        file_name <- "household_power_consumption.txt"
        if(!file.exists(file_name)){
                fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
                download.file(fileUrl, 
                              destfile = "household_power_consumption.zip", 
                              method = "curl")
                unzip("household_power_consumption.zip")
        }
        
        # if sqldf package is not loaded, load it
        if(!require(sqldf)) {
                download.packages("sqldf")
                library(sqldf)
        }
        # read the data lines regarding only the dates stated in the assignment
        query <- "select * from file where Date in ('1/2/2007','2/2/2007')"
        pw_data <- read.csv.sql(file = file_name, 
                                sql = query,
                                header = TRUE,
                                sep = ";")
        closeAllConnections()
        
        # convert Date column from char to date class
        pw_data$Date <- as.Date(pw_data$Date, "%d/%m/%Y")
        # concatenate Date and Time columns and convert it to adequate
        # datetime format
        pw_data$Time <- strptime(paste(pw_data$Date, pw_data$Time, sep = " "), 
                                 "%Y-%m-%d %H:%M:%S")
        
        return(pw_data)
}
