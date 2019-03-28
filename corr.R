##Setting working directory for this session
setwd("~/College/4th Year - 2nd Sem/Stat 197 - Data Science/Projects/2. Project")

corr <- function(directory, threshold = 0) {
  files <- list.files(directory, full.names = TRUE)
  data <- vector(mode = "numeric", length = 0)
  
  for (i in 1:length(files)){
      datafile <- read.csv(files[i])
      obs <- sum((!is.na(datafile$sulfate)) & (!is.na(datafile$nitrate)))
      
      if (obs > threshold){
        rmnasulfate <- datafile[which(!is.na(datafile$sulfate)), ]
        rmnanitrate <- rmnasulfate[which(!is.na(rmnasulfate$nitrate)), ]
        data <- c(data, cor(rmnanitrate$sulfate, rmnanitrate$nitrate))
        }
  }
  data
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

