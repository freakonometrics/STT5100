# STT5100 Modèles Linéaires Appliqués (Hiver 2025)

Arthur Charpentier, professeur

Pour plus d'information : [https://freakonometrics.hypotheses.org](https://freakonometrics.hypotheses.org/category/courses/stt5100)

Plan de cours : [Plan_Cours_STT5100_H2025.pdf](https://github.com/freakonometrics/STT5100/blob/master/docs/Plan_Cours_STT5100_H2025.pdf) (version approuvée)

Démonstrateur : *aucun pour l'instant*

```diff
- les données pour le 1er devoir sont en ligne (date limite 11 mars, midi)
```

**Prérequis**

selon [le site des cours de l'UQAM](https://etudier.uqam.ca/cours?sigle=STT5100), les préalables sont soit le cours ACT4400 (Modèles de survie) ou bien les trois cours suivants : STT2000 (Statistique II), STT2100 (aboratoire de statistique) et MAT1250 (Algèbre linéaire I).

selon [le lexique de l'UQAM](https://etudier.uqam.ca/cours?sigle=STT5100), "*un crédit équivaut à 45 heures de travail universitaire, soit 15 heures de cours magistraux ou d'ateliers, et 30 heures d'études et de travail personnel*." Ce cours d'une valeur de 3 crédits correspond donc à 135 heures de travail sur la session, soit en moyenne 9 heures de travail par semaine (3 heures de cours magistral, et 6 heures d'études et de travail personnel).

**Démonstrations et codes**
* démo 0: [https://rmarkdown.rstudio.com/](https://rmarkdown.rstudio.com/lesson-1.html)

``` r
locE = "http://www.prdh.umontreal.ca/BDLC/data/que/Exposures_1x1.txt"
locN = "https://www.prdh.umontreal.ca/BDLC/data/que/Population.txt"
locD = "https://www.prdh.umontreal.ca/BDLC/data/que/Deaths_1x1.txt"
E = read.table(locE, skip=2, header=TRUE)
D = read.table(locD, skip=2, header=TRUE)

library(boot)
data(aids)
loc = "http://freakonometrics.free.fr/baseaffairs.txt"
affairs = read.table(loc, TRUE)

library(DALEX)
data("apartments")
str(apartments)

data("titanic")
str(titanic)

location=read.table("http://freakonometrics.free.fr/rent98_00.txt",header=TRUE)
str(location)

download.file("http://freakonometrics.free.fr/fire.RData",
              destfile="fire.RData")
load("fire.RData")
str(fire)

download.file("http://freakonometrics.free.fr/base4.RData",
              destfile="base4.RData")
load("base4.RData")
str(base4)

library(datasets)
data("anscombe")
anscombe
anscombe1 = data.frame(y=anscombe$y1, x=anscombe$x1)
anscombe2 = data.frame(y=anscombe$y2, x=anscombe$x2)
anscombe3 = data.frame(y=anscombe$y3, x=anscombe$x3)
anscombe4 = data.frame(y=anscombe$y4, x=anscombe$x4)

davis=read.table("http://freakonometrics.free.fr/Davis.txt")
str(davis)

loc_fichier = "http://freakonometrics.free.fr/deathRate.RData"
download.file(loc_fichier, "deathRate.RData")
load("deathRate.RData")
str(database)

loc_fichier = "http://freakonometrics.free.fr/prix_maison.RData"
download.file(loc_fichier, "base2.RData")
load("base2.RData")
dim(database)
str(database)

loc = "http://freakonometrics.free.fr/titanic.RData"
download.file(loc, "titanic.RData")
load("titanic.RData")
base = base[,1:7]
n = nrow(base)
(p = mean(base$Survived))

Paid = matrix(c(3209, 4372, 4411, 4428, 4435, 4456,
                3367, 4659, 4696, 4720, 4730,   NA,
                3871, 5345, 5398, 5420,   NA,   NA,
                4239, 5917, 6020,   NA,   NA,   NA,
                4929, 6794,   NA,   NA,   NA,   NA,
                5217,   NA,   NA,   NA,   NA,   NA), 6,6)
```
(pour la mortalité canadienne [http://www.bdlc.umontreal.ca/CHMD/prov/que/que.htm](http://www.bdlc.umontreal.ca/CHMD/prov/que/que.htm) et pour les affaires extraconjugales, [Fair (1978) *A Theory of Extramarital Affairs*](https://www.uibk.ac.at/econometrics/data/fair78.pdf))

**Codes**
* [cours3.md](/code/cours3.md)
  
**Examens**
* Modèles de régression - OLS intra (28 février)
* Modèles de régression - GLM final (25 avril)

**Projets / Devoir**
* Modèles de régression - OLS : [devoir1.md](/devoir/devoir1.md)
* Modèles de régression - GLM : [devoir2.md](/devoir/devoir2.md)

**Introduction**

0. Plan de cours [video](https://www.youtube.com/watch?v=CLUglokf7PE) + [pdf](/slides/STT5100_A2022_INTRO_1.pdf) (32:50)
1. Epistémologie [video](https://www.youtube.com/watch?v=suw4eKnraHQ&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=3&t=0s) + [pdf](/slides/STT5100_A2020_INTRO_2.pdf) (29:50)

**Rappels**

Pour davantage de rappels de probabilités et statistiques, [MAT4681](https://github.com/freakonometrics/MAT4681/) + [vidéos](https://www.youtube.com/playlist?list=PLCrFTE7Gu_3RG98Ahj3MCgdBsjysMJ-4H) 

0. R, RStudio, Rmarkdown [video](https://www.youtube.com/watch?v=SMDeNtqOkVU&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=4&t=0s) + [pdf](/slides/STT5100_A2020_RAPPELS_1.pdf) (30:48)
1. Probabilités [video](https://www.youtube.com/watch?v=tf9C7KUgzgQ&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=5&t=0s) + [pdf](/slides/STT5100_A2020_RAPPELS_2.pdf) (47:24)
2. Vecteur Gaussien [video](https://www.youtube.com/watch?v=g5lfBRNcuaw&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=6&t=0s) + [pdf](/slides/STT5100_A2020_RAPPELS_3.pdf) (36:05)
3. Maximum de vraisemblance [video](https://www.youtube.com/watch?v=8MlQxK1ooRg&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=7&t=0s) + [pdf](/slides/STT5100_A2020_RAPPELS_4.pdf) (39:56)
4. Estimation paramétrique [video](https://www.youtube.com/watch?v=yWaSzptP14o&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=8&t=0s) + [pdf](/slides/STT5100_A2020_RAPPELS_5.pdf) (27:32)
5. Estimation non-paramétrique [video](https://www.youtube.com/watch?v=8qhplMgqVuU&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=9&t=0s) + [pdf](/slides/STT5100_A2020_RAPPELS_6.pdf) (37:12)
6. Simulations, Monte Carlo, Bootstrap  [video](https://www.youtube.com/watch?v=1oRAjtkxhhc&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=10&t=0s) + [pdf](/slides/STT5100_A2020_RAPPELS_7.pdf) (40:50)
7. Tests (1) [video](https://www.youtube.com/watch?v=sBJOIGx1XHM&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=8&t=0s) + [pdf](/slides/STT5100_A2020_RAPPELS_8.pdf) (32:29)
8. Tests (2) [video](https://www.youtube.com/watch?v=EhPU260yz30&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=11) + [pdf](/slides/STT5100_A2020_RAPPELS_9.pdf) (32:20)
9. Tests (3) [video](https://www.youtube.com/watch?v=Mz7NSFNDWcE&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=12) + [pdf](/slides/STT5100_A2020_RAPPELS_10.pdf)  (25:44)
10. Optimisation [video](https://www.youtube.com/watch?v=qbMfX07McmQ&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=14) + [pdf](/slides/STT5100_A2020_RAPPELS_11.pdf) (49:57)
11. Algèbre linéaire [video](https://www.youtube.com/watch?v=CAmOpaYi3jU&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=9&t=0s) + [pdf](/slides/STT5100_A2020_RAPPELS_12.pdf) (53:54)

Quelques compléments

1. Loi normale, vecteur Gaussien et lois dérivées [pdf](/slides/STT5100_H2022_COMPLEMENT_1.pdf)
2. Algèbre linéaire et géométrie [pdf](/slides/STT5100_H2022_COMPLEMENT_2.pdf)

**Moindres carrés**

1. Régressions [video](https://www.youtube.com/watch?v=8aXmC2fj_n8&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=16&t=0s) + [pdf](/slides/STT5100_A2020_OLS_1.pdf) (40:01)
2. Régression simple sur variable continue (1) [video](https://www.youtube.com/watch?v=Xw3dWco4xHM&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=17&t=0s) + [pdf](/slides/STT5100_A2020_OLS_2.pdf) (41:33)
3. Régression simple sur variable continue (2) [video](https://www.youtube.com/watch?v=z65Z4nsz2FI&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=18&t=0s) + [pdf](/slides/STT5100_A2020_OLS_3.pdf) (30:26)
4. Régression simple sur variable continue (3) [video](https://www.youtube.com/watch?v=c1w-fGrGGtA&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=18&t=0s) + [pdf](/slides/STT5100_A2020_OLS_4.pdf) (30:39)
5. Régression simple sur variable factorielle [video](https://www.youtube.com/watch?v=tFnvXKYoJrQ&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=20&t=0s) + [pdf](/slides/STT5100_A2020_OLS_5.pdf) (39:59)
6. Régression multiple (1) [video](https://www.youtube.com/watch?v=ZNOOpOqGr5Y&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=21&t=0s) + [pdf](/slides/STT5100_A2020_OLS_6.pdf) (45:56)
7. Régression multiple (2) [video](https://www.youtube.com/watch?v=s9yBPlqbXTU&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=22&t=0s) + [pdf](/slides/STT5100_A2020_OLS_7.pdf) (37:40)
8. Modèle Gaussien et tests [video](https://www.youtube.com/watch?v=5fMp3BDgwJw&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=23&t=0s) + [pdf](/slides/STT5100_A2020_OLS_8.pdf) (55:43)
9. Bootstrap [video](https://www.youtube.com/watch?v=RwmwVmttzsU&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=24&t=0s) + [pdf](/slides/STT5100_A2020_OLS_9.pdf) (45:37) 
10. Diagnostique [video](https://www.youtube.com/watch?v=BpomPYoSvw0&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=25&t=0s) + [pdf](/slides/STT5100_A2020_OLS_10.pdf) (50:08)
11. ANOVA (1) [video](https://www.youtube.com/watch?v=Pe1psmbjvDY&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=26&t=0s) + [pdf](/slides/STT5100_A2020_OLS_11.pdf) (37:52)
12. ANOVA (2) [video](https://www.youtube.com/watch?v=nCsdO4j5ODs&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=27&t=0s) + [pdf](/slides/STT5100_A2020_OLS_11.pdf) (28:28)
13. ANOVA (3) [video](https://www.youtube.com/watch?v=pOf4t4cQANQ&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=27) + [pdf](/slides/STT5100_A2020_OLS_21.pdf) (16:42)
14. Régression pondérée [video](https://www.youtube.com/watch?v=ks2GprUnL04&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=28&t=0s) + [pdf](/slides/STT5100_A2020_OLS_12.pdf) (16:33)
15. Multicolinéarité (1) [video](https://www.youtube.com/watch?v=JmhqnkAn1KA&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=29) + [pdf](/slides/STT5100_A2020_OLS_13.pdf) (43:25)
16. Sélection de variables [video](https://www.youtube.com/watch?v=-YzrEsgYFJQ&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=30) + [pdf](/slides/STT5100_A2020_OLS_14.pdf) (44:13)
17. MCG & hétéroscédasticité [video](https://www.youtube.com/watch?v=YzXiSFkG5Sg&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=31) + [pdf](/slides/STT5100_A2020_OLS_15.pdf) (21:30)
18. Multicolinéarité (2) [video](https://www.youtube.com/watch?v=pDATCIVv-OU&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=32) + [pdf](/slides/STT5100_A2020_OLS_16.pdf) (25:05)
19. ANOVA (4) [pdf](/slides/STT5100_A2020_OLS_17.pdf) (*hors programme*)
20. Transformations [video](https://www.youtube.com/watch?v=doSWBIlmizk&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=33) + [pdf](/slides/STT5100_A2020_OLS_20.pdf) (13:20)
20. Lissage, non-linéarités [video](https://www.youtube.com/watch?v=vLSUy0oOTZ0&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=34) + [pdf](/slides/STT5100_A2020_OLS_18.pdf) (34:51)
21. Discontinuités [video](https://www.youtube.com/watch?v=0yb9OCUUbOI&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=35) + [pdf](/slides/STT5100_A2020_OLS_19.pdf) (21:36) 
22. Exemple (1) [video](https://www.youtube.com/watch?v=q6U3jZfPOGE&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=34) + [pdf](/slides/STT5100_A2020_OLS_22.pdf) (40:24) 
23. Exemple (2) [video](https://www.youtube.com/watch?v=8WeUvlJEY3w&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=37) + [pdf](/slides/STT5100_A2020_OLS_23.pdf)  (28:17)
24. Exemple (3) video + [pdf](/slides/STT5100_A2020_OLS_24.pdf) 

**Modèles linéaires généralisés (GLM)**

0. introduction générale <a href="https://www.youtube.com/watch?v=p4XMwcelyI0&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=1">video</a> <a href="https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/covid/STT5100-0.pdf">pdf</a> (10:15) <br /> 	    
1. lois de Bernoulli, binomiale, multnomiale <a href="https://www.youtube.com/watch?v=75wN_XJvXYo&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=2">video</a> <a href="https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/covid/STT5100-1.pdf">pdf</a> (29:23) <br /> 
2.  régression logistique (Bernoulli) <a href="https://www.youtube.com/watch?v=9qPe9YbSk4k&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=3">video</a> <a href="https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/covid/STT5100-2.pdf">pdf</a> (23:04) <br /> 
3.    régression multinomiale <a href="https://www.youtube.com/watch?v=M8q3mzQuWZc&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=4">video</a> <a href="https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/covid/STT5100-3.pdf">pdf</a> (21:45) <br /> 
4.    régression logistique sur variables catégorielles <a href="https://www.youtube.com/watch?v=beB-6PgDQP4&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=5">video</a> <a href="https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/covid/STT5100-4.pdf">pdf</a> (30:24) <br /> 
5.    régression logistique sur variables continues <a href="https://www.youtube.com/watch?v=RfaBrGGFNn4&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=6">video</a> <a href="https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/covid/STT5100-5.pdf">pdf</a> (21:35) <br /> 
6.    analyse discriminante et courbe ROC <a href="https://www.youtube.com/watch?v=BQ_zdviAHu8&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=7">video</a> <a href="https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/covid/STT5100-6.pdf">pdf</a> (56:53) <br /> 
7.    modèles de comptage et loi de Poisson <a href="https://www.youtube.com/watch?v=vBTrb7KBoB8&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=8">video</a> <a href="https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/covid/STT5100-7.pdf">pdf</a> (19:28) <br /> 
8.  régression de Poisson <a href="https://www.youtube.com/watch?v=Et07c3a8V3c&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=9">video</a> <a href="https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/covid/STT5100-8.pdf">pdf</a> (25:38) <br /> 
9.    régression de Poisson et interprétations <a href="https://www.youtube.com/watch?v=xUGFwU8aLAw&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=10">video</a> <a href="https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/covid/STT5100-9.pdf">pdf</a> (40:15) <br /> 
10.    régression de Poisson et méthode des marges <a href="https://www.youtube.com/watch?v=hJUY3CEIQOQ&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=11">video</a> <a href="https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/covid/STT5100-10.pdf">pdf</a> (25:29) <br /> 
11.    régression de Poisson et application en assurance <a href="https://www.youtube.com/watch?v=1BuMQX_mlec&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=12">video</a> <a href="https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/covid/STT5100-11.pdf">pdf</a> (36:23) <br /> 
12.    famille exponentielle <a href="https://www.youtube.com/watch?v=0Hs7e4nstO4&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=13">video</a> <a href="https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/covid/STT5100-12.pdf">pdf</a> (30:01) <br /> 
13.    famille exponentielle et GLM <a href="https://www.youtube.com/watch?v=weoPmeWVaaw&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=14">video</a> <a href="https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/covid/STT5100-13.pdf">pdf</a> (41:02) <br /> 
14.    loi et lien video <a href="https://www.youtube.com/watch?v=4apRCozfmLE&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=15">video</a> <a href="https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/covid/STT5100-14.pdf">pdf</a> (36:05) <br /> 
15.    déviance et résidus <a href="https://www.youtube.com/watch?v=XZQTlAoVHl8&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=16">video</a> <a href="https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/covid/STT5100-15.pdf">pdf</a> (15:10) <br /> 
16.    modèle Tweedie et poids <a href="https://www.youtube.com/watch?v=BSp_qXnmbSo&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=17">video</a> <a href="https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/covid/STT5100-16.pdf">pdf</a> (29:33) <br /> 
17.    surdispersion <a href="https://www.youtube.com/watch?v=tZjjR0Z4k3k&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=18">video</a> <a href="https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/covid/STT5100-17.pdf">pdf</a> (21:01) <br /> 
18.    tests et GLM <a href="https://www.youtube.com/watch?v=o72UZKCd3jI&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=19">video</a> <a href="https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/covid/STT5100-18.pdf">pdf</a> (19:41) <br /> 
19.    GLM en petite dimension <a href="https://www.youtube.com/watch?v=YHOVtBC_s4o&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=20">video</a> <a href="https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/covid/STT5100-19.pdf">pdf</a> (23:34) <br /> 
20.    méthode stepwise <a href="https://www.youtube.com/watch?v=D31VCd-XJLU&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=21">video</a> <a href="https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/covid/STT5100-20.pdf">pdf</a> (17:57) <br /> 
21.    Poisson vs. Binomiale, application en démographie <a href="https://www.youtube.com/watch?v=A-uIImX-Jto&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=22">video</a> <a href="https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/covid/STT5100-21.pdf">pdf</a> (22:25) <br /> 
22. Exemple (1) [video](https://www.youtube.com/watch?v=v4l2mXyFdjs&list=PLCrFTE7Gu_3RDr8ZxhdwQ-9wyFz-df7i8&index=60) + [pdf](/slides/STT5100-22.pdf) 
23. Exemple (2) video + [pdf](/slides/STT5100-23.pdf) 

**Références** 
* William H. Greene, 2011, Econometric Analysis, [Prentice Hall](http://www.prenhall.com/greene/)
* Colin Cameron & Pravin K. Trivedi, 2013, Regression Analysis of Count Data, [Cambridge University Press](http://faculty.econ.ucdavis.edu/faculty/cameron/racd/count.html)
* Christoph Hanck, Martin Arnold, Alexander Gerber & Martin Schmelzer, 2018, Introduction to Econometrics with R, [https://econometrics-with-r.org/](https://www.econometrics-with-r.org/)
* Julian, J. Faraway, 2002, Practical Regression and Anova using R, [CRAN](https://cran.r-project.org/doc/contrib/Faraway-PRA.pdf)
* James H. Stock & Mark W. Watson, 2007, Introduction to Econometrics, [Addison Wesley](https://www.pearson.com/us/higher-education/product/Stock-Introduction-to-Econometrics-3rd-Edition/9780138009007.html)
* Achim Zeileis, 2008, Applied Econometrics with R, [Springer Verlag](https://eeecon.uibk.ac.at/~zeileis/teaching/AER/index.html)
* Michel Denuit & Arthur Charpentier, [chapitre9.pdf](https://github.com/freakonometrics/STT5100/blob/master/archives/A2018/chapitre9.pdf), extrait de [Charpentier & Denuit (2005)](https://freakonometrics.hypotheses.org/files/2018/11/ASSNVT1.pdf), voir aussi [https://nonlifemaths.github.io/chap9.html](https://nonlifemaths.github.io/chap9.html) (en anglais)
* Yihui Xie, J. J. Allaire & Garrett Grolemund, R Markdown: The Definitive Guide [https://bookdown.org/yihui/rmarkdown/](https://bookdown.org/yihui/rmarkdown/)
* Ewen Gallic, 2020, Notes de cours de R, [https://egallic.fr/Enseignement/R/Book/](https://egallic.fr/Enseignement/R/Book/avant-propos.html)
* ACT3035 [https://nour.me/act3035/](https://nour.me/act3035/)

**Projets / Devoir passés**
* Modèles de régression - OLS (hiver 2020) : [Devoir1](https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/devoirs/devoir1-H2020-STT5100.md)
* Régression logistique - GLM (hiver 2020) : [Devoir2](https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/devoirs/STT5100-H2020-devoir2.md)
* Régression de Poisson - GLM (hiver 2020) : [Devoir3](https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/devoirs/devoir3-H2020-STT5100.md)

**Examens passés**
* OLS énoncé hiver 2012 [H2012E.pdf](https://github.com/freakonometrics/STT5100/blob/master/archives/A2018/act6410-h2012-enonce.pdf) [csv](http://freakonometrics.blog.free.fr/public/data/basket-exam-v2.csv) pas d'annexes, désolé
* OLS _correction_ hiver 2012 [H2012C.pdf](https://github.com/freakonometrics/STT5100/blob/master/archives/A2018/act6410-h2012-correc.pdf)
* OLS énoncé automne 2012 [A2012E.pdf](https://github.com/freakonometrics/STT5100/blob/master/archives/A2018/act6410-a2012-enonce.pdf)
* OLS _correction_ automne 2012 [A2012C.pdf](https://github.com/freakonometrics/STT5100/blob/master/archives/A2018/act6410-a2012-correc.pdf)
* OLS énoncé automne 2018 [A2018-1E.pdf](https://github.com/freakonometrics/STT5100/raw/master/archives/A2018/Exam_STT5100_Aut_2018_intra-A.pdf)
* OLS _correction_ automne 2018 [A2018-1C.pdf](https://github.com/freakonometrics/STT5100/raw/master/archives/A2018/Exam_STT5100_Aut_2018_intra-A-correction.pdf)
* OLS énoncé hiver 2019 [H2019-1E.pdf](https://github.com/freakonometrics/STT5100/blob/master/archives/H2019/docs/Examen_STT5100_H2019_enonce.pdf)
* OLS _correction_ hiver 2019 [H2019-1C.pdf](https://github.com/freakonometrics/STT5100/blob/master/archives/H2019/docs/Examen_STT5100_H2019_correction.pdf)
* OLS énoncé automne 2019 [A2019-1E.pdf](https://github.com/freakonometrics/STT5100/blob/master/archives/A2019/devoirs/STT5100_AUTOMNE2019_ENONCE.pdf) 
* OLS _correction_ automne 2019 [A2019-1C.pdf](https://github.com/freakonometrics/STT5100/blob/master/archives/A2019/devoirs/STT5100_AUTOMNE2019_CORREC.pdf) pour la "correction"
* OLS : énoncé hiver 2020 [H2020-1E.pdf](https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/devoirs/STT5100_Hiver2020_A.pdf) et [Annexe](https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/devoirs/STT5100_Hiver2020_annexes.pdf)
* OLS _correction_ hiver 2020 [H2020-1C.pdf](https://github.com/freakonometrics/STT5100/blob/master/archives/H2020/devoirs/STT5100_Hiver2020_A_correc.pdf) 
* GLM énoncé 2013 [2013E.pdf](https://github.com/freakonometrics/STT5100/blob/master/archives/A2018/act2040-2013-enonce.pdf) [Annexes](https://f-origin.hypotheses.org/wp-content/blogs.dir/253/files/2013/03/EXAMEN-INTRA-annexe-2040-H2013.pdf)
* GLM _correction_ 2013 [2013C.pdf](https://github.com/freakonometrics/STT5100/blob/master/archives/A2018/act2040-2013-correc.pdf)
* GLM énoncé automne 2018 [A2018-2E.pdf](https://github.com/freakonometrics/STT5100/raw/master/archives/A2018/Examen_STT5100_Aut_2018_final-correction.pdf)
* GLM _correction_ automne 2018 [A2018-2C.pdf](https://github.com/freakonometrics/STT5100/raw/master/archives/A2018/Examen_STT5100_Aut_2018_final.pdf)
* GLM énoncé hiver 2019 [H2019-2E.pdf](https://github.com/freakonometrics/STT5100/blob/master/archives/H2019/docs/Examen_STT5100_Hiver_2019-final-B.pdf)
* GLM _correction_ hiver 2019 [H2019-2C.pdf](https://github.com/freakonometrics/STT5100/blob/master/archives/H2019/docs/Examen_STT5100_Hiver_2019-correction.pdf)
* GLM écononcé automne 2019 [A2019-2E.pdf](https://github.com/freakonometrics/STT5100/blob/master/archives/A2019/devoirs/STT5100_AUTOMNE2019_2_ENONCE.pdf) 
* GLM _correction_ écononcé automne 2019 [A2019-2C.pdf](https://github.com/freakonometrics/STT5100/blob/master/archives/A2019/devoirs/STT5100_AUTOMNE2019_2_CORREC.pdf) 

**Exam S/MASI - CAS** [modern actuarial statistics](https://www.casact.org/admissions/syllabus/index.cfm?fa=MASI)
* page "study tools" [https://casact.org/examS/](https://www.casact.org/admissions/studytools/examS/)

**Exam SRM - SOA** [statistics for risk modeling](https://www.soa.org/Education/Exam-Req/edu-exam-srm-detail.aspx)
* ACTEX "study notes" (sample) [https://actexmadriver.com/samples/SRM-2018.pdf](https://www.actexmadriver.com/samples/ACTEX_SRM-ACT-18FSMP-E_sample_6-27-18.pdf) and [https://actexmadriver.com/samples/SRM-2019.pdf](https://www.actexmadriver.com/samples/Actex%20SRM%20Spring%202019%20Sample.pdf)

**Exam PA - SOA** [predictive analytics](https://www.soa.org/Education/Exam-Req/edu-exam-pa-detail.aspx)

**R Toolbox - SOA**
* page "R console" [https://actuarialtoolkit.soa.org/](https://actuarialtoolkit.soa.org/tool/r-console/learn-more)

**"Curve Fitting"**

![https://xkcd.com/2048/](https://imgs.xkcd.com/comics/curve_fitting_2x.png)

[https://xkcd.com/2048/](https://xkcd.com/2048/)
