STT5100 — Devoir 1 — Automne 2026
================

## Données

Chaque étudiant(e) dispose d’une base de données différente. Pour
télécharger votre base, remplacez `"ABCD12345678"` par votre code
permanent, en conservant les lettres en majuscules.

``` r
code_permanent <- "ABCD12345678"

loc_fichier <- paste0(
  "https://raw.githubusercontent.com/freakonometrics/",
  "STT5100/master/devoir/",
  "data_devoir1_STT5100_A2026_",
  code_permanent,
  ".RData"
)

download.file(
  loc_fichier,
  "data_devoir1.RData",
  mode = "wb"
)

load("data_devoir1.RData")

head(data_devoir1)
```

    ##   income age education hours sex marital group union worktime worker industry
    ## 1   6500  30         4    26  S2      M2    G4    U1     <NA>   <NA>       I6
    ## 2  29700  28         3    40  S1      M1    G1    U1     <NA>   <NA>       I3
    ## 3  29700  38         2    40  S1      M2    G2    U2     <NA>   <NA>       I6
    ## 4   8500  34         2    42  S2      M1    G1    U1     <NA>   <NA>       I8
    ## 5  20900  31         3    40  S2      M1    G1    U1     <NA>   <NA>       I9
    ## 6  40200  40         4    44  S1      M2    G1    U1     <NA>   <NA>       I9
    ##   occupation region division metro
    ## 1         O4     R4       D8    A2
    ## 2         O1     R1       D1    A2
    ## 3         O8     R3       D5    A2
    ## 4         O3     R4       D8    A1
    ## 5         O1     R3       D5    A1
    ## 6         O1     R2       D4    A2

``` r
str(data_devoir1)
```

    ## 'data.frame':    6 obs. of  15 variables:
    ##  $ income    : num  6500 29700 29700 8500 20900 40200
    ##  $ age       : num  30 28 38 34 31 40
    ##  $ education : num  4 3 2 2 3 4
    ##  $ hours     : num  26 40 40 42 40 44
    ##  $ sex       : Factor w/ 2 levels "S1","S2": 2 1 1 2 2 1
    ##  $ marital   : Factor w/ 2 levels "M1","M2": 2 1 2 1 1 2
    ##  $ group     : Factor w/ 4 levels "G1","G2","G3",..: 4 1 2 1 1 1
    ##  $ union     : Factor w/ 2 levels "U1","U2": 1 1 2 1 1 1
    ##  $ worktime  : Factor w/ 12 levels "T1","T2","T3",..: NA NA NA NA NA NA
    ##  $ worker    : Factor w/ 8 levels "C1","C2","C3",..: NA NA NA NA NA NA
    ##  $ industry  : Factor w/ 16 levels "I1","I2","I3",..: 6 3 6 8 9 9
    ##  $ occupation: Factor w/ 10 levels "O1","O2","O3",..: 4 1 8 3 1 1
    ##  $ region    : Factor w/ 4 levels "R1","R2","R3",..: 4 1 3 4 3 2
    ##  $ division  : Factor w/ 9 levels "D1","D2","D3",..: 8 1 5 8 5 4
    ##  $ metro     : Factor w/ 2 levels "A1","A2": 2 2 2 1 1 2

À titre d’illustration, les premières lignes d’une base peuvent avoir la
structure suivante :

``` r
str(data_devoir1)
```

    ## 'data.frame':    6 obs. of  15 variables:
    ##  $ income    : num  6500 29700 29700 8500 20900 40200
    ##  $ age       : num  30 28 38 34 31 40
    ##  $ education : num  4 3 2 2 3 4
    ##  $ hours     : num  26 40 40 42 40 44
    ##  $ sex       : Factor w/ 2 levels "S1","S2": 2 1 1 2 2 1
    ##  $ marital   : Factor w/ 2 levels "M1","M2": 2 1 2 1 1 2
    ##  $ group     : Factor w/ 4 levels "G1","G2","G3",..: 4 1 2 1 1 1
    ##  $ union     : Factor w/ 2 levels "U1","U2": 1 1 2 1 1 1
    ##  $ worktime  : Factor w/ 12 levels "T1","T2","T3",..: NA NA NA NA NA NA
    ##  $ worker    : Factor w/ 8 levels "C1","C2","C3",..: NA NA NA NA NA NA
    ##  $ industry  : Factor w/ 16 levels "I1","I2","I3",..: 6 3 6 8 9 9
    ##  $ occupation: Factor w/ 10 levels "O1","O2","O3",..: 4 1 8 3 1 1
    ##  $ region    : Factor w/ 4 levels "R1","R2","R3",..: 4 1 3 4 3 2
    ##  $ division  : Factor w/ 9 levels "D1","D2","D3",..: 8 1 5 8 5 4
    ##  $ metro     : Factor w/ 2 levels "A1","A2": 2 2 2 1 1 2

Les données décrivent des situations individuelles sur le marché du
travail. Elles ont été recodées et certaines variables ont été
légèrement transformées. La variable d’intérêt est `income`.

- `income` : revenu annuel, variable à expliquer ;
- `age` : âge ;
- `education` : niveau de scolarité, mesuré sur une échelle numérique ;
- `hours` : nombre habituel d’heures travaillées par semaine ;
- `sex` : variable démographique à deux modalités ;
- `marital` : situation matrimoniale ;
- `group` : groupe démographique recodé ;
- `union` : statut relatif à la représentation syndicale ;
- `worktime` : statut temps plein / temps partiel recodé ;
- `worker` : catégorie de travailleur ;
- `industry` : secteur d’activité ;
- `occupation` : catégorie professionnelle ;
- `region` : grande région géographique ;
- `division` : division géographique, plus fine que `region` ;
- `metro` : catégorie relative au caractère métropolitain du lieu de
  résidence.

Chaque étudiant(e) dispose d’un échantillon d’environ 2 000
observations. Les échantillons sont différents d’un(e) étudiant(e) à
l’autre.

Le but du devoir est de mettre en œuvre, sur de vraies données, les
techniques présentées en cours.

## Travail demandé

Le rapport doit contenir **cinq parties**.

1.  **Analyse exploratoire.** Présenter rapidement les variables qui
    semblent pertinentes pour expliquer `income`. On attend des
    représentations graphiques appropriées et une première discussion
    des relations entre la variable d’intérêt et les variables
    explicatives.

2.  **Construction d’un premier modèle.** Proposer un modèle linéaire de
    départ et expliquer la démarche suivie. Il est possible, par
    exemple, de partir d’un modèle simple et de l’enrichir, ou de partir
    d’un modèle plus complexe et de le simplifier. Les principaux
    diagnostics du modèle devront être discutés.

3.  **Amélioration du modèle.** Proposer au moins une amélioration
    substantielle : transformation de la variable d’intérêt ou d’une
    variable explicative, effet non linéaire, interaction, regroupement
    de modalités, sélection de variables, etc. Les choix doivent être
    justifiés.

4.  **Comparaison des modèles.** Présenter rapidement au moins deux
    modèles et conclure par un tableau récapitulatif donnant, pour
    chacun :

    - le $R^2$ ajusté ;
    - le critère d’information d’Akaike (AIC) ;
    - le critère d’information bayésien (BIC) ;
    - les principales variables explicatives retenues.

    Le modèle finalement retenu devra être clairement identifié et le
    choix devra être justifié.

5.  **Prévision sur une base test commune.** Une base de test de 1 000
    observations est disponible dans le dépôt GitHub du cours. Elle
    contient les mêmes variables explicatives que les bases
    individuelles, mais **ne contient pas la variable `income`**. Cette
    base n’a pas servi à construire les échantillons individuels.

``` r
loc_test <- paste0(
  "https://raw.githubusercontent.com/freakonometrics/",
  "STT5100/master/devoir/",
  "STT5100_A2026_devoir1_test.Rdata"
)

download.file(
  loc_test,
  "data_test_devoir1.RData",
  mode = "wb"
)

load("data_test_devoir1.RData")
dim(data_test_devoir1)
```

    ## [1] 1000   14

Une fois les deux modèles retenus construits, il faudra calculer leurs
prévisions sur cette base. Par exemple, si les deux modèles s’appellent
`model_1` et `model_2` :

``` r
prediction_1 <- predict(
  model_1,
  newdata = data_test_devoir1
)

prediction_2 <- predict(
  model_2,
  newdata = data_test_devoir1
)

base_prediction <- data.frame(
  indice = seq_len(nrow(data_test_devoir1)),
  prediction_1 = prediction_1,
  prediction_2 = prediction_2
)

names(base_prediction) <- c(
  "indice",
  paste0("model_1_", code_permanent),
  paste0("model_2_", code_permanent)
)

dim(base_prediction)
head(base_prediction)
```

La base `base_prediction` doit contenir exactement **1 000 lignes et 3
colonnes**, sans valeur manquante.

``` r
stopifnot(
  nrow(base_prediction) == 1000,
  ncol(base_prediction) == 3,
  !anyNA(base_prediction)
)
```

Les prévisions doivent être exprimées **sur l’échelle originale de
`income`**. En particulier, si un modèle utilise une transformation de
la variable réponse, par exemple `log(income)`, il faudra expliquer et
effectuer correctement le retour à l’échelle originale avant de
sauvegarder les prévisions.

L’ordre des lignes de `data_test_devoir1` ne doit pas être modifié : la
colonne `indice` doit correspondre à l’ordre initial des observations
dans la base test.

On exportera ensuite les prévisions :

``` r
save(
  base_prediction,
  file = paste0(
    "prevision-devoir1-",
    code_permanent,
    ".RData"
  )
)
```

Il est fortement recommandé de vérifier que le fichier sauvegardé peut
être relu correctement :

``` r
rm(base_prediction)

load(
  paste0(
    "prevision-devoir1-",
    code_permanent,
    ".RData"
  )
)

str(base_prediction)
```

La base test doit uniquement servir à produire les prévisions finales.
Elle ne doit pas être utilisée pour choisir entre plusieurs modèles ou
modifier a posteriori la démarche de modélisation.

## Consignes

- **Date limite : à préciser sur Moodle.**

- Le devoir est individuel. Les discussions entre étudiant(e)s sont
  autorisées, mais chacun(e) doit produire son propre rapport, son
  propre code et ses propres prévisions. Des travaux identiques ou
  substantiellement identiques pourront donner lieu à une vérification
  individuelle.

- Chaque étudiant(e) doit déposer sur Moodle **trois fichiers** :

  - `devoir1-ABCD12345678.html`,
  - `devoir1-ABCD12345678.Rmd`,
  - `prevision-devoir1-ABCD12345678.RData`,

  où `ABCD12345678` doit être remplacé par le code permanent de
  l’étudiant(e).

- Dans le préambule du fichier R Markdown, le champ `author:` doit
  contenir le code permanent.

- Le fichier `.html` doit être lisible dans un navigateur et le fichier
  `.Rmd` doit compiler sans erreur. Tout fichier HTML vide ou tout
  fichier Rmd qui ne compile pas sera pénalisé. Il appartient à
  l’étudiant(e) de vérifier les fichiers déposés sur Moodle après le
  téléversement.

- La qualité de la présentation, des graphiques, des tableaux et, plus
  généralement, la lisibilité du document interviennent dans la
  notation. Il faut éviter les sorties R inutilement longues, les
  tableaux de plusieurs centaines de lignes ainsi que l’affichage de
  messages ou d’avertissements automatiques sans intérêt pour le
  rapport.

- Tout test ou toute technique qui n’a pas été vue et présentée dans le
  cours doit être expliqué et motivé, avec une référence appropriée.
  Encore une fois, il s’agit d’évaluer les connaissances acquises en
  cours, et non l’habileté à construire des modèles complexes et très
  prédictifs.

- Sauf autorisation explicite, les packages autorisés sont `MASS`,
  `lmtest`, `nortest`, `car`, `splines`, `AER`, `Hmisc`, `np`,
  `ggplot2`, `dplyr`, ainsi que les fonctions de base de `stats`. Des
  packages de mise en forme tels que `knitr`, `stargazer`, `DT`, `papeR`
  ou `formattable` peuvent également être utilisés. L’utilisation d’un
  autre package doit être demandée au préalable.

- L’utilisation d’outils d’IA générative (ChatGPT, Claude, Gemini,
  Llama, etc.) est autorisée pour améliorer l’aspect visuel du rendu
  (tableaux, figures, options du Markdown, etc.). L’étudiant(e) reste
  toutefois responsable de l’ensemble du contenu remis et doit être
  capable d’expliquer les méthodes, le code et les résultats présentés.
  En cas de doute, les étudiant(e)s pourront être convoqué(e)s pour
  présenter leur travail en 5 minutes.

- Les outils d’IA générative ne dispensent pas de citer une méthode ou
  une technique extérieure au cours. Une référence produite par un outil
  d’IA doit être vérifiée avant d’être incluse dans le rapport.

- Le fichier de prévisions sera évalué automatiquement. Une mauvaise
  structure, un nombre incorrect de lignes, des valeurs manquantes, un
  changement de l’ordre des observations ou des prévisions laissées sur
  une échelle transformée pourront empêcher son évaluation correcte.

## Remarque pratique

Pour accéder à votre base, vous devez remplacer `"ABCD12345678"` dans le
code de téléchargement par votre véritable code permanent, avec les
lettres en majuscules.

La base remise à chaque étudiant(e) porte le nom

``` text
data_devoir1_STT5100_A2026_ABCD12345678.RData
```

mais l’objet chargé dans R porte toujours le même nom :

``` r
data_devoir1
```
