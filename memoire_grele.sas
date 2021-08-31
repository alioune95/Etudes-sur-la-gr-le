libname rica 'C:\SAS\synop';
libname bra 'C:\SAS\MEMOIRE GRELE';



			/*****************************************************************************************/
			/*****************************IMPORTATION DES BASES DE DONNEES****************************/
			/*****************************************************************************************/
proc freq data=bra.grele; table departement; run;
data  grele2019;
infile 'C:\SAS\MEMOIRE GRELE\Donn--es Gr--les\BDGrele2019.csv' delimiter = ';' missover DSD lrecl=32767 firstobs=2 ;
informat 
		Date DDMMYY10.
		Indicatif BEST5.
		Annee BEST4.
		Mois BEST2.
		Jour BEST2.
		Commune $CHAR38.
        INSEE BEST5.
        Departement BEST2.
        Nom_departement $CHAR23.
        Population BEST6.
        Region $CHAR26.
        Longitude BEST20.
        Latitude BEST18.
        Classe_de_diametre $CHAR15.
        Classe_simple $CHAR2.
        Diametre_min BEST3.
        Diametre_max BEST3.
        Observation $CHAR1. ;

format 
		Date    DDMMYY10.
		Indicatif Z5.
		Annee   BEST4.
		Mois  BEST2.
		Jour    BEST2.
        Commune $CHAR38.
        INSEE Z5.
        Departement BEST2.
        Nom_departement $CHAR23.
        Population       BEST6.
        Region           $CHAR26.
        Longitude        BEST20.
        Latitude         BEST18.
        Classe_de_diametre $CHAR15.
        Classe_simple  $CHAR2.
        Diametre_min BEST3.
        Diametre_max  BEST3.
        Observation  $CHAR1.;

input 
		Date             
		Indicatif        
        Annee  
        Mois  
        Jour    
        Commune $
        INSEE 
        Departement 
        Nom_departement $
        Population       
        Region $          
        Longitude        
        Latitude         
        Classe_de_diametre $
        Classe_simple $
        Diametre_min 
        Diametre_max
        Observation  $   ;
 

run;




data  grelefr;
infile 'C:\SAS\MEMOIRE GRELE\Donn--es Gr--les\BDgreleFR.csv' delimiter = ';' missover DSD lrecl=32767 firstobs=2 ;
informat 
		Date    DDMMYY10.
		Annee   BEST4.
		Mois  BEST2.
		Jour    BEST2.
        Commune $CHAR38.
        INSEE BEST5.
        Departement BEST2.
        Nom_departement $CHAR23.
        Population       BEST6.
        Region           $CHAR26.
        Longitude        BEST20.
        Latitude         BEST18.
        Classe_de_diametre $CHAR15.
        Classe_simple  $CHAR2.
        Diametre_min BEST3.
        Diametre_max  BEST3.
        Observation  $CHAR1. ;

format 
		Date    DDMMYY10.
		Annee   BEST4.
		Mois  BEST2.
		Jour    BEST2.
        Commune $CHAR38.
        INSEE Z5.
        Departement BEST2.
        Nom_departement $CHAR23.
        Population       BEST6.
        Region           $CHAR26.
        Longitude        BEST20.
        Latitude         BEST18.
        Classe_de_diametre $CHAR15.
        Classe_simple  $CHAR2.
        Diametre_min BEST3.
        Diametre_max  BEST3.
        Observation  $CHAR1.
;

input 
		Date             
		Annee  
        Mois  
        Jour    
        Commune $
        INSEE 
        Departement 
        Nom_departement $
        Population       
        Region $          
        Longitude        
        Latitude         
        Classe_de_diametre $
        Classe_simple $
        Diametre_min 
        Diametre_max
        Observation  $   ;
 
run;





		/*****************************************************************************************************/
		/************************************PREPARATION DES DONNEES******************************************/
		/*****************************************************************************************************/


*Nous pouvons supprimer la variable indicatif de la table 'grele2019' vu qu'elle a la meme valeur que INSEE;
*Nous pouvons également enlever la variable 'Observation' des deux tables sachant que celle ci ne donne aucune information;

data grele2019;
set grele2019;
drop Indicatif Observation ;
run;

data grelefr;
set grelefr;
drop Observation;
run;


*Nous pouvons trier nos deux tables notamment en fonction de la date ;

proc sort data = grelefr;
by Date;
run;

proc sort data = grele2019;
by Date;
run;


*Concaténons nos deux tables afin d'en avoir qu'une seule;

data bra.grele;
set grelefr grele2019 ;
run;


* Exportons la table sous un fichier excel;

data bra.grele;
set bra.grele;
if classe_de_diametre in ("A3 (2 à 2.9 cm)") then classe_de_diametre="A2 (2 à 2.9 cm)";
run;
proc freq data = bra.grele; order = freq;
tables classe_de_diametre / missing;
run;

proc export data = bra.grele
		outfile = 'C:\R\Econometrie spatiale\data\data_grele.xlsx'
		dbms = excel replace;
		sheet = 'grele';
run;
		/*************************************************************************************************/
		/******************************STATISTIQUES DESCRIPTIVES******************************************/
		/*************************************************************************************************/



/*************TABLEAUX CROISEES**************/


*La représentation des départements et des différents classe de diamètre de grele;

proc freq data = bra.grele order = freq;
tables nom_departement / missing;
tables region / missing;
tables classe_de_diametre / missing;
run;


*Les classes de diamètres par région;

proc freq data = grele order = freq;
tables region*classe_de_diametre / missing;
run;


*Analyse descriptive de la population;

proc univariate data = bra.grele;
var population;
run;


*Analyse descriptive de la population par région;

proc means data = bra.grele N MEAN MIN MAX;
class region;
var population;
run;

*Analyse descriptive de la population par département;

proc means data = grele N MEAN MIN MAX;
class nom_departement;
var population;
run;

*Année avec le plus de grêle ?;


proc freq data = bra.grele order=freq;
tables annee;
run;

proc freq data = bra.grele order=freq;
tables date;
run;


proc freq data=rica.grele_meteo;
tables region;
run;


/*******Temps passé et présent*******/

proc freq data=rica.grele_meteo;
table ww w1 w2;
run;

proc freq data=rica.grele_meteo;
table ww* w1 ;
table ww*w2;
run;



/*********Répartition des mois dans les données météo de GRMF**************/

data rica.meteo_mois;
set rica.meteo;
run;

proc datasets library=rica nolist;
modify meteo_mois;
format date month2.;
run;

proc freq data=rica.meteo_mois order=freq;
table date;
run;


/*************GRAPHIQUE********************/


* Répartition de la grêle en fonction des régions  et de la classe de diamètre;


proc template;
define statgraph sgdesign;
dynamic _REGION _CLASSE_DE_DIAMETRE;
begingraph;
   entrytitle halign=center 'Répartition de la grêle en fonction des régions et classe de diamètre';
   layout lattice / rowdatarange=data columndatarange=data rowgutter=10 columngutter=10;
      layout overlay / xaxisopts=( discreteopts=( tickvaluefitpolicy=splitrotate));
         barchart category=_REGION response=_REVENUE / group=_CLASSE_DE_DIAMETRE name='bar' stat=freq groupdisplay=Stack clusterwidth=1.0;
         discretelegend 'bar' / opaque=false border=true halign=right valign=top displayclipped=true across=1 order=rowmajor location=inside;
      endlayout;
   endlayout;
endgraph;
end;
run;

proc sgrender data=bra.GRELE template=sgdesign;
dynamic _REGION="REGION" _CLASSE_DE_DIAMETRE="'CLASSE_DE_DIAMETRE'n";
run;


*Répartition de la grêle selon les mois et la classe de diamètre;


proc template;
define statgraph sgdesign;
dynamic _MOIS _CLASSE_DE_DIAMETRE;
begingraph / designwidth=847 designheight=575;
   entrytitle halign=center 'Répartition de la grêle selon les mois et la classe de diamètre';
   layout lattice / rowdatarange=data columndatarange=data rowgutter=10 columngutter=10;
      layout overlay / xaxisopts=( discreteopts=( tickvaluefitpolicy=splitrotate));
         barchart category=_MOIS response=_REVENUE / group=_CLASSE_DE_DIAMETRE name='bar' stat=freq groupdisplay=Stack clusterwidth=1.0;
         discretelegend 'bar' / opaque=false border=true halign=right valign=top displayclipped=true across=1 order=rowmajor location=inside;
      endlayout;
   endlayout;
endgraph;
end;
run;

proc sgrender data=bra.GRELE template=sgdesign;
dynamic _MOIS="MOIS" _CLASSE_DE_DIAMETRE="'CLASSE_DE_DIAMETRE'n";
run;


*Répartition de la population en fonction des régions;

proc template;
define statgraph sgdesign;
dynamic _REGION _POPULATION;
begingraph / designwidth=857 designheight=607;
   entrytitle halign=center 'Répartition de la population en fonction des régions';
   layout lattice / rowdatarange=data columndatarange=data rowgutter=10 columngutter=10;
      layout overlay / xaxisopts=( discreteopts=( tickvaluefitpolicy=splitrotate));
         barchart category=_REGION response=_POPULATION / name='bar' stat=sum groupdisplay=Cluster clusterwidth=1.0;
      endlayout;
   endlayout;
endgraph;
end;
run;

proc sgrender data=bra.GRELE template=sgdesign;
dynamic _REGION="REGION" _POPULATION="POPULATION";
run;


*Evolution de la population en fonction des années et des régions;


proc template;
define statgraph sgdesign;
dynamic _ANNEE _POPULATION _REGION;
begingraph / designwidth=1111 designheight=620;
   entrytitle halign=center 'Evolution de la population par année et par région';
   layout lattice / rowdatarange=data columndatarange=data rowgutter=10 columngutter=10;
      layout overlay / xaxisopts=( discreteopts=( tickvaluefitpolicy=splitrotate));
         barchart category=_ANNEE response=_POPULATION / group=_REGION name='bar' stat=sum groupdisplay=Stack clusterwidth=1.0;
         discretelegend 'bar' / opaque=false border=true halign=left valign=top displayclipped=true across=1 order=rowmajor location=inside;
      endlayout;
   endlayout;
endgraph;
end;
run;

proc sgrender data=bra.GRELE template=sgdesign;
dynamic _ANNEE="ANNEE" _POPULATION="POPULATION" _REGION="REGION";
run;


*Activation de l'éditeur ODS GRAPHIC EDITOR afin de pouvoir modifier les graphiques, les personnaliser ou les enregistrer;

ods html sge = on;



*Comptons le nombre de fois ou chaque commune apparait pour faire correspondre la fréquence de grêle avec la taille des points;

data grele; set bra.grele; run;
proc sort data = grele; 
by commune;
run;


data nombre_commune;
set grele;
by commune;
if first.commune then n=1;
else n+1;
if last.commune;
run;

data bon mauvais;
set nombre_commune;
if longitude lt latitude then output bon;
else output mauvais;
run;
proc datasets library =work nolist;
modify mauvais;
rename lat=longitude;
rename long=latitude;
quit;
proc sort data=bon; by commune; run;
proc sort data=mauvais; by commune; run;
data commune_grele;
merge bon mauvais;
by commune;
run;
proc export data = commune_grele
		outfile = 'C:\R\Econometrie spatiale\data\commune_grele.xlsx'
		dbms = excel replace;
		sheet = 'villageois';
run;
/* Construction des bases de données pour les cartes */


proc datasets library =work nolist;
modify nombre_commune;
rename departement=ID;
rename latitude=lat;
rename longitude=long;
quit;


data ville;
set nombre_commune;
keep commune lat Long ID Classe_simple n;
run;

data villee;
set ville;
if lat = -361.1000022 then delete;
run;





proc sort data = bd; 
by commune;
run;



*carte1 indice de grêle A1;
*carte2 indice de grêle A2;
*carte3 indice de grêle A3;
*carte4 indice de grêle A4;
*carte5 indice de grêle A5;


data carte1;
set bd;
where classe_simple='A1';
run;

data carte2;
set bd;
where classe_simple='A2';
run;

data carte3;
set bd;
where classe_simple='A3';
run;

data carte4;
set bd;
where classe_simple='A4';
run;

data bra.carte5;
set bra.grele;
where classe_simple='A5';
run;

 /*Permet de calculer la fréquence de chaque commune pour chaque indice de grêle*/

data donnees.carte11;  
set carte1;
by commune;
if first.commune then n=1;
else n+1;
if last.commune;
run;

data donnees.carte22;
set carte2;
by commune;
if first.commune then n=1;
else n+1;
if last.commune;
run;

data donnees.carte33;
set carte3;
by commune;
if first.commune then n=1;
else n+1;
if last.commune;
run;

data donnees.carte44;
set carte4;
by commune;
if first.commune then n=1;
else n+1;
if last.commune;
run;

data donnees.carte55;
set carte5;
by commune;
if first.commune then n=1;
else n+1;
if last.commune;
run;

/*Procédure permettant d'exporter mes tables pour la construction des cartes sur R*/

proc export data = donnees.carte55
		outfile = 'C:\SAS\MEMOIRE GRELE\Donn--es Gr--les\carte55.xlsx'
		dbms = excel replace;
		sheet = 'villageois';
run;



/*Afin de calculer la distance entre les communes et les stations nous avons besoin de la variable
geocode qui va nous servir dans la formule du calcul de la distance
De ce fait nous concaténons la latitude et la longitude des différentes observations 
grace à l'étape suivante*/

data bra.grele_geo;
set bra.grele;
geo_point_2d= catx(',',latitude,longitude);
run;


data rica.donnees_stations;
set rica.donnees_stations;
geo_point_2d= catx(',',latitude,longitude);
run;

/*evenement grêle marquants*/
/*juillet 2019*/

data bra.juillet19;
set bra.grele;
where date in ('06jul2019'd , '07jul2019'd);
run;

data bra.juillet19a1;
set bra.juillet19;
where classe_simple='A1';
run;

data bra.juillet19a2;
set bra.juillet19;
where classe_simple='A2';
run;

data bra.juillet19a3;
set bra.juillet19;
where classe_simple='A3';
run;

data bra.juillet19a4;
set bra.juillet19;
where classe_simple='A4';
run;

data bra.juillet19a5;
set bra.juillet19;
where classe_simple='A5';
run;

proc export data = bra.aout19a1
		outfile = 'C:\SAS\MEMOIRE GRELE\Donn--es Gr--les\aout19a1.xlsx'
		dbms = excel replace;
		sheet = 'grele';
run;

proc export data = bra.aout19a2
		outfile = 'C:\SAS\MEMOIRE GRELE\Donn--es Gr--les\aout19a2.xlsx'
		dbms = excel replace;
		sheet = 'grele';
run;

proc export data = bra.aout19a3
		outfile = 'C:\SAS\MEMOIRE GRELE\Donn--es Gr--les\aout19a3.xlsx'
		dbms = excel replace;
		sheet = 'grele';
run;

proc export data = bra.aout19a4
		outfile = 'C:\SAS\MEMOIRE GRELE\Donn--es Gr--les\aout19a4.xlsx'
		dbms = excel replace;
		sheet = 'grele';
run;

proc export data = bra.aout19a5
		outfile = 'C:\SAS\MEMOIRE GRELE\Donn--es Gr--les\aout19a5.xlsx'
		dbms = excel replace;
		sheet = 'grele';
run;

/* Evenement du 18 aout 2019*/

data bra.aout19;
set bra.grele;
where date in ('18aug2019'd);
run;

data bra.aout19a1;
set bra.aout19;
where classe_simple='A1';
run;

data bra.aout19a2;
set bra.aout19;
where classe_simple='A2';
run;

data bra.aout19a3;
set bra.aout19;
where classe_simple='A3';
run;

data bra.aout19a4;
set bra.aout19;
where classe_simple='A4';
run;

data bra.aout19a5;
set bra.aout19;
where classe_simple='A5';
run;


/********************************/
/********************************/

proc format;

value $region


'Basse et Haute Normandie' ='Normandie' 
'Centre'= 'Centre-Val de Loire'
'Centre - Val de Loire' = 'Centre-Val de Loire'
'Grand-Est' ='Grand Est'
'Nouvelle Aquitaine' ='Nouvelle-Aquitaine';

run;

proc datasets library = rica nolist;
modify grele_meteo;
format region $region.;
quit;


 




