LOAD DATA LOCAL INFILE 'at.csv' INTO TABLE corona_at
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(state,date,cases,growth,growth_cumulated,@th_dec)
SET threshold = REPLACE(@th_dec, ',', '.');
