setwd("~/College/4th Year - 2nd Sem/Stat 197 - Data Science/Projects/2. Project")

corr <- function(directory, threshold = 0) {
  #FOR SETTING THE WORKING DIRECTORY
  location <- file.path(getwd(), directory) 
  setwd(location)
  correlation = NULL
  
  #FOR ID
  #For all observations greater than threshold
  for (i in 1:332){
    if(i>=1 && i<10) {
      index <- paste("00", i, sep="")
      data <- read.csv(paste(index ,".csv", sep = ""))
    } else if(i>=10 && i<=99) {
      index <- paste("0",i,sep="")
      data <- read.csv(paste(index,".csv", sep = ""))
    } else {
      data <- read.csv(paste(i,".csv", sep = ""))
    }
    
    data = na.omit(data)
    if (nrow(data) > threshold) {
    datacorr <- cor(data$sulfate, data$nitrate)
    correlation = c(correlation, datacorr)
      }  
  }
  setwd("..") 
  return (correlation)
}

#FOR DEMO
cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
summary(cr)
length(cr)

cr <- corr("specdata")
summary(cr)
length(cr)

