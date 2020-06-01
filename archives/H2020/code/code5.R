plot(cars)
reg2=lm(dist~speed,data=cars)
points(cars$speed,predict(reg2),col='red',pch=19)
s=15
reg1=lm(dist~I(speed<s)+
          I(speed*(speed<s))+I(speed*(speed>=s)),data=cars)
summary(reg1)
anova(reg2,reg1)
points(cars$speed,predict(reg1),col='blue',pch=19)

chicago = read.table("http://freakonometrics.free.fr/chicago.txt",header=TRUE,sep=";")
str(chicago)
reg=lm(Fire~.,data=chicago)
summary(reg)
reg23=lm(Fire~X_2+X_3,data=chicago)
summary(reg23)
reg12=lm(Fire~X_1+X_2,data=chicago)
summary(reg12)
reg0=lm(Fire~1,data=chicago)
summary(reg0)
reg0=lm(Fire~Fire,data=chicago)
chicago$Fire0=chicago$Fire
chicago$Fire0[1]=6.3
reg0=lm(Fire~Fire0,data=chicago)
summary(reg0)
logLik(reg23)
logLik(reg12)
summary(reg23)
chicago=chicago[,1:4]
step(lm(Fire~.,data=chicago),direction = 'backward', k=2)
step(lm(Fire~.,data=chicago),direction = 'backward', k=log(nrow(chicago)))
step(lm(Fire~1,data=chicago),direction = 'forward', k=2)

plot(reg23)

