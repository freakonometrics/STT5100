STT5100 - Devoir 2 - Automne 2019
================
Arthur Charpentier

``` r
code_permanent = "ABCD12345678"
loc_fichier = paste("http://freakonometrics.free.fr/",code_permanent,"A2019D2.RData",sep="")
download.file(loc_fichier, "base_devoir_2.RData")
load("base_devoir_2.RData")
dim(database)
```

    ## [1]  6 16

  - `urgences` = nombre de visites aux urgences
  - `hopital` = nombre de séjour à l’hôpital
  - `sante` = état de santé (`poor`, `average`, `excellent`)
  - `chronique` = nombre de conditions chroniques
  - `limite_activites` = si la condition limite l’activité (`normal`,
    `limited`)
  - `region` = région aux U.S. (`northeast`,`midwest`,`west`,`other`)
  - `age` = âge (en années)
  - `genre` = genre (`female`,`male`)
  - `marie` = indique si la personne est mariée ou non (`no`,`yes`)
  - `ecole` = nombre d’années d’éducation
  - `revenu` = revenu de la famille (USD)
  - `employe` = indique si la personne est employée (`no`,`yes`)
  - `assurance` = indique si la personne est couverte par une assurance
    privée (`no`,`yes`)
  - `medicaid` = indique si la personne est couverte par Medicair
    (`no`,`yes`)
  - `visites` = nombre de visites chez le médecin **variable a
    expliquer**

<!-- end list -->

``` r
str(database)
```

    ## 'data.frame':    6 obs. of  16 variables:
    ##  $ visites         : int  7 13 13 4 5 2
    ##  $ urgences        : int  0 0 0 0 0 0
    ##  $ hopital         : int  0 1 0 0 0 0
    ##  $ sante           : Factor w/ 3 levels "poor","average",..: 2 1 2 2 1 1
    ##   ..- attr(*, "contrasts")= num [1:3, 1:2] 1 0 0 0 0 1
    ##   .. ..- attr(*, "dimnames")=List of 2
    ##   .. .. ..$ : chr  "poor" "average" "excellent"
    ##   .. .. ..$ : chr  "poor" "excellent"
    ##  $ chronique       : int  2 4 3 1 2 4
    ##  $ limite_activites: Factor w/ 2 levels "normal","limited": 1 1 2 1 2 1
    ##  $ region          : Factor w/ 4 levels "northeast","midwest",..: 2 4 1 2 3 3
    ##   ..- attr(*, "contrasts")= num [1:4, 1:3] 1 0 0 0 0 1 0 0 0 0 ...
    ##   .. ..- attr(*, "dimnames")=List of 2
    ##   .. .. ..$ : chr  "northeast" "midwest" "west" "other"
    ##   .. .. ..$ : chr  "northeast" "midwest" "west"
    ##  $ age             : num  70 67 95 68 93 83
    ##  $ genre           : Factor w/ 2 levels "female","male": 2 2 1 2 1 2
    ##  $ marie           : Factor w/ 2 levels "no","yes": 2 2 1 2 1 1
    ##  $ ecole           : int  11 12 3 8 0 6
    ##  $ revenu          : num  15972 50559 34820 16076 4560 ...
    ##  $ employe         : Factor w/ 2 levels "no","yes": 1 1 1 1 1 1
    ##  $ assurance       : Factor w/ 2 levels "no","yes": 2 2 2 2 1 1
    ##  $ medicaid        : Factor w/ 2 levels "no","yes": 1 1 1 1 1 1
    ##  $ visites.1       : int  7 13 13 4 5 2

``` diff
- (7 Novembre 2019) la base est en ligne
```

Le but du devoir est de mettre en oeuvre, sur des vraies donnees, les
techniques exposees en cours.

  - Date limite pour envoyer le devoir **20 décembre** a **minuit**,
  - Chaque etudiant(e) doit envoyer via Moodle deux fichiers :
    `devoir2-ABCD12345678.hmtl`, output d’un fichier
    `devoir2-ABCD12345678.Rmd` (il faudra envoyer les deux fichiers), où
    `ABCD12345678` doit être remplacé par le code permanent de
    l’étudiant(e). Le fichier `devoir2-ABCD12345678.hmtl` doit etre
    lisible et le fichier `devoir2-ABCD12345678.Rmd` doit compiler sans
    erreur,
  - Dans le preambule du markdown, `author:` doit mentionner le code
    permanent,
  - Le fichier doit contenir trois parties

<!-- end list -->

1.  Une partie exploratoire qui presente rapidement les variables qui
    pourraient etre interessantes (pour rappel, `visites` est la
    variable d’interet)
2.  Une partie presentant la construction du modele : il s’agira de
    partir au choix (i) d’un modele simple, et de montrer comment
    l’ameliorer, (ii) d’une modele complexe, et de montrer comment le
    simplifier
3.  Une partie qui presente la forme du modele, en donnant (i) la courbe
    ROC obtenue (ii) le AUC du modèle retenu (iii) la liste des
    variables explicatives retenues

<!-- end list -->

  - Les techniques de validation croisee, ou la constitution de bases
    d’apprentissage et de test *ne sont pas au programme* et ne
    devront pas etre utilisee ici \!
  - Les seuls packages autorises (sauf autorisation explicite) sont
    `MASS`, `lmtest`, `nortest`, `car`, `splines`, `AER`, `pROC`, `plotROC`, `verification`, `ROCR`, `dplyr`, `aod`, `vcd`, `statmod` (et les dépendances associées)
