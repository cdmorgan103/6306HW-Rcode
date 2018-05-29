#Reads in data to dataframe df
df <- read.csv('C:/Users/Chris/Documents/R/Working directory/6306/titanic.csv',header = T,sep = ",")


#creates array for male & female and performs sum
male<-(df$Sex =='male')
female<-(df$Sex =='female')
maleC<-sum(male)
femaleC<-sum(female)

#prints number of males and females
cat("Number of males = ", maleC)
cat("Number of females = ", femaleC)

#plots frequency of females and males
barplot(c(maleC,femaleC),names.arg = c("Male","Female"),
        xlab= "Gender", ylab="Passenger Count", main = "Titanic passenger gender count", col = c("darkblue","Pink"))



#gendat<-data.frame(male,female)
#gendat
#gendatnum<-gendat*1
#gendatnum
#barplot(sum(gendatnum))


#creates matrix for age Fare and Survived only per q2c
dfask<-data.frame(df$Age,df$Fare,df$Survived)
colnames(dfask)<-c("Age","Fare","Survived")

#Applies mean to selected fields
sapply(dfask,mean,na.rm=T)


ds <- read.csv('C:/Users/Chris/Documents/R/Working directory/6306/sleep_data_01.csv',header = T,sep = ",")
ds

#a
MedianAge<-median(ds$Age,na.rm = T)
MinDuration<-min(ds$Duration,na.rm = T)
MaxDuration<-max(ds$Duration,na.rm = T)
MeanRSES<-mean(ds$RSES,na.rm = T)
SdRSES<-sd(ds$RSES,na.rm = T)

#b
?data.frame
report<-data.frame(MedianAge,MeanRSES/5,SdRSES/5,MaxDuration - MinDuration)
report

#c
colnames(report)<-c("MedianAge","SelfEsteem","SE_SD","DurationRange")

#d
round(report,2)



myfunction <- function(x){
  MedianAge<-median(x$Age,na.rm = T)
  MinDuration<-min(x$Duration,na.rm = T)
  MaxDuration<-max(x$Duration,na.rm = T)
  MeanRSES<-mean(x$RSES,na.rm = T)
  SdRSES<-sd(x$RSES,na.rm = T)
  
  report<-data.frame(MedianAge,MeanRSES/5,SdRSES/5,MaxDuration - MinDuration)
  
  colnames(report)<-c("MedianAge","SelfEsteem","SE_SD","DurationRange")
  
  report<-round(report,2)
  return(report)
}

myfunction(ds)

  
  