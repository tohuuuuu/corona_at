CREATE TABLE `corona_at__ages` (
 `Time` date NOT NULL,
 `Bundesland` varchar(20) COLLATE utf8_german2_ci NOT NULL,
 `BundeslandID` tinyint(3) unsigned NOT NULL,
 `AnzahlFaelle` smallint(5) unsigned NOT NULL,
 `AnzahlFaelleSum` smallint(5) unsigned NOT NULL,
 `AnzahlFaelle7Tage` smallint(5) unsigned NOT NULL,
 `SiebenTageInzidenzFaelle` decimal(9,5) NOT NULL,
 `AnzahlTotTaeglich` smallint(5) unsigned NOT NULL,
 `AnzahlTotSum` smallint(5) unsigned NOT NULL,
 `AnzahlGeheiltTaeglich` smallint(5) unsigned NOT NULL,
 `AnzahlGeheiltSum` smallint(5) unsigned NOT NULL,
 `corona_at__ages_id` int(11) NOT NULL AUTO_INCREMENT,
 PRIMARY KEY (`corona_at__ages_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4096 DEFAULT CHARSET=utf8 COLLATE=utf8_german2_ci
