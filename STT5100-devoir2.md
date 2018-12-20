STT5100 Devoir \#2
================
Arthur Charpentier

**Objectif** : construire un “bon” modele linéaire pour comprendre les
visites chez le medecine, en Allemagne.

**Attendus** : les étudiants devront rendre le devoir qu’ils auront
fait, soit seul, soit avec une autre personne inscrite au cours (deux
étudiants par projet, maximum). Sont attendus,

1.  un rapport

<!-- end list -->

  - soit un rapport au format `pdf`,

  - soit une sortie `R` (au format `html` ou `rmd`),

<!-- end list -->

2.  une base de données

<!-- end list -->

  - un fichier `csv` avec la prévision pour chacun des 19609 personnes
    de la base. La base contiendra 19609 lignes, et 3 variables : la
    variable `id`, la variable `year` et une variable supplementaire
    appelée `prevision`, correspondant a la probabilite d’aller chez le
    medecin.

Le nom du fichier du rapport (comme la base de données) doit contenir le
(ou les) code permanent de l’étudiant, le sigle du cours, et “devoir 2”
(eg `STT5100-ABCD12345678-devoir2.pdf` et
`STT5100-ABCD12345678-devoir2.csv`). La premiere ligne du rapport doit
indiquer le (ou les) code permanent de l’étudiant. Tout manquement
entrainera une perte de points. Le rapport doit de conclure avec la
presentation du modele retenu.

Le rapport devra presenter quelques graphiques pertinents, expliquer
quel a ete le premier modele construit, puis le cheminement arrivant au
modele final. La sortie `R` (obtenue avec `summary(glm(doctor~....,
family=binomial)`) devra ensuite figurer. Le travail devra presenter la
courbe ROC du modele retenu, avec la valeur de l’AUC correspondante.

Les deux fichiers doivent etre envoyés, au plus tard, le **27 decembre
2018, midi** (conformément a l’entente
d’évaluation).

**Donnees**

``` r
base = read.table("http://freakonometrics.free.fr/STT5100_A2018_Devoir2.txt",sep=";")
str(base)
```

    ## 'data.frame':    19609 obs. of  17 variables:
    ##  $ id      : int  1 1 1 2 2 2 2 3 3 3 ...
    ##  $ doctor  : logi  TRUE FALSE FALSE FALSE TRUE TRUE ...
    ##  $ hospvis : int  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ year    : int  1984 1985 1986 1984 1985 1986 1988 1984 1986 1987 ...
    ##  $ edlevel : int  3 3 3 1 1 1 1 1 1 1 ...
    ##  $ age     : int  54 55 56 44 45 46 48 58 60 61 ...
    ##  $ outwork : int  0 0 0 1 1 1 1 1 1 1 ...
    ##  $ female  : int  0 0 0 1 1 1 1 1 1 1 ...
    ##  $ married : int  1 1 1 1 1 1 1 0 0 0 ...
    ##  $ kids    : int  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ hhninc  : num  3.05 4.51 3.5 3.05 3.18 ...
    ##  $ educ    : num  15 15 15 9 9 9 9 11 11 11 ...
    ##  $ self    : int  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ edlevel1: int  0 0 0 1 1 1 1 1 1 1 ...
    ##  $ edlevel2: int  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ edlevel3: int  1 1 1 0 0 0 0 0 0 0 ...
    ##  $ edlevel4: int  0 0 0 0 0 0 0 0 0 0 ...

``` r
tail(base)
```

    ##         id doctor hospvis year edlevel age outwork female married kids
    ## 19604 7011   TRUE       0 1988       1  27       0      1       1    0
    ## 19605 7015   TRUE       0 1988       1  27       0      1       1    0
    ## 19606 7016   TRUE       0 1988       1  31       0      0       1    0
    ## 19607 7023  FALSE       0 1988       1  31       0      0       1    1
    ## 19608 7026   TRUE       0 1988       1  26       0      0       1    0
    ## 19609 7028   TRUE       0 1988       1  30       0      1       0    0
    ##       hhninc     educ self edlevel1 edlevel2 edlevel3 edlevel4
    ## 19604  3.700 11.50000    0        1        0        0        0
    ## 19605  3.800 11.00000    0        1        0        0        0
    ## 19606  2.067 11.81824    0        1        0        0        0
    ## 19607  2.600 11.00000    0        1        0        0        0
    ## 19608  3.000 10.50000    0        1        0        0        0
    ## 19609  0.990 10.50000    0        1        0        0        0

``` r
table(base$doctor)
```

    ## 
    ## FALSE  TRUE 
    ##  7572 12037

Les donnees sont en Allemagne, pour les annees 1984-1988.

  - `doctor` : **Variable a expliquer** : Au moins une visite chez le
    docteur pendant l’annee `year`
  - `id` : Identifiant du patient
  - `hospvis` : Nombre de jours d’hospitalisation **a ne pas utiliser**
  - `year` : Annee
  - `edlevel` : Niveau d’education (facteur 1-4)
  - `age` : Age (25-64)
  - `outwork` : out of work=1; working=0
  - `female` : Genre, femme=1; homme=0
  - `married` : Statut marital, marie=1; non-marie=0
  - `kids` : Enfants, enfants=1; pas d’enfants=0
  - `hhninc` : Richesse du menage (annuel)
  - `educ` : Nombre d’annees d’education (7-18)
  - `self` : self-employed=1; not self employed=0
  - `edlevel1` : (1/0) not high school graduate
  - `edlevel2` : (1/0) high school graduate
  - `edlevel3` : (1/0) university/college
  - `edlevel4` : (1/0) graduate school
