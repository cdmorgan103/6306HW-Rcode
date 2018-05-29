mtcars
install.packages("randomForest")
library(randomForest)

randomForest(x=mtcars[,-1],y=mtcars$m)
M<-mtcars[,-1]
L<-mtcars[,1]


clf<-randomForest(M,L)
predict(clf, M[1,])
predict(clf,M[3,])
L[3,]

new_car<-c(7,175,100,4,2.6,16,0,1,5,5)
predict(clf,new_car)



clf$importance
clf$predicted

mtcars

clf$mse
clf

empty<-c()
for (i in c(10,20,40,60,80,100,150,200,300,400,500,1000)){
  empty<-c(empty,mean(randomForest(M,L,ntree=i)$mse))
  
}
plot(empty)


plot(sort(clf$importance))

#pandas for dataframes
#Numpy for matrixs
#sklearn for models
#scikit for learn
#python scientifc stack
#sciPy scientific python
