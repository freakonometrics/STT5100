base = read.table(
  "http://freakonometrics.free.fr/baseaffairs.txt",
  header=TRUE)
str(base)
barplot(table(base$Y))
table(base$RELIGIOUS)

reg=glm(Y~as.factor(SEX),data=base,family=poisson)
summary(reg)
mean(base$Y[base$SEX==0])
mean(base$Y[base$SEX==1])

reg=glm(Y~as.factor(SEX)+as.factor(RELIGIOUS),data=base,family=poisson)
summary(reg)
mean(base$Y[base$SEX==0])
mean(base$Y[base$SEX==1])
P = predict(reg, type='response')
cbind(base[,1:5],P)
table(P)
sum(base$Y[base$SEX==0])
sum(P[base$SEX==0])
sum(base$Y[(base$SEX==0)&(base$RELIGIOUS==4)])
sum(P[(base$SEX==0)&(base$RELIGIOUS==4)])
sum(base$Y[(base$SEX==0)&(base$RELIGIOUS%in%c(1,2,3,4,5))])
sum(P[(base$SEX==0)&(base$RELIGIOUS%in%c(1,2,3,4,5))])

reg=glm(Y~YEARMARRIAGE+as.factor(SEX)+as.factor(RELIGIOUS),data=base,family=poisson)
summary(reg)
