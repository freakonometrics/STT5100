STT5100 Devoir \#1 - Automne 2020
================


**Récupérer les données**

Il convient de remplacer le code permanent par *votre* propre code permanent pour avoir votre base,

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
États-Unis, et 14 variables explicatives. 

**Instructions**

Le but de ce premier projet est de construire un
modèle prédictif pour prévoir la valeur de la maison, par pieds carrés.

Il convidendra d'adopter le plan suivant :

**1.Présentation des données**

Dans une première partie, il faudra un peu de statistique descriptives, montrant quelles variables sont *a priori* corrélées avec la variable d'intérêt. Des graphiques sont attendus dans cette partie.

**2.Un premier modèle**

En utilisant les techniques du cours, **et uniquement les techniques du cours**, il faudra expliquer comment vous avez contruit un premier modèle qui vous semble valide.

**3.Le modèle final**

Dans un second temps, vous essayerez d'améliorer ce premier modèle, peut-être en tenant compte de non-linéarités potentielles, ou en regroupant des modalités de variables qualitatives. Il s'agira d'avoir aussi une discussion sur d'éventuelles valeurs aberrantes, ou levier, ainsi que la validation des hypothèses usuelles.

**4.Indicateurs**

Dans une section spécifique, il faudra indiquer
* le R2 ajusté du modèle retenu
* le AIC du modèle retenu
* le BIC du modèle retenu

**5.Prévision**

Une fois construit votre modèle final, par exemple

``` r
model = lm(ValueperSquareFeet~1, data=database)
```

Il faudra prévoir la valeur (par pieds carrés) de 200 maisons, et
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

**Envoi des résultats**

Un fichier intitulé `ABCD12345678A2020-prix200.RData` sera créé lors de la compilation, et je
vous demande de me le déposer sur Moodle avec les deux autres fichiers (`ABCD12345678A2020-devoir1.Rmd` et `ABCD12345678A2020-devoir1.html`). 

**Précisions complémentaires**

* dans le préambule de fichier `ABCD12345678A2020-devoir1.Rmd`, l'auteur doit contenir le **code permanent**, `author: "ABCD12345678: John Doe"`
* les techniques de validation croisée, ou la constitution de bases d’apprentissage et de test (*hold-out*) ne sont pas au programme et ne devront pas etre utilisées pour ce devoir
* tout test utilisé qui n'a pas été présenté dans le cadre du cours devra être expliqué, motivé, et pointer vers une référence (la commande pour insérer un lien est, e.g. `<https://en.wikipedia.org/wiki/Anderson%E2%80%93Darling_test>`)
* les seuls packages autorises (sauf autorisation explicite) sont `MASS`, `lmtest`, `nortest`, `car`, `splines`, `AER`, `splines`, `Hmisc`, `np` les packages graphiques `ggplot2` (et éventuellement de couleurs, ou de mise en forme `knitr`, `stargazer`, `DT`, `papeR`, `formattable` etc), de manipulation de données `dplyr`, ainsi que les fonctions de base de `stats`. L'utilisation de tout autre package devra être demandée au préalable.
* la forme du document et sa lisibilité interviendront dans la notation. Afficher des tableaux de plusieurs centaines de lignes, par exemple, est à proscrire.
* les rapports sont individuels ! s'il est autorisé de discuter avec d'autres élèves du groupe (en respectant le protocol sanitaire en vigueur), chacun doit rendre son propre rapport.

<img src="https://github.com/freakonometrics/STT5100/blob/master/archives/A2018/obviously.png" alt="drawing" width="300" align=right/>

Le fichier html doit être lisible dans un navigateur internet (Firefox) et le code Rmd doit compiler sans erreur. Le préambule du fichier Rmd doit contenir comme auteur le code permanent. Tout fichier qui ne compile pas et/ou qui n'est pas lisible donnera lieu à une forte pénalisation.
