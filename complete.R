setwd("~/College/4th Year - 2nd Sem/Stat 197 - Data Science/Projects/2. Project")

complete <- function(directory, id = 1:332) {
  #FOR SETTING THE WORKING DIRECTORY
  location <- file.path(getwd(), directory) 
  setwd(location)
  dataframe = NULL
  
  #For ID
  for (i in id){
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
    dataframe = as.data.frame(rbind(dataframe, c(i,nrow(data))))
  }
  
  setwd("..")
  colnames(dataframe) <-  c('id', 'nobs')
  return (dataframe) 
}
