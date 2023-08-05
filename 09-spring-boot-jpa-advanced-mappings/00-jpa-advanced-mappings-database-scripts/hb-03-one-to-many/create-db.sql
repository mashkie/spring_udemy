DROP SCHEMA IF EXISTS `hb-03-one-to-many`;

CREATE SCHEMA `hb-03-one-to-many`;

use `hb-03-one-to-many`;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `instructor_detail`;

CREATE TABLE `instructor_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `youtube_channel` varchar(128) DEFAULT NULL,
  `hobby` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `instructor`;

CREATE TABLE `instructor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `instructor_detail_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_DETAIL_idx` (`instructor_detail_id`),
  CONSTRAINT `FK_DETAIL` FOREIGN KEY (`instructor_detail_id`) 
  REFERENCES `instructor_detail` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `instructor_id` int DEFAULT NULL,
  
  PRIMARY KEY (`id`),
  
  UNIQUE KEY `TITLE_UNIQUE` (`title`),
  
  KEY `FK_INSTRUCTOR_idx` (`instructor_id`),
  
  CONSTRAINT `FK_INSTRUCTOR` 
  FOREIGN KEY (`instructor_id`) 
  REFERENCES `instructor` (`id`) 
  
  ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;


SET FOREIGN_KEY_CHECKS = 1;

#### postgres

-- Drop schema if exists
DROP SCHEMA IF EXISTS "hb-03-one-to-many" CASCADE;

-- Create schema
CREATE SCHEMA "hb-03-one-to-many";

-- Switch to the new schema
SET search_path TO "hb-03-one-to-many";

-- Disable foreign key checks
SET CONSTRAINTS ALL DEFERRED;

-- Drop tables if they exist
DROP TABLE IF EXISTS instructor CASCADE;
DROP TABLE IF EXISTS course CASCADE;
DROP TABLE IF EXISTS instructor_detail CASCADE;

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

-- Create course table
CREATE TABLE course (
  id serial PRIMARY KEY,
  title varchar(128),
  instructor_id integer,
  UNIQUE (title),
  CONSTRAINT fk_instructor FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Reset constraints
SET CONSTRAINTS ALL IMMEDIATE;

-- Reset search_path
RESET search_path;
