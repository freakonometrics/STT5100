Davis=read.table(
  "http://socserv.socsci.mcmaster.ca/jfox/Books/Applied-Regression-2E/datasets/Davis.txt")
Davis[12,c(2,3)]=Davis[12,c(3,2)]
str(Davis)
attach(Davis)
plot(height,weight)
X = Davis$height
Y = Davis$weight
(Bhat = cor(X,Y) * sd(Y)/sd(X))
(Ahat = mean(Y) - Bhat*mean(X))
abline(a=Ahat,b=Bhat,col='red')
residus = Y - (Ahat+Bhat*X)
s2 = var(residus)
plot(height,weight)
abline(a=Ahat,b=Bhat,col='black')

# methode 1
n=length(Y)
base = data.frame(y=Y,x=X)
base_simu = base
base_simu$y = (Ahat+Bhat*X) + rnorm(n,0,sd = sqrt(s2))
points(base_simu$x,base_simu$y,col='blue')
X = base_simu$x
Y = base_simu$y
(Bhat = cor(X,Y) * sd(Y)/sd(X))
(Ahat = mean(Y) - Bhat*mean(X))
abline(a=Ahat,b=Bhat,col='blue')

X = Davis$height
Y = Davis$weight
(Bhat0 = cor(X,Y) * sd(Y)/sd(X))
(Ahat0 = mean(Y) - Bhat*mean(X))
residus = Y - (Ahat0+Bhat0*X)
s2 = var(residus)

plot(height,weight)
abline(a=Ahat0,b=Bhat0,col='black')
base = data.frame(y=Y,x=X)
# methode 1
B0=B1=rep(NA,1000)
for(s in 1:1000){ 
n=length(Y)
base_simu = base
base_simu$y = (Ahat0+Bhat0*X) + rnorm(n,0,sd = sqrt(s2))
#points(base_simu$x,base_simu$y,col='blue')
X = base_simu$x
Y = base_simu$y
(Bhat = cor(X,Y) * sd(Y)/sd(X))
(Ahat = mean(Y) - Bhat*mean(X))
abline(a=Ahat,b=Bhat,col='blue')
B0[s] = Ahat
B1[s] = Bhat
}
hist(B0,probability = TRUE)
abline(v=Ahat0,col='red')
sd(B0)
hist(B1,probability = TRUE)
abline(v=Bhat0,col='red')
sd(B1)

summary(lm(weight~height, data=Davis))
hist(B1/0.06749,probability = TRUE)
abline(v=Bhat0/0.06749,col='red')
sd(B1)

summary(lm(weight~height, data=Davis))
plot(B0,B1)

X = Davis$height
Y = Davis$weight
(Bhat0 = cor(X,Y) * sd(Y)/sd(X))
(Ahat0 = mean(Y) - Bhat*mean(X))
residus = Y - (Ahat0+Bhat0*X)
s2 = var(residus)


plot(height,weight)
abline(a=Ahat0,b=Bhat0,col='black')
base = data.frame(y=Y,x=X)
# methode 2
B0=B1=rep(NA,1000)
for(s in 1:1000){ 
  n=length(Y)
  idx = sample(1:n,size=n,replace=TRUE)
  base_simu = base[idx,]
  X = base_simu$x
  Y = base_simu$y
  (Bhat = cor(X,Y) * sd(Y)/sd(X))
  (Ahat = mean(Y) - Bhat*mean(X))
  abline(a=Ahat,b=Bhat,col='blue')
  B0[s] = Ahat
  B1[s] = Bhat
}
hist(B0,probability = TRUE)
abline(v=Ahat0,col='red')
sd(B0)
hist(B1,probability = TRUE)
abline(v=Bhat0,col='red')
sd(B1)

summary(lm(weight~height, data=Davis))
hist(B1/0.06749,probability = TRUE)
abline(v=Bhat0/0.06749,col='red')
sd(B1)


