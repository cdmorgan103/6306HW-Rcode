URL<-"http://bit.ly/1jXJgDh"
temp<-tempfile()
download.file(URL,temp)
UDSData<-read.csv(gzfile(temp,"uds_summary.csv"))
temp
names(UDSData)
unlink(temp)

UDSData
date()
dim(UDSData)
variable.names(UDSData)
str(UDSData)


###########################

install.packages("downloader")
library(downloader)

download("https://raw.githubusercontent.com/thoughtfulbloke/faoexample/master/appleorange.csv",
         destfile="appleorange.csv")

download("https://raw.githubusercontent.com/thoughtfulbloke/faoexample/master/stability.csv",
         destfile="stability.csv")
list.files()

ao <- read.csv("appleorange.csv")
str(ao)
head(ao)

ao <- read.csv("appleorange.csv",stringsAsFactors = FALSE, header=FALSE)
aoraw<-ao
head(aoraw,10)
str(aoraw)
tail(aoraw,10)

aodata<-aoraw[3:700,]
names(aodata)<-c("country","countrynumber","products","productnumber","tonnes","year")
str(aodata)
aodata$countrynumber <-as.integer(aodata$countrynumber)
str(aodata)

fslines<-which(aodata$country == "Food supply quantity (tonnes) (tonnes)")
aodata<-aodata[(-1*fslines),]
str(aodata)

aodata$tonnes<-gsub("\xca","",aodata$tonnes)
aodata$tonnes<-gsub(", tonnes \\(\\)","",aodata$tonnes)
aodata$tonnes<-as.numeric(aodata$tonnes)
str(aodata)

aodata$year<-2009
apples<-aodata[aodata$productnumber ==2617,c(1,2,5)]
str(apples)
names(apples)[3]<-"apples"
str(apples)
oranges<- aodata[aodata$productnumber == 2611,c(2,5)]
str(oranges)
names(oranges)[2]<-"oranges"
str(oranges)

z<-c(aodata$country,aodata$countrynumber)
table(z)

cleanao2<-merge(apples,oranges, by="countrynumber",all=T)
str(cleanao2)
library(reshape2)
cleanao3<-dcast(aodata[,c(1:3,5)],formula=country + countrynumber ~ products, value.var = "tonnes")
str(cleanao3)
names(cleanao3)[3:4]<- c("apples","oranges")
cleanao2[!(complete.cases(cleanao2)),]
cleanao3[!(complete.cases(cleanao3)),]
table(aodata$country)[table(aodata$country)==1]