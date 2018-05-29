x<-rnorm(20)



Trim <- function(x, lower = 0.0, upper =1.0) {
  indicies <-x >= lower & x <= upper
  x[indicies]
}

Trim(x)

sumdice <- function(n=2){
  x<-sample(1:6,n,replace=TRUE)
  dots <-sum(x)
  dots
}

sumdice()

getwd()

setwd("C:/Users/Chris/Documents/R/Working directory")
list.files()

dir.create("ExampleDir")
file.create("ExampleDir/Code.R")

path = paste(getwd(), "\\ExampleDir",sep="")
path
setwd(path)
getwd()
list.files()
cat("Reproducible R Code",file="Code.R")
cat("yoyoyo",file="Code.R",append=T)
