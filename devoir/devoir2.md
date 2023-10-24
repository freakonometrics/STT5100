STT5100 (A2023) devoir 2
================

``` r
code_permanent = "ABCD12345678"
loc_fichier = paste("http://freakonometrics.free.fr/STT5100/A2023/Devoir2/STT5100A2023Devoir2",code_permanent,".RData",sep="")
download.file(loc_fichier, "base_devoir.RData")
load("base_devoir.RData")
dim(base_6_stt5100_a2023)
```

    ## [1]  6 30

La base contient les informations sur des personnes hospitalisées

- `y` : variable binaire indiquant la gravité de l'état de patient **variable à prédire**
- `age` : âge de la personne hospitalisée
- `death` : décès avant la date de construction de la base de données
- `sex` : sexe de la personne
- `dead_in_hosp` : indication d'une mort à l'hôpital
- `days_before_discharge` : nombre de jours avant de quitter l'hôpital
- `days_follow_up` : nombre de jours de suivi
- `disease_group` : maladie (groupe)
- `disease_class` : maladie (classe)
- `comorbidities` : nombre de comorbidités
- `income` : revenu de la personne
- `coma_score` : score de coma
- `race` : race de la personne
- `psych_score` : score psychologique
- `day_admission` : nombre de jours passé à l'hôpital
- `diabetes` : score de diabète
- `dementia` : score de démence
- `arterial_blood_pressure` : pression artérielle
- `heart_rate` : rythme cardiaque
- `respiration_index` :  indice de respiration
- `temperature_celsius` : température de la personne (en degrés celsius)
- `var_medic_1` : variable médicale (no1)
- `score_medic_2` : variable médicale (no2)
- `score_medic_3` : variable médicale (no3)
- `var_medic_4` : variable médicale (no4)
- `var_medic_5` : variable médicale (no5)
- `var_medic_6` : variable médicale (no6)
- `var_medic_7` : variable médicale (no7)
- `var_medic_8` : variable médicale (no8)
- `score_medic_9` :  variable médicale (no9)

``` r
str(base_6_stt5100_a2023)
```

    ## 'data.frame':    6 obs. of  30 variables:
    ##  $ age                    : num  76.8 51.4 73.9 92.6 64.7 ...
    ##  $ death                  : int  0 1 1 1 0 1
    ##  $ sex                    : chr  "female" "male" "male" "female" ...
    ##  $ dead_in_hosp           : int  0 0 0 0 0 0
    ##  $ days_before_discharge  : int  5 17 9 16 4 5
    ##  $ days_follow_up         : int  808 183 93 54 789 70
    ##  $ disease_group          : chr  "ARF/MOSF w/Sepsis" "Lung Cancer" "CHF" "ARF/MOSF w/Sepsis" ...
    ##  $ disease_class          : chr  "ARF/MOSF" "Cancer" "COPD/CHF/Cirrhosis" "ARF/MOSF" ...
    ##  $ comorbidities          : int  1 4 6 1 2 1
    ##  $ income                 : chr  "" "$11-$25k" "under $11k" "$25-$50k" ...
    ##  $ coma_score             : int  0 0 0 44 0 0
    ##  $ score_medic_9          : num  10 13.7 7.5 18.3 7 ...
    ##  $ race                   : chr  "white" "white" "white" "white" ...
    ##  $ psych_score            : num  13.3 17.5 26.2 23.7 15.3 ...
    ##  $ var_medic_1            : int  30 13 45 33 5 23
    ##  $ score_medic_2          : num  0.894 0.729 0.741 0.512 0.839 ...
    ##  $ score_medic_3          : num  0.856 0.457 0.593 0.396 0.648 ...
    ##  $ day_admission          : int  1 1 1 1 1 1
    ##  $ diabetes               : int  0 0 0 0 1 0
    ##  $ dementia               : int  0 0 0 0 0 0
    ##  $ var_medic_4            : chr  "no" "metastatic" "no" "no" ...
    ##  $ var_medic_5            : chr  "no dnr" "no dnr" "dnr before sadm" "no dnr" ...
    ##  $ var_medic_6            : int  5 17 -1 16 4 5
    ##  $ arterial_blood_pressure: num  105 51 73 120 62 74
    ##  $ heart_rate             : num  80 60 65 115 65 88
    ##  $ respiration_index      : int  28 6 8 24 28 24
    ##  $ temperature_celsius    : num  36.3 35.2 38.6 36 36 ...
    ##  $ var_medic_7            : num  0.7 2.3 1.4 1.6 1.8 ...
    ##  $ var_medic_8            : int  142 141 143 141 132 142
    ##  $ y                      : Factor w/ 2 levels "0","1": 2 2 2 1 2 2


``` diff
- (24 octobre 2023) la base est en ligne
```

Le but du devoir est de mettre en oeuvre, sur des vraies données, les
techniques exposées en cours.

*   Date limite pour envoyer le devoir **20 décembre 2023** a **midi**,
*   Chaque etudiant(e) doit déposer sur l’espace dédié, sur [Moodle](https://ena01.uqam.ca/mod/assign/view.php),
    trois fichiers : `STT5100A2023Devoir2ABCD12345678.hmtl`, sortie d’un fichier
    `STT5100A2023Devoir2ABCD12345678.Rmd`, et `STT5100A2023Devoir2ABCD12345678.RData` (il faudra envoyer les deux fichiers), où
    `ABCD12345678` doit être remplacé par le code permanent de
    l’étudiant(e). Le fichier `STT5100A2023Devoir2ABCD12345678.hmtl` doit etre
    lisible et le fichier `STT5100A2023Devoir2ABCD12345678.Rmd` doit compiler sans
    erreur. Le troisième fichier, `STT5100A2023Devoir2Prevision_ABCD12345678_test.RData`
    sera détaillé plus bas,
*   Dans le preambule du markdown, `author:` doit mentionner le code
    permanent,
*  Le fichier doit contenir quatre parties

1.  Une partie exploratoire qui presente rapidement les variables qui
    pourraient etre intéressantes pour prédire ensuite le nombre de vélos empruntés (pour rappel, `y` est la variable d’interet)
2.  Une partie presentant la construction d'un modele "simple", par exemple 
    partir au choix (i) d’un modele simple, et de montrer comment
    l’ameliorer, (ii) d’un modele complexe, et de montrer comment le
    simplifier
3.  Une partie proposant une amélioration du modèle, par exemple en transformant une ou plusieurs variables explicatives, voire en modélisant le logarithme de la variable d'intérêt
4.  Une partie spécifique, qui indiquera
-    le AIC des deux modèles retenus
-    le BIC des modèles retenus
-    le AUC des modèles retenus et des graphiques avec la courbe ROC de vos deux modèles.


   Plus précisément, une fois construit les deux modèles (je fais ici deux modèles simplistes pour illustrer),

``` r
model1 = glm(y~1, data = base_6_stt5100_a2023, family="binomial")
model2 = glm(y~1+age , data = base_6_stt5100_a2023, family="binomial")
```

4.  Une prévision **des deux modèles** sur la base de test donnée ci-dessous,

``` r
loc_fichier = "http://freakonometrics.free.fr/STT5100/A2023/Devoir2/STT5100A2023Devoir2TEST.RData"
download.file(loc_fichier, "base_devoir_2_test.RData", mode= "wb")
load("base_devoir_2_test.RData")
dim(base_test_stt5100_a2023)
```

    ## [1] 1036   29

``` r
prevision = data.frame(yhat_1 = predict(model1, 
                                        newdata = base_test_stt5100_a2023,
                                        type="response"),
                       yhat_2 = predict(model2, 
                                        newdata = base_test_stt5100_a2023,
                                        type="response"))
names(prevision) = paste("Y_",code_permanent,"_",1:ncol(prevision),sep="")
tail(prevision)
```

    ##      Y_ABCD12345678_1 Y_ABCD12345678_2
    ## 1031        0.8333333        1.0000000
    ## 1032        0.8333333        1.0000000
    ## 1033        0.8333333        0.8531455
    ## 1034        0.8333333        1.0000000
    ## 1035        0.8333333        1.0000000
    ## 1036        0.8333333        1.0000000

Cette base doit contenir 1036 observations ! (ce qu'on vérifie rapidement ici)

``` r
nom_fichier = paste("STT5100A2023Devoir2Prevision_",code_permanent,"_test.RData",sep="")
save("prevision", file = nom_fichier)
```

``` r
rm(list = "prevision")
load(nom_fichier)
str(prevision)
```

    ## 'data.frame':    1036 obs. of  2 variables:
    ##  $ Y_ABCD12345678_1: num  0.833 0.833 0.833 0.833 0.833 ...
    ##  $ Y_ABCD12345678_2: num  0.999996 0.000389 0.981104 1 1 ...


* tout test utilisé qui n'a pas été présenté dans le cadre du cours devra être expliqué, motivé, et pointer vers une référence (la commande pour insérer un lien est, e.g. `[Anderson Darling](https://en.wikipedia.org/wiki/Anderson%E2%80%93Darling_test)`). Dans le cas contraire, des points seront enlevés.
* les seuls packages autorises (sauf autorisation explicite) sont `MASS`, `lmtest`, `nortest`, `car`, `splines`, `AER`, `splines`, `Hmisc`, `np`, `pROC`, `ROCR`, `PRROC`, `plotROC`, `ROCit` les packages graphiques `ggplot2` (et éventuellement de couleurs, ou de mise en forme `knitr`, `stargazer`, `DT`, `papeR`, `formattable` etc), de manipulation de données `dplyr`, ainsi que les fonctions de base de `stats`. L'utilisation de tout autre package devra être demandée au préalable. Sinon, des points seront enlevés.
* la forme du document et sa lisibilité interviendront dans la notation. Afficher des tableaux de plusieurs centaines de lignes, par exemple, est à proscrire.
* les rapports sont individuels ! s'il est autorisé de discuter avec d'autres élèves du groupe (en respectant le protocol sanitaire en vigueur), chacun doit rendre son propre rapport. Dans le cas où deux fichiers identiques seraient envoyés par deux élèves différents, les deux élèves seront sanctionnés.

<img src="https://github.com/freakonometrics/STT5100/blob/master/archives/A2018/obviously.png" alt="drawing" width="300" align=right/>
