
              #___________________________________________________#
              #####################################################
              #   SIMULACION PROYECTO DE GRADO CASOS DENGUE       #
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

##---{Funcion para cargar los Shapes/Raster de los paises}
            
OPS <-readOGR("C:/Users/fabian.navarro/Google Drive/Proyecto_Covid19DMD/Enviar/Pan_Americ_Data/america.shp")
dt <- data.frame(OPS@data[c(3:6)])  
plot(OPS)

write.csv(dt ,file = "C:/Users/fabian.navarro/Google Drive/Proyecto_Covid19DMD/Enviar/codigo_en_R/america.csv")

##---{Mapa geografico de los aportes a las magnitudes}

Panamer <-read.csv("C:/Users/fabian.navarro/Google Drive/Proyecto_Covid19DMD/Enviar/codigo_en_R/americacc.csv", header = T, sep =",", dec=".")
OPS@data<-Panamer

myColor2 <- brewer.pal(n = 9, name = "YlOrRd")
spplot(OPS,"Column2",main="Paises con infeccion de Dengue asociados \na la mayor magnitud vectorial dentro de la \nOrganizacion Panamericana de Salud (OPS)", lwd=1, col.regions = myColor2, cuts= 8)

##---{Mapa geografico de los aportes a la frecuencia}

phasePana<-read.csv("C:/Users/fabian.navarro/Google Drive/Proyecto_Covid19DMD/Enviar/codigo_en_R/americaPhase.csv",header = T,sep=",",dec=".",row.names=1)
OPS@data<-phasePana

myColor2 <- brewer.pal(n = 9, name = "YlOrRd")
spplot(OPS,"Column2",main="Frecuencia de infeccion Dengue asociado \na la mayor oscilacion de frecuencia para la\nOrganizacion Panamericana de Salud (OPS)", lwd=1, col.regions = myColor2, cuts= 8)
