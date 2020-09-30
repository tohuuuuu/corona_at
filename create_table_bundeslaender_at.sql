CREATE TABLE `bundeslaender_at` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `bundesland` varchar(32) COLLATE utf8_german2_ci NOT NULL,
 `einwohner` mediumint(8) unsigned NOT NULL,
 `referenz` mediumint(8) unsigned NOT NULL DEFAULT 100000,
 `quotient` decimal(5,2) unsigned NOT NULL,
 `multiplikator` tinyint(3) unsigned NOT NULL DEFAULT 50,
 `schwellenwert` decimal(10,2) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_german2_ci
