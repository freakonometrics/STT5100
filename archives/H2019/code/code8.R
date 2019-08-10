myocarde = 
  read.table("http://freakonometrics.free.fr/myocarde.csv",head=TRUE, sep=";")
str(myocarde)

base=myocarde[,-8]
base$Y = myocarde$PRONO=="DECES"
reg = glm(Y~.,data=base,family=binomial(link = "logit"))
summary(reg)

BETA = matrix(NA,8,20)
BETA[,1] = lm(Y~.,data=base)$coefficients
X=as.matrix(cbind(1,base[,-8]))
Y=base[,8]
for(k in 2:20){
  p=exp(X %*% BETA[,k-1])/(1+exp(X %*% BETA[,k-1]))
  Wdiag=p*(1-p)
  W=diag(as.numeric(Wdiag))
  Z=X %*% BETA[,k-1] + solve(W)%*%(Y-p)
  BETA[,k] = lm(Z~0+X,weights = Wdiag)$coefficients
}
V=solve(t(X)%*%W%*%X)
sqrt(diag(V))
summary(reg)


myocarde = read.table("http://freakonometrics.free.fr/myocarde.csv",head=TRUE, sep=";")
reg=glm((PRONO=="DECES")~.,data=myocarde,
        family=binomial(link = "logit"))
summary(reg)
?residuals.glm
plot((myocarde$PRONO=="DECES")-predict(reg,type='response'))
plot(residuals(reg,type='pearson'))
plot(residuals(reg,type='deviance'))

reg=glm((PRONO=="DECES")~.,data=myocarde,
        family=binomial(link = "logit"))
step(reg)

reg1=glm((PRONO=="DECES")~PVENT+REPUL,data=myocarde,
        family=binomial(link = "logit"))
summary(reg1)

reg2=glm((PRONO=="DECES")~PRDIA+INCAR,data=myocarde,
         family=binomial(link = "logit"))
summary(reg2)
reg2b=glm((PRONO=="DECES")~PRDIA+INCAR,data=myocarde,
         family=binomial(link = "probit"))
summary(reg2b)

library(MASS)
stepAIC(reg,direction='backward')
reg=glm((PRONO=="DECES")~1,data=myocarde,
        family=binomial(link = "logit"))
stepAIC(reg,direction='forward')