Davis=read.table(
  "http://socserv.socsci.mcmaster.ca/jfox/Books/Applied-Regression-2E/datasets/Davis.txt")
Davis[12,c(2,3)]=Davis[12,c(3,2)]
plot(lm(weight~height, data=Davis))

n=200
x=runif(n)*2*pi
y=sin(x)*3+rnorm(n)
plot(x,y)

df=data.frame(x,y)
abline(lm(y~x,data=df))
s1=2
s2=4
pos1=function(x) (x-s1)*(x>s1)
pos2=function(x) (x-s2)*(x>s2)
reg=lm(y~x+pos1(x)+pos2(x),data=df)
summary(reg)
u=seq(0,6,by=.01)
v=predict(reg,newdata = data.frame(x=u))
lines(u,v,col='red')
abline(v=c(s1,s2),col='blue')

plot(x,y)
abline(lm(y~x,data=df))
s1=quantile(x,1/3)
s2=quantile(x,2/3)
pos1=function(x) (x-s1)*(x>s1)
pos2=function(x) (x-s2)*(x>s2)
reg=lm(y~x+pos1(x)+pos2(x),data=df)
summary(reg)
u=seq(0,6,by=.01)
v=predict(reg,newdata = data.frame(x=u))
lines(u,v,col='red')
abline(v=c(s1,s2),col='blue')

plot(x,y)
library(splines)
reg=lm(y~bs(x,knots=1:5,degree=1),data=df)
summary(reg)
v=predict(reg,newdata = data.frame(x=u))
lines(u,v,col='purple')
abline(v=1:5,col='light blue')

plot(x,y)
library(splines)
reg=lm(y~bs(x,knots=c(2,4),degree=2),data=df)
summary(reg)
v=predict(reg,newdata = data.frame(x=u))
lines(u,v,col='purple')
abline(v=c(2,4),col='light blue')
reg=lm(y~poly(x,degree=25),data=df)
v=predict(reg,newdata = data.frame(x=u))
lines(u,v,col='red')

n=200
x=runif(n)*5*pi
y=sin(x)*3+rnorm(n)
plot(x,y)
library(splines)
df=data.frame(x,y)
reg=lm(y~bs(x,knots=seq(2,14,by=2)),data=df)
summary(reg)
u=seq(0,16,by=.01)
v=predict(reg,newdata = data.frame(x=u))
lines(u,v,col='purple')
summary(reg)

library(DALEX)
data(apartments, package = "DALEX")
str(apartments)
attach(apartments)
plot(construction.year,m2.price)

reg3=lm(m2.price~poly(construction.year,degree=2),data=apartments)
u=1920:2010
v=predict(reg3,newdata=data.frame(construction.year=u))
lines(u,v,col='red')

reg1=lm(m2.price~bs(construction.year,
                    knots=c(1945,1990),degree=1),data=apartments)
u=1920:2010
v=predict(reg1,newdata=data.frame(construction.year=u))
lines(u,v,col='blue')

reg2=lm(m2.price~construction.year+
          I(construction.year>1950)+
          I(construction.year*(construction.year>1950)),
        data=apartments)
u=1920:2010
v=predict(reg2,newdata=data.frame(construction.year=u))
lines(u,v,col='green')

reg=lm(m2.price~district,data=apartments)
summary(reg)
library(car)
linearHypothesis(reg,c("districtBielany = 0", 
                       "districtPraga = 0",
                       'districtUrsus = 0',
                       'districtUrsynow = 0',
                       'districtWola = 0'))
levels(apartments$district)=c("A",
                              "A",
                              "Mokotow",
                              "Ochota",
                              "A",
                              "Srodmiescie",
                              "A",
                              "A",
                              "A",
                              "Zoliborz") 
reg=lm(m2.price~district,data=apartments)
table(apartments$district)
summary(reg)
apartments$district=relevel(apartments$district,'Mokotow')
reg=lm(m2.price~district,data=apartments)
summary(reg)
linearHypothesis(reg,c("districtZoliborz = 0", 
                       "districtOchota = 0"))
levels(apartments$district)=c("B","A",
                              "B",
                              "Srodmiescie","B")
reg=lm(m2.price~district,data=apartments)
summary(reg)

