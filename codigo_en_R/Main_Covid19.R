
              #___________________________________________________#
              #####################################################
              #   SIMULACION PROYECTO DE GRADO CASOS COVID-19     #
              #              EMPLEANDO METODO DMD                 #
              #___________________________________________________#
              #####################################################
              #                     MAIN                          #
              #___________________________________________________#
              #####################################################
              #                   Autores:                        #
              #          Fabian David Navarro Cano.               #
              #             Abel Alvarez Bustos.                  #
              #___________________________________________________#
            

library(rgdal)
library(RColorBrewer)
library(sp)

##---{Funcion para cargar los Shapes/Raster de la ciudad}

cali<-readOGR("C:/Users/fabian.navarro/Google Drive/Proyecto_Covid19DMD/Enviar/mc_comunas/mc_comunas.shp")
plot(cali)

write.csv(as.data.frame(cali@data),file = "cali.csv")

##---{Mapa geografico de los aportes a las magnitudes}

magn<-read.csv("C:/Users/fabian.navarro/Google Drive/Proyecto_Covid19DMD/Enviar/codigo_en_R/calicc.csv",header = T,sep=",",dec=".",row.names=1)
cali@data<-magn

myColor <- brewer.pal(n = 9, name = "YlOrRd")
spplot(cali,"Column2",main="Comunas de contagio COVID19 asociado \na la mayor magnitud vectorial para \nla ciudad de Santiago de Cali", lwd=2, col.regions = myColor, cuts= 8)

##---{Mapa geografico de los aportes a la frecuencia}

freq<-read.csv("C:/Users/fabian.navarro/Google Drive/Proyecto_Covid19DMD/Enviar/codigo_en_R/caliPhase.csv",header = T,sep=",",dec=".",row.names=1)
cali@data<-freq

myColor <- brewer.pal(n = 9, name = "YlOrRd")
spplot(cali,"Column2",main="Frecuencia al contagio de COVID19 asociado \na la mayor oscilacion de frecuencia para \nla ciudad de Santiago de Cali", lwd=2, col.regions = myColor, cuts= 8)
