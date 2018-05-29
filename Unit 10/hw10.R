library(ggplot2)
library(RColorBrewer)
load(file="C:/Users/Chris/desktop/data.rda")
df<-mh2015_puf

#states as a vector
states<-unique(df$LST)
states<-as.vector(states)

#subsets for VA's only
VA<-subset(df,df$FACILITYTYPE=="Veterans Administration medical center (VAMC) or other VA health care facility")

# creates continental list (adds dc, eliminates Alaska and Hawaii)
continental<-c(state.abb,"DC")
removest<-c("AK","HI")
continental<-setdiff(continental,removest)

#trims whitespace from states
VA$LST<-trimws(VA$LST)

#searches for continental US states in VA dataframe and saves as new dataframe
VAST<-VA[as.character(VA$LST) %in% continental,]
stateVA<-as.data.frame(table(VAST$LST))
colnames(stateVA)<-c("State","Frequency")

#performs interpolation for color values to be used in ggplot
colourCount = length(unique(stateVA$State))
getPalette = colorRampPalette(brewer.pal(11, "RdBu"))

#plots states
ggplot(data = stateVA, aes(x=reorder(stateVA$State,stateVA$Frequency),y=stateVA$Frequency,fill=stateVA$State)) + 
  geom_bar(stat="identity") + coord_flip() + theme_dark() +
  labs(title="VA hospitals in mainland United States",x="State",y="Count of Hospitals in State") + 
  theme(plot.title = element_text(hjust = 0.5), legend.position = "bottom") +
  guides(fill=guide_legend(title="US State",nrow=4))+ scale_fill_manual(values = getPalette(colourCount))

#reads in state size data  
ss<-read.csv("C:/Users/Chris/documents/R/Working directory/6306/Unit 10/statesize.csv")
colnames(ss)<-c("StateName","SqMiles","State","Region")

#paste data together for demo 2a
paste(stateVA$State[1:5], ss$StateName[1:5], ss$SqMiles[1:5])
#We can see this is a bad idea as the values do not lign up and the state data includes some states we eliminated. This is simply a bad idea
#i previously did trim ws space previously. 

#merges statedf and states size data
zz<-merge(stateVA,ss,by="State")

#calculate per 1000 sq miles
zz$hptho<-(zz$Frequency/zz$SqMiles)*1000


#performs interpolation for color values to be used in ggplot
colourCount2 = length(unique(zz$Region))

#plots hospitals for region
ggplot(data = zz, aes(x=reorder(zz$State,zz$hptho),y=zz$hptho,fill=zz$Region)) + 
  geom_bar(stat="identity") + coord_flip() + theme_dark() +
  labs(title="VA hospitals in mainland United States per 1000 sq miles",x="State",y="Hospitals per 1000 square miles") + 
  theme(plot.title = element_text(hjust = 0.5), legend.position = "bottom") +
  guides(fill=guide_legend(title="US Region",nrow=1)) + scale_fill_manual(values = getPalette(colourCount2))




