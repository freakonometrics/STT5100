Davis=read.table(
  "http://socserv.socsci.mcmaster.ca/jfox/Books/Applied-Regression-2E/datasets/Davis.txt")
Davis[12,c(2,3)]=Davis[12,c(3,2)]
plot(Davis$height,Davis$weight)

reg=lm(weight~height, data=Davis)
for(i in 1:100){
e = residuals(reg)
w = 1/abs(e)
reg=lm(weight~height, data=Davis,
       weights = w)
cat(coef(reg),'\n')
}
abline(a=-123.2,b=1.1,lwd=2,col='red')
abline(lm(weight~height, data=Davis),col='blue')
install.packages('quantreg')
library(quantreg)
summary(rq(weight~height, data=Davis,tau=.5))
abline(rq(weight~height, data=Davis,tau=.9))
abline(rq(weight~height, data=Davis,tau=.1))


y=sample(LETTERS[1:4],size=100,replace=TRUE)
x=as.factor(y)
levels(x)=c('ABC','ABC','ABC','D')


hist(Davis$weight,probability = TRUE)
lines(density(Davis$weight,
              kernel = 'rectangular',
              bw = 10),col='red')
lines(density(Davis$weight,
              kernel = 'rectangular',
              bw = 2),col='blue')

lines(density(Davis$weight,
              kernel = 'rectangular',
              bw = 25),col='green')

lines(density(Davis$weight,
              kernel = 'rectangular'),
      col='purple',lwd=2)


hist(Davis$weight,probability = TRUE)
lines(density(Davis$weight,
              kernel = 'epanechnikov')
              ,col='red')
lines(density(Davis$weight,
              kernel = 'gaussian')
      ,col='blue')

plot(Davis$height,Davis$weight)
lines(ksmooth(x=Davis$height,
        y=Davis$weight,
        kernel='normal',bandwidth = 5),col='red')

hist(Davis$weight,probability = TRUE)
lines(density(Davis$weight),col='red')