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
    sulfate <- numeric()
    nitrate <- numeric()
    for (file in files) {
        filename <- sprintf("%s/%s", directory, file)
        data <- read.csv(filename)
        sulfate <- c(sulfate, data[['sulfate']])
        nitrate <- c(nitrate, data[['nitrate']])
    }
    all <- cbind(sulfate, nitrate)
    good <- complete.cases(all)
    rows <- length(all[good]) / 2
    m <- matrix(all[good], nrow=rows, ncol=2)
    if (threshold == 0) {
        result <- cor(m)
        result
    }
    else if ((length(m) / 2) > threshold)
    {
        result <- cor(m[1:threshold,])
        result
    }
}