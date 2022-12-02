STT5100 - Devoir 2 - Automne 2022
================
Arthur Charpentier

``` r
n = 100
x = runif(n)*2
e = rpois(n,lambda=5)+1
lambda = e * exp(1+2*x)
y = rpois(n,lambda)
base = data.frame(y=y, x=x, e=e)
reg = glm(y~x+offset(log(e)),data=base,family=poisson)
summary(reg)
```

    ## 
    ## Call:
    ## glm(formula = y ~ x + offset(log(e)), family = poisson, data = base)
    ## 
    ## Deviance Residuals: 
    ##      Min        1Q    Median        3Q       Max  
    ## -2.68934  -0.80207  -0.04638   0.57080   2.91441  
    ## 
    ## Coefficients:
    ##             Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)  1.01372    0.02647   38.29   <2e-16 ***
    ## x            1.99276    0.01670  119.31   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## (Dispersion parameter for poisson family taken to be 1)
    ## 
    ##     Null deviance: 19612.83  on 99  degrees of freedom
    ## Residual deviance:   108.95  on 98  degrees of freedom
    ## AIC: 777.45
    ## 
    ## Number of Fisher Scoring iterations: 4

``` r
reg1 = glm(y/e~x,data=base,family=poisson,weights = e)
```

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 23.153846

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 63.714286

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 2.714286

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 29.600000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3.714286

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 15.333333

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4.142857

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 11.800000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 71.375000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 7.166667

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 13.200000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 11.400000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 144.777778

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4.142857

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 5.800000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 44.750000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 34.400000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 107.500000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 27.666667

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 65.600000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 32.833333

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 107.400000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 28.375000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 26.750000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 29.600000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 47.666667

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 13.833333

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 103.333333

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 18.857143

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 91.500000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 60.400000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 6.333333

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 81.333333

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 7.375000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 1.333333

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 76.800000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 3.800000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 128.666667

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 44.750000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4.600000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 9.250000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 40.500000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 89.666667

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 84.800000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 87.333333

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 29.333333

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 35.428571

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 68.500000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 66.222222

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 7.777778

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 22.300000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 48.400000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 12.250000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 9.750000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 5.571429

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 10.500000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 53.857143

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 2.800000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 16.333333

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 138.500000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 20.625000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 32.250000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 2.500000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 81.333333

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 59.400000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 99.125000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 70.166667

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 11.285714

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 67.166667

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 53.750000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 137.666667

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 135.666667

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 25.571429

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 18.700000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 8.222222

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 4.142857

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 19.400000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 14.750000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 10.125000

    ## Warning in dpois(y, mu, log = TRUE): non-integer x = 135.250000

``` r
summary(reg1)
```

    ## 
    ## Call:
    ## glm(formula = y/e ~ x, family = poisson, data = base, weights = e)
    ## 
    ## Deviance Residuals: 
    ##      Min        1Q    Median        3Q       Max  
    ## -2.68934  -0.80207  -0.04638   0.57080   2.91441  
    ## 
    ## Coefficients:
    ##             Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)  1.01372    0.02647   38.29   <2e-16 ***
    ## x            1.99276    0.01670  119.31   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## (Dispersion parameter for poisson family taken to be 1)
    ## 
    ##     Null deviance: 19612.83  on 99  degrees of freedom
    ## Residual deviance:   108.95  on 98  degrees of freedom
    ## AIC: Inf
    ## 
    ## Number of Fisher Scoring iterations: 4

``` r
loc = 'http://freakonometrics.free.fr/baseaffairs.txt'
base = read.table(loc,header = TRUE)
reg = glm(Y ~ ., data=base, family = poisson)

summary(reg)
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
library(car)
```

    ## Loading required package: carData

``` r
Anova(reg,type=3,test.statistic="Wald")
```

    ## Analysis of Deviance Table (Type III tests)
    ## 
    ## Response: Y
    ##              Df   Chisq Pr(>Chisq)    
    ## (Intercept)   1  0.0340    0.85361    
    ## SEX           1  0.0637    0.80069    
    ## AGE           1 16.9391  3.860e-05 ***
    ## YEARMARRIAGE  1 18.7934  1.457e-05 ***
    ## CHILDREN      1  8.3819    0.00379 ** 
    ## RELIGIOUS     1 27.3269  1.718e-07 ***
    ## EDUCATION     1 16.7746  4.209e-05 ***
    ## OCCUPATION    1  0.2928    0.58845    
    ## SATISFACTION  1 62.2697  2.995e-15 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
Anova(reg,type=3,test.statistic="LR")
```

    ## Analysis of Deviance Table (Type III tests)
    ## 
    ## Response: Y
    ##              LR Chisq Df Pr(>Chisq)    
    ## SEX             0.064  1   0.800586    
    ## AGE            18.454  1  1.741e-05 ***
    ## YEARMARRIAGE   19.104  1  1.238e-05 ***
    ## CHILDREN        8.747  1   0.003102 ** 
    ## RELIGIOUS      27.464  1  1.601e-07 ***
    ## EDUCATION      17.468  1  2.922e-05 ***
    ## OCCUPATION      0.294  1   0.587986    
    ## SATISFACTION   58.087  1  2.508e-14 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
