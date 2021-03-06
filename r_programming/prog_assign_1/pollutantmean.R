
pollutantmean <- function(directory, pollutant, id=1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files.
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used.
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## NOTE: Do not round the result!
    
    setwd("~/Engineering/coursera/r_programming/prog_assign_1")
    monitor_data <- numeric()
    for (i in id) {
        filename <- sprintf("%s/%03d.csv", directory, i)
        data <- read.csv(filename)
        monitor_data <- c(monitor_data, data[[pollutant]])
    }
    result <- mean(monitor_data, na.rm=TRUE)
    result
}
