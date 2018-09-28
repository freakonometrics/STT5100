Davis=read.table(
  "http://socserv.socsci.mcmaster.ca/jfox/Books/Applied-Regression-2E/datasets/Davis.txt")
Davis[12,c(2,3)]=Davis[12,c(3,2)]
Davis=data.frame(X2=Davis$height / 30.48,
                 X1=Davis$sex,
                 Y=Davis$weight * 2.204622)
str(Davis)
tail(Davis)

X0=cbind(1,Davis$X1=='F',Davis$X1=='M')
solve(t(X0)%*%X0)
eigen(t(X0)%*%X0)

X=X0[,1]
solve(t(X)%*%X)
Y=Davis$Y
solve(t(X)%*%X) %*% (t(X)%*%Y)
mean(Y)

X=X0[,c(2,3)]
solve(t(X)%*%X)
Y=Davis$Y
solve(t(X)%*%X) %*% (t(X)%*%Y)


x=Y[X[,1]==1]
y=Y[X[,2]==1]
nx=length(x)
ny=length(y)
mean(y)
sqrt(var(y)/ny)
sqrt(1/(ny-1)*sum( (y-mean(y))^2 )/ny)
s2=1/(nx+ny-2)*(sum( (x-mean(x))^2 )+sum( (y-mean(y))^2))
mean(x)
sqrt(s2/nx)
mean(y)
sqrt(s2/ny)
reg=lm(Y~0+X1,data=Davis)
summary(reg)

X=X0[,c(1,3)]
X=cbind(1,Davis$X1=='M')
solve(t(X)%*%X)
Y=Davis$Y
solve(t(X)%*%X) %*% (t(X)%*%Y)
reg2=lm(Y~X1,data=Davis)
summary(reg2)
?t.test
t.test(Y[X[,1]==1],Y[X[,2]==1],var.equal=TRUE)
P=cbind(Y,predict(reg),predict(reg2))

chicago = read.table("http://freakonometrics.free.fr/chicago.txt",header=TRUE,sep=";")
tail(chicago)
Y=chicago[,1]
X=as.matrix(cbind(1,chicago[,2:4]))
solve(t(X)%*%X) %*% (t(X)%*%Y)
b=solve(t(X)%*%X) %*% (t(X)%*%Y)
Yhat = X%*%b
plot(Y,Yhat)
abline(a=0,b=1,col='red')
E=Y-Yhat
s2=var(E)
var(Y)
var(Yhat)
var(E)
var(Yhat)+var(E)
as.numeric(s2)*solve(t(X)%*%X)
sqrt(diag(as.numeric(s2)*solve(t(X)%*%X)))
reg=lm(Fire~.,data=chicago)
summary(reg)
data(anscombe)
anscombe
summary(lm(y1~x1,data=anscombe))
plot(x4,y4)
abline(lm(y4~x4,data=anscombe))