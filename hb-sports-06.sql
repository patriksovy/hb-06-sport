DROP SCHEMA IF EXISTS `hb-06-sports`;

CREATE SCHEMA `hb-06-sports`;

use `hb-06-sports`;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `instructor_detail`;

CREATE TABLE `player` (
  id int(11) NOT NULL AUTO_INCREMENT,
  firstName varchar(15),
  lastName varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sport`;

CREATE TABLE `sport` (
  id int(11) NOT NULL AUTO_INCREMENT,
  Name varchar(20) NOT NULL,
  day varchar(10) DEFAULT 'sunday',
  startTime int(11) DEFAULT 0,
  endTime int(11) DEFAULT 24,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `player_sport`;

CREATE TABLE `player_sport` (
  playerId int(11) NOT NULL,
  sportId int(11) NOT NULL,
  
  PRIMARY KEY (`playerID`,`sportId`),
  
  KEY `FK_PLAYER_ID` (`playerId`),
  
  CONSTRAINT `FK_SPORT_06` FOREIGN KEY (`playerId`) 
  REFERENCES `player` (`id`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION,
  
  CONSTRAINT `FK_SPORT-07` FOREIGN KEY (`sportId`) 
  REFERENCES `sport` (`id`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO  player VALUES(1, 'Roman', 'Zimermann');
INSERT INTO  player VALUES(2, 'Samo', 'Bandaska');
INSERT INTO  player VALUES(3, 'Jožo', 'Trembuľa');
INSERT INTO  player VALUES(4, 'Silviya', 'Kyreiovich');
INSERT INTO  player VALUES(5, 'Petar', 'Noa');
INSERT INTO  player VALUES(6, 'Crazyfrog', 'Bandicootovich');

INSERT INTO sport VALUES (1, 'Hockey', 'Friday', 17, 21);
INSERT INTO sport VALUES (2, 'Curling', 'Thursday', 12, 14);
INSERT INTO sport VALUES (3, 'Football', 'Thursday', 13, 16);
INSERT INTO sport VALUES (4, 'Tenis', 'Monday', 12, 15);
INSERT INTO sport VALUES (5, 'Chess', 'Wednesday', 12, 15);
INSERT INTO sport VALUES (6, 'Golf', 'Saturday');

INSERT INTO player_sport VALUES (1, 5);
INSERT INTO player_sport VALUES (1, 6);
INSERT INTO player_sport VALUES (3, 1);
INSERT INTO player_sport VALUES (2, 1);
INSERT INTO player_sport VALUES (2, 4);
INSERT INTO player_sport VALUES (2, 5);
INSERT INTO player_sport VALUES (1, 5);



