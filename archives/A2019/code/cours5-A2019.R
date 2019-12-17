library(DALEX)
data(apartments, package = "DALEX")
chicago=read.table("http://freakonometrics.free.fr/chicago.txt",header=TRUE,sep=";")

str(apartments)
reg=lm(m2.price ~ ., data=apartments)
summary(reg)
reg=lm(m2.price ~ .+I(construction.year^2), data=apartments)
summary(reg)

boxplot(apartments$m2.price~apartments$district)

str(chicago)

reg=lm(Fire~ .,data=chicago)
summary(reg)
reg23=lm(Fire~ X_2+X_3,data=chicago)
summary(reg23)
reg12=lm(Fire~ X_1+X_2,data=chicago)
summary(reg12)
summary(lm(Prix~ Surface_Lot + Int_Qualite+
             Construction_Annee+Renovation_Annee+
             Surface_RdC +Foyer             +Vente_Annee,data=database))


summary(lm(Prix~ Surface_Lot + Int_Qualite+
             Construction_Annee+
             Surface_RdC +Foyer             +Vente_Annee,data=database))
summary(lm(Prix~ Surface_Lot + Int_Qualite+
             Construction_Annee+
             Surface_RdC +Foyer  ,data=database))

summary(lm(Prix~ Surface_Lot + Int_Qualite+
             Construction_Annee,data=database))
summary(lm(Prix~ Surface_RdC +Foyer,data=database))


reg= lm(Prix~ Surface_Lot + Int_Qualite+ Int_Condition+
                  Construction_Annee+Renovation_Annee+Garage_Ext_Surface+
                  Surface_RdC +Foyer+Vente_Annee,data=database)
summary(reg)
AIC(reg)

sdatabase=database[,c('Prix','Surface_Lot','Int_Qualite','Int_Condition',
'Construction_Annee','Renovation_Annee','Garage_Ext_Surface',
'Surface_RdC','Foyer','Vente_Annee')]
reg=lm(Prix~.,data=sdatabase)
step(reg)



