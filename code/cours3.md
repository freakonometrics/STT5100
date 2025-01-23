
``` r
x= cars$speed
y= cars$dist
n = length(x)
reg = lm(dist~speed,data=cars)
(b1 = reg$coefficients[2])
cov(x,y)/var(x)
cor(x,y)*sqrt(var(y)/var(x))

b0 = reg$coefficients[1]
mean(y)-b1*mean(x)

Sxy = sum((x-mean(x))*(y-mean(y)))
Sxx = sum((x-mean(x))^2)
Syy = sum((y-mean(y))^2)

epsilon = y-(b0+b1*x)
yhat = b0+b1*x
mean(epsilon)
mean(yhat)
mean(y)

Sex = sum((x-mean(x))*epsilon)
Seyhat = sum((yhat-mean(yhat))*epsilon)

Syy
sum((yhat-mean(yhat))^2)
sum((y-yhat)^2)
sum((yhat-mean(yhat))^2) + sum((y-yhat)^2)

sum((yhat-mean(yhat))^2)/Syy
cor(x,y)^2

s2 = var(epsilon)
s2
sqrt(s2/Sxx)
sqrt(s2/Sxx*mean(x^2))
sqrt(s2/Sxx*mean(x^2))*sqrt(49/48)
-s2*mean(x)/Sxx

b1/(sqrt(s2/Sxx))
Sxy/(sqrt(s2 * Sxx))
b0/sqrt(s2/Sxx*mean(x^2))
vcov(reg)

2*(1-pnorm(abs(b1/(sqrt(s2/Sxx)))))
2*(1-pnorm(abs(b0/sqrt(s2/Sxx*mean(x^2)))))

2*(1-pt(abs(b0/(sqrt(s2/Sxx*mean(x^2))*sqrt(49/48))),48))

davis=read.table(
  "http://freakonometrics.free.fr/Davis.txt")

y = davis$height
x = as.factor(davis$sex)

yF = y[x == "F"]
yM = y[x == "M"]
mean(yF)
mean(yM)
t.test(yM,yF,var.equal = TRUE,
       alternative = "two.sided")
summary(lm(y~x))

```
