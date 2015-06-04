#Exploratory Data Analysis 
##Course Project 1  

### Assignment
In order to examine how household energy usage varies over a 2-day period in 
February, 2007, the task is to reconstruct four different graphs, all of 
which were constructed using the base plotting system.

In this repository, you will find following files:

* R script for reading the data, ```read_data.R```
* R script for plotting each of the four graphs, ```plot1.R```,...,```plot4.R```
* corresponding PNG files for each of the graphs, ```plot1.png```,...,```plot4.png```

### Data
Individual household electric power consumption data set can be downloaded 
[here](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip).
It contains measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available. The following descriptions of the 9 variables in the dataset are taken from the UCI web site:

1. Date: Date in format dd/mm/yyyy
2. Time: time in format hh:mm:ss
3. Global_active_power: household global minute-averaged active power (in kilowatt)
4. Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
5. Voltage: minute-averaged voltage (in volt)
6. Global_intensity: household global minute-averaged current intensity (in ampere)
7. Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
8. Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
9. Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

The dataset has 2,075,259 rows and 9 columns, which makes it quite large. For this assignment
we will only be using data from the dates **2007-02-01** and **2007-02-02**. Therefore, 
we will only read the data from just those dates rather than reading in the entire data set.
For this purpose, ```sqldf``` package was used.
```
file_name <- "household_power_consumption.txt"
query <- "select * from file where Date in ('1/2/2007','2/2/2007')"
pw_data <- read.csv.sql(file = file_name, sql = query, header = TRUE, sep = ";")
```
Additionally, for plotting purposes, the Date and Time variables were converted 
to Date/Time classes in R using the ```strptime()``` and ```as.Date()``` functions. 
```
pw_data$Date <- as.Date(pw_data$Date, "%d/%m/%Y")
pw_data$Time <- strptime( paste(pw_data$Date, pw_data$Time, sep = " "), "%Y-%m-%d %H:%M:%S" )
```

### Plotting

In each of the four plotting scripts, the first step is to load the data.
The data will be loaded only once, when ```read_data()``` function is called for
the first time. Caching data is used in order to avoid unnecessary reloading and 
to reduce the execution time of the plotting scripts.
```
if(!exists("pw_data")) pw_data <<- read_data()
```
Each image is saved as PNG file with a width of 480 pixels and a height of 480 pixels.
The reference plots have transparent background (the background seems white because the website background is white), therefore we will also set the
background to transparent.
```
png("plot1.png", width = 480, height = 480, bg = "transparent")
```
The ```openDevice``` variable was introduced to determine whether we want to
print the image in the file or on the screen. It's default value is TRUE, which means
the image will be printed in the file. The variable can be set manually
to TRUE or FALSE, and this property was used in *plot4* script where we need to
disable printing in file for graphs 2 and 3. Usage examples:
```
> source("plot1.R") # plot1(TRUE) is called and the png file is created

> openDevice <- FALSE
> source("plot1.R") # plot1(openDevice) is called and the image is printed on the screen

> plot1(TRUE) # after the script is imported with source(), this is also a valid function call
```

### Solution

In order to reproduce the assignment, download *R scripts (read_data, plot1-4)* 
and run them as stated below. Note that the data file will be downloaded to the working directory and the four png files will be created. Also, each of the scripts will 
call the **read_data.R** script.
```
source("plot1.R")
source("plot2.R")
source("plot3.R")
source("plot4.R")
```
To avoid printing images to png files, run the following code.
```
openDevice <- FALSE
source("plot1.R")
source("plot2.R")
source("plot3.R")
source("plot4.R")
```