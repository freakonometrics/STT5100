

myocarde = read.table(
  "http://freakonometrics.free.fr/myocarde.csv",
  head=TRUE, sep=";")
str(myocarde)
base=data.frame(myocarde[,1:7],
                Y=(myocarde$PRONO=='DECES')*1)
str(base)
reg = glm(Y~1,data = base, family = "binomial")
summary(reg)
reg2 = glm(PRONO~1,data = myocarde, family = "binomial")
summary(reg2)
exp(-0.3704)/(1+exp(-0.3704))
mean(base$Y)
exp(0.3704)/(1+exp(0.3704))
boxplot(myocarde$FRCAR~myocarde$PRONO)
boxplot(myocarde$INSYS~myocarde$PRONO)
regI = glm(Y~INSYS,data = base, family = "binomial")
summary(regI)  
plot(base$INSYS,base$Y)
abline(lm(Y~INSYS,data=base),col='blue')
x0=seq(0,60)
y0=exp(6.85947-0.357909*x0)/(1+exp(6.85947-0.357909*x0))
lines(x0,y0,col='red')
ypred = predict(regI, type='response')
points(base$INSYS,ypred,col='red',pch=19,cex=.6)
summary(regI)  
regF = glm(Y~FRCAR,data = base, family = "binomial")
summary(regF) 

boxplot(myocarde$PRDIA~myocarde$PRONO)
regIP = glm(Y~INSYS+PRDIA,data = base, family = "binomial")
summary(regIP) 
plot(base$INSYS,base$PRDIA,pch=19,
     col=c('red','blue')[1+base$Y])

pred = function(i,p){ 
  s = 3.40519-0.32307*i+0.14671 *p
  exp(s)/(1+exp(s))}
x1=seq(0,60,length=51)
y1=seq(5,40,length=51)
z1=outer(x1,y1,pred)
contour(x1,y1,z1,add=TRUE)
persp(x1,y1,z1)
plot(base$INSYS,base$PRDIA,pch=19,
     col=c('red','blue')[1+base$Y])
contour(x1,y1,z1,add=TRUE,levels = c(0,.5,1))
summary(regIP)

step(glm(Y~.,data = base, family = "binomial"))

library(nnet)
reg=multinom(PRONO~ PVENT + REPUL,data = myocarde)
predict(reg,type="probs")

