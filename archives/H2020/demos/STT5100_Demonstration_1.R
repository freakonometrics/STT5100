###########################
#STT5100: Démonstration #1#
#Auteur: Alexandre LeBlanc#
#Date: 13/09/19           #
###########################

setwd("/Users/alexandreleblanc/Desktop/Documents de cours/STT 5100")

#############################
#Installation des paquetages#
#############################
install.packages("ggplot2", "Hmisc", "vioplot", "pastecs", "knitr", "gridExtra", "kableExtra")
devtools::install_github("haozhu233/kableExtra")
library(ggplot2)
library(Hmisc)
library(vioplot)
library(pastecs)
library(knitr)
library(gridExtra)
library(kableExtra)

########################
#Importation de données#
########################
code_permanent = "ABCD12345678"
loc_fichier = paste("http://freakonometrics.free.fr/", code_permanent, ".RData", sep = "")
download.file(loc_fichier, "base_devoir_1.RData")
load("base_devoir_1.RData")
dim(database)

attach(database)
str(database)

##################
#Valeurs intiales#
##################
marges_defaut = c(5.1, 4.1, 4.1, 2.1)

###########################
#Statistiques descriptives#
###########################
summary(database)
describe(database)
stat.desc(database[,sapply(database, is.integer) | sapply(database, is.numeric)])

###############################
#Visualisations avec R de base#
###############################
zone_num = table(Zone)
barplot(height = zone_num, beside = TRUE, col = "#2A9BF3", xlab = "Zone", ylab = "Effectif", main = "Variable Zone")

hist(Prix, col = "#2A9BF3", xlab = "Prix ($)", ylab = "Effectif", main = "Variable Prix")
hist(Prix/Surface_Lot, col = "#2A9BF3", xlab = "Prix/Surface ($/pi^2)", ylab = "Effectif", main = "Prix par Superficie")

boxplot(Prix ~ Cuisine_Qualite, plot = TRUE, col = c("red", "white", "blue", "grey", "purple"), main = "Prix par Qualité de la Cuisine", ylab = "Prix ($)", xlab = "Qualité de Cuisine")
legend("topright", inset = .02, title = "Qualité de Cuisine", c("Excellent", "Fair", "Good", "Poor", "TA"), fill = c("red", "white", "blue", "grey", "purple"), cex = 0.8)

par(mfrow = c(2, 3), oma = c(0, 0, 2, 0))
for(k in levels(Logement)){
  if(levels(Logement)[1] == k){
    plot(x = Surface_Lot[Logement == k], y = Prix[Logement == k], main = k, ylab = "Prix ($)", xlab = "Superficie (pi^2)")
  }else{
    plot(x = Surface_Lot[Logement == k], y = Prix[Logement == k], main = k, xlab = "", ylab = "")
  }
}
title("Prix par Superficie (par type de Logement)", outer = TRUE)

par(mfrow = c(1, 1), oma = marges_defaut)
vioplot(Prix ~ droplevels(Configuration), horizontal = TRUE, col = "magenta", xlab = "Prix ($)", ylab = "Configuration")
title("Prix par Superficie (par Configuration)")
abline(v = mean(Prix), col = "red", lty = 2)
abline(v = median(Prix), col = "blue", lty = 2)
legend("right", inset = .02, c("Moyenne (Prix)", "Médiane (Prix)"), lty = c(2, 2), col = c("red", "blue"), cex = 0.8)

#############################
#Visualisations avec ggplot2#
#############################
ggplot(database, aes(Zone)) + geom_bar(fill = "#2A9BF3") + 
                              xlab("Zone") + 
                              ylab("Effectif") + 
                              labs(title = "Variable Zone") + 
                              theme(axis.text.x = element_text(angle = 90, vjust = 0.5), plot.title = element_text(hjust = 0.5))

ggplot(database, aes(Prix)) + geom_histogram(fill = "#2A9BF3", bins = 8) + 
                              xlab("Prix ($)") + 
                              ylab("Effectif") + 
                              labs(title = "Variable Prix") + 
                              theme(axis.text.x = element_text(vjust = 0.5), plot.title = element_text(hjust = 0.5))

ggplot(database, aes(Prix/Surface_Lot)) + geom_histogram(fill = "#2A9BF3", bins = 8) + 
                                          xlab("Prix/Surface ($/pi^2)") + 
                                          ylab("Effectif") + 
                                          labs(title = "Prix par Superficie", subtitle = "Sous-titre") + 
                                          theme(axis.text.x = element_text(vjust = 0.5), plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5))

ggplot(database, aes(x = Cuisine_Qualite, y = Prix, fill = Cuisine_Qualite)) + geom_boxplot(color = "black", fill = c("blue", "white", "red", "purple")) + 
                                                                               xlab("Qualité de Cuisine") + 
                                                                               ylab("Prix ($)") +
                                                                               labs(title = "Prix par Qualité de Cuisine") + 
                                                                               theme(axis.text.x = element_text(vjust = 0.5), plot.title = element_text(hjust = 0.5)) +
                                                                               theme(legend.position = "top")

ggplot(database, aes(x = Surface_Lot, y = Prix, color = Style)) + geom_point() + 
                                                                  facet_wrap(~ Logement) +
                                                                  xlab("Surface (pi^2)") +
                                                                  ylab("Prix ($)") +
                                                                  ggtitle("Prix par Superficie (par type de Logement)") + 
                                                                  theme(plot.title = element_text(hjust = 0.5))

ggplot(database, aes(x = droplevels(Configuration), y = Prix)) + geom_violin(fill = "magenta", adjust = 1) + 
                                                                 coord_flip() +
                                                                 geom_boxplot(width = 0.2) +
                                                                 geom_hline(aes(yintercept = mean(Prix)), color = "red", linetype = "dashed", size = 1, show.legend = TRUE) +
                                                                 geom_hline(aes(yintercept = median(Prix)), color = "blue", linetype = "dashed", size = 1) +
                                                                 xlab("Configuration") + 
                                                                 ylab("Prix ($)") + 
                                                                 ggtitle("Prix par Superficie (par Configuration)") + 
                                                                 theme(plot.title = element_text(hjust = 0.5))
                                                              
                                                                



