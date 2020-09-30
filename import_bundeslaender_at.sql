LOAD DATA LOCAL INFILE 'bundeslaender_at.csv'
INTO TABLE bundeslaender_at
CHARACTER SET utf8
FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(bundesland,@var0,referenz,@var1,multiplikator,@var2)
SET einwohner = REPLACE(@var0, '.', ''),
    quotient = REPLACE(@var1, ',', '.'),
    schwellenwert = REPLACE(@var2, ',', '.');
