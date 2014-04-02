CREATE SCHEMA IF NOT EXISTS `dbis` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `dbis` ;

-- -----------------------------------------------------
-- Table `dbis`.`makertypes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbis`.`makertypes` (
  `id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbis`.`makers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbis`.`makers` (
  `id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `musicbrainzId` INT UNSIGNED NOT NULL,
  `type` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Maker_MakerType_idx` (`type` ASC),
  CONSTRAINT `fk_Maker_MakerType`
    FOREIGN KEY (`type`)
    REFERENCES `dbis`.`makertypes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbis`.`tracks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbis`.`tracks` (
  `id` INT UNSIGNED NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `musicbrainzId` INT UNSIGNED NOT NULL,
  `maker` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Track_Maker1_idx` (`maker` ASC),
  CONSTRAINT `fk_Track_Maker1`
    FOREIGN KEY (`maker`)
    REFERENCES `dbis`.`makers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbis`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbis`.`users` (
  `id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbis`.`listeningto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbis`.`listeningto` (
  `user` INT UNSIGNED NOT NULL,
  `track` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`user`, `track`),
  INDEX `fk_User_has_Track_Track1_idx` (`track` ASC),
  INDEX `fk_User_has_Track_User1_idx` (`user` ASC),
  CONSTRAINT `fk_User_has_Track_User1`
    FOREIGN KEY (`user`)
    REFERENCES `dbis`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Track_Track1`
    FOREIGN KEY (`track`)
    REFERENCES `dbis`.`tracks` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
