p0= xxxxx
n=100

set.seed(1)
Y=sample(0:1,size=n,replace=TRUE,prob=c(1-p0,p0))
mean(Y)
pchapo=mean(Y)
pchapo+c(-1,+1)*1.96*sqrt(pchapo*(1-pchapo)/n)

M=rep(NA,1e4)
for(s in 1:1e4) M[s]=mean(sample(0:1,size=n,replace=TRUE,prob=c(1-p0,p0)))
hist(M,probability = TRUE)
u=seq(.1,.6,by=.001)
v=dnorm(u,pchapo,sqrt(pchapo*(1-pchapo)/n))
lines(u,v,col='red')
v=dnorm(u,xxxxx,sqrt(xxxxx*(1-xxxxx)/n))
lines(u,v,col='blue')

L = function(p) p^(sum(Y))*(1-p)^(n-sum(Y))
xP=seq(0,1,by=.01)
yL=Vectorize(L)(xP)
plot(xP,yL,type='l')
optim(p=.5,function(x) -L(x))
optimize(L,interval = c(.2,.5),maximum = TRUE)

logL = function(p) (sum(Y))*log(p)+
  (n-sum(Y))*log(1-p)
xP=seq(0,1,by=.01)
yL=Vectorize(logL)(xP)
plot(xP,yL,type='l')
optimize(logL,interval = c(.2,.45),maximum = TRUE)

####################################

myocarde = read.table(
  "http://freakonometrics.free.fr/myocarde.csv",
  head=TRUE, sep=";")
str(myocarde)

n = nrow(myocarde)
Y = (myocarde$PRONO == "DECES")*1
X = as.matrix(cbind(1,myocarde[,1:7]),n,1+7)

nlogL = function(beta){
  s = X%*%beta
  p = exp(s)/(1+exp(s))
  -sum(Y*log(p)+(1-Y)*log(1-p))
}

optim(lm(Y~0+X)$coefficients,nlogL)

BETA = lm(Y~0+X)$coefficients
for(i in 1:1000){
P= exp(X%*%BETA)/(1+exp(X%*%BETA))
W = diag(as.vector(P*(1-P)),nrow=n, ncol=n)
Z = X%*%BETA + solve(W)%*%(Y-P)
BETA = lm(Z~0+X,weights = P*(1-P))$coefficients
}
BETA
H = t(X)%*%W %*% X
solve(H)
sqrt(diag(solve(H)))
cbind(BETA,sqrt(diag(solve(H))))
cbind(BETA,sqrt(diag(solve(H))),BETA/sqrt(diag(solve(H))))
summary(glm(Y~0+X,family=binomial))

####################################
#install.packages('ROCR')
library(ROCR)
Y = (myocarde$PRONO == "DECES")*1
S = predict(glm(Y~0+X,family=binomial))
P = exp(S)/(1+exp(S))
perf=performance(prediction(P,Y),"tpr","fpr")
plot(perf)
segments(0,0,1,1,col='grey')
table(Y,(P>.5))

plot(ecdf(P[Y==0]),col='red')
plot(ecdf(P[Y==1]),col='blue',add=TRUE)

S = predict(glm(Y~X[,3],family=binomial))
P = exp(S)/(1+exp(S))
perf=performance(prediction(P,Y),"tpr","fpr")
plot(perf)
segments(0,0,1,1,col='grey')
table(Y,(P>.5))

