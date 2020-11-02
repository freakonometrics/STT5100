STT5100 Devoir \#1 - Automne 2020
================


**Récupérer les données**

Il convient de remplacer le code permanent par *votre* propre code permanent pour avoir votre base,

``` r
code_permanent = "ABCD12345678"
loc_fichier = paste("http://freakonometrics.free.fr/",code_permanent,"A2020Devoir2.RData",sep="")
download.file(loc_fichier, "base_devoir_1.RData")
load("base_devoir_1.RData")
dim(database)
```

    ## [1]  6 17

``` r
str(database)
```

    ## 'data.frame': 6 obs. of  17 variables:
    ## $ PolNum    : int  200284572 200255943 200281328 200265182 200129146 200250676
    ## $ CalYear   : int  2010 2010 2010 2010 2009 2010
    ## $ Gender    : Factor w/ 2 levels "Female","Male": 2 1 2 2 1 2
    ## $ Type      : Factor w/ 6 levels "A","B","C","D",..: 2 3 1 4 5 2
    ## $ Category  : Factor w/ 3 levels "Large","Medium",..: 3 3 2 3 2 2
    ## $ Occupation: Factor w/ 5 levels "Employed","Housewife",..: 1 5 1 3 1 1
    ## $ Age       : int  47 24 20 47 40 18
    ## $ Group1    : int  14 13 3 11 11 20
    ## $ Bonus     : int  -30 0 10 -40 40 0
    ## $ Poldur    : int  3 0 1 1 11 11
    ## $ Value     : int  22505 26575 8310 29335 19475 5280
    ## $ Adind     : int  0 0 0 1 1 0
    ## $ SubGroup2 : Factor w/ 471 levels "L1","L10","L100",..: 432 350 319 52 280 373
    ## $ Group2    : Factor w/ 10 levels "L","M","N","O",..: 9 7 6 1 6 7
    ## $ Density   : num  23 285.6 125.9 53.4 169.5 ...
    ## $ Exppdays  : int  148 365 365 365 365 365
    ## $ y         : int  0 0 0 0 0 0

On a l'indicatrice `y` associée à la survenance, ou pas, d'un accident d'automobile, et 16 variables explicatives. 

**Instructions**

Le but de ce premier projet est de construire un
modèle prédictif pour quantifier la probailité d'avoir, ou pas, un accident dans l'année

Il convidendra d'adopter le plan suivant :

**1.Présentation des données**

Dans une première partie, il faudra un peu de statistique descriptives, montrant quelles variables sont *a priori* corrélées avec la variable d'intérêt. Des graphiques sont attendus dans cette partie. Dans cette partie, vous avez le droit de transformer vos variables et de supprimer certains individus, si vous l'expliquez.

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
* les techniques de validation croisée, ou la constitution de bases d’apprentissage et de test (*hold-out*) ne sont pas au programme et ne devront pas etre utilisées pour ce devoir.
* tout test utilisé qui n'a pas été présenté dans le cadre du cours devra être expliqué, motivé, et pointer vers une référence (la commande pour insérer un lien est, e.g. `<https://en.wikipedia.org/wiki/Anderson%E2%80%93Darling_test>`). Dans le cas contraitre, des points seront enlevés.
* les seuls packages autorises (sauf autorisation explicite) sont `MASS`, `lmtest`, `nortest`, `car`, `splines`, `AER`, `splines`, `Hmisc`, `np` les packages graphiques `ggplot2` (et éventuellement de couleurs, ou de mise en forme `knitr`, `stargazer`, `DT`, `papeR`, `formattable` etc), de manipulation de données `dplyr`, ainsi que les fonctions de base de `stats`. L'utilisation de tout autre package devra être demandée au préalable. Sinon, des points seront enlevés.
* la forme du document et sa lisibilité interviendront dans la notation. Afficher des tableaux de plusieurs centaines de lignes, par exemple, est à proscrire.
* les rapports sont individuels ! s'il est autorisé de discuter avec d'autres élèves du groupe (en respectant le protocol sanitaire en vigueur), chacun doit rendre son propre rapport. Dans le cas où deux fichiers identiques seraient envoyés par deux élèves différents, les deux élèves seront sanctionnés.

<img src="https://github.com/freakonometrics/STT5100/blob/master/archives/A2018/obviously.png" alt="drawing" width="300" align=right/>

Le fichier html doit être lisible dans un navigateur internet (Firefox) et le code Rmd doit compiler sans erreur. Le préambule du fichier Rmd doit contenir comme auteur le code permanent. Tout fichier qui ne compile pas et/ou qui n'est pas lisible donnera lieu à une forte pénalisation.
