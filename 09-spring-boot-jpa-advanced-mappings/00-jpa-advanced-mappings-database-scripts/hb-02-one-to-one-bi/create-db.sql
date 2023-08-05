DROP SCHEMA IF EXISTS `hb-01-one-to-one-uni`;

CREATE SCHEMA `hb-01-one-to-one-uni`;

use `hb-01-one-to-one-uni`;

SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE `instructor_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `youtube_channel` varchar(128) DEFAULT NULL,
  `hobby` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


CREATE TABLE `instructor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `instructor_detail_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_DETAIL_idx` (`instructor_detail_id`),
  CONSTRAINT `FK_DETAIL` FOREIGN KEY (`instructor_detail_id`) REFERENCES `instructor_detail` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;


### POSTGRES

-- Drop schema if exists
DROP SCHEMA IF EXISTS "hb-01-one-to-one-uni" CASCADE;

-- Create schema
CREATE SCHEMA "hb-01-one-to-one-uni";

-- Switch to the new schema
SET search_path TO "hb-01-one-to-one-uni";

-- Disable foreign key checks
SET CONSTRAINTS ALL DEFERRED;

-- Create instructor_detail table
CREATE TABLE instructor_detail (
  id serial PRIMARY KEY,
  youtube_channel varchar(128),
  hobby varchar(45)
);

-- Create instructor table
CREATE TABLE instructor (
  id serial PRIMARY KEY,
  first_name varchar(45),
  last_name varchar(45),
  email varchar(45),
  instructor_detail_id integer,
  CONSTRAINT fk_detail FOREIGN KEY (instructor_detail_id) REFERENCES instructor_detail (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Reset constraints
SET CONSTRAINTS ALL IMMEDIATE;

-- Reset search_path
RESET search_path;
