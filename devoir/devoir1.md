STT5100 Devoir 1 Hiver 2025
================
Arthur Charpentier

``` r
code_permanent = "ABCD12345678"
loc_fichier = paste("http://freakonometrics.free.fr/STT5100/base_STT5100_H2025_Devoir1_",code_permanent,".RData",sep="")
download.file(loc_fichier, "base_devoir_1.RData")
load("base_devoir_1.RData")
tail(base_STT5100_H2025_1)
```

    ##   surface nb_chambres nb_sdb annee_construction terrain garage voisinage
    ## 1    1360           2      1               1981      60      0         5
    ## 2    4272           3      3               2016     475      1         6
    ## 3    3592           1      2               2016     363      0         9
    ## 4     966           1      2               1977     273      1         8
    ## 5    4926           2      1               1993     470      0         8
    ## 6    3944           5      3               1990     248      2         8
    ##      prix code_postal etage renovation
    ## 1  262383         NW1     3       1993
    ## 2  985261         SE1     3       2016
    ## 3  777977         SW3     3       2016
    ## 4  229699        SW1P     1       1995
    ## 5 1041741         NW8     1       1993
    ## 6  879797          W9     2       1990

``` r
str(base_STT5100_H2025_1)
```

    ## 'data.frame':    6 obs. of  11 variables:
    ##  $ surface           : int  1360 4272 3592 966 4926 3944
    ##  $ nb_chambres       : int  2 3 1 1 2 5
    ##  $ nb_sdb            : int  1 3 2 2 1 3
    ##  $ annee_construction: int  1981 2016 2016 1977 1993 1990
    ##  $ terrain           : num  60 475 363 273 470 248
    ##  $ garage            : int  0 1 0 1 0 2
    ##  $ voisinage         : int  5 6 9 8 8 8
    ##  $ prix              : num  262383 985261 777977 229699 1041741 ...
    ##  $ code_postal       : chr  "NW1" "SE1" "SW3" "SW1P" ...
    ##  $ etage             : num  3 3 3 1 1 2
    ##  $ renovation        : num  1993 2016 2016 1995 1993 ...

Les données sont des prix de maisons, à Londres (UK)

- `prix` : **Variable a expliquer** : prix de la maison
- `surface` : surface
- `nb_chambres` : nombre de chambres
- `nb_sdb` : nombre de salle de bain
- `annee_construction` : année de construction
- `terrain` : surface du terrain
- `garage` : nombre de garages
- `voisinage` : note du voisinage (1-10)
- `code_postal` : code postal de la maison
- `etage` : nombre d’étages dans la maison
- \`renovation\`\` : année de la dernière rénovation
