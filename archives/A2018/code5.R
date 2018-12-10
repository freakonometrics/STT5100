runif(1)
U=runif(10000)
range(U)
hist(U)
plot(U[1:9999],U[2:10000],cex=.2)
X=qnorm(U)
mean(X)
var(X)
hist(X)

n=10
y=qnorm(runif(n),5,2)
ybar=mean(y)
m=10000
ybar=rep(NA,m)
for(j in 1:m){
  yj=qnorm(runif(n),5,2)
  ybar[j]=mean(yj)
}

n=100
y=qnorm(runif(n),5,2)
ybar=mean(y)
m=10000
ybar=rep(NA,m)
for(j in 1:m){
  yj=sample(y,size=n,replace=TRUE)
  ybar[j]=mean(yj)
}
mean(ybar)
var(ybar)
hist(ybar)


data(cars)
plot(cars)
reg=lm(dist~speed,data=cars)
x=seq(4,26,by=.25)
y=predict(reg,newdata=data.frame(speed=x))
lines(x,y,lwd=2,col='red')
n=nrow(cars)

m=10000
beta=matrix(NA,m,2)
maty=matrix(NA,m,21)
x=seq(4,26,length=21)
for(j in 1:m){
  indices=sample(1:n,size=n,replace=TRUE)
  base=cars[indices,]
  reg=lm(dist~speed,data=base)
  ##abline(reg,col=rgb(1,0,0,.2))
  beta[j,]=coefficients(reg)
  maty[j,]=cbind(1,x) %*% beta[j,]
}
hist(beta[,2],probability = TRUE)
u=seq(2,6,length=601)
lines(u,dnorm(u,3.9324,0.4155),col='blue')

hist(maty[,11],probability = TRUE)

y1=apply(maty,2,mean)
plot(cars)
lines(x,y1,col='red')
y2=apply(maty,2,function(x) quantile(x,.05))
lines(x,y2,col='red')
y3=apply(maty,2,function(x) quantile(x,.95))
lines(x,y3,col='red')

reg=lm(dist~speed,data=cars)
x=seq(4,26,by=.25)
y=predict(reg,newdata=data.frame(speed=x),
          interval='confidence',level = 0.90)
lines(x,y[,2],lty=2)
lines(x,y[,3],lty=2)
lines(x,y,col='green')

chicago = read.table("http://freakonometrics.free.fr/chicago.txt",header=TRUE,sep=";")
str(chicago)
reg=lm(Fire~X_1,data=chicago)
summary(reg)
plot(chicago$X_1,chicago$Fire)
abline(reg,col='red')
reg=lm(Fire~X_2,data=chicago)
summary(reg)
plot(chicago$X_2,chicago$Fire)
abline(reg,col='red')
reg=lm(Fire~X_3,data=chicago)
summary(reg)
plot(chicago$X_3,chicago$Fire)
abline(reg,col='red')
reg=lm(Fire~.,data=chicago)
summary(reg)

reg=lm(Fire~X_2+X_3,data=chicago)
summary(reg)