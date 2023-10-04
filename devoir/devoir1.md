STT5100 (A2023) devoir 1
================

``` r
code_permanent = "ABCD12345678"
loc_fichier = paste("http://freakonometrics.free.fr/STT5100/A2023/Devoir1/STT5100A2023Devoir1",code_permanent,".RData",sep="")
download.file(loc_fichier, "base_devoir.RData")
load("base_devoir.RData")
dim(base_6_stt5100_a2023)
```

    ## [1]  6 13

La base contient les informations pour des locations de vélos (type bixi)

- `y` : nombre de vélo loués pendant l'heure **variable à prédire**
- `heure` : heure de la journée (numérique, entre 0 et 23)
- `temperature` : température (numérique, en degré Celsius)
- `humidite` : taux d'humidité (numérique, de 0 à 100)
- `vent` : vitesse du vent (numérique, en m/s)
- `visibilite` : visibilité (unité inconnue)
- `luminosite` : indice de luminosité (unité inconnue, 0 correspond à la nuit)
- `pluie` : pluviométrie (en mm) pendant l'heure
- `neige` : quantité de neige tombée pendant l'heure (en cm)
- `saison` : saison de l'année (`Winter`, `Spring`, `Summer`, `Autumn`)
- `holiday` : jour férié (ou pas, en chaîne de caractères)
- `mois` : mois de l'année (`Jan`, `Feb`, ..., `Dec`)
- `jour` : jour de la semaine (`Mon`,`Tue`, ..., `Sun`)

``` r
str(base_6_stt5100_a2023)
```

    ## 'data.frame':    6 obs. of  13 variables:
    ##  $ y          : num  226 95 849 473 1342 ...
    ##  $ heure      : num  2 3 17 16 9 12
    ##  $ temperature: num  5.5 4.7 10.4 8.2 20.5 10.4
    ##  $ humidite   : num  56 44 37 64 73 44
    ##  $ vent       : num  1.2 3.8 1 1 1.6 1.7
    ##  $ visibilite : num  1067 2000 2000 281 364 ...
    ##  $ luminosite : num  0 0 0.67 0.32 1.23 2.93
    ##  $ pluie      : num  0 0 0 0 0 0
    ##  $ neige      : num  0 0 0 0 0 0
    ##  $ saison     : Factor w/ 4 levels "Spring","Summer",..: 1 1 1 4 2 1
    ##  $ holiday    : chr  "No Holiday" "No Holiday" "No Holiday" "No Holiday" ...
    ##  $ mois       : Factor w/ 12 levels "Jan","Feb","Mar",..: 3 3 3 12 6 4
    ##  $ jour       : Factor w/ 7 levels "Mon","Tue","Wed",..: 7 2 3 6 4 1

``` diff
- (22 septembre 2023) la base est en ligne
```

Le but du devoir est de mettre en oeuvre, sur des vraies données, les
techniques exposées en cours.

*   Date limite pour envoyer le devoir **8 novembre 2023** a **midi**,
*   Chaque etudiant(e) doit déposer sur l’espace dédié, sur [Moodle](https://ena01.uqam.ca/mod/assign/view.php),
    trois fichiers : `STT5100A2023Devoir1ABCD12345678.hmtl`, sortie d’un fichier
    `STT5100A2023Devoir1ABCD12345678.Rmd`, et `STT5100A2023Devoir1ABCD12345678.RData` (il faudra envoyer les deux fichiers), où
    `ABCD12345678` doit être remplacé par le code permanent de
    l’étudiant(e). Le fichier `STT5100A2023Devoir1ABCD12345678.hmtl` doit etre
    lisible et le fichier `STT5100A2023Devoir1ABCD12345678.Rmd` doit compiler sans
    erreur. Le troisième fichier, `STT5100A2023Devoir1Prevision_ABCD12345678_test.RData`
    sera détaillé plus bas,
*   Dans le preambule du markdown, `author:` doit mentionner le code
    permanent,
*  Le fichier doit contenir quatre parties

1.  Une partie exploratoire qui presente rapidement les variables qui
    pourraient etre intéressantes pour prédire ensuite la note finale de l'étudiant (pour rappel, `final` est la variable d’interet)
2.  Une partie presentant la construction d'un modele "simple", par exemple 
    partir au choix (i) d’un modele simple, et de montrer comment
    l’ameliorer, (ii) d’un modele complexe, et de montrer comment le
    simplifier
3.  Une partie proposant une amélioration du modèle, par exemple en transformant une variable explicative
4.  Une partie qui presente les deux modeles, en donnant (i) le R2
    ajuste (ii) l’indice d’Akaike AIC et (iii) l’indice BIC (iv) la
    liste des variables explicatives retenues,
4.  Une prévision **des deux modèles** sur la base de test donnée ci-dessous,

``` r
loc_fichier = "http://freakonometrics.free.fr/STT5100/A2023/Devoir1/STT5100A2023Devoir1TEST.RData"
download.file(loc_fichier, "base_devoir_1_test.RData", mode= "wb")
load("base_devoir_1_test.RData")
dim(base_test_stt5100_a2023)
```

    ## [1] 346  12

Plus précisément, une fois construit les deux modèles (je fais ici deux modèles simplistes pour illustrer),

``` r
model1 = lm(y~1, data = base_6_stt5100_a2023)
model2 = lm(y~1+temperature , data = base_6_stt5100_a2023)
```

on va construire une base avec les nombres de vélos empruntés prédits sur les données de cette
nouvelle base

``` r
prevision = data.frame(yhat_1 = predict(model1, newdata = base_test_stt5100_a2023),
                       yhat_2 = predict(model2, newdata = base_test_stt5100_a2023))
names(prevision) = paste("Y_",code_permanent,"_",1:ncol(prevision),sep="")
tail(prevision)
```

    ##     Y_ABCD12345678_1 Y_ABCD12345678_2
    ## 341         630.6667         378.7508
    ## 342         630.6667        1417.4192
    ## 343         630.6667        -241.3497
    ## 344         630.6667         153.9644
    ## 345         630.6667        2122.7836
    ## 346         630.6667        1866.9921

Cette base doit contenir 346 observations ! (ce qu'on vérifie rapidement ici)

``` r
dim(prevision)
```

    ## [1] 346   3

On va alors l’exporter

``` r
nom_fichier = paste("STT5100A2023Devoir1Prevision_",code_permanent,"_test.RData",sep="")
save("prevision", file = nom_fichier)
```

Vérifions que le fichier a bien été créé

``` r
rm(list = "prevision")
nom_fichier = paste("STT5100A2023Devoir1Prevision_",code_permanent,"_test.RData",sep="")
load(nom_fichier)
str(prevision)
```

    ## 'data.frame':    346 obs. of  2 variables:
    ##  $ Y_ABCD12345678_1: num  631 631 631 631 631 ...
    ##  $ Y_ABCD12345678_2: num  1277.9 797.3 665.5 45.4 1456.2 ...


* tout test utilisé qui n'a pas été présenté dans le cadre du cours devra être expliqué, motivé, et pointer vers une référence (la commande pour insérer un lien est, e.g. `[Anderson Darling](https://en.wikipedia.org/wiki/Anderson%E2%80%93Darling_test)`). Dans le cas contraire, des points seront enlevés.
* les seuls packages autorises (sauf autorisation explicite) sont `MASS`, `lmtest`, `nortest`, `car`, `splines`, `AER`, `splines`, `Hmisc`, `np` les packages graphiques `ggplot2` (et éventuellement de couleurs, ou de mise en forme `knitr`, `stargazer`, `DT`, `papeR`, `formattable` etc), de manipulation de données `dplyr`, ainsi que les fonctions de base de `stats`. L'utilisation de tout autre package devra être demandée au préalable. Sinon, des points seront enlevés.
* la forme du document et sa lisibilité interviendront dans la notation. Afficher des tableaux de plusieurs centaines de lignes, par exemple, est à proscrire.
* les rapports sont individuels ! s'il est autorisé de discuter avec d'autres élèves du groupe (en respectant le protocol sanitaire en vigueur), chacun doit rendre son propre rapport. Dans le cas où deux fichiers identiques seraient envoyés par deux élèves différents, les deux élèves seront sanctionnés.

<img src="https://github.com/freakonometrics/STT5100/blob/master/archives/A2018/obviously.png" alt="drawing" width="300" align=right/>

* le fichier html doit être lisible dans un navigateur internet (Firefox) et le code Rmd doit compiler sans erreur. Le préambule du fichier Rmd doit contenir comme auteur le code permanent. Tout fichier qui ne compile pas et/ou qui n'est pas lisible donnera lieu à une forte pénalisation.

Au niveau pratique, pour avoir accès à _vos_ données, vous devez remplacer `"ABCD12345678"` ci-dessus par votre **vrai** code permanent (avec les lettres en majuscules).
