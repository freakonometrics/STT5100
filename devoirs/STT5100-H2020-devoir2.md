STT5100 Devoir \#2 - Hiver 2020
================
Arthur Charpentier

``` r
code_permanent = "ABCD12345678"
loc_fichier = paste("http://freakonometrics.free.fr/",code_permanent,"H2020D2.RData",sep="")
download.file(loc_fichier, "base_devoir_2.RData")
load("base_devoir_2.RData")
dim(database)
```

    ## [1]  6 40

Les données sont par maison vendue

  - `foyer` : **Variable a expliquer** : Présence (1) ou pas (0) d’un
    foyer dans la maison
  - `Zone` : zone géographie (catégorielle, 7 modalités) (etc)

<!-- end list -->

``` r
str(database)
```

    ## 'data.frame':    6 obs. of  40 variables:
    ##  $ Zone              : Factor w/ 7 levels "A (agr)","C (all)",..: 6 6 6 6 6 6
    ##  $ Surface_Lot       : int  6897 6289 9488 13774 8923 8197
    ##  $ Rue               : Factor w/ 2 levels "Grvl","Pave": 2 2 2 2 2 2
    ##  $ Forme             : Factor w/ 4 levels "IR1","IR2","IR3",..: 1 1 4 1 1 4
    ##  $ Utilities         : Factor w/ 3 levels "AllPub","NoSeWa",..: 1 1 1 1 1 1
    ##  $ Configuration     : Factor w/ 5 levels "Corner","CulDSac",..: 1 5 5 5 5 5
    ##  $ Proxim_1          : Factor w/ 9 levels "Artery","Feedr",..: 3 3 2 3 3 3
    ##  $ Proxim_2          : Factor w/ 8 levels "Artery","Feedr",..: 3 3 3 3 3 3
    ##  $ Logement          : Factor w/ 5 levels "1Fam","2fmCon",..: 1 5 1 1 1 1
    ##  $ Style             : Factor w/ 8 levels "1.5Fin","1.5Unf",..: 3 3 3 6 8 3
    ##  $ Int_Qualite       : int  5 6 5 7 7 6
    ##  $ Int_Condition     : int  8 5 6 7 5 5
    ##  $ Construction_Annee: int  1962 2005 1947 1977 1998 1977
    ##  $ Renovation_Annee  : int  2010 2006 1993 1992 1998 1977
    ##  $ Toit              : Factor w/ 6 levels "Flat","Gable",..: 2 2 2 4 2 2
    ##  $ Exterieur         : Factor w/ 16 levels "AsbShng","AsphShn",..: 7 14 14 7 14 10
    ##  $ Maconnerie        : Factor w/ 6 levels "","BrkCmn","BrkFace",..: 5 6 5 3 5 3
    ##  $ Ext_Qualite       : Factor w/ 4 levels "Ex","Fa","Gd",..: 4 3 3 4 3 4
    ##  $ Ext_Condition     : Factor w/ 5 levels "Ex","Fa","Gd",..: 3 5 5 3 5 5
    ##  $ Foundation        : Factor w/ 6 levels "BrkTil","CBlock",..: 2 3 2 3 3 2
    ##  $ Chauffage         : Factor w/ 6 levels "Floor","GasA",..: 2 2 2 2 2 2
    ##  $ Chauff_Qualite    : Factor w/ 5 levels "Ex","Fa","Gd",..: 1 1 3 1 3 1
    ##  $ Electricite       : Factor w/ 6 levels "","FuseA","FuseF",..: 6 6 6 6 6 6
    ##  $ Surface_RdC       : int  1040 1362 1054 1316 751 1285
    ##  $ Surface_Etage     : int  0 0 0 972 631 0
    ##  $ Surface_Autre     : int  0 0 0 0 0 0
    ##  $ Toilettes         : int  1 2 1 1 2 1
    ##  $ Chambres          : int  3 2 3 4 3 3
    ##  $ Cuisine_Qualite   : Factor w/ 4 levels "Ex","Fa","Gd",..: 4 3 4 3 4 4
    ##  $ Pieces            : int  6 6 6 8 7 7
    ##  $ Note              : Factor w/ 8 levels "Maj1","Maj2",..: 8 8 8 8 8 8
    ##  $ Allee             : Factor w/ 3 levels "N","P","Y": 3 3 3 3 3 3
    ##  $ Garage_Ext_Surface: int  104 28 60 72 0 0
    ##  $ Garage_Int_Surface: int  0 0 122 0 0 0
    ##  $ Piscine_Surface   : int  0 0 0 0 0 0
    ##  $ Vente_Mois        : int  4 6 9 11 2 4
    ##  $ Vente_Annee       : int  2010 2007 2008 2009 2009 2007
    ##  $ Vente_Type        : Factor w/ 10 levels "COD","Con","ConLD",..: 10 10 10 10 10 10
    ##  $ Vente_Condition   : Factor w/ 6 levels "Abnorml","AdjLand",..: 5 5 1 5 5 5
    ##  $ foyer             : num  0 1 0 1 1 1

``` r
table(database$foyer)
```

    ## 
    ## 0 1 
    ## 2 4
    

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
