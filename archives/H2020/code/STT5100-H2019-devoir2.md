STT5100 - Devoir 2 - Hiver 2019
================
Arthur Charpentier

``` r
code_permanent = "ABCD12345678"
loc_fichier = paste("http://freakonometrics.free.fr/",code_permanent,"2.RData",sep="")
download.file(loc_fichier, "base_devoir_2.RData")
load("base_devoir_2.RData")
dim(database)
```

    ## [1] 100  10

  - `satisf` = niveau de satisfaction (entre 0 et 1)
  - `eval` = temps depuis la derniere evaluation (en annees)
  - `projets` = nombre de projets sur lequel l’employe etait implique
  - `heures_mensuel` = nombre d’heures travaillees par mois  
  - `anciennete` = nombre d’années passées dans l’entreprise
  - `accidents` = indicateur indiquant l’employe a eu un accident de
    travail  
  - `Y` = a quitté l’entreprise (0 : non, 1 : oui) **variable a
    expliquer**
  - `promotion` = indicateur indiquant si l’employe a obtenu une
    promotion au cours des 5 dernieres annees
  - `dept` = departement ou la personne etait employee (10 niveaux)
  - `salaire` = niveau relatif de salaire (3 niveaux)

<!-- end list -->

``` r
str(database)
```

    ## 'data.frame':    100 obs. of  10 variables:
    ##  $ satisf        : num  0.1 0.8 0.74 0.72 0.8 0.75 0.78 0.53 0.57 0.85 ...
    ##  $ eval          : num  0.95 0.55 0.71 0.65 0.85 0.96 0.66 0.84 0.92 0.53 ...
    ##  $ projets       : int  6 4 4 3 4 3 4 4 3 3 ...
    ##  $ heures_mensuel: int  244 144 133 109 273 252 156 219 238 226 ...
    ##  $ anciennete    : int  5 5 2 5 5 3 3 2 2 2 ...
    ##  $ accidents     : int  0 1 0 1 0 0 1 0 0 0 ...
    ##  $ Y             : int  1 0 0 0 1 0 0 0 0 0 ...
    ##  $ promotion     : int  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ dept          : Factor w/ 10 levels "compta","RH",..: 3 6 10 10 4 10 10 2 8 1 ...
    ##  $ salaire       : Factor w/ 3 levels "haut","bas","moyen": 3 1 3 2 2 3 2 1 3 2 ...

``` r
table(database$Y)
```

    ## 
    ##  0  1 
    ## 80 20


``` diff
- (9 avril 2019) precision sur les 'instructions'
```

Le but du devoir est de mettre en oeuvre, sur des vraies donnees, les
techniques exposees en cours.

  - Date limite pour envoyer le devoir **29 avril** a **midi**,
  - Chaque etudiant(e) doit envoyer par messagerie electronique deux
    fichiers : `devoir2.hmtl`, output d’un fichier `devoir2.Rmd` (il
    faudra envoyer les deux fichier). Le fichier `devoir2.hmtl` doit
    etre lisible et le fichier `devoir2.Rmd` doit compiler sans erreur,
  - Dans le preambule du markdown, `author:` doit mentionner le code
    permanent,
  - Le fichier doit contenir trois parties

<!-- end list -->

1.  Une partie exploratoire qui presente rapidement les variables qui
    pourraient être intéressantes (pour rappel, `Y` est la variable
    d’interet)
2.  Une partie presentant la construction du modele : il s’agira de
    partir au choix (i) d’un modele simple, et de montrer comment
    l’ameliorer, (ii) d’une modele complexe, et de montrer comment le
    simplifier
3.  Une partie qui presente la forme du modele, en affichant (i) la courbe ROC obtenue (ii) le AUC du modèle retenu (iii) la
    liste des variables explicatives retenues

<!-- end list -->

  - Les techniques de validation croisee, ou la constitution de bases
    d’apprentissage et de test *ne sont pas au programme* et ne
    devront pas etre utilisee ici \!
  - Les seuls packages autorises (sauf autorisation explicite) sont
    `MASS`, `lmtest`, `nortest`, `car`, `splines`, `AER`, `pROC`, `plotROC`, `verification`, `ROCR`, `dplyr`, `aod`, `vcd`, `statmod` (et les dépendances associées)
