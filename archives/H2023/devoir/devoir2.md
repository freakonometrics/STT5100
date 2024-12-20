STT5100 (H2023) devoir 2
================


```diff
- Les instructions ont été rajoutées (voir plus bas)
```

``` r
code_permanent = "ABCD12345678"
loc_fichier = paste("http://freakonometrics.free.fr/STT5100/",code_permanent,"-H2023D2.RData",sep="")
download.file(loc_fichier, "base_devoir_2.RData")
load("base_devoir_2.RData")
dim(basedevoir)
```

    ## [1]  6 25

Des conducteurs utilisant une application d’aide à la conduite se voient
proposer des coupons de réduction pour un restaurant, et on se demande
si la personne accepte (ou pas) le coupon. Les données sont :

- `type_destination`, domicile, travail, ou endroit non urgent
- `passager`, suivant que le conducteur est seul, ou avec un ami
- `meteo`, ensoleillé, pluvieux ou neigeux  
- `temperature`, température extérieure  
- `heure`, 14h, 10h, 18h, 7h ou 22h  
- `coupon`, Restaurant (moins de 20\$), Café, Carry out et Take away,
  Bar, Restaurant (entre 20 et 50\$)  
- `expiration`, le coupon expire dans 1 jour ou dans 2 heures  
- `genre`, genre du conduteur (homme ou femme)  
- `age_conducteur`, âge du conducteur  
- `statut_marital`, état-civil (Partenaire non marié, Célibataire,
  Partenaire marié, Divorcé, Veuf)  
- `enfants`, indique si le conducteur a des enfants (ou pas)  
- `education`, niveau d’éducation du conducteur (Études supérieures -
  pas de diplôme, Licence, Diplôme d’associé, Diplôme d’études
  secondaires, Diplôme d’études supérieures (maîtrise ou doctorat),
  Études secondaires partielles )  
- `occupation`, profession du conducteur (Sans emploi, Architecture et
  ingénierie, Étudiant, Éducation, formation et bibliothèque, Soins de
  santé, Praticiens et techniciens de la santé, Ventes et assimilés,
  Gestion, Arts, design, divertissement, sports et médias, informatique
  et mathématiques, Sciences sociales et physiques de la vie, Soins et
  services à la personne, Services sociaux et communautaires, Soutien
  administratif et de bureau, Construction et extraction, Juridique,
  Retraité, Entretien et réparation d’installations, Transport et
  déplacement de matériel, Affaires et finances, Services de protection,
  Préparation des aliments et service, Production, Nettoyage et
  entretien de bâtiments et de terrains, Agriculture, pêche et
  sylviculture )  
- `revenu_conducteur`, revenu du conducteur
- `visites_bars`, combien de fois allez-vous dans un bar chaque mois ?
  jamais, moins de 1 fois, entre 1 et 3, entre 4 et 8, ou plus que 8
- `visites_cafes`, combien de fois allez-vous dans un café chaque mois ?
  jamais, moins de 1 fois, entre 1 et 3, entre 4 et 8, ou plus que 8  
- `take_away`, combien de fois prenez-vous des plats à emporter par mois
  ? jamais, moins de 1 fois, entre 1 et 3, entre 4 et 8, ou plus que 8  
- `freq_resto_0_20`, combien de fois allez-vous dans un restaurant dont
  la dépense moyenne par personne est inférieure à 50 dollars chaque
  mois ? jamais, moins de 1 fois, entre 1 et 3, entre 4 et 8, ou plus
  que 8  
- `freq_resto_20_50`, combien de fois allez-vous dans un restaurant dont
  la dépense moyenne par personne est comprise entre 20 et 50 dollars
  chaque mois ? jamais, moins de 1 fois, entre 1 et 3, entre 4 et 8, ou
  plus que 8  
- `distance_plus_5`, la distance en voiture jusqu’au restaurant/bar pour
  utiliser le coupon est supérieure à 5 minutes  
- `distance_plus_15`, la distance en voiture jusqu’au restaurant/bar
  pour utiliser le coupon est supérieure à 15 minutes
- `distance_plus_25`, la distance en voiture jusqu’au restaurant/bar
  pour utiliser le coupon est supérieure à 25 minutes
- `meme_direction`, le restaurant/bar se trouve dans la même direction
  que la destination actuelle  
- `oppose_direction`, le restaurant/bar se trouve dans la direction
  opposée à la destination actuelle
- `y` : indique si le coupon est accepté **variable à prédire**

``` r
str(basedevoir)
```

    ## 'data.frame':    6 obs. of  25 variables:
    ##  $ type_destination : chr  "No Urgent Place" "No Urgent Place" "Work" "Work" ...
    ##  $ passager         : chr  "Friend(s)" "Alone" "Alone" "Alone" ...
    ##  $ meteo            : chr  "Sunny" "Sunny" "Sunny" "Sunny" ...
    ##  $ temperature      : num  -1.1 26.7 12.8 26.7 -1.1 12.8
    ##  $ heure            : chr  "10PM" "2PM" "7AM" "7AM" ...
    ##  $ coupon           : chr  "Carry out & Take away" "Restaurant(<20)" "Coffee House" "Carry out & Take away" ...
    ##  $ expiration       : chr  "1d" "2h" "2h" "1d" ...
    ##  $ genre            : chr  "Female" "Male" "Female" "Female" ...
    ##  $ age_conducteur   : int  24 26 22 67 61 18
    ##  $ statut_marital   : chr  "Unmarried partner" "Single" "Single" "Unmarried partner" ...
    ##  $ enfants          : int  0 0 0 1 1 0
    ##  $ education        : chr  "Bachelors degree" "Graduate degree (Masters or Doctorate)" "Bachelors degree" "Some college - no degree" ...
    ##  $ occupation       : chr  "Community & Social Services" "Management" "Office & Administrative Support" "Management" ...
    ##  $ revenu_conducteur: num  74500 27000 39500 37500 36000 53000
    ##  $ visites_bars     : chr  "less1" "4~8" "1~3" "never" ...
    ##  $ visites_cafes    : chr  "never" "gt8" "less1" "never" ...
    ##  $ take_away        : chr  "1~3" "gt8" "4~8" "4~8" ...
    ##  $ freq_resto_0_20  : chr  "less1" "4~8" "1~3" "1~3" ...
    ##  $ freq_resto_20_50 : chr  "never" "less1" "less1" "less1" ...
    ##  $ distance_plus_5  : int  1 1 1 1 1 1
    ##  $ distance_plus_15 : int  1 1 1 1 1 0
    ##  $ distance_plus_25 : int  0 0 1 1 0 0
    ##  $ meme_direction   : int  0 0 0 0 1 1
    ##  $ oppose_direction : int  1 1 1 1 0 0
    ##  $ y                : Factor w/ 2 levels "pas achat","achat": 2 2 2 2 1 1

**Instructions**

Le but de ce second projet est de construire un modèle prédictif pour quantifier la probabilité de réponse positivement, ou pas, à une sollicitation commerciale. Il convidendra d'adopter le plan suivant :

**1.Présentation des données**

Dans une première partie, il faudra un peu de statistique descriptives, montrant quelles variables sont *a priori* corrélées avec la variable d'intérêt, `y`. Des graphiques sont attendus dans cette partie. Dans cette partie, vous avez le droit de transformer vos variables et de supprimer certains individus, si vous l'expliquez.

**2.Un premier modèle**

En utilisant les techniques du cours, **et uniquement les techniques du cours**, il faudra expliquer comment vous avez contruit un premier modèle qui vous semble valide, simplement en retenant quelques variables, sans transformation de variables.

**3.Le modèle final**

Dans un second temps, vous essayerez d'améliorer ce premier modèle, peut-être en tenant compte de non-linéarités potentielles, ou en regroupant des modalités de variables qualitatives. 

**4.Indicateurs**

Dans une section spécifique, il faudra indiquer
* le AIC des deux modèles retenus
* le BIC des modèles retenus
* le AUC des modèles retenus
et de tracer la courbe ROC de vos deux modèles.

**5.Prévision**

Une fois construit votre modèle final, il faudra faire des prévisions sur 862 observations (merci de
copier-coller du code suivant à la fin de votre fichier Rmd)


``` r
loc_fichier = "http://freakonometrics.free.fr/STT5100/TestH2023D2.RData"
download.file(loc_fichier, "base_test_devoir_2.RData")
load("base_test_devoir_2.RData")
```
Afin d'avoir un code qui compile, je créée artificiellement deux modèles, mais vous devez utiliser ici les deux modèles que vous avez construits auparavant.

``` r
model_1 = glm(y ~ 1, data = basedevoir, family=binomial)
model_2 = glm(y ~ genre, data = basedevoir, family=binomial)

note_1 = predict(model_1, newdata = basetest, type="response")
note_2 = predict(model_2, newdata = basetest, type="response")
base_prediction = data.frame(indice = as.numeric(rownames(basetest)),
                             model_1 = note_1,
                             model_2 = note_2)
apply(base_prediction,2,mean)[2:3]
```

    ##   model_1   model_2 
    ## 0.6666667 0.6261601

``` r
dim(base_prediction)
```

    ## [1] 862   3

``` r
names(base_prediction) = c("indice",paste("model_",1:2,"_",code_permanent,sep=""))
save(base_prediction, file = paste("prevision-devoir2-",code_permanent,".RData",sep=""))

rm(list = "base_prediction")
load( paste("prevision-devoir2-",code_permanent,".RData",sep=""))
str(base_prediction)
```

    ## 'data.frame':    862 obs. of  3 variables:
    ##  $ indice              : num  1 2 3 4 5 6 7 8 9 10 ...
    ##  $ model_1_ABCD12345678: num  0.667 0.667 0.667 0.667 0.667 ...
    ##  $ model_2_ABCD12345678: num  0.75 0.5 0.5 0.75 0.75 ...

Un fichier intitulé `prevision-devoir2-ABCD12345678.RData` sera créé lors de la compilation, et je
vous demande de me le déposer sur Moodle avec les deux autres fichiers (`devoir2-ABCD12345678.Rmd` et `devoir2-ABCD12345678.html`). 

**Précisions complémentaires**

* dans le préambule de fichier `devoir2-ABCD12345678.Rmd`, l'auteur doit contenir le **code permanent**, `author: "ABCD12345678: John Doe"`
* les techniques de validation croisée, ou la constitution de bases d’apprentissage et de test (*hold-out*) ne sont pas au programme et ne devront pas etre utilisées pour ce devoir.
* tout test utilisé qui n'a pas été présenté dans le cadre du cours devra être expliqué, motivé, et pointer vers une référence (la commande pour insérer un lien est, e.g. `<https://en.wikipedia.org/wiki/Anderson%E2%80%93Darling_test>`). Dans le cas contraitre, des points seront enlevés.
* les seuls packages autorises (sauf autorisation explicite) sont `MASS`, `lmtest`, `nortest`, `car`, `splines`, `AER`, `ROCR`, `Hmisc`, `np` les packages graphiques `ggplot2` (et éventuellement de couleurs, ou de mise en forme `knitr`, `stargazer`, `DT`, `papeR`, `formattable` etc), de manipulation de données `dplyr`, ainsi que les fonctions de base de `stats`. L'utilisation de tout autre package devra être demandée au préalable. Sinon, des points seront enlevés.
* la forme du document et sa lisibilité interviendront dans la notation. Afficher des tableaux de plusieurs centaines de lignes, par exemple, est à proscrire.
* les rapports sont individuels ! s'il est autorisé de discuter avec d'autres élèves du groupe (en respectant le protocol sanitaire en vigueur), chacun doit rendre son propre rapport. Dans le cas où deux fichiers identiques seraient envoyés par deux élèves différents, les deux élèves seront sanctionnés.

<img src="https://github.com/freakonometrics/STT5100/blob/master/archives/A2018/obviously.png" alt="drawing" width="300" align=right/>

Le fichier html doit être lisible dans un navigateur internet (Firefox) et le code Rmd doit compiler sans erreur. Le préambule du fichier Rmd doit contenir comme auteur le code permanent. Tout fichier qui ne compile pas et/ou qui n'est pas lisible donnera lieu à une forte pénalisation.
