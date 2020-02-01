Davis = read.table(
  "http://socserv.socsci.mcmaster.ca/jfox/Books/Applied-Regression-2E/datasets/Davis.txt")
Davis[12,c(2,3)] = Davis[12,c(3,2)]
str(Davis)
reg = lm(weight~1+sex+height, data=Davis)
Davis2 = data.frame(weight = Davis$weight,
                    height = Davis$height,
                    M = (Davis$sex=='M')*1,
                    F = (Davis$sex=='F')*1)
reg2 = lm(weight~1+M+F+height, data=Davis2)
lm(weight~1+I(sex=='M')+I(sex=='F')+height, data=Davis)
sum(residuals(lm(weight~0+sex+height, data=Davis))^2)
sum(residuals(lm(weight~1+sex+height, data=Davis))^2)
Davis$sex = relevel(Davis$sex,'M')
lm(weight~1+sex+height, data=Davis)
Davis$sex = relevel(Davis$sex,'F')

reg=lm(weight~sex+height, data=Davis)
plot(Davis$height,Davis$weight)
plot(Davis$height,Davis$weight,
     col=c('red','blue')[1+(Davis$sex=='M')*1])
points(Davis$height,predict(reg),pch=19,
       col=c('red','blue')[1+(Davis$sex=='M')*1])
abline(lm(weight~height, data=Davis))
sum(residuals(lm(weight~height, data=Davis))^2)
sum(residuals(lm(weight~1, data=Davis))^2)
lm(weight~sex, data=Davis)
mean(Davis$weight[Davis$sex=='F'])
mean(Davis$weight[Davis$sex=='M'])


reg=lm(weight~height, data=Davis)
vcov(reg)

var(residuals(reg))
X = cbind(1,Davis$height)
var(residuals(reg))*solve(t(X)%*%X)

vcov(reg)[1,2]/sqrt(vcov(reg)[1,1]*vcov(reg)[2,2])
runif(1)

n=1e6
U = runif(n)
X =qnorm(U,2,3)
hist(X)

E = residuals(reg)
n=nrow(Davis)
bruit = sample(E , size=n, replace=TRUE)
base = data.frame(x = Davis$height,
                  y = predict(reg) + bruit)
plot(Davis$height,Davis$weight)
points(base$x,base$y,pch=19,col='blue')
regs = lm(y~x,data=base)
abline(regs,col='blue')
abline(reg)

plot(Davis$height,Davis$weight)
abline(reg)
E = residuals(reg)
n=nrow(Davis)
B= matrix(NA,1e3,2)
for(i in 1:1e3){
  bruit = sample(E , size=n, replace=TRUE)
  base = data.frame(x = Davis$height,
                    y = predict(reg) + bruit)
  regs = lm(y~x,data=base)
  abline(regs,col=rgb(0,0,1,.3))
  B[i,]=coefficients(regs)
}
hist(B[,1])
vcov(reg)
plot(B)
summary(reg)

reg=lm(weight~sex, data=Davis)
summary(reg)
plot(density(Davis$weight[Davis$sex=='F']),col='red',xlim=
       c(30,120))
lines(density(Davis$weight[Davis$sex=='M']),col='blue')
t.test(Davis$weight[Davis$sex=='F'],
       Davis$weight[Davis$sex=='M'])

