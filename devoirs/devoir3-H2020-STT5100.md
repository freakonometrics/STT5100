STT5100 Devoir \#3 - Hiver 2020
================
Arthur Charpentier

``` r
code_permanent = "ABCD12345678"
loc_fichier = paste("http://freakonometrics.free.fr/",code_permanent,"H2020D3.RData",sep="")
download.file(loc_fichier, "base_devoir_3.RData")
load("base_devoir_3.RData")
dim(database)
```

    ## [1]  6 24

``` r
str(database)
```

    ## 'data.frame':    6 obs. of  24 variables:
    ##  $ ID     : int  1 2 3 4 5 6
    ##  $ female : int  0 0 1 1 0 1
    ##  $ year   : int  1986 1985 1984 1985 1987 1984
    ##  $ age    : int  50 51 36 64 53 60
    ##  $ hsat   : num  5 8 9 6 10 10
    ##  $ handdum: num  0 0 0 0 1 0
    ##  $ handper: num  0 0 0 0 7.65 ...
    ##  $ hhninc : num  3800 1600 2000 1500 3800 ...
    ##  $ hhkids : int  1 1 1 0 0 0
    ##  $ educ   : num  10.5 11.5 11.5 9 9 10.5
    ##  $ married: int  1 1 1 0 1 1
    ##  $ haupts : int  1 0 0 1 1 1
    ##  $ reals  : int  0 1 1 0 0 0
    ##  $ fachhs : int  0 0 0 0 0 0
    ##  $ abitur : int  0 0 0 0 0 0
    ##  $ univ   : int  0 0 0 0 0 0
    ##  $ working: int  1 1 0 0 0 1
    ##  $ bluec  : int  1 0 0 0 0 0
    ##  $ whitec : int  0 0 0 0 0 1
    ##  $ self   : int  0 1 0 0 0 0
    ##  $ beamt  : int  0 0 0 0 0 0
    ##  $ docvis : int  1 0 0 3 0 0
    ##  $ public : int  1 1 1 1 1 1
    ##  $ addon  : int  0 0 0 0 0 0

  - `id` : person - identification number
  - `female` : female = 1; male = 0
  - `year` : calendar year of the observation
  - `age` : age in years
  - `hsat` : health satisfaction, coded 0 (low) - 10 (high)
  - `handdum` : handicapped = 1; otherwise = 0
  - `handper` : degree of handicap in percent (0 - 100)
  - `hhninc` : household nominal monthly net income in German marks /
    1000
  - `hhkids` : children under age 16 in the household = 1; otherwise = 0
  - `educ` : years of schooling
  - `married` : married = 1; otherwise = 0
  - `haupts` : highest schooling degree is Hauptschul degree = 1;
    otherwise = 0
  - `reals` : highest schooling degree is Realschul degree = 1;
    otherwise = 0
  - `fachhs` : highest schooling degree is Polytechnical degree = 1;
    otherwise = 0
  - `abitur` : highest schooling degree is Abitur = 1; otherwise = 0
  - `univ` : highest schooling degree is university degree = 1;
    otherwise = 0
  - `working` : employed = 1; otherwise = 0
  - `bluec` : blue collar employee = 1; otherwise = 0
  - `whitec` : white collar employee = 1; otherwise = 0
  - `self` : self employed = 1; otherwise = 0
  - `beamt` : civil servant = 1; otherwise = 0
  - `docvis` : **Variable a expliquer** number of doctor visits in last
    three months
  - `public` : insured in public health insurance = 1; otherwise = 0
  - `addon` : insured by add-on insurance = 1; otherswise = 0


``` diff
- (23 Mars 2020) la base test (6 lignes) est en ligne, ainsi que les bases personnalisées
```

Le but du devoir est de mettre en oeuvre, sur des vraies données, les
techniques exposées en cours.

  - Date limite pour envoyer le devoir **1er mai** avant **midi**,
  - Chaque étudiant(e) doit envoyer via [moodle](https://www.moodle2.uqam.ca/) deux
    fichiers : `devoir3-ABCD12345678.html`, output d’un fichier
    `devoir3-ABCD12345678.Rmd` (il faudra envoyer les deux fichiers), où
    `ABCD12345678` doit être remplacé par le code permanent de
    l’étudiant(e). Le fichier `devoir3-ABCD12345678.html` doit être
    lisible et le fichier `devoir3-ABCD12345678.Rmd` doit compiler sans
    erreur,
  
  __**En cas de soucis avec moodle**__ un envoi par messagerie électronique [charpentier.arthur@uqam.ca](mailto:charpentier.arthur@uqam.ca) est possible (la date butoir reste la même : **1er mai** à **midi**)
  
  - Dans le preambule du markdown, `author:` doit mentionner le code
    permanent,
  - Le fichier doit contenir trois parties

<!-- end list -->

1.  Une partie exploratoire qui presente rapidement les variables qui
    pourraient être intéressantes (pour rappel, `docvis` est la
    variable d’interêt)
2.  Une partie presentant la construction du modèle : il s’agira de
    partir au choix (i) d’un modele simple, et de montrer comment
    l’ameliorer, (ii) d’une modele complexe, et de montrer comment le
    simplifier
3.  Une partie qui compare les deux modèles avec les AIC des modèles

<!-- end list -->

  - Les techniques de validation croisee, ou la constitution de bases
    d’apprentissage et de test *ne sont pas au programme* et ne
    devront pas etre utilisee ici \!
  - Les seuls packages autorises (sauf autorisation explicite) sont
    `MASS`, `lmtest`, `counts`, `nortest`, `car`, `splines`, `AER`, `dplyr`, `aod`, `vcd`, `statmod` (et les dépendances associées)
