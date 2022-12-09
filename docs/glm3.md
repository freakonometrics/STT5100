GLM (2)
================
Arthur Charpentier


``` r
n = 1000
x = runif(n)*2
eta = (-2+2*x)
y = exp(rnorm(n,eta,1))
base = data.frame(y=y, x=x)
reg = glm(y~x,data=base, family=Gamma(link="log"))
summary(reg)
```

    ## 
    ## Call:
    ## glm(formula = y ~ x, family = Gamma(link = "log"), data = base)
    ## 
    ## Deviance Residuals: 
    ##     Min       1Q   Median       3Q      Max  
    ## -2.0637  -0.9564  -0.4408   0.2033   4.9253  
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept) -1.63084    0.07637  -21.35   <2e-16 ***
    ## x            2.04534    0.06542   31.26   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## (Dispersion parameter for Gamma family taken to be 1.433038)
    ## 
    ##     Null deviance: 2178.92  on 999  degrees of freedom
    ## Residual deviance:  945.23  on 998  degrees of freedom
    ## AIC: 2881.9
    ## 
    ## Number of Fisher Scoring iterations: 5

``` r
sum(residuals(reg,"pearson")^2)/(n-2)
```

    ## [1] 1.433038

``` r
p = exp(eta)/(1+exp(eta))
e = 1+rpois(n,2)
y = rbinom(n,size=e,prob=p)
base = data.frame(y,e,x)
regb = glm(cbind(y,e-y)~x,data=base, family=binomial)
summary(regb)
```

    ## 
    ## Call:
    ## glm(formula = cbind(y, e - y) ~ x, family = binomial, data = base)
    ## 
    ## Deviance Residuals: 
    ##     Min       1Q   Median       3Q      Max  
    ## -2.5085  -0.8682  -0.0333   0.8632   2.6672  
    ## 
    ## Coefficients:
    ##             Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept) -2.06714    0.09321  -22.18   <2e-16 ***
    ## x            2.03665    0.08085   25.19   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## (Dispersion parameter for binomial family taken to be 1)
    ## 
    ##     Null deviance: 1924.3  on 999  degrees of freedom
    ## Residual deviance: 1093.7  on 998  degrees of freedom
    ## AIC: 1998.1
    ## 
    ## Number of Fisher Scoring iterations: 4

``` r
regqb = glm(cbind(y,e-y)~x,data=base, family=quasibinomial)
summary(regqb)
```

    ## 
    ## Call:
    ## glm(formula = cbind(y, e - y) ~ x, family = quasibinomial, data = base)
    ## 
    ## Deviance Residuals: 
    ##     Min       1Q   Median       3Q      Max  
    ## -2.5085  -0.8682  -0.0333   0.8632   2.6672  
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept) -2.06714    0.08913  -23.19   <2e-16 ***
    ## x            2.03665    0.07731   26.34   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## (Dispersion parameter for quasibinomial family taken to be 0.9142827)
    ## 
    ##     Null deviance: 1924.3  on 999  degrees of freedom
    ## Residual deviance: 1093.7  on 998  degrees of freedom
    ## AIC: NA
    ## 
    ## Number of Fisher Scoring iterations: 4

``` r
loc = 'http://freakonometrics.free.fr/baseaffairs.txt'
base = read.table(loc,header = TRUE)
regp = glm(Y ~ ., data=base, family = poisson)
summary(regp)
```

    ## 
    ## Call:
    ## glm(formula = Y ~ ., family = poisson, data = base)
    ## 
    ## Deviance Residuals: 
    ##     Min       1Q   Median       3Q      Max  
    ## -2.7377  -1.1197  -0.8582  -0.5802   5.6989  
    ## 
    ## Coefficients:
    ##               Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)  -0.092993   0.504006  -0.185  0.85361    
    ## SEX           0.033153   0.131322   0.252  0.80069    
    ## AGE          -0.040826   0.009919  -4.116 3.86e-05 ***
    ## YEARMARRIAGE  0.074275   0.017133   4.335 1.46e-05 ***
    ## CHILDREN      0.497587   0.171869   2.895  0.00379 ** 
    ## RELIGIOUS    -0.253704   0.048533  -5.228 1.72e-07 ***
    ## EDUCATION     0.118261   0.028875   4.096 4.21e-05 ***
    ## OCCUPATION    0.020923   0.038668   0.541  0.58845    
    ## SATISFACTION -0.362262   0.045908  -7.891 2.99e-15 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## (Dispersion parameter for poisson family taken to be 1)
    ## 
    ##     Null deviance: 1295.2  on 562  degrees of freedom
    ## Residual deviance: 1132.7  on 554  degrees of freedom
    ## AIC: 1468.8
    ## 
    ## Number of Fisher Scoring iterations: 6

``` r
sum(residuals(regp,"pearson")^2)/554
```

    ## [1] 3.555002

``` r
regp = glm(Y ~ ., data=base, family = poisson)
regqp = glm(Y ~ ., data=base, family = quasipoisson)
cbind(summary(regp)$coefficients[,1:2],
      summary(regqp)$coefficients[,1:2])
```

    ##                 Estimate  Std. Error    Estimate Std. Error
    ## (Intercept)  -0.09299339 0.504005993 -0.09299339 0.95030594
    ## SEX           0.03315320 0.131321870  0.03315320 0.24760807
    ## AGE          -0.04082560 0.009919453 -0.04082560 0.01870318
    ## YEARMARRIAGE  0.07427472 0.017133174  0.07427472 0.03230469
    ## CHILDREN      0.49758727 0.171869209  0.49758727 0.32406029
    ## RELIGIOUS    -0.25370444 0.048532523 -0.25370444 0.09150833
    ## EDUCATION     0.11826082 0.028874518  0.11826082 0.05444305
    ## OCCUPATION    0.02092272 0.038667709  0.02092272 0.07290817
    ## SATISFACTION -0.36226240 0.045907614 -0.36226240 0.08655905

``` r
summary(regqp)
```

    ## 
    ## Call:
    ## glm(formula = Y ~ ., family = quasipoisson, data = base)
    ## 
    ## Deviance Residuals: 
    ##     Min       1Q   Median       3Q      Max  
    ## -2.7377  -1.1197  -0.8582  -0.5802   5.6989  
    ## 
    ## Coefficients:
    ##              Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  -0.09299    0.95031  -0.098  0.92208    
    ## SEX           0.03315    0.24761   0.134  0.89354    
    ## AGE          -0.04083    0.01870  -2.183  0.02947 *  
    ## YEARMARRIAGE  0.07427    0.03230   2.299  0.02187 *  
    ## CHILDREN      0.49759    0.32406   1.535  0.12524    
    ## RELIGIOUS    -0.25370    0.09151  -2.772  0.00575 ** 
    ## EDUCATION     0.11826    0.05444   2.172  0.03026 *  
    ## OCCUPATION    0.02092    0.07291   0.287  0.77424    
    ## SATISFACTION -0.36226    0.08656  -4.185 3.31e-05 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## (Dispersion parameter for quasipoisson family taken to be 3.55513)
    ## 
    ##     Null deviance: 1295.2  on 562  degrees of freedom
    ## Residual deviance: 1132.7  on 554  degrees of freedom
    ## AIC: NA
    ## 
    ## Number of Fisher Scoring iterations: 6

``` r
library(AER)
```

    ## Loading required package: car

    ## Loading required package: carData

    ## Loading required package: lmtest

    ## Loading required package: zoo

    ## 
    ## Attaching package: 'zoo'

    ## The following objects are masked from 'package:base':
    ## 
    ##     as.Date, as.Date.numeric

    ## Loading required package: sandwich

    ## Loading required package: survival

``` r
dispersiontest(regp, alternative = "greater")
```

    ## 
    ##  Overdispersion test
    ## 
    ## data:  regp
    ## z = 5.6724, p-value = 7.038e-09
    ## alternative hypothesis: true dispersion is greater than 1
    ## sample estimates:
    ## dispersion 
    ##   3.522986

``` r
library(MASS)
regnb = glm.nb(Y ~ ., data=base)
cbind(summary(regnb)$coefficients[,1:2],
      summary(regqp)$coefficients[,1:2])
```

    ##                 Estimate Std. Error    Estimate Std. Error
    ## (Intercept)   0.29699202 1.14382602 -0.09299339 0.95030594
    ## SEX           0.07875705 0.29330626  0.03315320 0.24760807
    ## AGE          -0.04953617 0.02247169 -0.04082560 0.01870318
    ## YEARMARRIAGE  0.09532155 0.04041235  0.07427472 0.03230469
    ## CHILDREN      0.38239059 0.35319109  0.49758727 0.32406029
    ## RELIGIOUS    -0.28040136 0.10973467 -0.25370444 0.09150833
    ## EDUCATION     0.14220450 0.06419563  0.11826082 0.05444305
    ## OCCUPATION   -0.03903303 0.08593921  0.02092272 0.07290817
    ## SATISFACTION -0.43630393 0.11710277 -0.36226240 0.08655905

``` r
source ("http://freakonometrics.free.fr/bases.R" )
INCURRED = PAID
for(j in 2:6) INCURRED[,j] = PAID[,j] - PAID[,j-1]
Y = as.vector(INCURRED)
base = data.frame(Y=Y , L=rep(1:6,6) , C=rep(1:6,each=6))
reg = glm(Y ~ as.factor(L)+as.factor(C), data=base, family = poisson)
passe = which(!is.na(base$Y))
futur = which(is.na(base$Y))
E = residuals(reg, type="pearson")
M = predict(reg, type="response",newdata=base)
n=nrow(base)
B = matrix(NA,1000,length(coefficients(reg)))
P = rep(NA,1000)
for(s in 1:1000){
  bases = base
  bases$Y = M+sample(E,size=n,replace=TRUE)*sqrt(M)
  bases$Y[bases$Y<0] = 0
  regs = glm(Y ~ as.factor(L)+as.factor(C), data=bases, family = poisson, subset = passe)
  B[s,]=coefficients(regs)
  P[s] =sum(predict(reg, type="response",newdata=base[futur,]))
}
cbind(apply(B,2,sd),summary(reg)$coefficients[,2])

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 7.621006

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 8.941533

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 20.032734

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3098.166327

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3237.194149

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3919.180737

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4317.767256

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 5217.080367

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 5195.530858

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1206.626671

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1413.011093

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1642.832244

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1861.269883

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 51.596006

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 49.025642

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 55.399846

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 14.208326

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 24.447534

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 12.722876

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 8.600055

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 8.773595

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 24.633613

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3128.174951

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3373.162572

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3919.180737

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4296.239079

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4889.870306

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 5106.271022

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1185.121923

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1296.895019

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1471.824853

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1622.004329

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1912.751968

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 42.591790

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 50.017742

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 52.188904

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 68.244177

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 14.208326

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 20.417165

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 23.439044

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 6.821091

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 8.773595

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3139.001718

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3276.667836

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3919.180737

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4588.286877

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4919.862296

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1187.284640

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1282.930904

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1476.822766

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1579.739616

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1886.143822

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 48.330866

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 53.134604

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 59.350355

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 59.112643

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 19.713790

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 15.523864

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 25.443586

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 8.389022

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 11.415613

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 21.535438

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3128.174951

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3368.894043

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3845.261212

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4164.780538

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4919.862296

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 5195.530858

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1185.121923

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1310.461082

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1432.533531

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1600.358908

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1825.304544

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 42.591790

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 64.232633

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 49.787082

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 20.955376

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 16.017047

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 8.561528

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 7.507059

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 21.535438

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3128.174951

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3353.359571

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3850.617026

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4318.649136

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4889.870306

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 5226.409598

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1216.465312

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1286.734430

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1471.824853

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1658.634727

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1886.143822

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 50.645428

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 54.084223

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 64.232633

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 59.112643

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 19.249013

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 19.074085

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 12.722876

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 5.740002

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3155.699242

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3337.179866

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3837.158586

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4242.858840

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4948.903961

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 5281.425445

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1204.075621

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1266.759474

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1386.907265

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1879.777474

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 34.197348

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 61.441701

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 71.461230

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 17.272924

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 43.953911

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 8.295381

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 7.322295

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3162.262917

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3373.162572

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3880.975961

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4362.152628

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4921.549131

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 5201.754321

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1202.943663

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1274.512063

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1629.813748

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1874.137704

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 55.417438

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 44.912124

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 57.659322

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 74.586580

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 17.843267

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 15.523864

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 23.713537

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 9.021844

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 9.159473

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 16.037347

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3178.958339

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3845.261212

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4313.818656

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4928.057802

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 5195.530858

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1202.109851

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1282.930904

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1641.857784

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1829.800396

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 50.220901

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 53.134604

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 63.164908

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 68.244177

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 19.713790

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 27.757386

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 10.947794

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 8.941533

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 25.348057

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3155.699242

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3337.179866

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3867.261448

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4242.858840

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4764.607131

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 5246.905803

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1349.026434

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1202.815036

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1487.709337

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1641.857784

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1852.926317

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 50.740241

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 50.967933

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 43.711452

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 65.593886

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 20.955376

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 20.945120

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 27.277876

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 8.295381

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 8.148386

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3128.174951

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3300.164473

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3850.617026

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4318.649136

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4986.414441

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 5237.031443

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1349.026434

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1286.253456

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1471.824853

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1641.857784

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1886.143822

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 42.591790

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 51.596006

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 57.659322

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 68.244177

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 20.955376

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 20.525831

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 17.977895

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 8.561528

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 9.595063

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 25.348057

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3092.332425

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3368.894043

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4310.096418

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4921.549131

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 5226.409598

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1229.601522

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1266.759474

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1634.389761

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1673.986756

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1912.751968

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 48.330866

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 61.186713

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 70.333516

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 22.613100

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 39.563977

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 24.781722

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 8.600055

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 11.584036

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 10.856701

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3178.958339

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3420.649736

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3726.151493

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4236.040874

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4923.839126

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 5143.026019

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1187.284640

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1245.398668

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1472.747475

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1622.004329

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1875.178815

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 49.820712

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 55.156182

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 52.188904

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 59.597500

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 22.613100

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 15.523864

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 23.439044

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 5.288934

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 9.119684

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 13.974770

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3205.805827

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3306.189277

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3837.158586

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4313.818656

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4885.495044

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 5195.530858

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1202.109851

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1286.734430

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1642.832244

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1892.062153

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 34.197348

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 50.967933

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 58.677405

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 68.244177

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 19.249013

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 25.443586

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3.829410

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 8.941533

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 21.535438

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3171.278602

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3411.605123

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3863.737217

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4164.780538

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4928.057802

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 5218.737027

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1227.178104

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1482.464565

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1622.004329

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1807.770790

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 49.990459

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 53.134604

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 94.093681

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 68.045798

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 19.249013

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 19.074085

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 43.953911

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 8.226405

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 11.122243

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 19.637885

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3393.737378

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3353.359571

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3863.737217

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4337.278864

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4899.013511

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 5057.125205

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1235.006955

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1264.525987

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1506.044464

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1642.832244

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 2057.580005

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 79.729837

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 54.084223

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 52.540935

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 68.513491

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 19.655017

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 20.673353

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 28.032669

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 8.561528

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 11.415613

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 16.306701

``` r
bind(apply(B,2,sd),summary(reg)$coefficients[,2])
