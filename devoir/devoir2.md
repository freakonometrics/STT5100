# STT5100 — Devoir 2 — Automne 2026

## Données

Chaque étudiant(e) dispose d’une base de données différente. Pour télécharger votre base, remplacez `"ABCD12345678"` par votre code permanent, en conservant les lettres en majuscules.

```r
code_permanent <- "ABCD12345678"

loc_fichier <- paste0(
  "https://raw.githubusercontent.com/freakonometrics/",
  "STT5100/master/devoir/",
  "data_devoir2_STT5100_A2026_",
  code_permanent,
  ".RData"
)

download.file(
  loc_fichier,
  "data_devoir2.RData",
  mode = "wb"
)

load("data_devoir2.RData")

head(data_devoir2)
```

À titre d’illustration, la structure d’une base est la suivante :

```r
str(data_devoir2)
```

La variable d’intérêt est `adhesion`, une variable binaire prenant les valeurs 0 et 1.

Les autres variables sont :

- `adhesion` : variable binaire à expliquer ;
- `age` : âge ;
- `indice_financier` : indicateur financier individuel ;
- `categorie_professionnelle` : catégorie professionnelle recodée ;
- `statut_familial` : situation familiale recodée ;
- `niveau_formation` : niveau de formation ;
- `incident_paiement` : indicateur relatif à un incident de paiement ;
- `engagement_principal` : indicateur relatif à un engagement financier principal ;
- `engagement_secondaire` : indicateur relatif à un engagement financier secondaire ;
- `canal` : catégorie correspondant au canal utilisé pour l’interaction ;
- `jour_observation` : jour associé à l’observation ;
- `periode` : période de l’année, recodée ;
- `nombre_solicitations` : nombre de sollicitations au cours de la période courante ;
- `delai` : délai depuis une interaction antérieure ; la valeur 0 correspond notamment à l’absence d’interaction antérieure ;
- `nombre_interactions` : nombre d’interactions antérieures ;
- `etat_precedent` : résultat recodé d’une interaction antérieure.

Chaque étudiant(e) dispose d’un échantillon de **2 000 observations**. Les échantillons sont différents d’un(e) étudiant(e) à l’autre.

Le but du devoir est de mettre en œuvre, sur de vraies données, les techniques de régression logistique présentées en cours.

## Travail demandé

Le rapport doit contenir **cinq parties**.

1. **Analyse exploratoire.** Présenter rapidement les variables qui semblent pertinentes pour expliquer `adhesion`. On attend des représentations graphiques appropriées, une description de la fréquence de la variable d’intérêt et une première discussion des relations entre `adhesion` et les variables explicatives.

2. **Construction d’un premier modèle.** Proposer un premier modèle de régression logistique et expliquer la démarche suivie. Il est possible, par exemple, de partir d’un modèle simple et de l’enrichir, ou de partir d’un modèle plus complexe et de le simplifier. Les coefficients importants devront être interprétés, notamment en termes de signe et, lorsque cela est pertinent, d’odds ratios. Les principaux tests et diagnostics vus en cours devront être discutés.

3. **Amélioration du modèle.** Proposer au moins une amélioration substantielle : effet non linéaire, interaction, regroupement de modalités, sélection de variables, transformation d’une variable explicative, etc. Les choix doivent être justifiés. On doit aboutir à un **second modèle**, différent du premier.

4. **Comparaison des modèles.** Comparer les deux modèles sur la base individuelle utilisée pour les estimer. 

   On présentera notamment, pour chacun des deux modèles :

   - le critère d’information d’Akaike (AIC) ;
   - le critère d’information bayésien (BIC) ;
   - les principales variables explicatives retenues ;
   - une courbe ROC, calculée à partir des probabilités prédites sur les 2 000 observations de la base ;
   - l’aire sous la courbe ROC (AUC).

   Les deux courbes ROC peuvent être présentées séparément ou sur une même figure, à condition que la comparaison soit claire.

   Par exemple, si les deux modèles s’appellent `model_1` et `model_2`, les probabilités ajustées utilisées pour les courbes ROC sont obtenues par

```r
proba_1 <- predict(
  model_1,
  newdata = data_devoir2,
  type = "response"
)

proba_2 <- predict(
  model_2,
  newdata = data_devoir2,
  type = "response"
)
```

   Le modèle finalement retenu devra être clairement identifié et le choix devra être justifié en tenant compte de l’ensemble des éléments précédents, et pas uniquement de l’AUC.

5. **Prévision sur une base test commune.** Une base de test de **1 000 observations** est disponible dans le dépôt GitHub du cours. Elle contient les mêmes variables explicatives que les bases individuelles, mais **ne contient pas la variable `adhesion`**.

```r
loc_test <- paste0(
  "https://raw.githubusercontent.com/freakonometrics/",
  "STT5100/master/devoir/",
  "data_test_devoir2_STT5100_A2026.RData"
)

download.file(
  loc_test,
  "data_test_devoir2.RData",
  mode = "wb"
)

load("data_test_devoir2.RData")

dim(data_test_devoir2)
```

On doit obtenir :

```text
1000   15
```

Une fois les deux modèles construits, il faudra calculer pour chacun la **probabilité prédite de `adhesion = 1`** sur cette base.

Par exemple :

```r
prediction_1 <- predict(
  model_1,
  newdata = data_test_devoir2,
  type = "response"
)

prediction_2 <- predict(
  model_2,
  newdata = data_test_devoir2,
  type = "response"
)

base_prediction <- data.frame(
  indice = seq_len(nrow(data_test_devoir2)),
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

La base `base_prediction` doit contenir exactement **1 000 lignes et 3 colonnes**, sans valeur manquante.

Les deux colonnes de prévisions doivent contenir des **probabilités comprises entre 0 et 1**, et non des classifications finales en 0 ou 1.

```r
stopifnot(
  nrow(base_prediction) == 1000,
  ncol(base_prediction) == 3,
  !anyNA(base_prediction),
  all(base_prediction[[2]] >= 0),
  all(base_prediction[[2]] <= 1),
  all(base_prediction[[3]] >= 0),
  all(base_prediction[[3]] <= 1)
)
```

L’ordre des lignes de `data_test_devoir2` ne doit pas être modifié : la colonne `indice` doit correspondre à l’ordre initial des observations dans la base test.

On exportera ensuite les prévisions :

```r
save(
  base_prediction,
  file = paste0(
    "prevision-devoir2-",
    code_permanent,
    ".RData"
  )
)
```

Il est fortement recommandé de vérifier que le fichier sauvegardé peut être relu correctement :

```r
rm(base_prediction)

load(
  paste0(
    "prevision-devoir2-",
    code_permanent,
    ".RData"
  )
)

str(base_prediction)
```
## Consignes

- **Date limite : Mercredi 16 Décembre, midi.**

- Le devoir est individuel. Les discussions entre étudiant(e)s sont autorisées, mais chacun(e) doit produire son propre rapport, son propre code et ses propres prévisions. Des travaux identiques ou substantiellement identiques pourront donner lieu à une vérification individuelle.

- Chaque étudiant(e) doit déposer sur Moodle **trois fichiers** :

  - `devoir2-ABCD12345678.html`,
  - `devoir2-ABCD12345678.Rmd`,
  - `prevision-devoir2-ABCD12345678.RData`,

  où `ABCD12345678` doit être remplacé par le code permanent de l’étudiant(e).

- Dans le préambule du fichier R Markdown, le champ `author:` doit contenir le code permanent.

- Le fichier `.html` doit être lisible dans un navigateur et le fichier `.Rmd` doit compiler sans erreur. Tout fichier HTML vide ou tout fichier Rmd qui ne compile pas sera pénalisé. Il appartient à l’étudiant(e) de vérifier les fichiers déposés sur Moodle après le téléversement.

- La qualité de la présentation, des graphiques, des tableaux et, plus généralement, la lisibilité du document interviennent dans la notation. Il faut éviter les sorties R inutilement longues, les tableaux de plusieurs centaines de lignes ainsi que l’affichage de messages ou d’avertissements automatiques sans intérêt pour le rapport.

- Tout test ou toute technique qui n’a pas été vue et présentée dans le cours doit être expliqué et motivé, avec une référence appropriée. Il s’agit d’évaluer les connaissances acquises en cours, et non l’habileté à construire des modèles complexes et très prédictifs.

- Sauf autorisation explicite, les packages autorisés sont `MASS`, `lmtest`, `nortest`, `car`, `splines`, `AER`, `Hmisc`, `np`, `ggplot2`, `dplyr`, `pROC`, ainsi que les fonctions de base de `stats`. Des packages de mise en forme tels que `knitr`, `stargazer`, `DT`, `papeR` ou `formattable` peuvent également être utilisés. L’utilisation d’un autre package doit être demandée au préalable.

- L’utilisation d’outils d’IA générative (ChatGPT, Claude, Gemini, Llama, etc.) est autorisée pour améliorer l’aspect visuel du rendu (tableaux, figures, options du Markdown, etc.). L’étudiant(e) reste toutefois responsable de l’ensemble du contenu remis et doit être capable d’expliquer les méthodes, le code et les résultats présentés. En cas de doute, les étudiant(e)s pourront être convoqué(e)s pour présenter leur travail en 5 minutes.

- Les outils d’IA générative ne dispensent pas de citer une méthode ou une technique extérieure au cours. Une référence produite par un outil d’IA **doit** être vérifiée avant d’être incluse dans le rapport.

- Le fichier de prévisions sera évalué automatiquement. Une mauvaise structure, un nombre incorrect de lignes, des valeurs manquantes, un changement de l’ordre des observations ou des prévisions qui ne sont pas des probabilités comprises entre 0 et 1 pourront empêcher son évaluation correcte.

## Remarque pratique

Pour accéder à votre base, vous devez remplacer `"ABCD12345678"` dans le code de téléchargement par votre véritable code permanent, avec les lettres en majuscules.

La base remise à chaque étudiant(e) porte le nom

```text
data_devoir2_STT5100_A2026_ABCD12345678.RData
```

mais l’objet chargé dans R porte toujours le même nom :

```r
data_devoir2
```
