STT5100 (H2023) devoir 1
================

``` r
code_permanent = "ABCD12345678"
loc_fichier = paste("http://freakonometrics.free.fr/STT5100/",code_permanent,"-H2023D1.RData",sep="")
download.file(loc_fichier, "base_devoir_1.RData")
load("base_devoir_1.RData")
dim(basedevoir)
```

    ## [1]  6 33

La base contient des informations par élèves dans deux écoles, avec 33 variables,

- `ecole` : école de l’élève (binaire : “A” ou “B”)
- `sexe` : sexe de l’étudiant (binaire : “F” - femme ou “M” - homme)
- `age` : âge de l’étudiant (numérique : de 15 à 22)
- `geographie` : type d’adresse du domicile de l’étudiant (binaire :
  “U” - urbain ou “R” - rural)
- `tailleFamille` : taille de la famille (numérique)
- `parents` : statut de cohabitation des parents (binaire : “T” - vivant
  ensemble ou “A” - séparés)
- `educMere` : niveau d’instruction de la mère (numérique : 0 - aucune,
  1 - enseignement primaire (4e année), 2 - de la 5e à la 9e année, 3 -
  enseignement secondaire ou 4 - enseignement supérieur).
- `educPere` : niveau d’éducation du père (numérique : 0 - aucune, 1 -
  enseignement primaire (4e année), 2 - de la 5e à la 9e année, 3 -
  enseignement secondaire ou 4 - enseignement supérieur)
- `metierMere` : emploi de la mère (nominal : “enseignant”, “santé”,
  “services” civils (par exemple, administration ou police), “à la
  maison” ou “autre”).
- `metierPere` : Emploi du père (nominal : “enseignant”, “santé”,
  “services” civils (par exemple, administration ou police),
  “à_la_famille” ou “autre”)
- `choixEcole` : raison pour laquelle l’élève a choisi cette école
  (nominal : proximité du “domicile”, “réputation” de l’école,
  préférence pour un “cours” ou “autre”).
- `tuteur` : tuteur de l’élève (nominal : “mère”, “père” ou “autre”)
- `tempsTransport` : temps de trajet domicile-école, en minutes
- `tempsEtude` : temps d’étude hebdomadaire, en minutes
- `echec` : nombre d’échecs en classe dans le passé (numérique : n si
  1\<=n\<3, sinon 4)
- `extraSupport` : soutien scolaire supplémentaire (binaire : oui ou
  non)
- `extra` : soutien scolaire familial (binaire : oui ou non)
- `activites` : cours supplémentaires rémunérés dans la matière du cours
  (mathématiques ou français) (binaire : oui ou non)
- `activites` : activités extra-scolaires (binaire : oui ou non)
- `garderie` : a fréquenté l’école maternelle (binaire : oui ou non)
- `etudesSup` : souhaite suivre des études supérieures (binaire : oui ou
  non)
- `internet` : accès à l’internet à la maison (binaire : oui ou non)
- `romance` : avec une relation amoureuse (binaire : oui ou non)
- `familleQual` : qualité des relations familiales (numérique : de 1 -
  très mauvaise à 5 - excellente)
- `tempsLibre` : temps libre après l’école (numérique : de 1 - très
  faible à 5 - très élevé)
- `sorties` : sorties avec des amis (numérique : de 1 - très faible à
  5 - très élevé)
- `alcoolSemaine` : consommation d’alcool pendant les journées de
  travail (numérique : de 1 - très faible à 5 - très élevée)
- `alcoolWE` : consommation d’alcool le week-end (numérique : de 1 -
  très faible à 5 - très élevée)
- `sante` : état de santé actuel (numérique : de 1 - très mauvais à 5 -
  très bon)
- `absences` : nombre d’absences scolaires (numérique : de 0 à 100)
- `intra1` : note de la première période (numérique : de 0 à 100)
- `intra2` : note de la deuxième période (numérique : de 0 à 100)
- `final` : note finale (numérique : de 0 à 100) **variable à prédire**

``` r
str(basedevoir)
```

    ## 'data.frame':    6 obs. of  33 variables:
    ##  $ ecole         : Factor w/ 2 levels "A","B": 1 2 1 1 2 1
    ##  $ sexe          : chr  "M" "F" "M" "M" ...
    ##  $ age           : int  18 16 16 18 18 16
    ##  $ geographie    : Factor w/ 2 levels "campagne","ville": 2 1 2 2 2 2
    ##  $ tailleFamille : int  5 5 5 4 3 5
    ##  $ parents       : Factor w/ 2 levels "separes","ensembles": 2 2 2 2 1 2
    ##  $ educMere      : Factor w/ 5 levels "aucune","primaire14",..: 3 3 2 3 2 1
    ##  $ educPere      : Factor w/ 5 levels "aucune","primaire14",..: 2 4 3 2 3 3
    ##  $ metierMere    : Factor w/ 5 levels "maison","sante",..: 4 1 4 3 1 3
    ##  $ metierPere    : Factor w/ 5 levels "maison","sante",..: 4 4 4 3 3 3
    ##  $ choixEcole    : Factor w/ 4 levels "cours","maison",..: 4 3 3 2 4 3
    ##  $ tuteur        : Factor w/ 3 levels "pere","mere",..: 2 2 2 2 2 2
    ##  $ tempsTransport: num  5 18 4 8 29 9
    ##  $ tempsEtude    : num  590 230 70 190 170 30
    ##  $ echec         : int  0 0 0 0 0 0
    ##  $ extraSupport  : Factor w/ 2 levels "non","oui": 1 1 1 1 1 1
    ##  $ familleSupport: Factor w/ 2 levels "non","oui": 1 2 2 1 1 1
    ##  $ extra         : Factor w/ 2 levels "non","oui": 2 1 1 1 1 1
    ##  $ activites     : Factor w/ 2 levels "non","oui": 2 2 2 2 1 1
    ##  $ garderie      : Factor w/ 2 levels "non","oui": 2 2 2 2 2 1
    ##  $ etudesSup     : Factor w/ 2 levels "non","oui": 2 2 2 2 2 2
    ##  $ internet      : Factor w/ 2 levels "non","oui": 2 2 2 2 2 2
    ##  $ romance       : Factor w/ 2 levels "non","oui": 1 1 2 1 1 1
    ##  $ familleQual   : Factor w/ 5 levels "tres mauvaise",..: 4 3 3 5 4 4
    ##  $ tempsLibre    : Factor w/ 5 levels "tres faible",..: 2 3 3 2 4 3
    ##  $ sorties       : Factor w/ 5 levels "tres faible",..: 4 3 3 4 3 2
    ##  $ alcoolSemaine : Factor w/ 5 levels "tres faible",..: 1 1 1 1 1 2
    ##  $ alcoolWE      : Factor w/ 5 levels "tres faible",..: 3 1 2 2 2 4
    ##  $ sante         : Factor w/ 5 levels "tres mauvaise",..: 2 2 3 4 4 5
    ##  $ absences      : int  6 0 0 8 0 0
    ##  $ intra1        : num  78.2 40.5 54.2 78.8 62.5 ...
    ##  $ intra2        : num  70.5 52.5 45.8 71.5 66.8 ...
    ##  $ final         : num  72 54.8 59.5 71.5 72.5 ...

``` diff
- (21 janvier 2023) la base est en ligne
```

Le but du devoir est de mettre en oeuvre, sur des vraies données, les
techniques exposées en cours.

*   Date limite pour envoyer le devoir **14 novembre** a **midi**,
*   Chaque etudiant(e) doit déposer sur l’espace dédié, sur [Moodle](https://ena01.uqam.ca/mod/assign/view.php?id=3199734),
    trois fichiers : `devoir1-ABCD12345678.hmtl`, sortie d’un fichier
    `devoir1-ABCD12345678.Rmd`, et `prevision-devoir1-ABCD12345678.RData` (il faudra envoyer les deux fichiers), où
    `ABCD12345678` doit être remplacé par le code permanent de
    l’étudiant(e). Le fichier `devoir1-ABCD12345678.hmtl` doit etre
    lisible et le fichier `devoir1-ABCD12345678.Rmd` doit compiler sans
    erreur. Le troisième fichier, `prevision-devoir1-ABCD12345678.RData`
    sera détaillé plus bas,
*   Dans le preambule du markdown, `author:` doit mentionner le code
    permanent,
*  Le fichier doit contenir quatre parties

1.  Une partie exploratoire qui presente rapidement les variables qui
    pourraient etre intéressantes pour prédire ensuite la valeur des
    maisons (pour rappel, `ValeurMaison` est la variable d’interet)
2.  Une partie presentant la construction d'un modele "simple", par exemple 
    partir au choix (i) d’un modele simple, et de montrer comment
    l’ameliorer, (ii) d’un modele complexe, et de montrer comment le
    simplifier
3.  Une partie proposant une amélioration du modèle, par exemple en transformant une variable explicative
4.  Une partie qui presente les deux modeles, en donnant (i) le R2
    ajuste (ii) l’indice d’Akaike AIC et (iii) l’indice BIC (iv) la
    liste des variables explicatives retenues,
4.  Une prévision **des deux modèles** sur la base de test donnée ci-dessous,

``` r
loc_fichier = "http://freakonometrics.free.fr/STT5100/TestH2023-D1.RData"
download.file(loc_fichier, "base_test_devoir_1.RData")
load("base_test_devoir_1.RData")
```

Plus précisément, une fois construit les deux modèles (je fais ici deux modèles simplistes pour illustrer),

``` r
model_1 = lm(final ~ 1, data = basedevoir)
idx = which((basedevoir$final > min(basedevoir$final )) & (basedevoir$final < max(basedevoir$final )))
sous_basedevoir = basedevoir[idx,]
model_2 = lm(final ~ 1, data = sous_basedevoir)
```

on va construire une base avec les prix prédits sur les données de cette
nouvelle base

``` r
note_1 = predict(model_1, newdata = basetest)
note_2 = predict(model_2, newdata = basetest)
base_prediction = data.frame(indice = as.numeric(rownames(basetest)),
                             model_1 = note_1,
                             model_2 = note_2)
apply(base_prediction,2,mean)[2:3]
```

    ##  model_1  model_2 
    ## 65.04167 65.75000

Cette base doit contenir 256 observations ! (ce qu'on vérifie rapidement)

``` r
dim(base_prediction)
```

    ## [1] 256   3

On va alors l’exporter

``` r
names(base_prediction) = c("indice",paste("model_",1:2,"_",code_permanent,sep=""))
save(base_prediction, file = paste("prevision-devoir1-",code_permanent,".RData",sep=""))
```

Vérifions que le fichier a bien été créé

``` r
rm(list = "base_prediction")
load( paste("prevision-devoir1-",code_permanent,".RData",sep=""))
str(base_prediction)
```

    ## 'data.frame':    256 obs. of  3 variables:
    ##  $ indice              : num  1 2 3 4 5 6 7 8 9 10 ...
    ##  $ model_1_ABCD12345678: num  65 65 65 65 65 ...
    ##  $ model_2_ABCD12345678: num  65.8 65.8 65.8 65.8 65.8 ...

* tout test utilisé qui n'a pas été présenté dans le cadre du cours devra être expliqué, motivé, et pointer vers une référence (la commande pour insérer un lien est, e.g. `[Anderson Darling](https://en.wikipedia.org/wiki/Anderson%E2%80%93Darling_test)`). Dans le cas contraire, des points seront enlevés.
* les seuls packages autorises (sauf autorisation explicite) sont `MASS`, `lmtest`, `nortest`, `car`, `splines`, `AER`, `splines`, `Hmisc`, `np` les packages graphiques `ggplot2` (et éventuellement de couleurs, ou de mise en forme `knitr`, `stargazer`, `DT`, `papeR`, `formattable` etc), de manipulation de données `dplyr`, ainsi que les fonctions de base de `stats`. L'utilisation de tout autre package devra être demandée au préalable. Sinon, des points seront enlevés.
* la forme du document et sa lisibilité interviendront dans la notation. Afficher des tableaux de plusieurs centaines de lignes, par exemple, est à proscrire.
* les rapports sont individuels ! s'il est autorisé de discuter avec d'autres élèves du groupe (en respectant le protocol sanitaire en vigueur), chacun doit rendre son propre rapport. Dans le cas où deux fichiers identiques seraient envoyés par deux élèves différents, les deux élèves seront sanctionnés.

<img src="https://github.com/freakonometrics/STT5100/blob/master/archives/A2018/obviously.png" alt="drawing" width="300" align=right/>

* le fichier html doit être lisible dans un navigateur internet (Firefox) et le code Rmd doit compiler sans erreur. Le préambule du fichier Rmd doit contenir comme auteur le code permanent. Tout fichier qui ne compile pas et/ou qui n'est pas lisible donnera lieu à une forte pénalisation.

Au niveau pratique, pour avoir accès à _vos_ données, vous devez remplacer `"ABCD12345678"` ci-dessus par votre **vrai** code permanent (avec les lettres en majuscules).
