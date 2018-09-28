# STT5100 Modèles linéaires appliqués

Arthur Charpentier, [@freakonometrics](https://twitter.com/freakonometrics)

Pour plus d'information : [https://freakonometrics.hypotheses.org](https://freakonometrics.hypotheses.org/category/courses/stt5100/2018-automne)

Plan de cours : [Plan_STT5100_A2018.pdf](https://github.com/freakonometrics/STT5100/raw/master/Plan_STT5100_A2018.pdf)

Démonstrateur : Mohamed Ouhourane [*](https://www-s.uqam.ca/cgi-bin/regis/trcpV2.pl?nom=ouhourane&prenom=mohamed), puis Gillis Delmas Tchouangue Dinkou [*](https://www-s.uqam.ca/cgi-bin/regis/trcpV2.pl?nom=tchouangue%20dinkou&prenom=gillis%20delmas) (à partir du 21 septembre)

**Références** 
* William H. Greene, 2011, Econometric Analysis, [Prentice Hall](http://www.prenhall.com/greene/)
* Colin Cameron & Pravin K. Trivedi, 2013, Regression Analysis of Count Data, [Cambridge University Press](http://faculty.econ.ucdavis.edu/faculty/cameron/racd/count.html)
* Julian, J. Faraway, 2002, Practical Regression and Anova using R, [CRAN](https://cran.r-project.org/doc/contrib/Faraway-PRA.pdf)
* James H. Stock & Mark W. Watson, 2007, Introduction to Econometrics, [Addison Wesley](https://www.pearson.com/us/higher-education/product/Stock-Introduction-to-Econometrics-3rd-Edition/9780138009007.html)
* Achim Zeileis, 2008, Applied Econometrics with R, [Springer Verlag](https://eeecon.uibk.ac.at/~zeileis/teaching/AER/index.html)

**Notes de cours (2014)**
*  OLS, partie 1 [act6420-e2014-1.pdf](https://github.com/freakonometrics/STT5100/raw/master/act6420-e2014-1.pdf)
*  OLS, partie 2 [act6420-e2014-2.pdf](https://github.com/freakonometrics/STT5100/raw/master/act6420-e2014-2.pdf)

Attention, ce sont des resumes synthetiques du cours ! Il convient de lire Greene (2011) pour Stock & Watson (2007) pour plus de details (les parties sont indiquees dans le plan, plus bas).

**Projets**
* Modeles de régression - OLS : [STT5100-devoir1.md](https://github.com/freakonometrics/STT5100/blob/master/STT5100-devoir1.md)
* Regression logistique - GLM

**Examens passés**
* OLS énoncé hiver 2012 [H2012E.pdf](https://github.com/freakonometrics/STT5100/raw/master/act6410-h2012-enonce.pdf)
* OLS _correction_ hiver 2012 [H2012C.pdf](https://github.com/freakonometrics/STT5100/raw/master/act6410-h2012-correc.pdf)
* OLS énoncé automne 2012 [A2012E.pdf](https://github.com/freakonometrics/STT5100/raw/master/act6410-a2012-enonce.pdf)
* OLS _correction_ automne 2012 [A2012C.pdf](https://github.com/freakonometrics/STT5100/raw/master/act6410-a2012-correc.pdf)
* GLM énoncé 2011 [2011E.pdf](https://github.com/freakonometrics/STT5100/raw/master/act2040-2011-enonce.pdf)
* GLM _correction_ 2011 [2011C.pdf](https://github.com/freakonometrics/STT5100/raw/master/act2040-2011-correc.pdf)
* GLM énoncé 2013 [2013E.pdf](https://github.com/freakonometrics/STT5100/raw/master/act2040-2013-enonce.pdf)
* GLM _correction_ 2013 [2013C.pdf](https://github.com/freakonometrics/STT5100/raw/master/act2040-2013-correc.pdf)

**Seances**

"It's not magic; it's code", [Ben Welsh](https://source.opennews.org/articles/how-we-found-new-patterns-la-homeless-arrest/).
Install [R](https://cran.r-project.org/) and [Rstudio](https://www.rstudio.com/products/rstudio/download/). 

1. Motivation et rappels (probabilités et statistiques) [STT5100-1.md](https://github.com/freakonometrics/STT5100/blob/master/STT5100-1.md)
2. Le modele linéaire simple [STT5100-2.md](https://github.com/freakonometrics/STT5100/blob/master/STT5100-2.md)
- lecture : Chapitre 4 (Stock & Watston)
3. Le modele linéaire multiple [code4.R](https://github.com/freakonometrics/STT5100/blob/master/code4.R) [STT5100-3.md](https://github.com/freakonometrics/STT5100/blob/master/STT5100-3.md)
- lecture : Chapitres 2 et 3 (Greene, edition 5)
- lecture : Chapitre  5 et 6 (Stock & Watston)
- exercices : 3.3 et 3.6 (Greene) et faire des exemples dans la page [chiffres.pdf](https://github.com/freakonometrics/STT5100/raw/master/STT5100_donnees_chiffres.pdf)
- complément sur la régression avec un facteur [blog](https://freakonometrics.hypotheses.org/55142)
4. Incertitude dans le modele lineaire
- lecture : Chapitre  6 (Stock & Watston)
5. Tests statistiques et significativite
- lecture : Chapitre  7 (Stock & Watston)
6. Regression locale et lissage
7. Choix de modeles
8. **Examen Intra**
9. Regression logistique
10. Regression logistique
11. Regression de Poisson
12. Regression de Poisson 
13. GLM - Modeles Lineaires Generalises
14. GLM - Modeles Lineaires Generalises
15. **Examen Final**

**Bases de données**

[STT5100-0.md](https://github.com/freakonometrics/STT5100/blob/master/STT5100-0.md)

* davis (y = wight, x1 = height, x2 = gender)
* cars (y = dist, x = speed)
* chicago (y = Fire, x1, x2, x3)
* myocarde (y= PRONO, FRCAR, INCAR, INSYS, PRDIA, PAPUL, PVENT, REPUL)
* titanic [kaggle](https://www.kaggle.com/c/titanic/data)

**Exercices**

[TD1STT5100.pdf](https://github.com/freakonometrics/STT5100/blob/master/TD1STT5100.pdf)

[TD2STT5100.pdf](https://github.com/freakonometrics/STT5100/blob/master/TD2STT5100.pdf) et correction [stt5100-2-C.pdf](https://github.com/freakonometrics/STT5100/blob/master/stt5100-2-C.pdf)

[TD3STT5100.pdf](https://github.com/freakonometrics/STT5100/blob/master/TD3STT5100.pdf) et correction [TD3STT5100-C.pdf] (https://github.com/freakonometrics/STT5100/blob/master/TD3STT5100-C.pdf)

**"Curve Fitting"**

![https://xkcd.com/2048/](https://imgs.xkcd.com/comics/curve_fitting_2x.png)

[https://xkcd.com/2048/](https://xkcd.com/2048/)
