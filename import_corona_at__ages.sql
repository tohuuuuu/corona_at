TRUNCATE corona_at__ages;
LOAD DATA LOCAL INFILE 'CovidFaelle_Timeline.csv' INTO TABLE corona_at__ages
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@Time,Bundesland,BundeslandID,@AnzEinwohner,AnzahlFaelle,AnzahlFaelleSum,AnzahlFaelle7Tage,@SiebenTageInzidenzFaelle,AnzahlTotTaeglich,AnzahlTotSum,AnzahlGeheiltTaeglich,AnzahlGeheiltSum)
SET Time = DATE(STR_TO_DATE(@Time,'%d.%c.%Y %H:%i:%S')), SiebenTageInzidenzFaelle = REPLACE(@SiebenTageInzidenzFaelle, ',', '.')
