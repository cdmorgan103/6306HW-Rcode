df<-cars
y<-cars$dist
x<-cars$speed


lm(cars)
model<-lm(y~x,df)

plot(cars)
abline(model)
plot(model)





