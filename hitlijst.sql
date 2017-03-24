-- MySQL Script generated by MySQL Workbench
-- Fri Mar 24 09:47:01 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema hitlijst
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hitlijst
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hitlijst` DEFAULT CHARACTER SET utf8 ;
USE `hitlijst` ;

-- -----------------------------------------------------
-- Table `hitlijst`.`Lied`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hitlijst`.`Lied` (
  `idLied` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `releasedate` DATE NULL,
  PRIMARY KEY (`idLied`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hitlijst`.`Artiest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hitlijst`.`Artiest` (
  `idArtiest` INT NOT NULL AUTO_INCREMENT,
  `Artiestnaam` VARCHAR(45) NULL,
  PRIMARY KEY (`idArtiest`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hitlijst`.`Hitlijst`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hitlijst`.`Hitlijst` (
  `idHitlijst` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idHitlijst`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hitlijst`.`Hitlijstrelease`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hitlijst`.`Hitlijstrelease` (
  `idHitlijstrelease` INT NOT NULL AUTO_INCREMENT,
  `publicatiedatum` DATE NULL,
  `week` INT NULL,
  `jaar` YEAR NULL,
  `Hitlijst_idHitlijst` INT NOT NULL,
  PRIMARY KEY (`idHitlijstrelease`),
  INDEX `fk_Hitlijstrelease_Hitlijst1_idx` (`Hitlijst_idHitlijst` ASC),
  CONSTRAINT `fk_Hitlijstrelease_Hitlijst1`
    FOREIGN KEY (`Hitlijst_idHitlijst`)
    REFERENCES `hitlijst`.`Hitlijst` (`idHitlijst`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hitlijst`.`Hitlijstrelease_has_HitItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hitlijst`.`Hitlijstrelease_has_HitItem` (
  `Hitlijstrelease_idHitlijstrelease` INT NOT NULL,
  `Hitlijstrelease_has_HitItem_id` INT NOT NULL AUTO_INCREMENT,
  `positie` INT NULL,
  `Lied_idLied` INT NOT NULL,
  INDEX `fk_Hitlijstrelease_has_HitItem_Hitlijstrelease1_idx` (`Hitlijstrelease_idHitlijstrelease` ASC),
  PRIMARY KEY (`Hitlijstrelease_has_HitItem_id`),
  INDEX `fk_Hitlijstrelease_has_HitItem_Lied1_idx` (`Lied_idLied` ASC),
  CONSTRAINT `fk_Hitlijstrelease_has_HitItem_Hitlijstrelease1`
    FOREIGN KEY (`Hitlijstrelease_idHitlijstrelease`)
    REFERENCES `hitlijst`.`Hitlijstrelease` (`idHitlijstrelease`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hitlijstrelease_has_HitItem_Lied1`
    FOREIGN KEY (`Lied_idLied`)
    REFERENCES `hitlijst`.`Lied` (`idLied`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hitlijst`.`Lied_has_Artiest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hitlijst`.`Lied_has_Artiest` (
  `Lied_idLied` INT NOT NULL,
  `Artiest_idArtiest` INT NOT NULL,
  `Lied_has_Artiest_id` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_Lied_has_Artiest_Artiest1_idx` (`Artiest_idArtiest` ASC),
  INDEX `fk_Lied_has_Artiest_Lied1_idx` (`Lied_idLied` ASC),
  PRIMARY KEY (`Lied_has_Artiest_id`),
  CONSTRAINT `fk_Lied_has_Artiest_Lied1`
    FOREIGN KEY (`Lied_idLied`)
    REFERENCES `hitlijst`.`Lied` (`idLied`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lied_has_Artiest_Artiest1`
    FOREIGN KEY (`Artiest_idArtiest`)
    REFERENCES `hitlijst`.`Artiest` (`idArtiest`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;