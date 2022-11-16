STT5100 (A2022) devoir 2
================

Le but du devoir est de mettre en oeuvre, sur des vraies données, les
techniques exposées en cours.

``` r
code_permanent = "ABCD12345678"
loc_fichier = paste("http://freakonometrics.free.fr/STT5100/",code_permanent,"-A2022D2.RData",sep="")
download.file(loc_fichier, "base_devoir_2.RData")
load("base_devoir_2.RData")
dim(basedevoir)
```

    ## [1]  6 12

La base contient des données de banques en Europe, et le but est de
comprendre qui a quitté la banque (modélisation du taux d’attrition, ou
“[churn](https://fr.wikipedia.org/wiki/Attrition_(taux))”)

-   `Id` = identifiant du client (numéro)
-   `ScoreCredit` = score de crédit du client, entre 350 et 850
-   `Pays` = pays de résidence du client (`France` 50%, `Germany` 25% et
    `Spain` 25%)
-   `Genre` = sexe du client (`Female` 45% et `Male` 55%)
-   `Age` = âge du client (numérique, entre 18 ans et 92 ans)
-   `Anciennete` = nombre d’année d’ancienneté (numérique, entre 0 et 10
    ans)
-   `Balance` = balance du compte courant (entre 0 et 250,000 euros)
-   `NbProduits` = nombre de comptes dans la banque (entre 1 et 4)
-   `CarteCredit` = possession (ou pas) d’une carte de crédit (`0` ou
    `1`)
-   `Actif` = le client est-il “actif” (`0` ou `1`)
-   `Salaire` = salaire annuel estimé du client (en euros, entre 10 et
    200,000 euros)
-   `Depart` = indicatrice (`0` ou `1`) indiquant si le client a quitté
    la banque **variable a expliquer**

``` r
str(basedevoir)
```

    ## 'data.frame':    6 obs. of  12 variables:
    ##  $ Id         : int  15620505 15584580 15640280 15644788 15730059 15698528
    ##  $ ScoreCredit: int  594 443 850 731 638 599
    ##  $ Pays       : chr  "Spain" "France" "France" "France" ...
    ##  $ Genre      : chr  "Female" "Male" "Male" "Female" ...
    ##  $ Age        : int  24 35 39 30 44 31
    ##  $ Anciennete : int  0 6 4 5 9 3
    ##  $ Balance    : num  97379 161111 127771 0 77637 ...
    ##  $ NbProduits : int  1 1 2 2 2 1
    ##  $ CarteCredit: int  1 0 0 1 1 1
    ##  $ Actif      : int  1 0 1 0 1 1
    ##  $ Salaire    : num  71405 13947 151739 189529 111346 ...
    ##  $ Depart     : int  0 0 0 0 0 1

``` diff
- (16 novembre 2022) la base est en ligne
```

Le but du devoir est de mettre en oeuvre, sur des vraies données, les
techniques exposées en cours.

-   Date limite pour envoyer le devoir **4 décembre** a **midi**,
-   Chaque etudiant(e) doit déposer sur l’espace dédié, sur Moodle,
    trois fichiers : `devoir2-ABCD12345678.hmtl`, sortie d’un fichier
    `devoir2-ABCD12345678.Rmd` (il faudra envoyer les deux fichiers), où
    `ABCD12345678` doit être remplacé par le code permanent de
    l’étudiant(e). Le fichier `devoir2-ABCD12345678.hmtl` doit etre
    lisible et le fichier `devoir2-ABCD12345678.Rmd` doit compiler sans
    erreur. Le troisième fichier, `prevision-devoir2-ABCD12345678.RData`
    sera détaillé plus bas,
-   Dans le preambule du markdown, `author:` doit mentionner le code
    permanent,
-   Le fichier doit contenir cinq parties

1.  Présentation des données

Dans une première partie, il faudra un peu de statistique descriptives,
montrant quelles variables sont a priori corrélées avec la variable
d’intérêt. Des graphiques sont attendus dans cette partie. Dans cette
partie, vous avez le droit de transformer vos variables et de supprimer
certains individus, si vous l’expliquez.

2.  Un premier modèle

En utilisant les techniques du cours, et uniquement les techniques du
cours, il faudra expliquer comment vous avez contruit un premier modèle
qui vous semble valide.

3.  Le modèle final

Dans un second temps, vous essayerez d’améliorer ce premier modèle,
peut-être en tenant compte de non-linéarités potentielles, ou en
regroupant des modalités de variables qualitatives.

4.  Indicateurs

Dans une section spécifique, il faudra indiquer

-   le AIC du modèle retenu
-   le BIC du modèle retenu
-   le AUC du mdoèle retenu et de tracer la courbe ROC de vos deux
    modèles.

5.  Prévision sur la base de test donnée ci-dessous,

``` r
loc_fichier = "http://freakonometrics.free.fr/STT5100/TestA2022D2.RData"
download.file(loc_fichier, "base_test_devoir_2.RData")
load("base_test_devoir_2.RData")
```

Plus précisément, une fois construit les deux modèles,

``` r
model_1 = glm(Depart ~ 1, data = basedevoir, family=binomial)
model_2 = glm(Depart ~ 1, data = basedevoir, family=binomial)
```

On va construire une base avec les prix prédits sur les données de cette
nouvelle base

``` r
proba_1 = predict(model_1, newdata = basetest, type="response")
proba_2 = predict(model_2, newdata = basetest, type="response")
base_prediction = data.frame(indice = as.numeric(rownames(basetest)),
                             model_1 = proba_1,
                             model_2 = proba_2)
apply(base_prediction,2,mean)[2:3]
```

    ##   model_1   model_2 
    ## 0.1666667 0.1666667

Cette base doit contenir 400 observations !

``` r
dim(base_prediction)
```

    ## [1] 400   3

On va alors l’exporter

``` r
save(base_prediction, file = paste("prevision-devoir2-",code_permanent,".RData",sep=""))
```

-   Le fichier html doit être lisible dans un navigateur internet
    (Firefox) et le code Rmd doit compiler sans erreur. Le préambule du
    fichier Rmd doit contenir comme auteur le code permanent. Tout
    fichier qui ne compile pas et/ou qui n’est pas lisible donnera lieu
    à une forte pénalisation.
-   Les rapports sont individuels ! s’il est autorisé de discuter avec
    d’autres élèves du groupe (en respectant le protocol sanitaire en
    vigueur), chacun doit rendre son propre rapport. Dans le cas où deux
    fichiers identiques seraient envoyés par deux élèves différents, les
    deux élèves seront sanctionnés.
-   La forme du document et sa lisibilité interviendront dans la
    notation. Afficher des tableaux de plusieurs centaines de lignes,
    par exemple, est à proscrire.
-   les seuls packages autorises (sauf autorisation explicite) sont
    `MASS`, `car`, `splines`, `AER`, `Hmisc`, `pROC`, `ROCR`, les
    packages graphiques `ggplot2` (et éventuellement de couleurs, ou de
    mise en forme `knitr`, `stargazer`, `formattable` etc), de
    manipulation de données `dplyr` ou `tidyverse`, ainsi que les
    fonctions de base de stats. L’utilisation de tout autre package
    devra être demandée au préalable. Sinon, des points seront enlevés.
