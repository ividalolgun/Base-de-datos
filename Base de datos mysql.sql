-- MySQL Script generated by MySQL Workbench
-- Sun Nov 22 18:03:07 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`MUNICIPIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MUNICIPIO` (
  `Nombre municipio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Nombre municipio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PERSONA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PERSONA` (
  `RUT persona` VARCHAR(15) NOT NULL,
  `Nombre persona` VARCHAR(45) NULL,
  `Direccion vivienda` VARCHAR(225) NULL,
  PRIMARY KEY (`RUT persona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FARMACIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FARMACIA` (
  `Direccion` VARCHAR(45) NOT NULL,
  `Nombre farmacia` VARCHAR(45) NULL,
  PRIMARY KEY (`Direccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PERTENECE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PERTENECE` (
  `MUNICIPIO_Nombre municipio` VARCHAR(45) NOT NULL,
  `FARMACIA_Direccion` VARCHAR(45) NOT NULL,
  `PERSONA_RUT persona` VARCHAR(45) NOT NULL,
  INDEX `fk_Pertenece_MUNICIPIO_idx` (`MUNICIPIO_Nombre municipio` ASC) VISIBLE,
  INDEX `fk_Pertenece_FARMACIA1_idx` (`FARMACIA_Direccion` ASC) VISIBLE,
  INDEX `fk_Pertenece_PERSONA1_idx` (`PERSONA_RUT persona` ASC) VISIBLE,
  PRIMARY KEY (`FARMACIA_Direccion`, `PERSONA_RUT persona`, `MUNICIPIO_Nombre municipio`),
  CONSTRAINT `fk_Pertenece_MUNICIPIO`
    FOREIGN KEY (`MUNICIPIO_Nombre municipio`)
    REFERENCES `mydb`.`MUNICIPIO` (`Nombre municipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pertenece_FARMACIA1`
    FOREIGN KEY (`FARMACIA_Direccion`)
    REFERENCES `mydb`.`FARMACIA` (`Direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pertenece_PERSONA1`
    FOREIGN KEY (`PERSONA_RUT persona`)
    REFERENCES `mydb`.`PERSONA` (`RUT persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PAGO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PAGO` (
  `Tipo pago` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Tipo pago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MEDICAMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MEDICAMENTO` (
  `Nombre medicamento` VARCHAR(45) NOT NULL,
  `ID medicamento` VARCHAR(45) NULL,
  `Tipo fármaco` VARCHAR(45) NULL,
  PRIMARY KEY (`Nombre medicamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VENTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VENTA` (
  `FARMACIA_Direccion` VARCHAR(45) NOT NULL,
  `PAGO_Tipo pago` VARCHAR(45) NOT NULL,
  `MEDICAMENTO_Nombre medicamento` VARCHAR(45) NOT NULL,
  `PERSONA_RUT persona` VARCHAR(45) NOT NULL,
  `Precio` VARCHAR(45) NULL,
  `Cantidad` VARCHAR(45) NULL,
  INDEX `fk_VENTA_FARMACIA1_idx` (`FARMACIA_Direccion` ASC) VISIBLE,
  INDEX `fk_VENTA_PAGO1_idx` (`PAGO_Tipo pago` ASC) VISIBLE,
  INDEX `fk_VENTA_MEDICAMENTO1_idx` (`MEDICAMENTO_Nombre medicamento` ASC) VISIBLE,
  INDEX `fk_VENTA_PERSONA1_idx` (`PERSONA_RUT persona` ASC) VISIBLE,
  PRIMARY KEY (`FARMACIA_Direccion`, `MEDICAMENTO_Nombre medicamento`, `PAGO_Tipo pago`, `PERSONA_RUT persona`),
  CONSTRAINT `fk_VENTA_FARMACIA1`
    FOREIGN KEY (`FARMACIA_Direccion`)
    REFERENCES `mydb`.`FARMACIA` (`Direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VENTA_PAGO1`
    FOREIGN KEY (`PAGO_Tipo pago`)
    REFERENCES `mydb`.`PAGO` (`Tipo pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VENTA_MEDICAMENTO1`
    FOREIGN KEY (`MEDICAMENTO_Nombre medicamento`)
    REFERENCES `mydb`.`MEDICAMENTO` (`Nombre medicamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VENTA_PERSONA1`
    FOREIGN KEY (`PERSONA_RUT persona`)
    REFERENCES `mydb`.`PERSONA` (`RUT persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MEDICAMENTO GENERICO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MEDICAMENTO GENERICO` (
  `ID Nombre MG` VARCHAR(45) NOT NULL,
  `Nombre medicamento generico` VARCHAR(45) NULL,
  `MEDICAMENTO GENERICOcol` VARCHAR(45) NULL,
  PRIMARY KEY (`ID Nombre MG`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CANTIDAD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CANTIDAD` (
  `Tipo fármaco` VARCHAR(45) NOT NULL,
  `Medida` VARCHAR(45) NULL,
  `Cantidad farmaco` VARCHAR(45) NULL,
  PRIMARY KEY (`Tipo fármaco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TIENE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TIENE` (
  `MEDICAMENTO_Nombre medicamento` VARCHAR(45) NOT NULL,
  `MEDICAMENTO GENERICO_ID Nombre MG` VARCHAR(45) NOT NULL,
  `CANTIDAD_Tipo fármaco` VARCHAR(45) NOT NULL,
  INDEX `fk_TIENE_MEDICAMENTO1_idx` (`MEDICAMENTO_Nombre medicamento` ASC) VISIBLE,
  INDEX `fk_TIENE_MEDICAMENTO GENERICO1_idx` (`MEDICAMENTO GENERICO_ID Nombre MG` ASC) VISIBLE,
  INDEX `fk_TIENE_CANTIDAD1_idx` (`CANTIDAD_Tipo fármaco` ASC) VISIBLE,
  PRIMARY KEY (`MEDICAMENTO_Nombre medicamento`, `MEDICAMENTO GENERICO_ID Nombre MG`, `CANTIDAD_Tipo fármaco`),
  CONSTRAINT `fk_TIENE_MEDICAMENTO1`
    FOREIGN KEY (`MEDICAMENTO_Nombre medicamento`)
    REFERENCES `mydb`.`MEDICAMENTO` (`Nombre medicamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TIENE_MEDICAMENTO GENERICO1`
    FOREIGN KEY (`MEDICAMENTO GENERICO_ID Nombre MG`)
    REFERENCES `mydb`.`MEDICAMENTO GENERICO` (`ID Nombre MG`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TIENE_CANTIDAD1`
    FOREIGN KEY (`CANTIDAD_Tipo fármaco`)
    REFERENCES `mydb`.`CANTIDAD` (`Tipo fármaco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MEDICO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MEDICO` (
  `RUT Medico` VARCHAR(45) NOT NULL,
  `Nombre medico` VARCHAR(45) NULL,
  `Nombre institucion` VARCHAR(45) NULL,
  PRIMARY KEY (`RUT Medico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FECHA DE PRESCRIPCIÓN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FECHA DE PRESCRIPCIÓN` (
  `DD/MM/AA` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DD/MM/AA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RECETA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RECETA` (
  `MEDICO_RUT Medico` VARCHAR(45) NOT NULL,
  `FECHA DE PRESCRIPCIÓN_DD/MM/AA` VARCHAR(45) NOT NULL,
  `PERSONA_RUT persona` VARCHAR(45) NOT NULL,
  `MEDICAMENTO_Nombre medicamento` VARCHAR(45) NOT NULL,
  INDEX `fk_RECETA_MEDICO1_idx` (`MEDICO_RUT Medico` ASC) VISIBLE,
  INDEX `fk_RECETA_FECHA DE PRESCRIPCIÓN1_idx` (`FECHA DE PRESCRIPCIÓN_DD/MM/AA` ASC) VISIBLE,
  INDEX `fk_RECETA_PERSONA1_idx` (`PERSONA_RUT persona` ASC) VISIBLE,
  INDEX `fk_RECETA_MEDICAMENTO1_idx` (`MEDICAMENTO_Nombre medicamento` ASC) VISIBLE,
  PRIMARY KEY (`MEDICO_RUT Medico`, `FECHA DE PRESCRIPCIÓN_DD/MM/AA`, `PERSONA_RUT persona`, `MEDICAMENTO_Nombre medicamento`),
  CONSTRAINT `fk_RECETA_MEDICO1`
    FOREIGN KEY (`MEDICO_RUT Medico`)
    REFERENCES `mydb`.`MEDICO` (`RUT Medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RECETA_FECHA DE PRESCRIPCIÓN1`
    FOREIGN KEY (`FECHA DE PRESCRIPCIÓN_DD/MM/AA`)
    REFERENCES `mydb`.`FECHA DE PRESCRIPCIÓN` (`DD/MM/AA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RECETA_PERSONA1`
    FOREIGN KEY (`PERSONA_RUT persona`)
    REFERENCES `mydb`.`PERSONA` (`RUT persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RECETA_MEDICAMENTO1`
    FOREIGN KEY (`MEDICAMENTO_Nombre medicamento`)
    REFERENCES `mydb`.`MEDICAMENTO` (`Nombre medicamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

select * from persona