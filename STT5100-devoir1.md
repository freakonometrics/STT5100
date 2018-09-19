STT5100 Devoir \#1
================

**Objectif** : construire un "bon" modele linéaire pour comprendre le taux de décès par cancer, aux Etats-Unis.

**Attendus** : les étudiants devront rendre le devoir qu'ils auront fait, soit seul, soit avec une autre personne inscrite au cours (deux étudiants par projet, maximum). Sont attendus, 
1) un rapport
- soit un rapport au format `pdf`, 
- soit une sortie `R` (au format `html` ou `rmd`),
2) une base de données
- un fichier `csv` avec la prévision pour chacun des 2400 comtés de la base. La base contiendra 2400 lignes, et 2 variables : la variable `Geography` et une variable supplementaire appelée `prevision`.

Le nom du fichier du rapport (comme la base de données) doit contenir le (ou les) code permanent de l'étudiant, le sigle du cours, et "devoir 1" (eg `STT5100-ABCD12345678-devoir1.pdf` et `STT5100-ABCD12345678-devoir1.csv`). La premiere ligne du rapport doit indiquer le (ou les) code permanent de l'étudiant. Tout manquement entrainera une perte de points. Le rapport doit de conclure avec la presentation du modele retenu, par exemple

![modele](https://latex.codecogs.com/gif.latex?\text{deathRate}=-5+2\cdot\text{povertyPercent}+.05\cdot\text{PctMarriedHouseholds})

Le rapport devra presenter quelques graphiques pertinents, expliquer quel a ete le premier modele construit, puis le cheminement arrivant au modele final.

Les deux fichiers doivent etre envoyés, au plus tard, le **12 novembre 2018, midi** (conformément a l'entente d'évaluation).

**Donnees**

``` r
base = read.table("http://freakonometrics.free.fr/STT5100_A2018_Devoir1.txt",sep=";")
str(base)
```

    ## 'data.frame':    2400 obs. of  34 variables:
    ##  $ avgAnnCount            : num  862 50 106 67 326 ...
    ##  $ avgDeathsPerYear       : int  326 23 45 28 130 584 67 67 67 26 ...
    ##  $ TARGET_deathRate       : num  171 193 176 212 188 ...
    ##  $ incidenceRate          : num  456 435 415 507 495 ...
    ##  $ medIncome              : int  84500 35955 37026 30675 51025 54208 46177 35528 49565 43615 ...
    ##  $ popEst2015             : int  167627 9245 22131 10458 49489 274219 27811 23877 28562 10699 ...
    ##  $ povertyPercent         : num  5.9 25.3 19.1 31.4 11.3 15.1 13.5 20.1 10.1 20.4 ...
    ##  $ studyPerCap            : num  89.5 0 0 0 1050.7 ...
    ##  $ binnedInc              : Factor w/ 10 levels "(34218.1, 37413.8]",..: 9 1 1 10 6 7 5 1 6 4 ...
    ##  $ MedianAge              : num  42.2 39 38.4 39.5 42.2 40.6 44.5 43.9 41.5 36.9 ...
    ##  $ MedianAgeMale          : num  41 35.5 36.9 37.8 40.9 38.9 43.3 43.3 40.3 35.3 ...
    ##  $ MedianAgeFemale        : num  43.1 41.8 40.8 41.2 43.6 42 46.1 44.7 42.6 38.8 ...
    ##  $ Geography              : Factor w/ 2400 levels "Abbeville County, South Carolina",..: 314 1035 2140 1303 958 86 317 2357 2210 313 ...
    ##  $ AvgHouseholdSize       : num  2.73 2.71 0.0261 2.49 2.44 2.64 2.54 2.53 2.49 2.63 ...
    ##  $ PercentMarried         : num  56.7 47.3 56.1 34.8 56.8 45.1 58.4 52.7 56.3 45.9 ...
    ##  $ PctNoHS18_24           : num  6.6 22.8 12.6 33.9 15.5 12.3 17 19.9 16.7 18.5 ...
    ##  $ PctHS18_24             : num  30.1 39.9 38.5 34.8 33.7 32.4 44.1 33.5 41.5 60.8 ...
    ##  $ PctSomeCol18_24        : num  NA NA NA 29.5 NA 45.8 NA NA 34.6 NA ...
    ##  $ PctBachDeg18_24        : num  12.4 6.1 1.9 1.8 7.7 9.4 5.3 2.8 7.1 4.7 ...
    ##  $ PctHS25_Over           : num  30.6 44.2 32 35.3 35.2 32.9 47.5 33.7 48.7 44 ...
    ##  $ PctBachDeg25_Over      : num  20.8 5 7.4 10.2 14.5 17 6.7 6.8 9.4 6.3 ...
    ##  $ PctEmployed16_Over     : num  65.6 42.3 49.3 40.9 59.2 58 55 45.3 58.2 51 ...
    ##  $ PctUnemployed16_Over   : num  4.6 6.8 12.2 13.2 5.8 12.5 7.1 9.6 7.5 13.2 ...
    ##  $ PctPrivateCoverage     : num  84.5 48.5 56.9 54.7 76.7 66.9 65.3 58.8 71.4 54.9 ...
    ##  $ PctPrivateCoverageAlone: num  69 35.4 43.3 NA 57.6 49.9 50 42 53.4 43.9 ...
    ##  $ PctEmpPrivCoverage     : num  62 32.4 36.1 28.9 51 45.3 45.4 35.3 49 42.3 ...
    ##  $ PctPublicCoverage      : num  23.9 43.1 40 45.8 33.9 33.4 35.1 43.9 36.5 39.3 ...
    ##  $ PctPublicCoverageAlone : num  9.8 27.6 22.7 25.4 15 17.7 19.6 22.8 18 25.2 ...
    ##  $ PctWhite               : num  92.7 68.6 81.3 25.5 93.9 ...
    ##  $ PctBlack               : num  3.25 28.48 16 74.06 1.78 ...
    ##  $ PctAsian               : num  1.689 0.085 0.245 0 0.515 ...
    ##  $ PctOtherRace           : num  0.458 0.563 0.313 0 1.698 ...
    ##  $ PctMarriedHouseholds   : num  61.3 49.3 56.4 32.8 55.4 ...
    ##  $ BirthRate              : num  4.32 5.6 5.68 3.73 5.73 ...

``` r
tail(base)
```

    ##      avgAnnCount avgDeathsPerYear TARGET_deathRate incidenceRate medIncome
    ## 2621         123               54            201.6         450.0     36852
    ## 649          109               40            139.7         409.0     47366
    ## 960           86               36            178.9         432.6     44397
    ## 1198         141               60            225.1         541.3     33650
    ## 1506          31               14            202.1         451.5     50348
    ## 2361         104               39            171.7         492.1     49886
    ##      popEst2015 povertyPercent studyPerCap          binnedInc MedianAge
    ## 2621      25683           22.5       0.000 (34218.1, 37413.8]      38.5
    ## 649       23886           13.7       0.000   (45201, 48021.6]      36.2
    ## 960       15414           15.1       0.000   (42724.4, 45201]      42.3
    ## 1198      21578           24.8     185.374   [22640, 34218.1]      40.4
    ## 1506       4995           12.4       0.000 (48021.6, 51046.4]      41.5
    ## 2361      16950           16.2       0.000 (48021.6, 51046.4]      40.1
    ##      MedianAgeMale MedianAgeFemale                   Geography
    ## 2621          37.6            40.4     Allen Parish, Louisiana
    ## 649           35.7            37.0     Dawson County, Nebraska
    ## 960           41.6            43.4 Appomattox County, Virginia
    ## 1198          38.8            40.9 Grenada County, Mississippi
    ## 1506          38.3            43.4      Dewey County, Oklahoma
    ## 2361          38.8            41.6       Bond County, Illinois
    ##      AvgHouseholdSize PercentMarried PctNoHS18_24 PctHS18_24
    ## 2621             2.66           41.6         31.5       45.6
    ## 649              2.71           56.6         27.0       34.6
    ## 960              2.55           54.3         10.8       45.2
    ## 1198             2.86           39.3         35.7       31.5
    ## 1506             2.57           59.1         35.8       31.3
    ## 2361             2.57           47.5         11.2       23.8
    ##      PctSomeCol18_24 PctBachDeg18_24 PctHS25_Over PctBachDeg25_Over
    ## 2621              NA             4.0         44.0               6.9
    ## 649               NA             2.5         33.4               9.7
    ## 960             38.2             5.8         36.1              10.1
    ## 1198              NA             0.4         30.2               9.9
    ## 1506              NA             2.0         42.3              17.6
    ## 2361              NA             1.4         39.8              10.4
    ##      PctEmployed16_Over PctUnemployed16_Over PctPrivateCoverage
    ## 2621               40.4                  8.9               58.0
    ## 649                67.6                  4.8               68.3
    ## 960                53.3                  6.6               68.0
    ## 1198                 NA                  9.4               55.3
    ## 1506               54.9                  2.7               63.8
    ## 2361               52.8                  6.4               68.1
    ##      PctPrivateCoverageAlone PctEmpPrivCoverage PctPublicCoverage
    ## 2621                    43.7               39.8              40.2
    ## 649                       NA               46.4              30.4
    ## 960                     52.5               44.5              35.3
    ## 1198                    42.7               37.2              44.0
    ## 1506                      NA               39.9              32.8
    ## 2361                    52.7               46.7              40.2
    ##      PctPublicCoverageAlone PctWhite   PctBlack   PctAsian PctOtherRace
    ## 2621                   23.8 72.49834 20.0171520 0.81082135    0.7328578
    ## 649                    16.5 89.22265  4.6615979 0.07063027    3.6395363
    ## 960                    18.7 77.50526 20.2853761 0.11178327    0.2498685
    ## 1198                   23.9 55.53703 43.6153953 0.49094530    0.0000000
    ## 1506                   19.1 88.73124  0.1850709 0.86366440    0.1233806
    ## 2361                   22.4 90.75261  5.5565182 0.80864091    0.5198406
    ##      PctMarriedHouseholds BirthRate
    ## 2621             45.16008  5.988024
    ## 649              54.01485  8.054333
    ## 960              54.81369  4.406073
    ## 1198             42.92637  1.946661
    ## 1506             59.69746  2.164502
    ## 2361             52.40729  5.736869

Les donnees sont par comte, aux Etats-Unis.

  - `TARGET_deathRate` : **Variable a expliquer** : Moyenne par habitant
    (100 000) décès par cancer(a)
  - `avgAnnCount` : Nombre moyen de cas déclarés de cancer diagnostiqués
    annuellement(a)
  - `avgDeathsPerYear` : Nombre moyen de décès déclarés dus au cancer(a)
  - `incidenceRate` : Moyenne par habitant (100 000) des diag diagoses
    du cancer(a)
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
  - `PctSomeCol18_24` : Pourcentage des résidents du comté âgés de 18 à
    24 ans ayant le plus haut niveau de scolarité atteint : certains
    collèges (b)
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
  - `PctPrivateCoverageAlone` : Pourcentage de résidents du comté
    bénéficiant d’une couverture médicale privée uniquement (pas
    d’assistance publique) (b)
  - `PctEmpPrivCoverage` : Pourcentage de résidents du comté bénéficiant
    d’une assurance maladie privée fournie par l’employé (b)
  - `PctPublicCoverage` : Pourcentage de résidents des comtés
    bénéficiant d’une couverture médicale fournie par le gouvernement
    (b)
  - `PctPubliceCoverageAlone` : Pourcentage de résidents des comtés
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

<!-- end list -->

1)  : années 2010-2016
2)  : Estimations du recensement de 2013
