SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `side` DEFAULT CHARACTER SET utf8 ;
USE `side` ;

-- -----------------------------------------------------
-- Table `side`.`empresa`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `side`.`empresa` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `eCnpj` VARCHAR(45) NOT NULL ,
  `eRazao` VARCHAR(45) NOT NULL ,
  `eFantasia` VARCHAR(45) NULL DEFAULT NULL ,
  `eLogradouro` VARCHAR(45) NOT NULL ,
  `eNumero` INT(11) NOT NULL ,
  `eComplemento` VARCHAR(45) NULL DEFAULT NULL ,
  `eBairro` VARCHAR(45) NULL DEFAULT NULL ,
  `eMunicipio` VARCHAR(45) NOT NULL ,
  `eUf` VARCHAR(45) NOT NULL ,
  `eRntrc` INT(11) NOT NULL ,
  `eCertificado` BLOB NULL DEFAULT NULL ,
  `eLogo` BLOB NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `eCnpjk_UNIQUE` (`eCnpj` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `side`.`usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `side`.`usuario` (
  `uId` INT NOT NULL ,
  `uNome` VARCHAR(45) NOT NULL ,
  `uSenha` VARCHAR(45) NOT NULL ,
  `uEmail` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`uId`) ,
  INDEX `eCnpj` (`uEmail` ASC) ,
  UNIQUE INDEX `uEmail_UNIQUE` (`uEmail` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `side`.`motorista`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `side`.`motorista` (
  `mId` INT NOT NULL ,
  `mCpf` VARCHAR(11) NOT NULL ,
  `mCnh` VARCHAR(11) NOT NULL ,
  `mValidade` DATE NULL DEFAULT NULL ,
  `mTipo` VARCHAR(1) NULL DEFAULT NULL ,
  `mNome` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`mId`) ,
  UNIQUE INDEX `mCpf_UNIQUE` (`mCpf` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `side`.`mdfe`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `side`.`mdfe` (
  `mId` INT NOT NULL ,
  `mChave` VARCHAR(44) NOT NULL ,
  `mEmissor` VARCHAR(14) NOT NULL ,
  `mDataInicio` DATETIME NOT NULL ,
  `mDataFim` DATETIME NULL DEFAULT NULL ,
  `mStatus` INT(11) NOT NULL ,
  `mXmlEnvio` BLOB NULL DEFAULT NULL ,
  `mXmlAutorizado` BLOB NULL DEFAULT NULL ,
  `mXmlCancelamento` BLOB NULL DEFAULT NULL ,
  `usuario_uId` INT NOT NULL ,
  `motorista_mCpf` INT NOT NULL ,
  PRIMARY KEY (`mId`) ,
  INDEX `fk_mdfe_usuario1` (`usuario_uId` ASC) ,
  INDEX `fk_mdfe_motorista1` (`motorista_mCpf` ASC) ,
  UNIQUE INDEX `mChave_UNIQUE` (`mChave` ASC) ,
  CONSTRAINT `fk_mdfe_usuario1`
    FOREIGN KEY (`usuario_uId` )
    REFERENCES `side`.`usuario` (`uId` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mdfe_motorista1`
    FOREIGN KEY (`motorista_mCpf` )
    REFERENCES `side`.`motorista` (`mId` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `side`.`historico`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `side`.`historico` (
  `hId` INT NOT NULL AUTO_INCREMENT ,
  `hDescricao` VARCHAR(45) NULL DEFAULT NULL ,
  `hDataEvento` DATETIME NULL DEFAULT NULL ,
  `mdfe_mId` INT NOT NULL ,
  PRIMARY KEY (`hId`) ,
  INDEX `fk_historico_mdfe1` (`mdfe_mId` ASC) ,
  CONSTRAINT `fk_historico_mdfe1`
    FOREIGN KEY (`mdfe_mId` )
    REFERENCES `side`.`mdfe` (`mId` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `side`.`veiculo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `side`.`veiculo` (
  `vId` INT NOT NULL ,
  `vPlaca` VARCHAR(14) NOT NULL ,
  `vProprietario` VARCHAR(14) NOT NULL ,
  `vTipoVeiculo` INT(1) NOT NULL ,
  `vCargaMax` INT(9) NOT NULL ,
  `vTipoProprietario` INT(1) NOT NULL ,
  `vRntrc` INT(8) NOT NULL ,
  PRIMARY KEY (`vId`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `side`.`veiculo_mdfe`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `side`.`veiculo_mdfe` (
  `veiculo_vId` INT NOT NULL ,
  `mdfe_mId` INT NOT NULL ,
  PRIMARY KEY (`veiculo_vId`, `mdfe_mId`) ,
  INDEX `fk_veiculo_has_mdfe_mdfe1` (`mdfe_mId` ASC) ,
  INDEX `fk_veiculo_has_mdfe_veiculo1` (`veiculo_vId` ASC) ,
  CONSTRAINT `fk_veiculo_has_mdfe_veiculo1`
    FOREIGN KEY (`veiculo_vId` )
    REFERENCES `side`.`veiculo` (`vId` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_veiculo_has_mdfe_mdfe1`
    FOREIGN KEY (`mdfe_mId` )
    REFERENCES `side`.`mdfe` (`mId` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `side`.`empresa_usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `side`.`empresa_usuario` (
  `empresa_id` INT NOT NULL ,
  `usuario_uId` INT NOT NULL ,
  PRIMARY KEY (`empresa_id`, `usuario_uId`) ,
  INDEX `fk_empresa_has_usuario_usuario1` (`usuario_uId` ASC) ,
  INDEX `fk_empresa_has_usuario_empresa1` (`empresa_id` ASC) ,
  CONSTRAINT `fk_empresa_has_usuario_empresa1`
    FOREIGN KEY (`empresa_id` )
    REFERENCES `side`.`empresa` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empresa_has_usuario_usuario1`
    FOREIGN KEY (`usuario_uId` )
    REFERENCES `side`.`usuario` (`uId` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `side`.`empresa_motorista`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `side`.`empresa_motorista` (
  `empresa_id` INT NOT NULL ,
  `motorista_mId` INT NOT NULL ,
  PRIMARY KEY (`empresa_id`, `motorista_mId`) ,
  INDEX `fk_empresa_has_motorista_motorista1` (`motorista_mId` ASC) ,
  INDEX `fk_empresa_has_motorista_empresa1` (`empresa_id` ASC) ,
  CONSTRAINT `fk_empresa_has_motorista_empresa1`
    FOREIGN KEY (`empresa_id` )
    REFERENCES `side`.`empresa` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empresa_has_motorista_motorista1`
    FOREIGN KEY (`motorista_mId` )
    REFERENCES `side`.`motorista` (`mId` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `side`.`empresa_veiculo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `side`.`empresa_veiculo` (
  `empresa_id` INT NOT NULL ,
  `veiculo_id` INT NOT NULL ,
  PRIMARY KEY (`empresa_id`, `veiculo_id`) ,
  INDEX `fk_empresa_has_veiculo_veiculo1` (`veiculo_id` ASC) ,
  INDEX `fk_empresa_has_veiculo_empresa1` (`empresa_id` ASC) ,
  CONSTRAINT `fk_empresa_has_veiculo_empresa1`
    FOREIGN KEY (`empresa_id` )
    REFERENCES `side`.`empresa` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empresa_has_veiculo_veiculo1`
    FOREIGN KEY (`veiculo_id` )
    REFERENCES `side`.`veiculo` (`vId` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `side`.`empresa_mdfe`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `side`.`empresa_mdfe` (
  `empresa_id` INT NOT NULL ,
  `mdfe_mId` INT NOT NULL ,
  PRIMARY KEY (`empresa_id`, `mdfe_mId`) ,
  INDEX `fk_empresa_has_mdfe_mdfe1` (`mdfe_mId` ASC) ,
  INDEX `fk_empresa_has_mdfe_empresa1` (`empresa_id` ASC) ,
  CONSTRAINT `fk_empresa_has_mdfe_empresa1`
    FOREIGN KEY (`empresa_id` )
    REFERENCES `side`.`empresa` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empresa_has_mdfe_mdfe1`
    FOREIGN KEY (`mdfe_mId` )
    REFERENCES `side`.`mdfe` (`mId` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `side`.`telefone`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `side`.`telefone` (
  `tId` INT NOT NULL ,
  `tCpf` VARCHAR(14) NOT NULL ,
  `tFone` INT(11) NOT NULL ,
  `tDescricao` VARCHAR(30) NULL ,
  `motorista_mCpf` VARCHAR(11) NOT NULL ,
  PRIMARY KEY (`tId`) ,
  INDEX `fk_telefone_motorista1` (`motorista_mCpf` ASC) ,
  CONSTRAINT `fk_telefone_motorista1`
    FOREIGN KEY (`motorista_mCpf` )
    REFERENCES `side`.`motorista` (`mCpf` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `side`.`permissao`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `side`.`permissao` (
  `idpermissao` INT NOT NULL ,
  `tipo` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`idpermissao`) ,
  UNIQUE INDEX `tipo_UNIQUE` (`tipo` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `side`.`permissao_usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `side`.`permissao_usuario` (
  `permissao_idpermissao` INT NOT NULL ,
  `usuario_uId` INT NOT NULL ,
  PRIMARY KEY (`permissao_idpermissao`, `usuario_uId`) ,
  INDEX `fk_permissao_has_usuario_usuario1` (`usuario_uId` ASC) ,
  INDEX `fk_permissao_has_usuario_permissao1` (`permissao_idpermissao` ASC) ,
  CONSTRAINT `fk_permissao_has_usuario_permissao1`
    FOREIGN KEY (`permissao_idpermissao` )
    REFERENCES `side`.`permissao` (`idpermissao` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_permissao_has_usuario_usuario1`
    FOREIGN KEY (`usuario_uId` )
    REFERENCES `side`.`usuario` (`uId` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
