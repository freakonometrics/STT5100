STT5100 Exercice GLM
================
Arthur Charpentier

**Donnees**

``` r
base = read.table("http://freakonometrics.free.fr/baseaffairs.txt",header=TRUE)
str(base)
```

    ## 'data.frame':    563 obs. of  9 variables:
    ##  $ SEX         : int  1 0 0 1 1 0 0 1 0 1 ...
    ##  $ AGE         : num  37 27 32 57 22 32 22 57 32 22 ...
    ##  $ YEARMARRIAGE: num  10 4 15 15 0.75 1.5 0.75 15 15 1.5 ...
    ##  $ CHILDREN    : int  0 0 1 1 0 0 0 1 1 0 ...
    ##  $ RELIGIOUS   : int  3 4 1 5 2 2 2 2 4 4 ...
    ##  $ EDUCATION   : int  18 14 12 18 17 17 12 14 16 14 ...
    ##  $ OCCUPATION  : int  7 6 1 6 6 5 1 4 1 4 ...
    ##  $ SATISFACTION: int  4 4 4 5 3 5 3 4 2 5 ...
    ##  $ Y           : int  0 0 0 0 0 0 0 0 0 0 ...

``` r
tail(base)
```

    ##     SEX AGE YEARMARRIAGE CHILDREN RELIGIOUS EDUCATION OCCUPATION
    ## 596   1  47         15.0        1         3        16          4
    ## 597   1  22          1.5        1         1        12          2
    ## 598   0  32         10.0        1         2        18          5
    ## 599   1  32         10.0        1         2        17          6
    ## 600   1  22          7.0        1         3        18          6
    ## 601   0  32         15.0        1         3        14          1
    ##     SATISFACTION Y
    ## 596            2 7
    ## 597            5 1
    ## 598            4 6
    ## 599            5 2
    ## 600            2 2
    ## 601            5 1

``` r
table(base$Y)
```

    ## 
    ##   0   1   2   3   4   5   6   7   8  10 
    ## 451  34  17  19  12  11  11   5   2   1

Il s’agit d’une base construite à partir des données de l’article *A
Theory of Extramarital Affairs*, de Ray Fair, paru en 1978 dans le
*Journal of Political Economy*, avec 563 observations.

  - `Y` : nombre d’aventures extra-conjugales hétérosexuelles pendant
    l’année passée
  - `SEX` : 0 pour une femme, et 1 pour un homme
  - `AGE` : âge de la personne interrogée
  - `YEARMARRIAGE` : nombre d’années de mariage
  - `CHILDREN` : 0 si la personne n’a pas d’enfants (avec son épouse) et
    1 si elle en a
  - `RELIGIOUS` : degré de “religiosité”, entre 1 (anti-religieuse) à 5
    (très religieuse)
  - `EDUCATION` : nombre d’années d’éducation, 9=grade school, 12=high
    school, à 20=PhD
  - `OCCUPATION` : construit suivant l’échelle d’Hollingshead : Higher
    executives of large concerns, proprietors, and major professionals
    (1) Business managers, proprietors of medium-sized businesses, and
    lesser professionals (2) Administrative personnel, owners of small
    businesses, and minor professionals (3) Clerical and sales workers,
    technicians, and owners of little businesses (4) Skilled manual
    employees (5) Machine operators and semiskilled employees (6)
    Unskilled employees (7)
  - `SATISFACTION` : perception de son mariage, de très mécontente (1) à
    très contente (5)

Pour simplifier, on peut definir \* `ENFANTS` : `OUI` si la personne en
a, `NON` sinon \* `SEXE` : `F` pour une femme, et `H` pour un homme

``` r
base$SEXE="H"
base$SEXE[base$SEX=="0"]="F"
base$SEXE=as.factor(base$SEXE)
table(base$SEXE)
```

    ## 
    ##   F   H 
    ## 295 268

``` r
base$ENFANT="OUI"
base$ENFANT[base$CHILDREN==0]="NON"
base$ENFANT=as.factor(base$ENFANT)
table(base$ENFANT)
```

    ## 
    ## NON OUI 
    ## 164 399

Pour la premiere partie du cours, sur la **regression logistique**, on
va transformer la variable `Y` pour la rendre binaire (on supprimera
cette ligne pour faire une regression de Poisson)

``` r
base$Y = (base$Y>0)
table(base$Y)
```

    ## 
    ## FALSE  TRUE 
    ##   451   112
