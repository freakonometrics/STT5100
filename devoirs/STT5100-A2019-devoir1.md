STT5100 - Devoir 1 - Automne 2019
================
Arthur Charpentier

``` r
code_permanent = "ABCD12345678"
loc_fichier = paste("http://freakonometrics.free.fr/",code_permanent,"A2019D1.RData",sep="")
download.file(loc_fichier, "base_devoir_1.RData")
load("base_devoir_1.RData")
dim(database)
```

    ## [1]  6 20

  - `Age` = âge (en années)
  - `Depression` = mesure de la dépression
  - `Hospitalizations` = nombre d’hospitalisations
  - `Link` = temps (en jours) nécessaire pour établir un lien avec les
    soins primaires
  - `RiskDrug` = échelle de risque
  - `Gender` = genre de la personne (`female` ou `male`)
  - `Suicide` = la personne a eu des pensées suicidaires graves au cours
    des 30 derniers jours (`no` ou `yes`)
  - `Homeless` = statut de logement (`homeless` ou `housed`)
  - `DrinksAverage` = nombre moyen de boissons consommées par jour au
    cours des 30 derniers jours
  - `DrinksMax` = nombre maximal de boissons consommées par jour au
    cours des 30 derniers jours
  - `PostCare` =lien post-détox aux soins primaires
  - `MentalScore` = score de la composante mentale (les scores les plus
    bas indiquent un état moins bon)
  - `PhysicalScore` = score de la composante physique (les scores les
    plus bas indiquent un état moins bon)
  - `SocialScore` = soutien social perçu par les amis
  - `Ethnicity` = race/ethnicité (`black`, `hispanic`, `other` ou
    `white`)
  - `BSAS` = Bureau of Substance Addiction Services (`no` ou `yes`)
  - `SexRisk` = évaluation des risques liés au sexe (valeur grande =
    davantage risqué)
  - `SubstenceAbuse` = toxicomanie (`alcohol`, `cocaine` ou `heroin`)
  - `Treated` = la personne a-t-elle suivi un traitement à la clinique
    (`no` ou `yes`)
  - `DrugScore` = score d’addiction **variable a expliquer**

<!-- end list -->

``` r
str(database)
```

    ## 'data.frame':    6 obs. of  20 variables:
    ##  $ Age             : int  38 26 45 33 34 44
    ##  $ Depression      : int  34 56 17 15 29 44
    ##  $ Hospitalizations: int  1 2 2 0 0 1
    ##  $ Link            : int  348 365 43 365 356 27
    ##  $ RiskDrug        : int  14 0 0 0 0 0
    ##  $ Gender          : Factor w/ 2 levels "female","male": 1 1 2 1 1 2
    ##  $ Suicide         : Factor w/ 2 levels "no","yes": 1 1 1 1 1 2
    ##  $ Homeless        : Factor w/ 2 levels "homeless","housed": 1 2 1 2 2 2
    ##  $ DrinksAverage   : int  0 1 0 0 0 3
    ##  $ DrinksMax       : int  0 1 0 0 0 6
    ##  $ PostCare        : int  0 0 1 0 0 1
    ##  $ MentalScore     : num  43.4 14.4 29.9 41.6 31.1 ...
    ##  $ PhysicalScore   : num  21.9 46.7 36 62.1 64.9 ...
    ##  $ SocialScore     : int  9 2 7 11 14 13
    ##  $ Ethnicity       : Factor w/ 4 levels "black","hispanic",..: 1 1 1 1 1 3
    ##  $ BSAS            : Factor w/ 2 levels "no","yes": 1 1 1 2 1 1
    ##  $ SexRisk         : int  8 11 6 6 12 4
    ##  $ SubstenceAbuse  : Factor w/ 3 levels "alcohol","cocaine",..: 3 3 2 2 2 2
    ##  $ Treated         : Factor w/ 2 levels "no","yes": 1 2 1 2 2 2
    ##  $ DrugScore       : int  32 36 22 6 37 44

``` diff
- (18 Septembre 2019) la base est en ligne
```

Le but du devoir est de mettre en oeuvre, sur des vraies donnees, les
techniques exposees en cours.

  - Date limite pour envoyer le devoir **4 novembre** a **midi**,
  - Chaque etudiant(e) doit envoyer par messagerie electronique deux
    fichiers : `devoir1-ABCD12345678.html`, output d’un fichier
    `devoir1-ABCD12345678.Rmd` (il faudra envoyer les deux fichiers), où
    `ABCD12345678` doit être remplacé par le code permanent de
    l’étudiant(e). Le fichier `devoir1-ABCD12345678.html` doit etre
    lisible et le fichier `devoir1-ABCD12345678.Rmd` doit compiler sans
    erreur,
  - Dans le preambule du markdown, `author:` doit mentionner le code
    permanent,
  - Le fichier doit contenir trois parties

<!-- end list -->

1.  Une partie exploratoire qui presente rapidement les variables qui
    pourraient etre interessantes (pour rappel, `DrugScore` est la
    variable d’interet)
2.  Une partie presentant la construction du modele : il s’agira de
    partir au choix (i) d’un modele simple, et de montrer comment
    l’ameliorer, (ii) d’une modele complexe, et de montrer comment le
    simplifier
3.  Une partie qui presente la forme du modele, en donnant (i) le R2
    ajuste (ii) l’indice d’Akaike AIC et (iii) l’indice BIC (iv) la
    liste des variables explicatives retenues

<!-- end list -->

  - Les techniques de validation croisee, ou la constitution de bases
    d’apprentissage et de test *ne sont pas au programme* et ne
    devront pas etre utilisee ici \!
  - Les seuls packages autorises (sauf autorisation explicite) sont
    `MASS`, `lmtest`, `nortest`, `car`, `splines`, `AER`
