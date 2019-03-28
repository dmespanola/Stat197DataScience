##Setting working directory for this session
setwd("~/College/4th Year - 2nd Sem/Stat 197 - Data Science/Projects/2. Project")

pollutantmean <- function(directory, pollutant, id = 1:332){
  #create a list of all files in the directory
  files <- list.files(directory, full.names = TRUE) 
  
  # create an empty data frame
  data <- data.frame()
  
  for (i in id){
    #add files to main data
    data <- rbind(data, read.csv(files[i]))
  }
  
  #Calulate mean
  if (pollutant == "sulfate"){
    mean <- mean(data[, 2], na.rm = TRUE)
  }
  else{
    mean <- mean(data[, 3], na.rm = TRUE)
  }

  return(mean)
}

#DEMO
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)
