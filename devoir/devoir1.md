STT5100 (H2022) devoir 1
================

Le but du devoir est de mettre en oeuvre, sur des vraies données, les
techniques exposées en cours.

  - Date limite pour envoyer le devoir **6 mars** avant **midi**,
  - Chaque étudiant(e) doit envoyer via [moodle](https://www.moodle2.uqam.ca/) trois
    fichiers : un _rapport_ `devoir1-ABCD12345678.html`, output d’un fichier
    `devoir1-ABCD12345678.Rmd`, et une _base de données_ `devoir1-ABCD12345678.Rda` (il faudra envoyer les trois fichiers), où
    `ABCD12345678` doit être remplacé par le code permanent de
    l’étudiant(e). Le fichier `devoir1-ABCD12345678.html` doit être
    lisible et le fichier `devoir1-ABCD12345678.Rmd` doit compiler sans
    erreur. La base `devoir1-ABCD12345678.Rda` dont contenir 425 lignes.
  
  __**En cas de soucis avec moodle**__ un envoi par messagerie électronique [charpentier.arthur@uqam.ca](mailto:charpentier.arthur@uqam.ca) est possible (la date butoir reste la même : **6 mars** à **midi**)
  
  - Dans le preambule du markdown, `author:` doit mentionner le code
    permanent (`author: "ABCD12345678: John Doe"`),
  - Le _rapport_ doit contenir trois parties

<!-- end list -->

1.  Une partie exploratoire qui presente rapidement les variables qui
    pourraient être intéressantes (`non_viol_per_pop` est la
    variable d’interêt)
2.  Une partie presentant la construction du modèle : il s’agira de
    partir au choix (i) d’un modèle simple, correspondant à un modèle linéeaire sans transformer les variables, `model1` (ii) d’un modèle plus complexe, `model2` avec des possibles transformations des variables explicatives ou de la variable d'intérêt, etc
3.  Une partie qui presente succintement les modèles, en donnant, sur la base d'apprentissage (i) le R2
    ajusté (ii) l’indice d’Akaike AIC et (iii) l’indice BIC (iv) la
    liste des variables explicatives retenues

* à la fin, vous devez faire des prévisions de la variable `non_viol_per_pop`, sur une base de test `test_data_students`, à l'aide des deux modèles `model1` et `model2`. Les prévisions seront stockées dans une même base, exportées dans un fichier `Rda`, et le fichier devra être déposé sur Moodle.
* tout test utilisé qui n'a pas été présenté dans le cadre du cours devra être expliqué, motivé, et pointer vers une référence (la commande pour insérer un lien est, e.g. `<https://en.wikipedia.org/wiki/Anderson%E2%80%93Darling_test>`). Dans le cas contraitre, des points seront enlevés.
* les seuls packages autorises (sauf autorisation explicite) sont `MASS`, `lmtest`, `nortest`, `car`, `splines`, `AER`, `splines`, `Hmisc`, `np` les packages graphiques `ggplot2` (et éventuellement de couleurs, ou de mise en forme `knitr`, `stargazer`, `DT`, `papeR`, `formattable` etc), de manipulation de données `dplyr`, ainsi que les fonctions de base de `stats`. L'utilisation de tout autre package devra être demandée au préalable. Sinon, des points seront enlevés.
* la forme du document et sa lisibilité interviendront dans la notation. Afficher des tableaux de plusieurs centaines de lignes, par exemple, est à proscrire.
* les rapports sont individuels ! s'il est autorisé de discuter avec d'autres élèves du groupe (en respectant le protocol sanitaire en vigueur), chacun doit rendre son propre rapport. Dans le cas où deux fichiers identiques seraient envoyés par deux élèves différents, les deux élèves seront sanctionnés.

<img src="https://github.com/freakonometrics/STT5100/blob/master/archives/A2018/obviously.png" alt="drawing" width="300" align=right/>

* le fichier html doit être lisible dans un navigateur internet (Firefox) et le code Rmd doit compiler sans erreur. Le préambule du fichier Rmd doit contenir comme auteur le code permanent. Tout fichier qui ne compile pas et/ou qui n'est pas lisible donnera lieu à une forte pénalisation.

Au niveau pratique, pour avoir accès à _vos_ données, vous devez remplacer `code_permanent` ci-dessous par votre **vrai** code
permanent (avec les lettres en majuscules)

``` r
code_permanent = "ABCD12345678"
loc_fichier = paste("http://freakonometrics.free.fr/STT5100/H2022/data_",code_permanent,"_train.Rda",sep="")
download.file(loc_fichier, "base_devoir_1.Rda")
load("base_devoir_1.Rda")
dim(data_students)
```

    ## [1]   6 107

On vous donne un ensemble de données qui contient des communautés à
travers les États-Unis avec leur nombre total de crimes non violents
pour 100 000 habitants `non_viol_per_pop`. On vous demande de faire une
prévision sur le nombre attendu de crimes non violents dans des
communautés où le nombre total n’est pas observé (mais les covariables
le sont). Les covariables de la base sont ici

-   `state`: US state (by 2 letter postal abbreviation)(nominal)
-   `population`: population for community (numeric -integer)
-   `householdsize`: mean people per household (numeric - decimal)
-   `racepercentageblack`: percentage of population that is african
    american (numeric - decimal)
-   `race_percentage_white`: percentage of population that is caucasian
    (numeric - decimal)
-   `race_percentage_asian`: percentage of population that is of asian
    heritage (numeric - decimal)
-   `race_percentage_hisp`: percentage of population that is of hispanic
    heritage (numeric - decimal)
-   `age_percentage12t21`: percentage of population that is 12-21 in age
    (numeric - decimal)
-   `age_percentage12t29`: percentage of population that is 12-29 in age
    (numeric - decimal)
-   `age_percentage16t24`: percentage of population that is 16-24 in age
    (numeric - decimal)
-   `age_percentage65up`: percentage of population that is 65 and over
    in age (numeric - decimal)
-   `numb_urban`: number of people living in areas classified as urban
    (numeric - expected to be integer)
-   `percentage_urban`: percentage of people living in areas classified
    as urban (numeric - decimal)
-   `med_income   median`: household income (numeric - may be integer)
-   `percentage_w_wage`: percentage of households with wage or salary
    income in 1989 (numeric - decimal)
-   `percentage_w_farm_self`: percentage of households with farm or self
    employment income\`: in 1989 (numeric - decimal)
-   `percentage_w_inv_inc`: percentage of households with investment /
    rent income in 1989 (numeric - decimal)
-   `percentage_w_soc_sec`: percentage of households with social
    security income in 1989 (numeric - decimal)
-   `percentage_w_pub_asst`: percentage of households with public
    assistance income in 1989 (numeric - decimal)
-   `percentage_w_retire`: percentage of households with retirement
    income in 1989 (numeric - decimal)
-   `med_fam_inc`: median family income (differs from household income
    for non-family households) (numeric - may be integer)
-   `per_cap_inc`: per capita income (numeric - decimal)
-   `white_per_cap`: per capita income for caucasians (numeric -
    decimal)
-   `black_per_cap`: per capita income for african americans (numeric -
    decimal)
-   `indian_per_cap`: per capita income for native americans (numeric -
    decimal)
-   `asian_per_cap`: per capita income for people with asian heritage
    (numeric - decimal)
-   `other_per_cap`: per capita income for people with ‘other’ heritage
    (numeric - decimal)
-   `hisp_per_cap`: per capita income for people with hispanic heritage
    (numeric - decimal)
-   `num_under_pov`: number of people under the poverty level (numeric -
    expected to be integer)
-   `percentage_pop_under_pov`: percentage of people under the poverty
    level (numeric - decimal)
-   `percentage_less9th_grade percentage`: of people 25 and over with
    less than a 9th grade education (numeric - decimal)
-   `percentage_not_h_s_grad`: percentage of people 25 and over that are
    not high school graduates (numeric - decimal)
-   `percentage_b_sor_more`: percentage of people 25 and over with a
    bachelors degree or higher education (numeric - decimal)
-   `percentage_unemployed`: percentage of people 16 and over, in the
    labor force, and unemployed (numeric - decimal)
-   `percentage_employ`: percentage of people 16 and over who are
    employed (numeric - decimal)
-   `percentage_empl_manu`: percentage of people 16 and over who are
    employed in manufacturing (numeric - decimal)
-   `percentage_empl_prof_serv`: percentage of people 16 and over who
    are employed in professional services (numeric - decimal)
-   `percentage_occup_manu`: percentage of people 16 and over who are
    employed in manufacturing (numeric - decimal)
-   `percentage_occup_mgmt_prof`: percentage of people 16 and over who
    are employed in management or professional occupations (numeric -
    decimal)
-   `male_percentage_divorce`: percentage of males who are divorced
    (numeric - decimal)
-   `male_percentage_nev_marr`: percentage of males who have never
    married (numeric - decimal)
-   `female_percentage_div`: percentage of females who are divorced
    (numeric - decimal)
-   `total_percentage_div`: percentage of population who are divorced
    (numeric - decimal)
-   `pers_per_fam`: mean number of people per family (numeric - decimal)
-   `percentage_fam2_par`: percentage of families (with kids) that are
    headed by two parents (numeric - decimal)
-   `percentage_kids2_par`: percentage of kids in family housing with
    two parents (numeric - decimal)
-   `percentage_young_kids2_par`: percent of kids 4 and under in two
    parent households (numeric - decimal)
-   `percentage_teen2_par`: percent of kids age 12-17 in two parent
    households (numeric - decimal)
-   `percentage_work_mom_young_kids`: percentage of moms of kids 6 and
    under in labor force (numeric - decimal)
-   `percentage_work_mom`: percentage of moms of kids under 18 in labor
    force (numeric - decimal)
-   `num_kids_born_never_mar`: number of kids born to never married
    (numeric - expected to be integer)
-   `percentage_kids_born_never_mar`: percentage of kids born to never
    married (numeric - decimal)
-   `num_immig`: total number of people known to be foreign born
    (numeric - expected to be integer)
-   `percentage_immig_recent`: percentage of *immigrants* who immigated
    within last 3 years (numeric - decimal)
-   `percentage_immig_rec5`: percentage of *immigrants* who immigated
    within last 5 years (numeric - decimal)
-   `percentage_immig_rec8`: percentage of *immigrants* who immigated
    within last 8 years (numeric - decimal)
-   `percentage_immig_rec10`: percentage of *immigrants* who immigated
    within last 10 years (numeric - decimal)
-   `percentage_recent_immig`: percent of *population* who have
    immigrated within the last 3 years (numeric - decimal)
-   `percentage_rec_immig5`: percent of *population* who have immigrated
    within the last 5 years (numeric - decimal)
-   `percentage_rec_immig8`: percent of *population* who have immigrated
    within the last 8 years (numeric - decimal)
-   `percentage_rec_immig10`: percent of *population* who have
    immigrated within the last 10 years (numeric - decimal)
-   `percentage_speak_engl_only`: percent of people who speak only
    English (numeric - decimal)
-   `percentage_not_speak_engl_well`: percent of people who do not speak
    English well (numeric - decimal)
-   `percentage_larg_house_fam`: percent of family households that are
    large (6 or more) (numeric - decimal)
-   `percentage_larg_house_occup`: percent of all occupied households
    that are large (6 or more people) (numeric - decimal)
-   `pers_per_occup_hous`: mean persons per household (numeric -
    decimal)
-   `pers_per_own_occ_hous`: mean persons per owner occupied household
    (numeric - decimal)
-   `pers_per_rent_occ_hous`: mean persons per rental household
    (numeric - decimal)
-   `percentage_pers_own_occup`: percent of people in owner occupied
    households (numeric - decimal)
-   `percentage_pers_dense_hous`: percent of persons in dense housing
    (more than 1 person per room) (numeric - decimal)
-   `percentage_hous_less3_b_r`: percent of housing units with less than
    3 bedrooms (numeric - decimal)
-   `med_num_b_r`: median number of bedrooms (numeric - decimal)
-   `hous_vacant`: number of vacant households (numeric - expected to be
    integer)
-   `percentage_hous_occup`: percent of housing occupied (numeric -
    decimal)
-   `percentage_hous_own_occ`: percent of households owner occupied
    (numeric - decimal)
-   `percentage_vacant_boarded`: percent of vacant housing that is
    boarded up (numeric - decimal)
-   `percentage_vac_more6_mos`: percent of vacant housing that has been
    vacant more than 6 months (numeric - decimal)
-   `med_yr_hous_built`: median year housing units built (numeric - may
    be integer)
-   `percentage_hous_no_phone`: percent of occupied housing units
    without phone (in 1990, this was rare!) (numeric - decimal)
-   `percentage_w_o_full_plumb`: percent of housing without complete
    plumbing facilities (numeric - decimal)
-   `own_occ_low_quart`: owner occupied housing - lower quartile value
    (numeric - decimal)
-   `own_occ_med_val`: owner occupied housing - median value (numeric -
    decimal)
-   `own_occ_hi_quart`: owner occupied housing - upper quartile value
    (numeric - decimal)
-   `own_occ_qrange`: owner occupied housing - difference between upper
    quartile and lower quartile values (numeric - decimal)
-   `rent_low_q`: rental housing - lower quartile rent (numeric -
    decimal)
-   `rent_median`: rental housing - median rent (Census variable H32B
    from file STF1A) (numeric - decimal)
-   `rent_high_q`: rental housing - upper quartile rent (numeric -
    decimal)
-   `rent_qrange`: rental housing - difference between upper quartile
    and lower quartile rent (numeric - decimal)
-   `med_rent`: median gross rent (Census variable H43A from file
    STF3A - includes utilities) (numeric - decimal)
-   `med_rent_percentage_hous_inc`: median gross rent as a percentage of
    household income (numeric - decimal)
-   `med_own_cost_percentage_inc`: median owners cost as a percentage of
    household income - for owners with a mortgage (numeric - decimal)
-   `med_own_cost_percentage_inc_no_mtg`: median owners cost as a
    percentage of household income - for owners without a mortgage
    (numeric - decimal)
-   `num_in_shelters`: number of people in homeless shelters (numeric -
    expected to be integer)
-   `num_street`: number of homeless people counted in the street
    (numeric - expected to be integer)
-   `percentage_foreign_born`: percent of people foreign born (numeric -
    decimal)
-   `percentage_born_same_state`: percent of people born in the same
    state as currently living (numeric - decimal)
-   `percentage_same_house85`: percent of people living in the same
    house as in 1985 (5 years before) (numeric - decimal)
-   `percentage_same_city85`: percent of people living in the same city
    as in 1985 (5 years before) (numeric - decimal)
-   `percentage_same_state85`: percent of people living in the same
    state as in 1985 (5 years before) (numeric - decimal)
-   `land_area`: land area in square miles (numeric - decimal)
-   `pop_dens`: population density in persons per square mile (numeric -
    decimal)
-   `percentage_use_pub_trans`: percent of people using public transit
    for commuting (numeric - decimal)
-   `lemas_percentage_offic_drug_un`: percent of officers assigned to
    drug units (numeric - decimal)
-   `gang_unit_deployment`: is a special gang unit deployed (string)
-   `drug_officers`: how high is the deployment of specialized drug
    officers (string)
-   `force_diversity`: how high is the diversity of the police force
    (string)
-   `non_viol_per_pop`: total number of non-violent crimes per 100K
    popuation (numeric - decimal)

Vous devez ensuite construire vos modèles, par exemple

``` r
model1 = lm(non_viol_per_pop~1, data = data_students)
model2 = lm(non_viol_per_pop~1+rent_median, data = data_students)
```

Pour finir, vous devez faire une prévision à partir de la base
`test_data_students`,

``` r
code_test = "test"
loc_fichier = paste("http://freakonometrics.free.fr/STT5100/H2022/data_",code_test,".Rda",sep="")
download.file(loc_fichier, "base_devoir_1_test.Rda")
load("base_devoir_1_test.Rda")
dim(test_data_students)
```

    ## [1] 425 106

On construit alors 2 séries de prévisions, à partir des 2 modèles

``` r
prevision = data.frame(yhat_1 = predict(model1, newdata = test_data_students),
                       yhat_2 = predict(model2, newdata = test_data_students))
names(prevision) = paste("Y_",code_permanent,1:ncol(prevision),sep="")
str(prevision)
```

    ## 'data.frame':    425 obs. of  2 variables:
    ##  $ Y_ABCD123456781: num  6226 6226 6226 6226 6226 ...
    ##  $ Y_ABCD123456782: num  5842 5308 4523 5586 4640 ...

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

    ## 'data.frame':    425 obs. of  2 variables:
    ##  $ Y_ABCD123456781: num  6226 6226 6226 6226 6226 ...
    ##  $ Y_ABCD123456782: num  5842 5308 4523 5586 4640 ...
