STT5100 (A2023) devoir 2
================

``` r
code_permanent = "ABCD12345678"
loc_fichier = paste("http://freakonometrics.free.fr/STT5100/A2023/Devoir2/STT5100A2023Devoir2",code_permanent,".RData",sep="")
download.file(loc_fichier, "base_devoir.RData")
load("base_devoir.RData")
dim(base_6_stt5100_a2023)
```

    ## [1]  6 30

La base contient les informations sur des personnes hospitalisées

- `y` : variable binaire indiquant la gravité de l'état de patient **variable à prédire**
- `age` :
- `death` :
- `sex` :
- `dead_in_hosp` :
- `days_before_discharge` :
- `days_follow_up` :
- `disease_group` :
- `disease_class` :
- `comorbidities` :
- `income` :  
- `coma_score` :
- `race` :
- `psych_score` :
- `day_admission` :
- `diabetes` :
- `dementia` :
- `arterial_blood_pressure` :
- `heart_rate` :
- `respiration_index` :  
- `temperature_celsius` :
- `var_medic_1` :
- `score_medic_2` :
- `score_medic_3` :
- `score_medic_3` :
- `var_medic_4` :
- `var_medic_5` :
- `var_medic_6` :
- `var_medic_7` :
- `var_medic_8` :
- `score_medic_9` :   

``` r
str(base_6_stt5100_a2023)
```

    ## 'data.frame':    6 obs. of  30 variables:
    ##  $ age                    : num  76.8 51.4 73.9 92.6 64.7 ...
    ##  $ death                  : int  0 1 1 1 0 1
    ##  $ sex                    : chr  "female" "male" "male" "female" ...
    ##  $ dead_in_hosp           : int  0 0 0 0 0 0
    ##  $ days_before_discharge  : int  5 17 9 16 4 5
    ##  $ days_follow_up         : int  808 183 93 54 789 70
    ##  $ disease_group          : chr  "ARF/MOSF w/Sepsis" "Lung Cancer" "CHF" "ARF/MOSF w/Sepsis" ...
    ##  $ disease_class          : chr  "ARF/MOSF" "Cancer" "COPD/CHF/Cirrhosis" "ARF/MOSF" ...
    ##  $ comorbidities          : int  1 4 6 1 2 1
    ##  $ income                 : chr  "" "$11-$25k" "under $11k" "$25-$50k" ...
    ##  $ coma_score             : int  0 0 0 44 0 0
    ##  $ score_medic_9          : num  10 13.7 7.5 18.3 7 ...
    ##  $ race                   : chr  "white" "white" "white" "white" ...
    ##  $ psych_score            : num  13.3 17.5 26.2 23.7 15.3 ...
    ##  $ var_medic_1            : int  30 13 45 33 5 23
    ##  $ score_medic_2          : num  0.894 0.729 0.741 0.512 0.839 ...
    ##  $ score_medic_3          : num  0.856 0.457 0.593 0.396 0.648 ...
    ##  $ day_admission          : int  1 1 1 1 1 1
    ##  $ diabetes               : int  0 0 0 0 1 0
    ##  $ dementia               : int  0 0 0 0 0 0
    ##  $ var_medic_4            : chr  "no" "metastatic" "no" "no" ...
    ##  $ var_medic_5            : chr  "no dnr" "no dnr" "dnr before sadm" "no dnr" ...
    ##  $ var_medic_6            : int  5 17 -1 16 4 5
    ##  $ arterial_blood_pressure: num  105 51 73 120 62 74
    ##  $ heart_rate             : num  80 60 65 115 65 88
    ##  $ respiration_index      : int  28 6 8 24 28 24
    ##  $ temperature_celsius    : num  36.3 35.2 38.6 36 36 ...
    ##  $ var_medic_7            : num  0.7 2.3 1.4 1.6 1.8 ...
    ##  $ var_medic_8            : int  142 141 143 141 132 142
    ##  $ y                      : Factor w/ 2 levels "0","1": 2 2 2 1 2 2

``` r
model1 = glm(y~1, data = base_6_stt5100_a2023, family="binomial")
model2 = glm(y~1+age , data = base_6_stt5100_a2023, family="binomial")
```

    ## Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred

``` r
loc_fichier = "http://freakonometrics.free.fr/STT5100/A2023/Devoir2/STT5100A2023Devoir2TEST.RData"
download.file(loc_fichier, "base_devoir_2_test.RData", mode= "wb")
load("base_devoir_2_test.RData")
dim(base_test_stt5100_a2023)
```

    ## [1] 1062   29

``` r
prevision = data.frame(yhat_1 = predict(model1, 
                                        newdata = base_test_stt5100_a2023,
                                        type="response"),
                       yhat_2 = predict(model2, 
                                        newdata = base_test_stt5100_a2023,
                                        type="response"))
names(prevision) = paste("Y_",code_permanent,"_",1:ncol(prevision),sep="")
tail(prevision)
```

    ##      Y_ABCD12345678_1 Y_ABCD12345678_2
    ## 1057        0.8333333        1.0000000
    ## 1058        0.8333333        1.0000000
    ## 1059        0.8333333        0.8531455
    ## 1060        0.8333333        1.0000000
    ## 1061        0.8333333        1.0000000
    ## 1062        0.8333333        1.0000000

``` r
nom_fichier = paste("STT5100A2023Devoir2Prevision_",code_permanent,"_test.RData",sep="")
save("prevision", file = nom_fichier)
```

``` r
rm(list = "prevision")
load(nom_fichier)
str(prevision)
```

    ## 'data.frame':    1062 obs. of  2 variables:
    ##  $ Y_ABCD12345678_1: num  0.833 0.833 0.833 0.833 0.833 ...
    ##  $ Y_ABCD12345678_2: num  0.999996 0.000389 0.981104 1 1 ...
