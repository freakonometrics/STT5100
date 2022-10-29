STT5100 (A2022) devoir 1
================

``` r
code_permanent = "ABCD12345678"
loc_fichier = paste("http://freakonometrics.free.fr/STT5100/",code_permanent,"-A2021D1.RData",sep="")
download.file(loc_fichier, "base_devoir_1.RData")
load("base_devoir_1.RData")
dim(basedevoir)
```

    ## [1]  6 14

La base contient des informations par quartier, dans une grande ville
américaine, avec 14 variables, parmi les suivantes

-   `DistanceAutoroutes` = distance à la plus proche autoroute
-   `DistanceEmployeur` = distance moyenne aux principaux employeurs de
    la ville
-   `Ecoles` = classement des écoles (variable catégorielle - 5
    catégories)
-   `Historique` = ancienneté des maisons dans le quartier (variable
    catégorielle)
-   `Industries` = quantité d’industries dans le quartier (variable
    catégorielle)
-   `NiveauPolution` = indice indiquant la pollution moyenne dans le
    quartier
-   `NombreChambres` = nombre moyen de chambre par maison dans le
    quartier
-   `Polution` = classe de polution (variable catégorielle)
-   `ProportionAvant1940` = proportion de logements dans le quartier
    contruits avant 1940
-   `ProportionEspaceIndustrie` = proportion de la superficie du
    quartier réservé à des industries
-   `ProportionGrandsTerrain` = proportions de logements occupant un
    grand terrain
-   `ProportionNoirs` = proportions de personnes se déclarant *noires*
    de peau dans les formulaires du recensement
-   `ProportionPauvres` = proportions de personnes classées comme
    *pauvres* dans le quartier
-   `RatioProfEleve` = ratio du nombre d’élèves par professeur
-   `TauxCrime` = taux de crime par habitants, dans le quartier
-   `ValeurMaison` = valeur moyenne des maisons dans le quartier
    **variable a expliquer**

``` r
str(basedevoir)
```

    ## 'data.frame':    6 obs. of  14 variables:
    ##  $ DistanceAutoroutes       : num  24 24 24 5 24 24
    ##  $ DistanceEmployeur        : num  1.45 2 1.95 1.46 2.05 ...
    ##  $ Ecoles                   : Factor w/ 5 levels "P","Q","R","S",..: 4 4 4 1 4 4
    ##  $ NiveauPolution           : num  0.597 0.584 0.614 0.871 0.584 0.671
    ##  $ NombreChambres           : num  5.62 5.84 5.65 4.93 6.35 ...
    ##  $ Polution                 : Factor w/ 5 levels "K","L","M","N",..: 4 4 4 5 4 5
    ##  $ ProportionAvant1940      : num  97.9 59.7 87.6 95.7 86.1 96.2
    ##  $ ProportionEspaceIndustrie: num  18.1 18.1 18.1 19.6 18.1 ...
    ##  $ ProportionGrandsTerrain  : num  0 0 0 0 0 0
    ##  $ ProportionNoirs          : num  314.6 24.6 291.6 391.7 83.5 ...
    ##  $ ProportionPauvres        : num  26.4 15.7 14.1 29.5 17.6 ...
    ##  $ RatioProfEleve           : num  20.2 20.2 20.2 14.7 20.2 20.2
    ##  $ TauxCrime                : num  7.4 12.25 12.05 2.37 8.49 ...
    ##  $ ValeurMaison             : num  17.2 10.2 20.8 14.6 14.5 13.1

``` diff
- (12 septembre 2022) la base est en ligne
```

Le but du devoir est de mettre en oeuvre, sur des vraies données, les
techniques exposées en cours.

*   Date limite pour envoyer le devoir **14 novembre** a **midi**,
*   Chaque etudiant(e) doit déposer sur l’espace dédié, sur Moodle,
    trois fichiers : `devoir1-ABCD12345678.hmtl`, sortie d’un fichier
    `devoir1-ABCD12345678.Rmd`, et `prevision-devoir1-ABCD12345678.RData` (il faudra envoyer les deux fichiers), où
    `ABCD12345678` doit être remplacé par le code permanent de
    l’étudiant(e). Le fichier `devoir1-ABCD12345678.hmtl` doit etre
    lisible et le fichier `devoir1-ABCD12345678.Rmd` doit compiler sans
    erreur. Le troisième fichier, `prevision-devoir1-ABCD12345678.RData`
    sera détaillé plus bas,
*   Dans le preambule du markdown, `author:` doit mentionner le code
    permanent,
*  Le fichier doit contenir quatre parties

1.  Une partie exploratoire qui presente rapidement les variables qui
    pourraient etre intéressantes pour prédire ensuite la valeur des
    maisons (pour rappel, `ValeurMaison` est la variable d’interet)
2.  Une partie presentant la construction du modele : il s’agira de
    partir au choix (i) d’un modele simple, et de montrer comment
    l’ameliorer, (ii) d’un modele complexe, et de montrer comment le
    simplifier
3.  Une partie qui presente la forme du modele, en donnant (i) le R2
    ajuste (ii) l’indice d’Akaike AIC et (iii) l’indice BIC (iv) la
    liste des variables explicatives retenues,
4.  Une prévision sur la base de test donnée ci-dessous,

``` r
loc_fichier = "http://freakonometrics.free.fr/STT5100/TestA2021D1.RData"
download.file(loc_fichier, "base_test_devoir_1.RData")
load("base_test_devoir_1.RData")
```

Plus précisément, une fois construit les deux modèles,

``` r
model_1 = lm(ValeurMaison ~ 1, data = basedevoir)
idx = which((basedevoir$ValeurMaison > min(basedevoir$ValeurMaison )) & (basedevoir$ValeurMaison < max(basedevoir$ValeurMaison )))
sous_basedevoir = basedevoir[idx,]
model_2 = lm(ValeurMaison ~ 1, data = sous_basedevoir)
```

On va construire une base avec les prix prédits sur les données de cette
nouvelle base

``` r
prix_1 = predict(model_1, newdata = basetest)
prix_2 = predict(model_2, newdata = basetest)
base_prediction = data.frame(indice = as.numeric(rownames(basetest)),
                             model_1 = prix_1,
                             model_2 = prix_2)
apply(base_prediction,2,mean)[2:3]
```

    ##  model_1  model_2 
    ## 15.06667 14.85000

Cette base doit contenir 100 observations !

``` r
dim(base_prediction)
```

    ## [1] 100   3

On va alors l’exporter

``` r
names(base_prediction) = c("indice",paste("model_",1:2,"_",code_permanent,sep=""))
save(base_prediction, file = paste("prevision-devoir1-",code_permanent,".RData",sep=""))
```

Vérifions que le fichier a bien été créé

``` r
rm(list = "base_prediction")
load( paste("prevision-devoir1-",code_permanent,".RData",sep=""))
str(base_prediction)
```

    ## 'data.frame':	100 obs. of  3 variables:
    ##  $ indice              : num  701 702 703 704 705 706 707 708 709 710 ...
    ##  $ model_1_ABCD12345678: num  15.1 15.1 15.1 15.1 15.1 ...
    ##  $ model_2_ABCD12345678: num  14.8 14.8 14.8 14.8 14.8 ...

* tout test utilisé qui n'a pas été présenté dans le cadre du cours devra être expliqué, motivé, et pointer vers une référence (la commande pour insérer un lien est, e.g. `[Anderson Darling](https://en.wikipedia.org/wiki/Anderson%E2%80%93Darling_test)`). Dans le cas contraire, des points seront enlevés.
* les seuls packages autorises (sauf autorisation explicite) sont `MASS`, `lmtest`, `nortest`, `car`, `splines`, `AER`, `splines`, `Hmisc`, `np` les packages graphiques `ggplot2` (et éventuellement de couleurs, ou de mise en forme `knitr`, `stargazer`, `DT`, `papeR`, `formattable` etc), de manipulation de données `dplyr`, ainsi que les fonctions de base de `stats`. L'utilisation de tout autre package devra être demandée au préalable. Sinon, des points seront enlevés.
* la forme du document et sa lisibilité interviendront dans la notation. Afficher des tableaux de plusieurs centaines de lignes, par exemple, est à proscrire.
* les rapports sont individuels ! s'il est autorisé de discuter avec d'autres élèves du groupe (en respectant le protocol sanitaire en vigueur), chacun doit rendre son propre rapport. Dans le cas où deux fichiers identiques seraient envoyés par deux élèves différents, les deux élèves seront sanctionnés.

<img src="https://github.com/freakonometrics/STT5100/blob/master/archives/A2018/obviously.png" alt="drawing" width="300" align=right/>

* le fichier html doit être lisible dans un navigateur internet (Firefox) et le code Rmd doit compiler sans erreur. Le préambule du fichier Rmd doit contenir comme auteur le code permanent. Tout fichier qui ne compile pas et/ou qui n'est pas lisible donnera lieu à une forte pénalisation.

Au niveau pratique, pour avoir accès à _vos_ données, vous devez remplacer `"ABCD12345678"` ci-dessus par votre **vrai** code permanent (avec les lettres en majuscules).
