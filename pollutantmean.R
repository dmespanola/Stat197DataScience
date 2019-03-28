##Setting working directory for this session
setwd("~/College/4th Year - 2nd Sem/Stat 197 - Data Science/Projects/2. Project")

pollutantmean <- function(directory, pollutant, id=1:332){
  #For Setting working Directory in this funcion
  location <- file.path(getwd(), directory) 
  setwd(location)
  total = 0                            
  observations = 0   
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
    
    ##FOR MISSING VALUES
    data = na.omit(data)
    ##GETTING THE OBSERVATIONS
    observations = observations + nrow(data)
    ##GETTING TOTAL IN POLLUTANT   
    if (pollutant == "sulfate") {
      total = total + sum(data$sulfate)
    } else {
      total = total + sum(data$nitrate)
    }  
  }

mean <- total/observations
setwd("..")  
return(mean)

}
