-- MySQL Script generated by MySQL Workbench
-- Tue Jul 30 23:01:07 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

-- SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
-- SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema internet_tv
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema internet_tv
-- -----------------------------------------------------

CREATE SCHEMA IF NOT EXISTS internet_tv DEFAULT CHARACTER SET utf8 ;
USE internet_tv ;

-- -----------------------------------------------------
-- Table internet_tv.programs
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS internet_tv.programs (
  program_id INT NOT NULL AUTO_INCREMENT,
  program_name VARCHAR(255) NULL,
  program_description VARCHAR(255) NULL,
  PRIMARY KEY (program_id))
ENGINE = InnoDB;

CREATE UNIQUE INDEX program_id ON internet_tv.programs (program_id ASC) VISIBLE;


-- -----------------------------------------------------
-- Table internet_tv.channels
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS internet_tv.channels (
  channel_id INT NOT NULL AUTO_INCREMENT,
  channel_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (channel_id))
ENGINE = InnoDB;

CREATE UNIQUE INDEX channel_id_UNIQUE ON internet_tv.channels (channel_id ASC) VISIBLE;


-- -----------------------------------------------------
-- Table internet_tv.genres
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS internet_tv.genres (
  genre_id INT NOT NULL AUTO_INCREMENT,
  genre_name VARCHAR(255) NULL,
  PRIMARY KEY (genre_id))
ENGINE = InnoDB;

CREATE UNIQUE INDEX genre_id_UNIQUE ON internet_tv.genres (genre_id ASC) VISIBLE;


-- -----------------------------------------------------
-- Table internet_tv.program_genres
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS internet_tv.program_genres (
  genre_id INT NOT NULL,
  program_id INT NOT NULL,
  PRIMARY KEY (genre_id, program_id),
  CONSTRAINT program_id
    FOREIGN KEY (program_id)
    REFERENCES internet_tv.programs (program_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT genre_id
    FOREIGN KEY (genre_id)
    REFERENCES internet_tv.genres (genre_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX genre_id_idx ON internet_tv.program_genres (genre_id ASC) INVISIBLE;

CREATE INDEX video_id_idx ON internet_tv.program_genres (program_id ASC) INVISIBLE;


-- -----------------------------------------------------
-- Table internet_tv.season
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS internet_tv.season (
  season_id INT NOT NULL AUTO_INCREMENT,
  program_id INT NOT NULL,
  season_number INT NULL,
  PRIMARY KEY (season_id),
  CONSTRAINT program_id
    FOREIGN KEY (program_id)
    REFERENCES internet_tv.programs (program_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX season_id_UNIQUE ON internet_tv.season (season_id ASC) VISIBLE;

CREATE INDEX program_id_idx ON internet_tv.season (program_id ASC) VISIBLE;


-- -----------------------------------------------------
-- Table internet_tv.episodes
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS internet_tv.episodes (
  episode_id INT NOT NULL AUTO_INCREMENT,
  season_id INT NOT NULL,
  episode_number INT NULL,
  episode_title VARCHAR(255) NOT NULL,
  episode_description VARCHAR(255) NOT NULL,
  episode_length_seconds INT NOT NULL,
  episode_release_date DATE NOT NULL,
  PRIMARY KEY (episode_id),
  CONSTRAINT season_id
    FOREIGN KEY (season_id)
    REFERENCES internet_tv.season (season_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX episode_id_UNIQUE ON internet_tv.episodes (episode_id ASC) INVISIBLE;

CREATE INDEX season_id_idx ON internet_tv.episodes (season_id ASC) INVISIBLE;


-- -----------------------------------------------------
-- Table internet_tv.schedules
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS internet_tv.schedules (
  schedule_id INT NOT NULL AUTO_INCREMENT,
  channel_id INT NOT NULL,
  episode_id INT NOT NULL,
  schedule_start_time DATETIME NOT NULL,
  schedule_end_time DATETIME NOT NULL,
  schedule_view_count INT NOT NULL,
  PRIMARY KEY (schedule_id),
  CONSTRAINT channel_id
    FOREIGN KEY (channel_id)
    REFERENCES internet_tv.channels (channel_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT episode_id
    FOREIGN KEY (episode_id)
    REFERENCES internet_tv.episodes (episode_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX channel_id_idx ON internet_tv.schedules (channel_id ASC) VISIBLE;

CREATE INDEX episode_id_idx ON internet_tv.schedules (episode_id ASC) VISIBLE;

CREATE UNIQUE INDEX schedule_id_UNIQUE ON internet_tv.schedules (schedule_id ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;