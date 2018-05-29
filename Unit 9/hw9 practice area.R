library(rvest)
library(stringr)
library(XML)
library(ggplot2)

#loads Harry potter IMDB site
HPSite<-read_html("http://www.imdb.com/title/tt1201607/fullcredits?ref_=tt_ql_1")

#pulls actor data from site
Actors <- HPSite %>% 
  html_nodes(".itemprop .itemprop") %>%
  html_text()
Actors

#pulls character data from site
Characters <- HPSite %>% 
  html_nodes("#fullcredits_content div") %>%
  html_text()
Characters

#cleans up character white space
Characters<-trimws(Characters)
#removes \n's
Characters<-gsub("\n","",Characters)
#removes extra spaces when over 2 concurrent spaces
Characters<-gsub(" {2,}"," ",Characters)

#creates data frame
dfHP<-data.frame(Actors, Characters)

#creates surname
dfHP$Surname<-word(dfHP$Actors,-1)

#uses surname to create first name and trims white space
dfHP$FirstName<-trimws(str_replace_all(dfHP$Actors,dfHP$Surname,""))

#reorders dataframe, elimantes unnecessary columns, and prints first 10 rows
dfHP<-dfHP[c(4,3,2)]
head(dfHP,n = 10)

####################################
##################################
#loads espn page
ESPNSite<-readHTMLTable("http://www.espn.com/nba/team/stats/_/name/sa/san-antonio-spurs")

#stores 2nd table as a dataframe
ep<-data.frame(ESPNSite[2])

#fixes naming header issues
names(ep) <- as.matrix(ep[1,])

#removes player header row and totals row
ep = ep[-1,]
ep = ep[-18,]

#creates position column
ep$Position<-gsub("* ,","",ep$PLAYER)
ep$Position<-word(ep$PLAYER,-1)

#creates name column
ep$Name<-trimws(str_replace_all(ep$PLAYER,ep$Position,""))
ep$Name<-gsub(",","",ep$Name)


#converts number data
ep<-data.frame(ep[1:1],apply(ep[2:15],2,as.character),ep[16:17])
ep<-data.frame(ep[1:1],apply(ep[2:15],2,as.numeric),ep[16:17])
ep$Player<-as.character(ep$PLAYER)
  
sapply(ep[1:17],typeof)

#rearanges table
ep<-ep[,c(17,16,2,3,4,5,6,7,8,9,10,11,12,13,14,15,1)]

#plots everything
ggplot(data=ep, aes(x=reorder(ep$PLAYER,ep$FG.),y=ep$FG., fill=ep$Position)) + geom_bar(stat = "identity") + 
  ggtitle("San Antonio Spurs FG% by players") +
  xlab("Player, position") + ylab("FG%") + guides(fill=F) +
  theme(plot.title = element_text(hjust = 0.5)) + coord_flip() + scale_fill_brewer(palette="Set3") + 
  scale_color_brewer(palette="Set3") +
  labs(colour="Legend")  










