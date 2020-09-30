CREATE TABLE `corona_at` (
 `idcorona_at` int(11) NOT NULL AUTO_INCREMENT,
 `state` varchar(45) COLLATE utf8_german2_ci NOT NULL,
 `date` date NOT NULL,
 `cases` int(11) DEFAULT NULL,
 `growth` int(11) DEFAULT NULL,
 `growth_cumulated` int(11) DEFAULT NULL,
 `threshold` decimal(10,2) DEFAULT NULL,
 PRIMARY KEY (`idcorona_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2048 DEFAULT CHARSET=utf8 COLLATE=utf8_german2_ci
