corr <- function(directory, threshold=0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files.
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0.
    
    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!
    
    setwd("~/Engineering/coursera/r_programming/prog_assign_1")
    files <- list.files(path=directory, pattern='*.csv')
    nitrate <- numeric()
    sulfate <- numeric()
    for (file in files) {
        filename <- sprintf("%s/%s", directory, file)
        data <- read.csv(filename)
        sulfate <- c(sulfate, data[['sulfate']])
        nitrate <- c(nitrate, data[['nitrate']])
    }
}