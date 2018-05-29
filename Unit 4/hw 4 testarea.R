#test 
install.packages("fivethirtyeight")
library(fivethirtyeight)

data(package = "fivethirtyeight")

?college_recent_grads
data(college_recent_grads)
df<-college_recent_grads


vignette("fivethirtyeight", package = "fivethirtyeight")
##https://fivethirtyeight.com/features/the-economic-guide-to-picking-a-college-major/



dim(df)
colnames(df)
length(colnames(df))

##start 2

myfunction <- function(x)
  {
  a<-colnames(df)
  b<-length(a)
  cat("colnames: ", a, sep = ",","\n")
  cat("number of columns: ", b)
  }

myfunction(df)

major_count<-as.data.frame(table(df$major_category))



par(las=2,par(mar=c(5,10,4,1)+2)) 
install.packages("RColorBrewer")
library(RColorBrewer)

barplot(major_count$Freq,names.arg = major_count$Var1,xlab="Count of Major category",horiz = T,
   main = "Major categories for recent graduates",
   col=brewer.pal(n=11,name = "Spectral"),xlim=c(0,30), cex.names = .7)
mtext("Major Category",side=2,line=5,cex = 1.1)


write.csv(df,file ="dfData.csv",row.names = F)



getwd()
setwd("C:/Users/Chris/Documents/R/Working directory/6306")

##
#dummyData = rep(c(1,2, 2, 2), 25)
#dummyData
#table(dummyData)
#x <- as.data.frame(table(dummyData))
#x
#x[order(x$Freq, decreasing = TRUE), ]


