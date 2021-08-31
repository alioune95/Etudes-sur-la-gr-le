install.packages("rgdal")
install.packages("sp")
install.packages("maptools")
install.packages("raster")
install.packages("haven")
install.packages("ggmap")
install.packages("ggplot2")
install.packages("cartography")
install.packages("lwgeom")
install.packages("sf")
install.packages("mass")
install.packages("tmaptools")
install.packages("maps")
install.packages("leaflet")
install.packages("questionr")

library("questionr")
library("dplyr")
library("leaflet")
library("maptools")
library("raster")
library("readxl")
library("lwgeom")
library("ggplot2")
library("cartography")
library("sf")
library("maps")
library("sp")
library("tmap")
library("tmaptools")
library("mapproj")
library("basemapR")
#Import des données----
arrests <- USArrests 
map_data("state")

tyy <- map_data("france")

ggplot ( tyy , aes ( long , lat ))+
geom_polygon(aes(x=long, y=lat, group = group),colour='white', fill='grey') +
geom_point(data=juillet19a1, aes(x=Longitude, y=Latitude), colour = 'black'
           ,shape="circle filled", fill='red', alpha=0.7 )+
geom_point(data=juillet19a5, aes(x=Longitude, y=Latitude), colour= "black",
           shape="circle filled", fill='violet', alpha=0.7)+
coord_map("albers",  at0 = 45.5, lat1 = 29.5)



ggplot ( tyy , aes ( long , lat ))+
        geom_polygon(aes(x=long, y=lat, group = group),colour='white', fill='grey') +
        geom_point(data=nombre_commune, aes(x=Longitude, y=Latitude), colour = 'black'
                   ,shape="circle filled", fill='red', alpha=0.7 )+
        coord_map("albers",  at0 = 45.5, lat1 = 29.5)

aa <- map_data(FranceFormes)
vignette("ggplot2-specs")

if (require("maps")) {
        ggplot ( aa  , aes ( long , lat ))+
                geom_polygon(aes(group = group)) +
                geom_map ( aes ( map_id=region, fill=region), ,map = aa ) +
                geom_contour()+
                geom_point(data=juillet19a1, aes(x=Longitude, y=Latitude, shape=), colour = 'steelblue', alpha=0.3)+
                geom_point(data=juillet19a5, aes(x=Longitude, y=Latitude), colour= "white", alpha=0.5)+
                coord_map("albers",  at0 = 45.5, lat1 = 29.5)
}

ids <- factor(c("1.1", "2.1", "1.2", "2.2", "1.3", "2.3"))


arrests$region <- tolower(rownames(USArrests))

states_map <- map_data("state")
arrests_map <- left_join(states_map, arrests, by = "region")
map('france', fill = TRUE, col = 1:10)
# Créer la carte
ggplot(arrests_map, aes(long, lat, group = group))+
        geom_polygon(aes(fill = Assault), color = "white")+
        scale_fill_viridis_c(option = "C")
gffff <- data(franceMapEnv)






grele <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/BDgrelenum.xlsx", sheet = "grele")
nombre_commune  <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/nombre_communes.xlsx")
villageois  <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/points.xlsx")
carte11 <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/carte11.xlsx")
carte22 <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/carte22.xlsx")
carte33 <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/carte33.xlsx")
carte44 <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/carte44.xlsx")
carte55 <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/carte55.xlsx")
juillet19 <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/juillet2019.xlsx")
juillet19a1 <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/juillet2019a1.xlsx")
juillet19a2 <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/juillet2019a2.xlsx")
juillet19a3 <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/juillet2019a3.xlsx")
juillet19a4 <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/juillet2019a4.xlsx")
juillet19a5 <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/juillet2019a5.xlsx")
carte1 <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/carte1.xlsx")
carte2 <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/carte2.xlsx")
carte3 <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/carte3.xlsx")
carte4 <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/carte4.xlsx")
carte5 <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/carte5.xlsx")
aout19a1 <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/aout19a1.xlsx")
aout19a2 <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/aout19a2.xlsx")
aout19a3 <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/aout19a3.xlsx")
aout19a4 <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/aout19a4.xlsx")
aout19a5 <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/aout19a5.xlsx")
grele_meteo <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/grele_meteo.xlsx")
grele_meteo2 <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/grele_meteo2.xlsx")
temps <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/temps1.xlsx")
temps_commune <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/commune_temps.xlsx")
dep_temps<- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/dep_temps.xlsx")
grele_meteoww <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/grelemeteoww.xlsx")
grele_meteoww1_2 <- read_xlsx("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/grelemeteoww12.xlsx")
synop <- read.csv2("C:/SAS/MEMOIRE GRELE/Donn--es Gr--les/postesSynop.csv")
#Carte de la France----
FranceFormes <- getData(name="GADM", country="FRA", level=1)



#Exposition des communes de France à la grêle----

plot(FranceFormes, border="black", col="white", bg="white",main="Exposition des communes de France à la grêle")
points(nombre_commune$Longitude, nombre_commune$Latitude, pch=21, bg=24, col=rgb(red=0, green=0, blue=0, alpha=0.1), cex=carte11$n)

plot(FranceFormes, border="grey", col="#AAAAAA", bg="white",main="Exposition des communes de France à la grêle")
points(nombre_commune$Longitude, nombre_commune$Latitude, pch=20, 
       col=rgb(red=1, green=0, blue=0, alpha=0.2), cex=nombre_commune$n)


#Tracons les différentes cartes de grêle selon leur classe de diamètre----


# Classe de diamètre A1
plot(FranceFormes, border="grey", col="#AAAAAA", bg="white", main="Grêle de la classe A1")
points(carte11$Longitude, carte11$Latitude, pch=20, bg= 'grey' ,col=rgb(red=1, green=0, blue=0, alpha=0.1), cex=carte11$n)

# Classe de diamètre A2
plot(FranceFormes, border="grey", col="#AAAAAA", bg="white",main="Grêle de la classe A2")
points(carte22$Longitude, carte22$Latitude, pch=20, col=rgb(red=1, green=0, blue=0, alpha=0.1), cex=carte22$n)

# Classe de diamètre A3
plot(FranceFormes,border="grey", col="#AAAAAA", bg="white", main="Grêle de la classe A3")
points(carte33$Longitude, carte33$Latitude, pch=20, col=rgb(red=1, green=0, blue=0, alpha=0.25), cex=carte33$n)

# Classe de diamètre A4
plot(FranceFormes, border="grey", col="#AAAAAA", bg="white",main="Grêle de la classe A4")
points(carte44$Longitude, carte44$Latitude, pch=20, col=rgb(red=1, green=0, blue=0, alpha=0.35), cex=carte44$n)

# Classe de diamètre A5 et plus
plot(FranceFormes,border="grey", col="#AAAAAA", bg="white", main="Grêle de la classe A5 et plus")
points(carte55$Longitude, carte55$Latitude, pch=20, col=rgb(red=1, green=0, blue=0, alpha=0.35), cex=carte55$n)


#evenement de debut juillet 2019

plot(FranceFormes,border="grey", col="#AAAAAA", bg="white", main="Grêle de la classe A5 et plus")
points(juillet19a1$Longitude, juillet19a1$Latitude, pch=20, col=rgb(red=0.2, green=1, blue=0, alpha = 0.75))
points(juillet19a2$Longitude, juillet19a2$Latitude, pch=20, col=rgb(red=1, green=1, blue=0, alpha = 0.75))
points(juillet19a3$Longitude, juillet19a3$Latitude, pch=20, col=rgb(red=0, green=0, blue=0.8,alpha = 0.75))
points(juillet19a4$Longitude, juillet19a4$Latitude, pch=20, col=rgb(red=0, green=0, blue=0,alpha = 0.75))
points(juillet19a5$Longitude, juillet19a5$Latitude, pch=20, col=rgb(red=1, green=0, blue=0,alpha = 0.75))

legend( "bottomleft", c("Classe A1", "Classe A2", "Classe A3", 
                        "Classe A4", "Classe A5"), pch = c(20,20,20,20,20),
        col = c(rgb(red=0.2, green=1, blue=0),
                rgb(red=1, green=1, blue=0),
                rgb(red=0, green=0, blue=0.8 ),
                rgb(red=0, green=0, blue=0),
                rgb(red=1, green=0, blue=0)),
        title = "Classe de diamètre des grêlons")

#Tous les classes en même temps
plot(FranceFormes,border="black", col="white", bg="white", main="Grêle de la classe A5 et plus")
points(carte1$Longitude, carte1$Latitude, pch=20, col=rgb(red=0.2, green=1, blue=0, alpha = 0.75))
points(carte2$Longitude, carte2$Latitude, pch=20, col=rgb(red=1, green=1, blue=0, alpha = 0.75))
points(carte3$Longitude, carte3$Latitude, pch=20, col=rgb(red=0, green=0, blue=0.8,alpha = 0.75))
points(carte4$Longitude, carte4$Latitude, pch=20, col=rgb(red=0, green=0, blue=0,alpha = 0.75))
points(carte5$Longitude, carte5$Latitude, pch=20, col=rgb(red=1, green=0, blue=0,alpha = 0.75))

legend( "bottomleft", c("Classe A1", "Classe A2", "Classe A3", 
                        "Classe A4", "Classe A5"), pch = c(20,20,20,20,20),
        col = c(rgb(red=0.2, green=1, blue=0),
                rgb(red=1, green=1, blue=0),
                rgb(red=0, green=0, blue=0.8 ),
                rgb(red=0, green=0, blue=0),
                rgb(red=1, green=0, blue=0)),
        title = "Classes de diamètre des grêlons")


#evenement aout 2019

plot(FranceFormes,border="grey", col="#AAAAAA", bg="white", main="Grêle de la classe A5 et plus")
points(aout19a1$Longitude, aout19a1$Latitude, pch=20, col=rgb(red=0.2, green=1, blue=0, alpha = 0.75))
points(aout19a2$Longitude, aout19a2$Latitude, pch=20, col=rgb(red=1, green=1, blue=0, alpha = 0.75))
points(aout19a3$Longitude, aout19a3$Latitude, pch=20, col=rgb(red=0, green=0, blue=0.8,alpha = 0.75))
points(aout19a4$Longitude, aout19a4$Latitude, pch=20, col=rgb(red=0, green=0, blue=0,alpha = 0.75))
points(aout19a5$Longitude, aout19a5$Latitude, pch=20, col=rgb(red=1, green=0, blue=0,alpha = 0.75))

legend( "bottomleft", c("Classe A1", "Classe A2", "Classe A3", 
                        "Classe A4", "Classe A5"), pch = c(20,20,20,20,20),
        col = c(rgb(red=0.2, green=1, blue=0),
                rgb(red=1, green=1, blue=0),
                rgb(red=0, green=0, blue=0.8 ),
                rgb(red=0, green=0, blue=0),
                rgb(red=1, green=0, blue=0)),
        title = "Classes de diamètre des grêlons")


#cartographie des conditions météo----


range(grele_meteo$t)


#carte position des stations météo

plot(FranceFormes,border="grey", col="#AAAAAA", bg="white", main="Grêle de la classe A5 et plus")
points(postesSynop$Longitude, postesSynop$Latitude, pch=20, bg= 'grey' ,col=rgb(red=1, green=0, blue=0,))


#regroupement en différentes classes

myData = grele_meteo[grele_meteo$Longitude > -180,]
mydata <- as.data.frame(myData)
mydata$temps <- cut(mydata$t, c(271, 274, 277, 280, 283, 286, 289, 294))


#tableau par classe


mydata0 <-  subset(mydata, temps=="(271,274]")
mydata1 <-  subset(mydata, temps=="(274,277]")
mydata2 <-  subset(mydata, temps=="(277,280]")
mydata3 <-  subset(mydata, temps=="(280,283]")
mydata4 <-  subset(mydata, temps=="(283,286]")
mydata5 <-  subset(mydata, temps=="(286,289]")
mydata6 <-  subset(mydata, temps=="(289,294]")


#carte sur la température
plot(FranceFormes,border="black", col="#AAAAAA", bg="white", main="Grêle de la classe A5 et plus")
points(mydata0$Longitude, mydata0$Latitude, pch=20, col=rgb(255, 220, 204,180, maxColorValue = 255))
points(mydata1$Longitude, mydata1$Latitude, pch=20, col=rgb(255, 170, 128,180, maxColorValue = 255))
points(mydata2$Longitude, mydata2$Latitude, pch=20, col=rgb(255, 119, 51,180,maxColorValue = 255))
points(mydata3$Longitude, mydata3$Latitude, pch=20, col=rgb(230, 77, 0,180, maxColorValue = 255))
points(mydata4$Longitude, mydata4$Latitude, pch=20, col=rgb(179, 60, 0,180,maxColorValue = 255))
points(mydata5$Longitude, mydata5$Latitude, pch=20, col=rgb(102, 34, 0, 180, maxColorValue = 255))
points(mydata6$Longitude, mydata6$Latitude, pch=20, col=rgb(51, 17, 0, 180, maxColorValue = 255))


legend( "bottomleft", c("271-274", "274-277", "277-280", 
         "280-283", "283-286", "286-289", "289-294"), pch = c(20,20,20,20,20,20,20),
       col = c(rgb(255, 220, 204, maxColorValue = 255),
               rgb(255, 170, 128, maxColorValue = 255),
               rgb(255, 119, 51,maxColorValue = 255),
               rgb(230, 77, 0, maxColorValue = 255),
               rgb(179, 60, 0,maxColorValue = 255),
               rgb(102, 34, 0, maxColorValue = 255),
               rgb(51, 17, 0, maxColorValue = 255),
       title = "Répartition de la tempétature en degré Kelvin"))


grele_meteo2$Region %in% FranceFormes@data$NAME_1 
grele_meteo3 = grele_meteo2[grele_meteo2$long > -180,]

dep_temps$Nom_departement %in% FranceFormes@data$NAME_2 

temps_commune$Commune %in% FranceFormes@data$NAME_4

grele_meteoww$Nom_departement%in% FranceFormes@data$NAME_2


#transformation de ww en facteur

grele_meteoww$ww <-factor(grele_meteoww$ww,
                       levels=c("27",
                                "87",
                                "88",
                                "89",
                                "90",
                                "93",
                                "94",
                                "96",
                                "99"
                       ),
                       labels = c("27",
                                  "87",
                                  "88",
                                  "89",
                                  "90",
                                  "93",
                                  "94",
                                  "96",
                                  "99"
                       )
)




FranceFormes@data <- left_join(FranceFormes@data, dep_temps, by = c('NAME_2' = 'Nom_departement'))
qtm(FranceFormes, "temps_myen")

FranceFormes@data <- left_join(FranceFormes@data, grele_meteoww, by = c('NAME_2' = 'Nom_departement'))
qtm(FranceFormes, "ww")


#carte sur ww

grele_meteoww27 <-subset(grele_meteoww, ww=="27")
grele_meteoww87 <-subset(grele_meteoww, ww=="87")
grele_meteoww88 <-subset(grele_meteoww, ww=="88")
grele_meteoww89 <-subset(grele_meteoww, ww=="89")
grele_meteoww90 <-subset(grele_meteoww, ww=="90")
grele_meteoww93 <-subset(grele_meteoww, ww=="93")
grele_meteoww94 <-subset(grele_meteoww, ww=="94")
grele_meteoww96 <-subset(grele_meteoww, ww=="96")



plot(FranceFormes,border="black", col="#AAAAAA", bg="white", main="Grêle de la classe A5 et plus")
points(grele_meteoww27$Longitude, grele_meteoww27$Latitude, pch=20, col=rgb(153, 204, 255,180, maxColorValue = 255))
points(grele_meteoww87$Longitude, grele_meteoww87$Latitude, pch=20, col=rgb(255, 128, 255,180, maxColorValue = 255))
points(grele_meteoww88$Longitude, grele_meteoww88$Latitude, pch=20, col=rgb(255, 51, 255,180, maxColorValue = 255))
points(grele_meteoww89$Longitude, grele_meteoww89$Latitude, pch=20, col=rgb(228, 153, 255,180, maxColorValue = 255))
points(grele_meteoww90$Longitude, grele_meteoww90$Latitude, pch=20, col=rgb(207, 77, 255,180, maxColorValue = 255))
points(grele_meteoww93$Longitude, grele_meteoww93$Latitude, pch=20, col=rgb(187, 0, 255,180, maxColorValue = 255))
points(grele_meteoww94$Longitude, grele_meteoww94$Latitude, pch=20, col=rgb(112, 0, 153,180, maxColorValue = 255))
points(grele_meteoww96$Longitude, grele_meteoww96$Latitude, pch=20, col=rgb(56, 0, 77,180, maxColorValue = 255))

legend( "bottomleft", c("27", "87", "88", 
                        "89", "90", "93", "94","96"),
        pch = c(20,20,20,20,20,20,20,20,20),
        col = c(rgb(153, 204, 255, maxColorValue = 255),
                rgb(255, 128, 255, maxColorValue = 255),
                rgb(255, 51, 255,maxColorValue = 255),
                rgb(228, 153, 255, maxColorValue = 255),
                rgb(207, 77, 255,maxColorValue = 255),
                rgb(187, 0, 255, maxColorValue = 255),
                rgb(112, 0, 153, maxColorValue = 255),
                rgb(56, 0, 77, maxColorValue = 255),
              
                title = "Répartition du temps présent"))


#carte sur w1 et w2

#transformation en facteur

grele_meteoww1_2$w1 <-factor(grele_meteoww1_2$w1,
                          levels=c("0",
                                   "1",
                                   "2",
                                   "6",
                                   "7",
                                   "8",
                                   "9",
                                   "mq"
                                   
                          ),
                          labels = c("0",
                                     "1",
                                     "2",
                                     "6",
                                     "7",
                                     "8",
                                     "9",
                                     "mq"
                          )
)



grele_meteoww1_2$w2 <-factor(grele_meteoww1_2$w2,
                          levels=c("0",
                                   "1",
                                   "2",
                                   "6",
                                   "7",
                                   "8",
                                   "9",
                                   "mq"
                          ),
                          labels = c("0",
                                     "1",
                                     "2",
                                     "6",
                                     "7",
                                     "8",
                                     "9",
                                     "mq"
                          )
)

grele_meteoww1_2w10 <-subset(grele_meteoww1_2, w1=="0")
grele_meteoww1_2w11 <-subset(grele_meteoww1_2, w1=="1")
grele_meteoww1_2w12 <-subset(grele_meteoww1_2, w1=="2")
grele_meteoww1_2w16 <-subset(grele_meteoww1_2, w1=="6")
grele_meteoww1_2w17 <-subset(grele_meteoww1_2, w1=="7")
grele_meteoww1_2w18 <-subset(grele_meteoww1_2, w1=="8")
grele_meteoww1_2w19 <-subset(grele_meteoww1_2, w1=="9")

grele_meteoww1_2w20 <-subset(grele_meteoww1_2, w2=="0")
grele_meteoww1_2w21 <-subset(grele_meteoww1_2, w2=="1")
grele_meteoww1_2w22 <-subset(grele_meteoww1_2, w2=="2")
grele_meteoww1_2w26 <-subset(grele_meteoww1_2, w2=="6")
grele_meteoww1_2w27 <-subset(grele_meteoww1_2, w2=="7")
grele_meteoww1_2w28 <-subset(grele_meteoww1_2, w2=="8")
grele_meteoww1_2w29 <-subset(grele_meteoww1_2, w2=="9")


#carte pour w1
plot(FranceFormes,border="black", col="#AAAAAA", bg="white", main="Grêle de la classe A5 et plus")
points(grele_meteoww1_2w10$Longitude, grele_meteoww1_2w10$Latitude, pch=20, col=rgb(255, 128, 255,180, maxColorValue = 255))
points(grele_meteoww1_2w11$Longitude, grele_meteoww1_2w11$Latitude, pch=20, col=rgb(255, 255, 0,180, maxColorValue = 255))
points(grele_meteoww1_2w12$Longitude, grele_meteoww1_2w12$Latitude, pch=20, col=rgb(179, 102, 255, maxColorValue = 255))
points(grele_meteoww1_2w16$Longitude, grele_meteoww1_2w16$Latitude, pch=20, col=rgb(179, 89, 0,180, maxColorValue = 255))
points(grele_meteoww1_2w17$Longitude, grele_meteoww1_2w17$Latitude, pch=20, col=rgb(214, 214, 194, maxColorValue = 255))
points(grele_meteoww1_2w18$Longitude, grele_meteoww1_2w18$Latitude, pch=20, col=rgb(56, 0, 77,180, maxColorValue = 255))
points(grele_meteoww1_2w19$Longitude, grele_meteoww1_2w19$Latitude, pch=20, col=rgb(51, 255, 51,180, maxColorValue = 255))

legend( "bottomleft", c("0", "1", "2", 
                        "6", "7", "8", "9"),
        pch = c(20,20,20,20,20,20,20),
        col = c(rgb(255, 128, 255, maxColorValue = 255),
                rgb(255, 255, 0, maxColorValue = 255),
                rgb(179, 102, 255,maxColorValue = 255),
                rgb(179, 89, 0, maxColorValue = 255),
                rgb(214, 214, 194,maxColorValue = 255),
                rgb(56, 0, 77, maxColorValue = 255),
                rgb(51, 255, 51, maxColorValue = 255),
                title = "Répartition du temps passé"))


#carte pour w2

plot(FranceFormes,border="black", col="#AAAAAA", bg="white", main="Grêle de la classe A5 et plus")
points(grele_meteoww1_2w20$Longitude, grele_meteoww1_2w20$Latitude, pch=20, col=rgb(77, 166, 255,180, maxColorValue = 255))
points(grele_meteoww1_2w21$Longitude, grele_meteoww1_2w21$Latitude, pch=20, col=rgb(255, 255, 0, maxColorValue = 255))
points(grele_meteoww1_2w22$Longitude, grele_meteoww1_2w22$Latitude, pch=20, col=rgb(179, 102, 255,180, maxColorValue = 255))
points(grele_meteoww1_2w26$Longitude, grele_meteoww1_2w26$Latitude, pch=20, col=rgb(179, 89, 0,180, maxColorValue = 255))
points(grele_meteoww1_2w27$Longitude, grele_meteoww1_2w27$Latitude, pch=20, col=rgb(214, 214, 194,180, maxColorValue = 255))
points(grele_meteoww1_2w28$Longitude, grele_meteoww1_2w28$Latitude, pch=20, col=rgb(56, 0, 77,180, maxColorValue = 255))
points(grele_meteoww1_2w29$Longitude, grele_meteoww1_2w29$Latitude, pch=20, col=rgb(51, 255, 51,180, maxColorValue = 255))


legend( "bottomleft", c("0", "1", "2", 
                        "6", "7", "8", "9"),
        pch = c(20,20,20,20,20,20,20),
        col = c(rgb(77, 166, 255, maxColorValue = 255),
                rgb(255, 255, 0, maxColorValue = 255),
                rgb(179, 102, 255,maxColorValue = 255),
                rgb(179, 89, 0, maxColorValue = 255),
                rgb(214, 214, 194,maxColorValue = 255),
                rgb(56, 0, 77, maxColorValue = 255),
                rgb(51, 255, 51, maxColorValue = 255),
                title = "Répartition du temps passé"))

