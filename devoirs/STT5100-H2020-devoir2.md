STT5100 Devoir \#1 - Hiver 2020
================
Arthur Charpentier

``` r
code_permanent = "ABCD12345678"
loc_fichier = paste("http://freakonometrics.free.fr/",code_permanent,"H2020D1.RData",sep="")
download.file(loc_fichier, "base_devoir_1.RData")
load("base_devoir_1.RData")
dim(database)
```

    ## [1]  6 32

``` r
str(database)
```

    ## 'data.frame':    6 obs. of  32 variables:
    ##  $ avgAnnCount           : num  583 86 1931 493 18 ...
    ##  $ avgDeathsPerYear      : int  206 36 677 182 6 11
    ##  $ TARGET_deathRate      : num  173 166 173 173 199 ...
    ##  $ incidenceRate         : num  491 423 526 477 574 ...
    ##  $ medIncome             : int  51138 52260 61510 39548 36903 36708
    ##  $ popEst2015            : int  125175 16829 300813 75713 1830 5533
    ##  $ povertyPercent        : num  14.3 11.7 10 17.5 18 25.7
    ##  $ studyPerCap           : num  192 0 366 674 0 ...
    ##  $ binnedInc             : Factor w/ 10 levels "(34218.1, 37413.8]",..: 7 7 9 2 1 1
    ##  $ MedianAge             : num  34.7 41.4 41.8 44.3 49.6 35
    ##  $ MedianAgeMale         : num  33.2 40.5 40 42.6 52.3 35.4
    ##  $ MedianAgeFemale       : num  36.2 42.1 43.2 45.8 44.2 34
    ##  $ Geography             : Factor w/ 3047 levels "Abbeville County, South Carolina",..: 233 1491 2022 2042 1809 3043
    ##  $ AvgHouseholdSize      : num  2.57 2.51 2.56 2.43 2.47 2.81
    ##  $ PercentMarried        : num  49 57.4 51.4 53.8 55.1 37.8
    ##  $ PctNoHS18_24          : num  18.7 21 9.3 15.8 34.9 26.6
    ##  $ PctHS18_24            : num  33.2 33.3 28.7 35.5 40.6 53.8
    ##  $ PctBachDeg18_24       : num  6.9 2.8 9.1 5.6 2.8 0
    ##  $ PctHS25_Over          : num  29.4 41.5 35.3 31.8 39.7 40.1
    ##  $ PctBachDeg25_Over     : num  16.1 12.2 17.2 13.7 18.8 7.4
    ##  $ PctEmployed16_Over    : num  59.3 66.2 59.2 47 55.8 49.2
    ##  $ PctUnemployed16_Over  : num  5.7 3.6 7.3 10.4 3.9 18.2
    ##  $ PctPrivateCoverage    : num  68.5 71.8 77.1 63.5 57.7 32
    ##  $ PctEmpPrivCoverage    : num  42.2 48.8 54.2 37.9 24.7 23.8
    ##  $ PctPublicCoverage     : num  31 31 30.1 39.9 41.3 36.6
    ##  $ PctPublicCoverageAlone: num  16.6 14.9 13.5 18.7 19.9 25.4
    ##  $ PctWhite              : num  72.2 96.8 86.5 88.2 98.5 ...
    ##  $ PctBlack              : num  21.325 0.386 5.041 7.498 0 ...
    ##  $ PctAsian              : num  1.475 0.208 2.75 0.646 0.474 ...
    ##  $ PctOtherRace          : num  1.84 1.59 2.4 1.52 0 ...
    ##  $ PctMarriedHouseholds  : num  47 56.4 53.4 52.1 52 ...
    ##  $ BirthRate             : num  5.82 5.7 4.24 6.6 3.9 ...

Les donnees sont par comté, aux Etats-Unis.

  - `TARGET_deathRate` : **Variable a expliquer** : Moyenne par habitant
    (100 000) décès par cancer (a)
  - `avgAnnCount` : Nombre moyen de cas déclarés de cancer diagnostiqués
    annuellement (a)
  - `avgDeathsPerYear` : Nombre moyen de décès déclarés dus au cancer
    (a)
  - `incidenceRate` : Moyenne par habitant (100 000) des diag diagoses
    du cancer (a)
  - `medianIncome` : Revenu médian par comté (b)
  - `popEst2015` : Population du comté (b)
  - `povertyPercent` : Pourcentage de la population vivant dans la
    pauvreté (b)
  - `studyPerCap` : Nombre d’essais cliniques liés au cancer par
    habitant et par comté (a)
  - `binnedInc` : Revenu médian par habitant par décile b)
  - `MedianAge` : Âge médian des résidents du comté (b)
  - `MedianAgeMale` : Âge médian des résidents masculins du comté (b)
  - `MedianAgeFemale` : Âge médian des résidentes du comté (b)
  - `Geography` : Nom du comté (b)
  - `AvgHouseholdSize` : Taille moyenne des ménages du comté (b)
  - `PercentMarried` : Pourcentage de résidents du comté qui sont mariés
    (b)
  - `PctNoHS18_24` : Pourcentage de résidents du comté âgés de 18 à 24
    ans ayant le plus haut niveau de scolarité atteint : moins que le
    secondaire (b)
  - `PctHS18_24` : Pourcentage de résidents du comté âgés de 18 à 24 ans
    ayant fait les plus hautes études : diplôme d’études secondaires (b)
  - `PctBachDeg18_24` : Pourcentage de résidents du comté âgés de 18 à
    24 ans ayant le plus haut niveau d’instruction atteint :
    baccalauréat (b)
  - `PctHS25_Over` : Pourcentage de résidents du comté âgés de 25 ans et
    plus ayant fait les plus hautes études : diplôme d’études
    secondaires - (b)
  - `PctBachDeg25_Over` : Pourcentage de résidents du comté âgés de 25
    ans et plus ayant fait les plus hautes études : baccalauréat (b)
  - `PctEmployed16_Over` : Pourcentage de résidents du comté âgés de 16
    ans et plus ayant un emploi (b)
  - `PctEmployed16_Over` : Pourcentage de résidents du comté âgés de 16
    ans et plus sans emploi (b)
  - `PctPrivateCoverage` : Pourcentage de résidents du comté bénéficiant
    d’une couverture médicale privée (b)
  - `PctEmpPrivCoverage` : Pourcentage de résidents du comté bénéficiant
    d’une assurance maladie privée fournie par l’employé (b)
  - `PctPublicCoverage` : Pourcentage de résidents des comtés
    bénéficiant d’une couverture médicale fournie par le gouvernement
    (b)
  - `PctPublicCoverageAlone` : Pourcentage de résidents des comtés
    bénéficiant d’une couverture médicale fournie par le gouvernement
    seulement (b)
  - `PctWhite` : Pourcentage de résidents du comté qui s’identifient
    comme Blancs (b)
  - `PctBlack` : Pourcentage de résidents du comté qui s’identifient
    comme Noirs (b)
  - `PctAsian` : Pourcentage de résidents des comtés qui s’identifient
    comme asiatiques (b)
  - `PctOtherRace` : Pourcentage des résidents du comté qui
    s’identifient dans une catégorie qui n’est pas blanche, noire ou
    asiatique (b)
  - `PctMarriedHousesholds` : Pourcentage de ménages mariés (b)
    BirthRate : Nombre de naissances vivantes par rapport au nombre de
    femmes dans le comté (b)
  - `BirthRate` : Taux de naissance par femme, dans le comté (b)

<!-- end list -->

1)  : années 2010-2016
2)  : Estimations du recensement de 2013


``` diff
- (6 Janvier 2020) seule la base test (6 lignes) est en ligne
```

Le but du devoir est de mettre en oeuvre, sur des vraies données, les
techniques exposées en cours.

  - Date limite pour envoyer le devoir **1er mars** avant **midi**,
  - Chaque étudiant(e) doit envoyer via [moodle](https://www.moodle2.uqam.ca/) deux
    fichiers : `devoir1-ABCD12345678.html`, output d’un fichier
    `devoir1-ABCD12345678.Rmd` (il faudra envoyer les deux fichiers), où
    `ABCD12345678` doit être remplacé par le code permanent de
    l’étudiant(e). Le fichier `devoir1-ABCD12345678.html` doit être
    lisible et le fichier `devoir1-ABCD12345678.Rmd` doit compiler sans
    erreur,
    
  ![40% center](img/moodle1.png)
  
  - Il suffit de déposer les deux fichiers comme indiqué
  
  __**En cas de soucis avec moodle**__ un envoi par messagerie électronique [charpentier.arthur@uqam.ca](mailto:charpentier.arthur@uqam.ca) est possible (la date butoir reste la même : **1er mars** à **midi**)
  
  - Dans le preambule du markdown, `author:` doit mentionner le code
    permanent,
  - Le fichier doit contenir trois parties

<!-- end list -->

1.  Une partie exploratoire qui presente rapidement les variables qui
    pourraient être intéressantes (pour rappel, `TARGET_deathRate` est la
    variable d’interêt)
2.  Une partie presentant la construction du modèle : il s’agira de
    partir au choix (i) d’un modele simple, et de montrer comment
    l’ameliorer, (ii) d’une modele complexe, et de montrer comment le
    simplifier
3.  Une partie qui presente la forme du modele, en donnant (i) le R2
    ajusté (ii) l’indice d’Akaike AIC et (iii) l’indice BIC (iv) la
    liste des variables explicatives retenues

<!-- end list -->

  - Les techniques de validation croisée, ou la constitution de bases
    d’apprentissage et de test *ne sont pas au programme* et ne
    devront pas etre utilisee ici \!
  - Les seuls packages autorises (sauf autorisation explicite) sont
    `MASS`, `lmtest`, `nortest`, `car`, `splines`, `AER`
