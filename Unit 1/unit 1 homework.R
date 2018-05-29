x<-12
log(12)
?log
z<-rnorm(15,mean = 10,sd = 2 )
z
mean(z)
sd(z)
weightsvec<-c(60,72,57,90,95,72)
heightvec<-c(1.8,1.85,1.72,1.9,1.74,1.91)
weightsvec
heightvec
plot(heightvec,weightsvec)
bmi<-weightsvec/((heightvec)^2)
bmi
meankg<-mean(weightsvec)
a<-weightsvec-meankg
a
sum(a)
DScat<-c("Computer Programming","Math","Statistics","Machine Learning", "Domain Expertise", "Communication and Presentation Skills", "Data Visualization")
DScat
DSscore<-c(2,3,3,1,4,5,4)
Chris<-data.frame(DScat,DSscore)
Chris
barplot(Chris$DSscore, names = Chris$DScat,
  xlab = "Categories", ylab= "Score",
  main = "Chris Morgan's Data Science Profile",
  space = .2, cex.names = .55)

  