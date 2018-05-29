
#problem 1 my doods

#reads in data in dataframe
df<-read.table(file = "C:/Users/Chris/Documents/R/Working directory/6306/Unit 5/yob2016.txt",
               header = T,sep=";",col.names = c("Name","Gender","count"))

#prints summary and structure
summary(df)
str(df)

#identifie bad data location in df, i returns postion, j returns bad name. cat prints it
i<-grep("yyy",df$Name)
j<-grep("yyy",df$Name,value = T)
cat("The bad data name was:", j, "at row:", i)


#deletes bad data row
y2016<-df[-c(i),]

#problem 2 broski's
#reads in data in dataframe
y2015<-read.table(file = "C:/Users/Chris/Documents/R/Working directory/6306/Unit 5/yob2015.txt",
               header = T,sep=",",col.names = c("Name","Gender","count"))
#prints last 10
tail(y2015,n = 10)

#it seems unsusual that they'd all tie for a count of 5, zyus and zyrus could also be duplicates by error

#merge the data
final<-merge(y2015,y2016, by =c("Name","Gender"))
head(final)

#problem 3
#create a total column
final$Total<-final$count.x+final$count.y

#sort by total
final<-final[order(-final$Total),]
head(final,n=20)
#find male values and delete
z<-grep("M",final$Gender)
final<-final[-c(z),]

#print top 10 girl names
head(final,n=10)

#write to csv, create export table for export
export<-data.frame(final$Name,final$Total)
colnames(export)[c(1,2)] <- c("Name","Total")
write.csv(x=export,file="GirlNames.csv",row.names = F)

codebook()


####alt

#final2<-merge(y2015,y2016, by =c("Name"))
#head(final2)

#final2$total<-final2$count.x+final2$count.y
#head(final2)

#sortt2<-final2[order(-final2$total),]
#head(sortt2,n = 10)

#zzz<-grep("M",testdf2$Gender.y)
#testdf3<-testdf2[-c(zzz),]
#testdf3


###alt
#export2<-data.frame(final[,c(-2,-3,-4)])
#colnames(export)[c(1,2)] <- c("Name","Total")
#head(export2)

