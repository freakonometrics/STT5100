STT5100 (H2022) devoir 2
================

Le but du devoir est de mettre en oeuvre, sur des vraies données, les
techniques exposées en cours.

  - Date limite pour envoyer le devoir **29 avril** avant **midi**,
  - Chaque étudiant(e) doit envoyer via [moodle](https://www.moodle2.uqam.ca/) trois
    fichiers : un _rapport_ `devoir2-ABCD12345678.html`, output d’un fichier
    `devoir2-ABCD12345678.Rmd`, et une _base de données_ `devoir2-ABCD12345678.Rda` (il faudra envoyer les trois fichiers), où
    `ABCD12345678` doit être remplacé par le code permanent de
    l’étudiant(e). Le fichier `devoir2-ABCD12345678.html` doit être
    lisible et le fichier `devoir2-ABCD12345678.Rmd` doit compiler sans
    erreur. La base `devoir2-ABCD12345678.Rda` doit contenir 19017 lignes.
  
  __**En cas de soucis avec moodle**__ un envoi par messagerie électronique [charpentier.arthur@uqam.ca](mailto:charpentier.arthur@uqam.ca) est possible (la date butoir reste la même : **29 avril** à **midi**)
  
  - Dans le preambule du markdown, `author:` doit mentionner le code
    permanent (`author: "ABCD12345678: John Doe"`),
  - Le _rapport_ doit contenir trois parties

<!-- end list -->

1.  Une partie exploratoire qui presente rapidement les variables qui
    pourraient être intéressantes (`target_accident` est la
    variable d’interêt)
2.  Une partie presentant la construction du modèle : il s’agira de
    partir au choix (i) d’un modèle simple, correspondant à un modèle logistique sans transformer les variables, `model1` (ii) d’un modèle plus complexe, `model2` avec des possibles transformations des variables explicatives ou de la variable d'intérêt, etc
3.  Une partie qui presente succintement les modèles, en donnant, sur la base d'apprentissage (i) l’indice d’Akaike AIC (ii) l’indice BIC, (iii) la courbe ROC, et (iv) la
    liste des variables explicatives retenues

* à la fin, vous devez faire des prévisions de la probabilité associée à la variable `target_accident`, sur une base de test `test_data_students`, à l'aide des deux modèles `model1` et `model2`. Les prévisions seront stockées dans une même base, exportées dans un fichier `Rda`, et le fichier devra être déposé sur Moodle.
* tout test utilisé qui n'a pas été présenté dans le cadre du cours devra être expliqué, motivé, et pointer vers une référence (la commande pour insérer un lien est, e.g. `[Anderson Darling](https://en.wikipedia.org/wiki/Anderson%E2%80%93Darling_test)`). Dans le cas contraire, des points seront enlevés.
* les seuls packages autorises (sauf autorisation explicite) sont `MASS`, `lmtest`, `nortest`, `car`, `splines`, `AER`, `splines`, `Hmisc`, `np` les packages graphiques `ggplot2` (et éventuellement de couleurs, ou de mise en forme `knitr`, `stargazer`, `DT`, `papeR`, `formattable` etc), de manipulation de données `dplyr`, ainsi que les fonctions de base de `stats`. L'utilisation de tout autre package devra être demandée au préalable. Sinon, des points seront enlevés.
* la forme du document et sa lisibilité interviendront dans la notation. Afficher des tableaux de plusieurs centaines de lignes, par exemple, est à proscrire.
* les rapports sont individuels ! s'il est autorisé de discuter avec d'autres élèves du groupe (en respectant le protocol sanitaire en vigueur), chacun doit rendre son propre rapport. Dans le cas où deux fichiers identiques seraient envoyés par deux élèves différents, les deux élèves seront sanctionnés.

<img src="https://github.com/freakonometrics/STT5100/blob/master/archives/A2018/obviously.png" alt="drawing" width="300" align=right/>

* le fichier html doit être lisible dans un navigateur internet (Firefox) et le code Rmd doit compiler sans erreur. Le préambule du fichier Rmd doit contenir comme auteur le code permanent. Tout fichier qui ne compile pas et/ou qui n'est pas lisible donnera lieu à une forte pénalisation.

Au niveau pratique, pour avoir accès à _vos_ données, vous devez remplacer `"ABCD12345678"` ci-dessous par votre **vrai** code permanent (avec les lettres en majuscules)

``` r
code_permanent = "ABCD12345678"
loc_fichier = paste("http://freakonometrics.free.fr/STT5100/H2022/devoir2/data_",code_permanent,"_train.Rda",sep="")
download.file(loc_fichier, "base_devoir_1.Rda")
load("base_devoir_1.Rda")
dim(data_students)
```

    ## [1]  6 24

**Note (Windows)** Il semble qu'il puisse y avoir un soucis avec Windows. Si le code précédant ne marche pas, il faudra utiliser l'option `mode= "wb"` (_The `wb` indicates that the file is opened for writing in binary mode_)

``` r
download.file(loc_fichier, "base_devoir_1.Rda", mode= "wb")
load("base_devoir_1.Rda")
dim(data_students)
```

    ## [1]   6 24

On vous donne un ensemble de contrats d'assurances, accompagnés de la variable `target_accident` qui indique la survenance (ou pas) d'un accident. On vous demande de faire une
prévision sur la survenance d'un accident. Les covariables de la base sont ici

-   `state`: US state (by 2 letter postal abbreviation)(nominal)


Vous devez ensuite construire vos modèles, par exemple

``` r
model1 = glm(target_accident~1, data = data_students, family=binomial)
model2 = glm(target_accident~1+drv_sex1 , data = data_students, family=binomial)
```

Pour finir, vous devez faire une prévision à partir de la base
`test_data_students`,

``` r
code_test = "test"
loc_fichier = paste("http://freakonometrics.free.fr/STT5100/H2022/devoir2/data_",code_test,".Rda",sep="")
download.file(loc_fichier, "base_devoir_1_test.Rda", mode= "wb")
load("base_devoir_1_test.Rda")
dim(test_data_students)
```

    ## [1] 19017    23

On construit alors 2 séries de prévisions, à partir des 2 modèles

``` r
prevision = data.frame(yhat_1 = predict(model1, newdata = test_data_students, type="response"),
                       yhat_2 = predict(model2, newdata = test_data_students, type="response"))
names(prevision) = paste("Y_",code_permanent,1:ncol(prevision),sep="")
str(prevision)
```

    ## 'data.frame':    19017 obs. of  2 variables:
    ##  $ Y_ABCD123456781: num  2.14e-11 2.14e-11 2.14e-11 2.14e-11 2.14e-11 ...
    ##  $ Y_ABCD123456782: num  2.14e-11 2.14e-11 2.14e-11 2.14e-11 2.14e-11 ...

``` r
nom_fichier = paste("STT5100_2022_",code_permanent,"_test.Rda",sep="")
save("prevision", file = nom_fichier)
```

Vérifions que le fichier STT5100_2022_ABCD12345678_test.Rda a bien été
créé

``` r
rm(list = "prevision")
load(nom_fichier)
str(prevision)
```

    ## 'data.frame':    19017 obs. of  2 variables:
    ##  $ Y_ABCD123456781: num  2.14e-11 2.14e-11 2.14e-11 2.14e-11 2.14e-11 ...
    ##  $ Y_ABCD123456782: num  2.14e-11 2.14e-11 2.14e-11 2.14e-11 2.14e-11 ...
