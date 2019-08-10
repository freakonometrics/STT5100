base$B = base$Y>0
reg = glm(B ~ as.factor(RELIGIOUS),family=binomial,data=base)
summary(reg)

reg$coefficients
Xb = reg$coefficients[1]+c(0,reg$coefficients[2:5])
p=exp(Xb)/(1+exp(Xb))

table((base$RELIGIOUS))
table(base$B , (base$RELIGIOUS))
14/42
29/152
32/118

reg = glm(B ~ as.factor(RELIGIOUS),
family=binomial,data=base)

regB = glm(cbind(B,1-B) ~ as.factor(RELIGIOUS),
family=binomial,data=base)
predict(regB,type='response')


base = read.table("http://freakonometrics.free.fr/baseaffairs.txt",header=TRUE)
str(base)

reg = glm(Y ~ as.factor(SEX)+AGE+YEARMARRIAGE+
              CHILDREN + as.factor(RELIGIOUS)+
              as.factor(SATISFACTION), data=base,
              family=poisson(link='log'))

table(base$Y)
gof = goodfit(base$Y, type = "poisson",
  method = "ML", par = NULL)

plot(gof)




