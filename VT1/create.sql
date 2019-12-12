-- MySQL Script generated by MySQL Workbench
-- Tue 26 Nov 2019 02:32:12 AM +03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lab
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `lab` ;

-- -----------------------------------------------------
-- Table `lab`.`administrators`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab`.`administrators` (
  `login` VARCHAR(45) NOT NULL,
  `token` VARCHAR(45) NULL DEFAULT NULL,
  `firstName` VARCHAR(45) NULL DEFAULT NULL,
  `lastName` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`login`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `lab`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab`.`clients` (
  `login` VARCHAR(45) NOT NULL,
  `token` VARCHAR(45) NULL DEFAULT NULL,
  `firstName` VARCHAR(45) NULL DEFAULT NULL,
  `lastName` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `phoneNumber` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`login`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `lab`.`roomType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab`.`roomType` (
  `typeName` VARCHAR(45) NOT NULL,
  `numOfPlaces` INT(11) NULL DEFAULT NULL,
  `cost` INT(11) NULL DEFAULT NULL,
  `smallImage` VARCHAR(45) NULL DEFAULT NULL,
  `area` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`typeName`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `lab`.`confirmedRequests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab`.`confirmedRequests` (
  `typeName` VARCHAR(45) NOT NULL,
  `arrivalDate` DATE NOT NULL,
  `departureDate` DATE NOT NULL,
  `numberOfPersons` INT(11) NULL DEFAULT NULL,
  `client` VARCHAR(45) NOT NULL,
  `roomNumber` INT(11) NOT NULL,
  PRIMARY KEY (`departureDate`, `arrivalDate`, `roomNumber`),
  CONSTRAINT `fk_confirmedRequests_1`
    FOREIGN KEY (`client`)
    REFERENCES `lab`.`clients` (`login`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_confirmedRequests_2`
    FOREIGN KEY (`typeName`)
    REFERENCES `lab`.`roomType` (`typeName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `lab`.`largeImages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab`.`largeImages` (
  `typeName` VARCHAR(45) NOT NULL,
  `url` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`url`),
  CONSTRAINT `fk_largeImages_1`
    FOREIGN KEY (`typeName`)
    REFERENCES `lab`.`roomType` (`typeName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `lab`.`rejectedRequests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab`.`rejectedRequests` (
  `typeName` VARCHAR(45) NOT NULL,
  `arrivalDate` DATE NOT NULL,
  `departureDate` DATE NOT NULL,
  `numberOfPersons` INT(11) NULL DEFAULT NULL,
  `client` VARCHAR(45) NOT NULL,
  `comment` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`arrivalDate`, `departureDate`),
  CONSTRAINT `fk_rejectedRequests_1`
    FOREIGN KEY (`typeName`)
    REFERENCES `lab`.`roomType` (`typeName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rejectedRequests_2`
    FOREIGN KEY (`client`)
    REFERENCES `lab`.`clients` (`login`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `lab`.`requests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab`.`requests` (
  `typeName` VARCHAR(45) NOT NULL,
  `arrivalDate` DATE NOT NULL,
  `depatureDate` DATE NOT NULL,
  `numberOfPersons` INT(11) NULL DEFAULT NULL,
  `client` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`arrivalDate`, `depatureDate`),
  CONSTRAINT `fk_requests_1`
    FOREIGN KEY (`typeName`)
    REFERENCES `lab`.`roomType` (`typeName`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_requests_2`
    FOREIGN KEY (`client`)
    REFERENCES `lab`.`clients` (`login`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `lab`.`roomNumbers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab`.`roomNumbers` (
  `typeName` VARCHAR(45) NOT NULL,
  `number` INT(11) NOT NULL,
  PRIMARY KEY (`number`),
  CONSTRAINT `fk_roomNumbers_1`
    FOREIGN KEY (`typeName`)
    REFERENCES `lab`.`roomType` (`typeName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `lab`.`services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab`.`services` (
  `typeName` VARCHAR(45) NOT NULL,
  `service` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`service`),
  CONSTRAINT `fk_services_1`
    FOREIGN KEY (`typeName`)
    REFERENCES `lab`.`roomType` (`typeName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;