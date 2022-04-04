-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cupcake
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cupcake
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cupcake` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `cupcake` ;

-- -----------------------------------------------------
-- Table `cupcake`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`user` (
                                                `user_id` INT NOT NULL AUTO_INCREMENT,
                                                `email` VARCHAR(100) NOT NULL,
    `password` VARCHAR(45) NOT NULL,
    `credit` INT NOT NULL DEFAULT '0',
    `role` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`user_id`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cupcake`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`order` (
                                                 `order_id` INT NOT NULL AUTO_INCREMENT,
                                                 `user_id` INT NOT NULL,
                                                 `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                 `ispayed` TINYINT NOT NULL DEFAULT '0',
                                                 PRIMARY KEY (`order_id`),
    INDEX `fk_order_user_idx` (`user_id` ASC) VISIBLE,
    CONSTRAINT `fk_order_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `cupcake`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cupcake`.`bottom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`bottom` (
                                                  `bottom_id` INT NOT NULL AUTO_INCREMENT,
                                                  `name` VARCHAR(45) NOT NULL,
    `price` INT NOT NULL,
    PRIMARY KEY (`bottom_id`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cupcake`.`topping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`topping` (
                                                   `topping_id` INT NOT NULL AUTO_INCREMENT,
                                                   `name` VARCHAR(45) NOT NULL,
    `price` INT NOT NULL,
    PRIMARY KEY (`topping_id`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cupcake`.`orderline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`orderline` (
                                                     `orderline_id` INT NOT NULL AUTO_INCREMENT,
                                                     `order_id` INT NOT NULL,
                                                     `quantity` INT NOT NULL DEFAULT '1',
                                                     `totalprice` INT NOT NULL,
                                                     `bottom_id` INT NOT NULL,
                                                     `topping_id` INT NOT NULL,
                                                     PRIMARY KEY (`orderline_id`),
    INDEX `fk_orderline_order1_idx` (`order_id` ASC) VISIBLE,
    INDEX `fk_orderline_bottom1_idx` (`bottom_id` ASC) VISIBLE,
    INDEX `fk_orderline_topping1_idx` (`topping_id` ASC) VISIBLE,
    CONSTRAINT `fk_orderline_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `cupcake`.`order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_orderline_bottom1`
    FOREIGN KEY (`bottom_id`)
    REFERENCES `cupcake`.`bottom` (`bottom_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_orderline_topping1`
    FOREIGN KEY (`topping_id`)
    REFERENCES `cupcake`.`topping` (`topping_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
