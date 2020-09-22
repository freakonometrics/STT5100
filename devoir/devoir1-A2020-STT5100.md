STT5100 Devoir \#1 - Automne 2020
================

``` r
code_permanent = "ABCD12345678"
loc_fichier = paste("http://freakonometrics.free.fr/",code_permanent,"A2020Devoir1.RData",sep="")
download.file(loc_fichier, "base_devoir_1.RData")
load("base_devoir_1.RData")
dim(database)
```

    ## [1]  6 15

``` r
str(database)
```

    ## 'data.frame':    6 obs. of  15 variables:
    ##  $ PropertyCity            : Factor w/ 450 levels "","ALACHUA","ALLIGATOR POINT",..: 324 336 392 438 404 238
    ##  $ ConstructionType        : Factor w/ 7 levels "","FRAME","MASONRY",..: 3 3 3 3 3 3
    ##  $ YearBuilt               : int  1971 2007 1958 1956 1974 1974
    ##  $ YearofRoofVerified      : Factor w/ 3 levels "","False","True": 2 2 2 2 2 2
    ##  $ RoofMaterial            : Factor w/ 7 levels "","ASP/FGLASS SHINGLE",..: 1 1 2 1 1 1
    ##  $ AdjSquareFeet           : int  993 1283 938 1484 1805 2209
    ##  $ TypeOfResidence         : Factor w/ 16 levels "AGRICULTURE",..: 14 14 14 14 14 14
    ##  $ DistancetoFireDepartment: num  0.8 0.27 0.83 0.78 0.81 1.08
    ##  $ DistancetoCoast         : num  -99 -99 -99 -99 -99 -99
    ##  $ RoofShape               : Factor w/ 7 levels "","FLAT","GABLE",..: 1 1 4 1 1 1
    ##  $ Pool                    : Factor w/ 2 levels "No","Yes": 1 1 1 1 1 1
    ##  $ LocationWindSpeed       : int  140 140 123 140 140 140
    ##  $ CountyName              : Factor w/ 61 levels "ALACHUA","BAKER",..: 6 6 47 6 6 6
    ##  $ EffectiveYearBuilt      : int  1972 2008 1978 1957 1975 1979
    ##  $ ValueperSquareFeet      : num  166.3 77.1 94 120.7 123.2 ...

On a la valeur `ValueperSquareFeet` de maisons par pieds carrés, aux
États-Unis, et 14 variables explicatives. Le but est de construire un
modèle prédictif pour prévoir la valeur de la maison.

Une fois construit votre modèle final, par exemple

``` r
model = lm(ValueperSquareFeet~1, data=database)
```

il faudra prévoir la valeur (par pieds carrés) de 200 maisons, et
d’envoyer les données, avec un code de la forme (merci de
copier-coller ce code à la fin de votre fichier
Rmd)

``` r
loc_fichier = "http://freakonometrics.free.fr/DATATESTA2020Devoir1.RData"
download.file(loc_fichier, "base_test_devoir_1.RData")
load("base_test_devoir_1.RData")
valeur = predict(model, newdata = datatest)
btest = data.frame(indice = 1:nrow(datatest),x=valeur)
names(btest) = c("indice", code_permanent)
head(btest)
```

    ##   indice ABCD12345678
    ## 1      1     113.9465
    ## 2      2     113.9465
    ## 3      3     113.9465
    ## 4      4     113.9465
    ## 5      5     113.9465
    ## 6      6     113.9465

``` r
save(valeur, file = paste(code_permanent,"A2020-prix200.RData",sep=""))
```

Un fichier intitulé ABCD12345678A2020-prix200.RData sera créé, et je
vous demande de me l’envoyer avec les deux autres fichiers (`Rmd` et
`html`). 

<img src="https://github.com/freakonometrics/STT5100/blob/master/archives/A2018/obviously.png" alt="drawing" width="300" align=right/>

Le fichier html doit être lisible dans un navigateur internet (Firefox) et le code Rmd doit compiler sans erreur. Le préambule du fichier Rmd doit contenir comme auteur le code permanent.
