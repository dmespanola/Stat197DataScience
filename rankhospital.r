setwd("~/College/4th Year - 2nd Sem/Stat 197 - Data Science/Projects/3. Project/wd") ## Setting working directory to the directory containing the needed data

rankhospital <- function(state, outcome, num = "best") {
    
    ## Reading outcome data    
    rawdata <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    needed <- as.data.frame(cbind(rawdata[, 2],   # hospital name column
                                  rawdata[, 7],   # state column
                                  rawdata[, 11],  # hospital 30-day mortality rates due to heart attack column
                                  rawdata[, 17],  # hospital 30-day mortality rates due to heart failure column
                                  rawdata[, 23]), # hospital 30-day mortaity rates due to pneumonia column
                            stringsAsFactors = FALSE)
    colnames(needed) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")
    
    ## Checking that state and outcome are valid
    if(!state %in% needed[, "state"]){
        stop('invalid state')
    } else if(!outcome %in% c("heart attack", "heart failure", "pneumonia")){
        stop('invalid outcome')
    } else if (is.numeric(num)) {
        input <- which(needed[, "state"] == state)
        xtrct <- needed[input, ]                             # extracting dataframe for the called state
        xtrct[, eval(outcome)] <- as.numeric(xtrct[, eval(outcome)])
        xtrct <- xtrct[order(xtrct[, eval(outcome)], xtrct[, "hospital"]), ]
        output <- xtrct[, "hospital"][num]
    } else if (!is.numeric(num)){
        if (num == "best") {
            output <- best(state, outcome)
        } else if (num == "worst") {
            input <- which(needed[, "state"] == state)
            xtrct <- needed[input, ]    
            xtrct[, eval(outcome)] <- as.numeric(xtrct[, eval(outcome)])
            xtrct <- xtrct[order(xtrct[, eval(outcome)], xtrct[, "hospital"], decreasing = TRUE), ]
            output <- xtrct[, "hospital"][1]
        } else {
            stop('invalid rank')
        }
    }
    return(output)
}

# example output:
rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart failure", 5000)

