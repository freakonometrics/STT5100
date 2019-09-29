k=1
base = anscombe[,k+c(0,4)]
names(base) = c('x','y')
plot(base$x,base$y,ylim=c(0,12),pch=19)
reg = lm(y~x, data=base)
summary(reg)
vcov(reg)
sqrt(diag(vcov(reg)))
abline(a=3,b=.5,col='red')

base0 = cbind(base0,x5 = rnorm(11))
reg0 = lm(y~., data=base0)
summary(reg0)

k=4
base = anscombe[,k+c(0,4)]
names(base) = c('x','y')
plot(base$x,base$y,ylim=c(0,14),pch=19)
reg = lm(y~x, data=base)
abline(a=3,b=.5,col='red')
summary(reg)

Davis=read.table(
  "http://socserv.socsci.mcmaster.ca/jfox/Books/Applied-Regression-2E/datasets/Davis.txt")
Davis[12,c(2,3)]=Davis[12,c(3,2)]
reg = lm(weight~height, data=Davis)
summary(reg)
plot(reg,which=1)

summary(lm(residuals(reg)~Davis$height))
summary(lm(residuals(reg)~predict(reg)+I(predict(reg)^2)))

R=rstudent(reg)
plot(pnorm(R),rank(R)/length(R))
plot(qnorm((1:length(R))/length(R)),sort(R))
