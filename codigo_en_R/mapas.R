library(rgdal)
library(RColorBrewer)
library(sp)

################# MAGNITUDE #######################

cali<-readOGR("C:/Users/fabian.navarro/Google Drive/Proyecto_Covid19DMD/Enviar/mc_comunas/mc_comunas.shp")
plot(cali)
cali@data   #muestra los datos de lectura
View(cali@data) #muestra los datos couna tabla
#write(cali@data)
write.csv(as.data.frame(cali@data),file = "cali.csv")
datos<-read.csv("C:/Users/fabian.navarro/Google Drive/Proyecto_Covid19DMD/Enviar/codigo_en_R/calicc.csv",header = T,sep=",",dec=".",row.names=1)
cali@data<-datos

View(cali@data)
mean(datos$Column2)
#spplot((cali))
myColor <- brewer.pal(n = 9, name = "YlOrRd")
spplot(cali,"Column2",main="Comunas de contagio COVID19 asociado \na la mayor magnitud vectorial para \nla ciudad de Santiago de Cali", lwd=2, col.regions = myColor, cuts= 8)

################# PHASE #######################

phase<-read.csv("C:/Users/fabian.navarro/Google Drive/Proyecto_Covid19DMD/Enviar/codigo_en_R/caliPhase.csv",header = T,sep=",",dec=".",row.names=1)
cali@data<-phase
mean(phase$Column2)
spplot(cali,"Column2",main="Frecuencia al contagio de COVID19 asociado \na la mayor oscilacion de frecuencia para \nla ciudad de Santiago de Cali", lwd=2, col.regions = myColor, cuts= 8)

################################################
# Datos sobre Dengue de la Region Panamericana #
################################################

OPS <-readOGR("C:/Users/fabian.navarro/Google Drive/Proyecto_Covid19DMD/Enviar/Pan_Americ_Data/america.shp")
dt <- data.frame(OPS@data[c(3:6)])
View(OPS@data)
View(dt)
write.csv(dt ,file = "C:/Users/fabian.navarro/Google Drive/Proyecto_Covid19DMD/Enviar/codigo_en_R/america.csv")
plot(OPS)

Panamer <-read.csv("C:/Users/fabian.navarro/Google Drive/Proyecto_Covid19DMD/Enviar/codigo_en_R/americacc.csv", header = T, sep =",", dec=".")
View(Panamer)
OPS@data<-Panamer
View(OPS@data)

mean(OPS$Column2)
#spplot((OPS))
myColor2 <- brewer.pal(n = 9, name = "YlOrRd")
spplot(OPS,"Column2",main="Paises con infeccion de Dengue asociados \na la mayor magnitud vectorial dentro de la \nOrganizacion Panamericana de Salud (OPS)", lwd=1, col.regions = myColor2, cuts= 8)

################# PHASE #######################

phasePana<-read.csv("C:/Users/fabian.navarro/Google Drive/Proyecto_Covid19DMD/Enviar/codigo_en_R/americaPhase.csv",header = T,sep=",",dec=".",row.names=1)
OPS@data<-phasePana
mean(phasePana$Column2)
spplot(OPS,"Column2",main="Frecuencia de infeccion Dengue asociado \na la mayor oscilacion de frecuencia para la\nOrganizacion Panamericana de Salud (OPS)", lwd=1, col.regions = myColor2, cuts= 8)

##############################
# PRUEBA PARA VISUALIZAR MAPAS
##############################

OPS1 <-readOGR("C:/Users/fabian.navarro/Google Drive/Proyecto_Covid19DMD/Enviar/Pan_Americ_Data/america.shp")
dt1 <- data.frame(OPS@data[c(3:6)])
View(OPS1@data)
View(dt1)
write.csv(dt ,file = "C:/Users/fabian.navarro/Google Drive/Proyecto_Covid19DMD/Enviar/codigo_en_R/americaMAPAS.csv")
plot(OPS1)

DataMapas <-read.csv("C:/Users/fabian.navarro/Google Drive/Proyecto_Covid19DMD/Enviar/codigo_en_R/americaMAPAScc.csv", header = T, sep =",", dec=",")
View(DataMapas)
OPS1@data<-DataMapas
View(OPS1@data)

mean(OPS1$X1980)
#spplot((OPS))

myColor3 <- rev(brewer.pal(n = 9, name = "Spectral"))
spplot(OPS1,"X2012", lwd=1, col.regions = myColor3, cuts= 8)


