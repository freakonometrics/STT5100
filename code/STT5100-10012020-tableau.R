set.seed(1)
y = sample(c('PILE','FACE'),size = 11, prob = c(.6,.4), replace = TRUE)
y
y = (y=='PILE')*1
mean(y)

L = function(p) prod(dbinom(y,size = 1,prob = p))
vp = seq(0,1,by=.01)
vL = (Vectorize(L))(vp)
plot(vp,vL,type='l')
optim(.5,function(x) -L(x))

set.seed(1)
y = sample(c('PILE','FACE'),size = 1000, prob = c(.6,.4), replace = TRUE)
y = (y=='PILE')*1
t.test(y,mu =.5)
sqrt(10)*(mean(y)-.5)/sqrt(mean(y)*(1-mean(y)))

y = sample(c('PILE','FACE'),size = 5000, prob = c(.6,.4), replace = TRUE)
y = (y=='PILE')*1
L = function(p) sum(log(dbinom(y,size = 1,prob = p)))
vp = seq(0,1,by=.01)
vL = (Vectorize(L))(vp)
plot(vp,vL,type='l')


Davis = read.table(
"http://socserv.socsci.mcmaster.ca/jfox/Books/Applied-Regression-2E/datasets/Davis.txt")
Davis[12,c(2,3)] = Davis[12,c(3,2)]
y = Davis$height
thetahat = mean(y)
v = thetahat *(1-thetahat )/length(y)
sqrt(v)
thetahat + c(-1,+1)*1.96*sqrt(thetahat *(1-thetahat )/length(y))
