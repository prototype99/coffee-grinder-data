CREATE DATABASE coffee-grinder;
USE coffee-grinder;

SET SQL_MODE="EMPTY_STRING_IS_NULL,STRICT_TRANS_TABLES";

CREATE TABLE data (
  id tinyint(3) NOT NULL AUTO_INCREMENT,
  name tinytext,
  warranty tinyint(3) NOT NULL DEFAULT 2,
  cost DECIMAL(4,2) NOT NULL,
  yearCost DECIMAL(2,0),
  url tinytext,
  key id (id)
);

LOAD DATA LOCAL INFILE '/home/seirra/Documents/sql/coffee-grinder/data.csv'
INTO TABLE data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

UPDATE data SET warranty = DEFAULT WHERE warranty = 0;

UPDATE data SET yearCost = cost / warranty;

SELECT * from data ORDER BY yearCost;