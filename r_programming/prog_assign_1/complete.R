complete <- function(directory, id=1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files.
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used.
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases.
    
    setwd("~/Engineering/coursera/r_programming/prog_assign_1")
    df <- data.frame(id=c(NULL), nobs=c(NULL))
    for (i in id) {
        filename <- sprintf("%s/%03d.csv", directory, i)
        data <- read.csv(filename)
        count <- 0
        for (obs in 1:nrow(data)) {
            if (!is.na(data[['nitrate']][obs]) && !is.na(data[['sulfate']][obs]))
                count <- count + 1
        }
        d <- c(id=i, nobs=count)
        df <- rbind(df, d)
    }
    names(df)[1] <- "id"
    names(df)[2] <- "nobs"
    df
}