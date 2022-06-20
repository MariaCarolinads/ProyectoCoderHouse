
CREATE SCHEMA IF NOT EXISTS `ProyectCoderHouse` DEFAULT CHARACTER SET utf8 ;
USE `ProyectCoderHouse` ;

-- -----------------------------------------------------
-- Table `ProyectCoderHouse`.`Nombre_Proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectCoderHouse`.`Nombre_Proyecto` (
  `idNombre_Proyecto` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idNombre_Proyecto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectCoderHouse`.`Codigo_de_obra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectCoderHouse`.`Codigo_de_obra` (
  `idCodigo_de_obra` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idCodigo_de_obra`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectCoderHouse`.`Unidad_Constructiva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectCoderHouse`.`Unidad_Constructiva` (
  `idUCConductor` INT NOT NULL AUTO_INCREMENT,
  `Unidad_Constructivacol` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idUCConductor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectCoderHouse`.`DescConductor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectCoderHouse`.`DescConductor` (
  `idDescConductor` INT NOT NULL AUTO_INCREMENT,
  `DescConductorcol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDescConductor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectCoderHouse`.`Conductor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectCoderHouse`.`Conductor` (
  `idConductor` INT NOT NULL AUTO_INCREMENT,
  `Unidad_Constructiva_idUCConductor` INT NOT NULL,
  `DescConductor_idDescConductor` INT NOT NULL,
  PRIMARY KEY (`idConductor`, `Unidad_Constructiva_idUCConductor`, `DescConductor_idDescConductor`),
  INDEX `fk_Conductor_Unidad_Constructiva1_idx` (`Unidad_Constructiva_idUCConductor` ASC) VISIBLE,
  INDEX `fk_Conductor_DescConductor1_idx` (`DescConductor_idDescConductor` ASC) VISIBLE,
  CONSTRAINT `fk_Conductor_Unidad_Constructiva1`
    FOREIGN KEY (`Unidad_Constructiva_idUCConductor`)
    REFERENCES `ProyectCoderHouse`.`Unidad_Constructiva` (`idUCConductor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Conductor_DescConductor1`
    FOREIGN KEY (`DescConductor_idDescConductor`)
    REFERENCES `ProyectCoderHouse`.`DescConductor` (`idDescConductor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectCoderHouse`.`UnidadConstructiva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectCoderHouse`.`UnidadConstructiva` (
  `idUCApoyos` INT NOT NULL AUTO_INCREMENT,
  `UnidadConstructiva` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idUCApoyos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectCoderHouse`.`CapacidadApoyo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectCoderHouse`.`CapacidadApoyo` (
  `idCapacidadApoyo` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCapacidadApoyo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectCoderHouse`.`MaterialApoyos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectCoderHouse`.`MaterialApoyos` (
  `idMaterialApoyos` INT NOT NULL AUTO_INCREMENT,
  `MaterialApoyoscol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMaterialApoyos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectCoderHouse`.`Apoyos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectCoderHouse`.`Apoyos` (
  `idApoyos` INT NOT NULL AUTO_INCREMENT,
  `UnidadConstructiva_idUCApoyos` INT NOT NULL,
  `CapacidadApoyo_idCapacidadApoyo` INT NOT NULL,
  `MaterialApoyos_idMaterialApoyos` INT NOT NULL,
  PRIMARY KEY (`idApoyos`, `UnidadConstructiva_idUCApoyos`, `CapacidadApoyo_idCapacidadApoyo`, `MaterialApoyos_idMaterialApoyos`),
  INDEX `fk_Apoyos_UnidadConstructiva1_idx` (`UnidadConstructiva_idUCApoyos` ASC) VISIBLE,
  INDEX `fk_Apoyos_CapacidadApoyo1_idx` (`CapacidadApoyo_idCapacidadApoyo` ASC) VISIBLE,
  INDEX `fk_Apoyos_MaterialApoyos1_idx` (`MaterialApoyos_idMaterialApoyos` ASC) VISIBLE,
  CONSTRAINT `fk_Apoyos_UnidadConstructiva1`
    FOREIGN KEY (`UnidadConstructiva_idUCApoyos`)
    REFERENCES `ProyectCoderHouse`.`UnidadConstructiva` (`idUCApoyos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Apoyos_CapacidadApoyo1`
    FOREIGN KEY (`CapacidadApoyo_idCapacidadApoyo`)
    REFERENCES `ProyectCoderHouse`.`CapacidadApoyo` (`idCapacidadApoyo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Apoyos_MaterialApoyos1`
    FOREIGN KEY (`MaterialApoyos_idMaterialApoyos`)
    REFERENCES `ProyectCoderHouse`.`MaterialApoyos` (`idMaterialApoyos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectCoderHouse`.`Circuito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectCoderHouse`.`Circuito` (
  `idCircuito` INT NOT NULL AUTO_INCREMENT,
  `Circuitocol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCircuito`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectCoderHouse`.`ClaseProyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectCoderHouse`.`ClaseProyecto` (
  `idClaseProyecto` INT NOT NULL AUTO_INCREMENT,
  `ClaseProyectocol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idClaseProyecto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectCoderHouse`.`PlandeInversion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectCoderHouse`.`PlandeInversion` (
  `idPI2022` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Proyecto_idNombre_Proyecto` INT NOT NULL,
  `Codigo_de_obra_idCodigo_de_obra` INT NOT NULL,
  `Conductor_idConductor` INT NOT NULL,
  `Apoyos_idApoyos` INT NOT NULL,
  `Circuito_idCircuito` INT NOT NULL,
  `ClaseProyecto_idClaseProyecto` INT NOT NULL,
  PRIMARY KEY (`idPI2022`, `Nombre_Proyecto_idNombre_Proyecto`, `Codigo_de_obra_idCodigo_de_obra`, `Conductor_idConductor`, `Apoyos_idApoyos`, `Circuito_idCircuito`, `ClaseProyecto_idClaseProyecto`),
  INDEX `fk_Proyecto_Nombre_Proyecto_idx` (`Nombre_Proyecto_idNombre_Proyecto` ASC) VISIBLE,
  INDEX `fk_Proyecto_Codigo_de_obra1_idx` (`Codigo_de_obra_idCodigo_de_obra` ASC) VISIBLE,
  INDEX `fk_Proyecto_Conductor1_idx` (`Conductor_idConductor` ASC) VISIBLE,
  INDEX `fk_Proyecto_Apoyos1_idx` (`Apoyos_idApoyos` ASC) VISIBLE,
  INDEX `fk_Proyecto_Circuito1_idx` (`Circuito_idCircuito` ASC) VISIBLE,
  INDEX `fk_PlandeInversion_ClaseProyecto1_idx` (`ClaseProyecto_idClaseProyecto` ASC) VISIBLE,
  CONSTRAINT `fk_Proyecto_Nombre_Proyecto`
    FOREIGN KEY (`Nombre_Proyecto_idNombre_Proyecto`)
    REFERENCES `ProyectCoderHouse`.`Nombre_Proyecto` (`idNombre_Proyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyecto_Codigo_de_obra1`
    FOREIGN KEY (`Codigo_de_obra_idCodigo_de_obra`)
    REFERENCES `ProyectCoderHouse`.`Codigo_de_obra` (`idCodigo_de_obra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyecto_Conductor1`
    FOREIGN KEY (`Conductor_idConductor`)
    REFERENCES `ProyectCoderHouse`.`Conductor` (`idConductor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyecto_Apoyos1`
    FOREIGN KEY (`Apoyos_idApoyos`)
    REFERENCES `ProyectCoderHouse`.`Apoyos` (`idApoyos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyecto_Circuito1`
    FOREIGN KEY (`Circuito_idCircuito`)
    REFERENCES `ProyectCoderHouse`.`Circuito` (`idCircuito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlandeInversion_ClaseProyecto1`
    FOREIGN KEY (`ClaseProyecto_idClaseProyecto`)
    REFERENCES `ProyectCoderHouse`.`ClaseProyecto` (`idClaseProyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectCoderHouse`.`ReporteBDA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectCoderHouse`.`ReporteBDA` (
  `TiqueteBDA` VARCHAR(20) NOT NULL,
  `KmdeRed` INT NULL,
  `CantidadApoyos` VARCHAR(45) NULL,
  `Conductor_idConductor` INT NOT NULL,
  `Apoyos_idApoyos` INT NOT NULL,
  `Circuito_idCircuito` INT NOT NULL,
  `Nombre_Proyecto_idNombre_Proyecto` INT NOT NULL,
  `Codigo_de_obra_idCodigo_de_obra` INT NOT NULL,
  PRIMARY KEY (`TiqueteBDA`, `Conductor_idConductor`, `Apoyos_idApoyos`, `Circuito_idCircuito`, `Nombre_Proyecto_idNombre_Proyecto`, `Codigo_de_obra_idCodigo_de_obra`),
  INDEX `fk_ReporteBDA_Conductor1_idx` (`Conductor_idConductor` ASC) VISIBLE,
  INDEX `fk_ReporteBDA_Apoyos1_idx` (`Apoyos_idApoyos` ASC) VISIBLE,
  INDEX `fk_ReporteBDA_Circuito1_idx` (`Circuito_idCircuito` ASC) VISIBLE,
  INDEX `fk_ReporteBDA_Nombre_Proyecto1_idx` (`Nombre_Proyecto_idNombre_Proyecto` ASC) VISIBLE,
  INDEX `fk_ReporteBDA_Codigo_de_obra1_idx` (`Codigo_de_obra_idCodigo_de_obra` ASC) VISIBLE,
  CONSTRAINT `fk_ReporteBDA_Conductor1`
    FOREIGN KEY (`Conductor_idConductor`)
    REFERENCES `ProyectCoderHouse`.`Conductor` (`idConductor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ReporteBDA_Apoyos1`
    FOREIGN KEY (`Apoyos_idApoyos`)
    REFERENCES `ProyectCoderHouse`.`Apoyos` (`idApoyos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ReporteBDA_Circuito1`
    FOREIGN KEY (`Circuito_idCircuito`)
    REFERENCES `ProyectCoderHouse`.`Circuito` (`idCircuito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ReporteBDA_Nombre_Proyecto1`
    FOREIGN KEY (`Nombre_Proyecto_idNombre_Proyecto`)
    REFERENCES `ProyectCoderHouse`.`Nombre_Proyecto` (`idNombre_Proyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ReporteBDA_Codigo_de_obra1`
    FOREIGN KEY (`Codigo_de_obra_idCodigo_de_obra`)
    REFERENCES `ProyectCoderHouse`.`Codigo_de_obra` (`idCodigo_de_obra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectCoderHouse`.`MaterialDescargado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectCoderHouse`.`MaterialDescargado` (
  `idMaterialDescargado` INT NOT NULL AUTO_INCREMENT,
  `Conductor_idConductor` INT NOT NULL,
  `Apoyos_idApoyos` INT NOT NULL,
  `Codigo_de_obra_idCodigo_de_obra` INT NOT NULL,
  `Circuito_idCircuito` INT NOT NULL,
  `Nombre_Proyecto_idNombre_Proyecto` INT NOT NULL,
  `ClaseProyecto_idClaseProyecto` INT NOT NULL,
  PRIMARY KEY (`idMaterialDescargado`, `Conductor_idConductor`, `Apoyos_idApoyos`, `Codigo_de_obra_idCodigo_de_obra`, `Circuito_idCircuito`, `Nombre_Proyecto_idNombre_Proyecto`, `ClaseProyecto_idClaseProyecto`),
  INDEX `fk_MaterialDescargado_Conductor1_idx` (`Conductor_idConductor` ASC) VISIBLE,
  INDEX `fk_MaterialDescargado_Apoyos1_idx` (`Apoyos_idApoyos` ASC) VISIBLE,
  INDEX `fk_MaterialDescargado_Codigo_de_obra1_idx` (`Codigo_de_obra_idCodigo_de_obra` ASC) VISIBLE,
  INDEX `fk_MaterialDescargado_Circuito1_idx` (`Circuito_idCircuito` ASC) VISIBLE,
  INDEX `fk_MaterialDescargado_Nombre_Proyecto1_idx` (`Nombre_Proyecto_idNombre_Proyecto` ASC) VISIBLE,
  INDEX `fk_MaterialDescargado_ClaseProyecto1_idx` (`ClaseProyecto_idClaseProyecto` ASC) VISIBLE,
  CONSTRAINT `fk_MaterialDescargado_Conductor1`
    FOREIGN KEY (`Conductor_idConductor`)
    REFERENCES `ProyectCoderHouse`.`Conductor` (`idConductor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MaterialDescargado_Apoyos1`
    FOREIGN KEY (`Apoyos_idApoyos`)
    REFERENCES `ProyectCoderHouse`.`Apoyos` (`idApoyos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MaterialDescargado_Codigo_de_obra1`
    FOREIGN KEY (`Codigo_de_obra_idCodigo_de_obra`)
    REFERENCES `ProyectCoderHouse`.`Codigo_de_obra` (`idCodigo_de_obra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MaterialDescargado_Circuito1`
    FOREIGN KEY (`Circuito_idCircuito`)
    REFERENCES `ProyectCoderHouse`.`Circuito` (`idCircuito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MaterialDescargado_Nombre_Proyecto1`
    FOREIGN KEY (`Nombre_Proyecto_idNombre_Proyecto`)
    REFERENCES `ProyectCoderHouse`.`Nombre_Proyecto` (`idNombre_Proyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MaterialDescargado_ClaseProyecto1`
    FOREIGN KEY (`ClaseProyecto_idClaseProyecto`)
    REFERENCES `ProyectCoderHouse`.`ClaseProyecto` (`idClaseProyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
