##Setting working directory for this session
setwd("~/College/4th Year - 2nd Sem/Stat 197 - Data Science/Projects/2. Project")

complete <- function(directory, id = 1:332) {
  #create a list of all files in the directory
  files <- list.files(directory, full.names = TRUE) 
  # create an empty data frame
  data <- data.frame()
  dataframe = NULL
  
  for(i in id){
    data <- read.csv(files[i])
    data = na.omit(data) 
    dataframe = as.data.frame(rbind(dataframe, c(i,nrow(data))))
    
  }
  
  colnames(dataframe) <-  c('id', 'nobs')
  return(dataframe)
}


##DEMO
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)
