SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `sircoc` DEFAULT CHARACTER SET latin1 ;
USE `sircoc` ;

-- -----------------------------------------------------
-- Table `sircoc`.`rua`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`rua` (
  `idrua16` INT NOT NULL ,
  `descricao16` VARCHAR(45) NULL ,
  PRIMARY KEY (`idrua16`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`bairro`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`bairro` (
  `idbairro15` INT NOT NULL ,
  `descricao15` VARCHAR(45) NULL ,
  PRIMARY KEY (`idbairro15`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`cidade`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`cidade` (
  `idcidade14` INT NOT NULL ,
  `descricao14` VARCHAR(45) NULL ,
  PRIMARY KEY (`idcidade14`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`estado`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`estado` (
  `idestado17` INT NOT NULL ,
  `descricao17` VARCHAR(45) NULL ,
  `sigla17` VARCHAR(2) NULL ,
  PRIMARY KEY (`idestado17`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`cep`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`cep` (
  `idcep18` INT NOT NULL ,
  `numero18` VARCHAR(45) NULL ,
  PRIMARY KEY (`idcep18`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`endereco`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`endereco` (
  `idendereco13` INT NOT NULL ,
  `fkrua16` INT NOT NULL ,
  `fkbairro15` INT NOT NULL ,
  `fkcidade14` INT NOT NULL ,
  `fkestado17` INT NOT NULL ,
  `fkcep18` INT NOT NULL ,
  PRIMARY KEY (`idendereco13`) ,
  INDEX `fk_endereco_rua1_idx` (`fkrua16` ASC) ,
  INDEX `fk_endereco_bairro1_idx` (`fkbairro15` ASC) ,
  INDEX `fk_endereco_cidade1_idx` (`fkcidade14` ASC) ,
  INDEX `fk_endereco_estado1_idx` (`fkestado17` ASC) ,
  INDEX `fk_endereco_cep1_idx` (`fkcep18` ASC) ,
  CONSTRAINT `fk_endereco_rua1`
    FOREIGN KEY (`fkrua16` )
    REFERENCES `sircoc`.`rua` (`idrua16` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_endereco_bairro1`
    FOREIGN KEY (`fkbairro15` )
    REFERENCES `sircoc`.`bairro` (`idbairro15` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_endereco_cidade1`
    FOREIGN KEY (`fkcidade14` )
    REFERENCES `sircoc`.`cidade` (`idcidade14` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_endereco_estado1`
    FOREIGN KEY (`fkestado17` )
    REFERENCES `sircoc`.`estado` (`idestado17` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_endereco_cep1`
    FOREIGN KEY (`fkcep18` )
    REFERENCES `sircoc`.`cep` (`idcep18` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`unidade`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`unidade` (
  `idunidade01` INT NOT NULL ,
  `fkidendereco13` INT NOT NULL ,
  `nome01` VARCHAR(45) NULL ,
  `nomefantasia01` VARCHAR(45) NULL ,
  `numerounidade01` INT NULL ,
  `tipo01` VARCHAR(45) NULL ,
  PRIMARY KEY (`idunidade01`) ,
  INDEX `fk_unidade_endereco1_idx` (`fkidendereco13` ASC) ,
  CONSTRAINT `fk_unidade_endereco1`
    FOREIGN KEY (`fkidendereco13` )
    REFERENCES `sircoc`.`endereco` (`idendereco13` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`viatura`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`viatura` (
  `idviatura02` INT NOT NULL ,
  `fkunidade01` INT NOT NULL ,
  `perfixo02` VARCHAR(45) NULL ,
  `placa02` VARCHAR(45) NULL ,
  `marca02` VARCHAR(45) NULL ,
  `modelo02` VARCHAR(45) NULL ,
  `hodometro02` VARCHAR(45) NULL ,
  `status02` VARCHAR(45) NULL ,
  `combustivel02` VARCHAR(45) NULL ,
  `ano02` INT NULL ,
  `chassi02` VARCHAR(45) NULL ,
  `renavam02` INT NULL ,
  `diferencial02` VARCHAR(45) NULL ,
  `bateria02` VARCHAR(45) NULL ,
  `caixademarcha02` VARCHAR(45) NULL ,
  `pneu02` VARCHAR(45) NULL ,
  `recebemos02` VARCHAR(45) NULL ,
  `inventario02` VARCHAR(45) NULL ,
  PRIMARY KEY (`idviatura02`) ,
  INDEX `fk_viatura_unidade1_idx` (`fkunidade01` ASC) ,
  CONSTRAINT `fk_viatura_unidade1`
    FOREIGN KEY (`fkunidade01` )
    REFERENCES `sircoc`.`unidade` (`idunidade01` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`email`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`email` (
  `idemail19` INT NOT NULL ,
  `email19` VARCHAR(45) NULL ,
  PRIMARY KEY (`idemail19`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`militar`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`militar` (
  `idmilitar03` INT NOT NULL ,
  `fkunidade01` INT NOT NULL ,
  `fkemail19` INT NOT NULL ,
  `fkendereco13` INT NOT NULL ,
  `nome03` VARCHAR(45) NULL ,
  `nomedeguerra03` VARCHAR(45) NULL ,
  `cpf03` INT NULL ,
  `rgcivil03` INT NULL ,
  `rgmilitar03` VARCHAR(45) NULL ,
  `fatorrh03` VARCHAR(45) NULL ,
  `postograduacao03` VARCHAR(45) NULL ,
  `anoinclusao03` VARCHAR(45) NULL ,
  PRIMARY KEY (`idmilitar03`) ,
  INDEX `fk_militar_unidade1_idx` (`fkunidade01` ASC) ,
  INDEX `fk_militar_email1_idx` (`fkemail19` ASC) ,
  INDEX `fk_militar_endereco1_idx` (`fkendereco13` ASC) ,
  CONSTRAINT `fk_militar_unidade1`
    FOREIGN KEY (`fkunidade01` )
    REFERENCES `sircoc`.`unidade` (`idunidade01` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_militar_email1`
    FOREIGN KEY (`fkemail19` )
    REFERENCES `sircoc`.`email` (`idemail19` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_militar_endereco1`
    FOREIGN KEY (`fkendereco13` )
    REFERENCES `sircoc`.`endereco` (`idendereco13` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`tipodeocorrencia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`tipodeocorrencia` (
  `idtipodeocorrencia07` INT NOT NULL ,
  `descrição07` VARCHAR(45) NULL ,
  PRIMARY KEY (`idtipodeocorrencia07`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`ocorrencia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`ocorrencia` (
  `idocorrencia04` INT NOT NULL ,
  `fkunidade01` INT NOT NULL ,
  `fkidtipodeocorrencia07` INT NOT NULL ,
  `numeroevento04` INT NULL ,
  `data04` DATE NULL ,
  `numvitimas04` INT NULL COMMENT '0 ou muitas' ,
  `fatais04` TINYINT(1) NULL COMMENT 'sim ou não' ,
  `comandanteobm04` VARCHAR(45) NULL ,
  `comandantesocorro04` VARCHAR(45) NULL ,
  `comoavisado04` VARCHAR(45) NULL ,
  `recebimentoaviso04` DATETIME NULL ,
  `saidaobm04` DATETIME NULL ,
  `chegadacena04` DATETIME NULL ,
  `saidalocalevento04` DATETIME NULL ,
  `retornoobm04` DATETIME NULL ,
  `fkidendereco13` INT NOT NULL ,
  `areaobm04` TINYINT(1) NULL ,
  `dpresponsavel04` VARCHAR(45) NULL ,
  `socorroprimeiro04` VARCHAR(45) NULL ,
  `outrossocorros04` VARCHAR(45) NULL ,
  `especiodobem04` VARCHAR(45) NULL ,
  `ondeocorreuevento04` VARCHAR(45) NULL COMMENT 'Pode ser retirado de outra tabela via chave estrangeira ou via código' ,
  `qtocontinente04` VARCHAR(45) NULL COMMENT 'Responsabilidade pelos bens' ,
  `qtoconteudo04` VARCHAR(45) NULL COMMENT 'Responsabilidade pelos bens' ,
  `nomeposicaotripulantes04` VARCHAR(45) NULL COMMENT 'Tripulação' ,
  `comooriginou04` VARCHAR(45) NULL COMMENT 'Provavél causa do evento' ,
  `ondeoriginou04` VARCHAR(45) NULL COMMENT 'Provavél causa do evento' ,
  `situacaoevento04` VARCHAR(45) NULL COMMENT 'Ação de socorro' ,
  `estabelecidomaterial04` VARCHAR(45) NULL COMMENT 'Ação de socorro' ,
  `houvesalvamento04` TINYINT(1) NULL ,
  `salvoporquem04` VARCHAR(45) NULL ,
  `salvomeios04` VARCHAR(45) NULL ,
  `retiradacadaver04` TINYINT(1) NULL ,
  `retiradaporquem04` VARCHAR(45) NULL ,
  `retiradameios04` VARCHAR(45) NULL ,
  `protecaobens04` TINYINT(1) NULL ,
  `protecaoporquem04` VARCHAR(45) NULL ,
  `protecaomeios04` VARCHAR(45) NULL ,
  `iluminacao04` TINYINT(1) NULL ,
  `iluminacaoporquem04` VARCHAR(45) NULL ,
  `iluminacaomeios04` VARCHAR(45) NULL ,
  `arrombamento04` TINYINT(1) NULL ,
  `arrombadoporquem04` VARCHAR(45) NULL ,
  `arrobadomeios04` VARCHAR(45) NULL ,
  `moveisimoveisatingidos04` VARCHAR(45) NULL ,
  `prejizocontinente04` VARCHAR(45) NULL COMMENT 'Nulo insignificante parcial total' ,
  `prejuizoconteudo04` VARCHAR(45) NULL COMMENT 'Nulo insignificante parcial total' ,
  `matempregadocorpo04` VARCHAR(45) NULL ,
  `matempregadooutros04` VARCHAR(45) NULL ,
  `matcorpodestruido04` VARCHAR(45) NULL ,
  `recolhimentovalores04` TINYINT(1) NULL ,
  `guiarecolhimento04` VARCHAR(45) NULL COMMENT 'Numero da guia' ,
  `aquemconfiados04` VARCHAR(100) NULL ,
  `suprimentodeagua04` TINYINT(1) NULL ,
  `meiosusados04` VARCHAR(45) NULL COMMENT 'Viatura/Hidrante/ Outros meios' ,
  `outrosacidentes04` TINYINT(1) NULL ,
  `envolvidos04` VARCHAR(100) NULL COMMENT 'Pessoal / material envolvido' ,
  `socorromedico04` TINYINT(1) NULL ,
  `chefeequipe04` VARCHAR(45) NULL ,
  `viaturas04` VARCHAR(45) NULL ,
  `vitimas04` VARCHAR(100) NULL COMMENT 'Nome / destino' ,
  `auxiliosestranhos04` VARCHAR(45) NULL ,
  `pessoalenvolvido04` VARCHAR(200) NULL COMMENT 'Nomes/RGs dos officiais e praças envolvidos' ,
  `autoridadesnolocal04` VARCHAR(100) NULL COMMENT 'Nomes / Cargos das autoridades que compareceram no local' ,
  `laudoexigencias04` INT NULL COMMENT 'Não / Sim / N.F.P.A.' ,
  `certificadoaprovacao04` INT NULL COMMENT 'Não / Sim / N.F.P.A.' ,
  `certificadodespacho04` INT NULL COMMENT 'Não / Sim / N.F.P.A.' ,
  `aparelhagempreventiva04` VARCHAR(45) NULL ,
  `entreguelocalevento04` VARCHAR(100) NULL ,
  `pessoalempregado04` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção' ,
  `qtdeextintores04` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção' ,
  `qtdeesguicho04` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção' ,
  `qtdemangotinhos04` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção\\nMangotinhos e linhas de 1 1/2' ,
  `qtdelinhas04` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção\\nLinhas 2 1/2' ,
  `extratoexpuma04` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção\\nLitros' ,
  `qtdeviaturas04` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção\\nViaturas e equipamentos' ,
  `consumoagua04` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção\\nLitros' ,
  `tempoextincao04` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção\\nHoras' ,
  `temporescaldo04` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção\\nHoras' ,
  `condicaoevento04` VARCHAR(45) NULL COMMENT 'Dados para classificação do incendio quanto a proporção' ,
  `condicaoumidade04` VARCHAR(45) NULL COMMENT 'Dados para classificação do incendio quanto a proporção' ,
  `condicaochuva04` VARCHAR(45) NULL COMMENT 'Dados para classificação do incendio quanto a proporção' ,
  `condicaotemperatura04` VARCHAR(45) NULL COMMENT 'Dados para classificação do incendio quanto a proporção' ,
  `areasinistrada04` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção\\nMetros quadrados' ,
  `perigopropagacao04` VARCHAR(45) NULL COMMENT 'Dados para classificação do incendio quanto a proporção' ,
  `qtdevitimasincendio04` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção' ,
  `classeincendio04` VARCHAR(45) NULL COMMENT 'Dados para classificação do incendio quanto a proporção' ,
  `qtdeembarcacao04` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção\\nQuantidade de embarcações usadas' ,
  `qdtdeaeronaves04` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção\\nQuantidades de aeronaves usadas' ,
  `infcomplementar04` VARCHAR(400) NULL ,
  `responsaveform04` VARCHAR(45) NULL ,
  `detalhelocal04` VARCHAR(150) NULL COMMENT 'Evento' ,
  `avisolocal04` VARCHAR(150) NULL COMMENT 'Evento' ,
  `bmsmortos04` INT NULL COMMENT 'Eventos\\nEfetivo' ,
  `bmsferidos04` INT NULL COMMENT 'Eventos\\nEfetivo' ,
  `dp04` VARCHAR(45) NULL COMMENT 'Eventos' ,
  `rapref04` VARCHAR(45) NULL COMMENT 'Eventos' ,
  `areadestedificada04` INT NULL COMMENT 'Eventos' ,
  `areadestnaoedificada04` INT NULL COMMENT 'Eventos' ,
  `prejuizo04` INT NULL COMMENT 'Eventos' ,
  PRIMARY KEY (`idocorrencia04`) ,
  INDEX `fk_ocorrencia_unidade1_idx` (`fkunidade01` ASC) ,
  INDEX `fk_ocorrencia_endereco1_idx` (`fkidendereco13` ASC) ,
  INDEX `fk_ocorrencia_tipodeocorrencia1_idx` (`fkidtipodeocorrencia07` ASC) ,
  CONSTRAINT `fk_ocorrencia_unidade1`
    FOREIGN KEY (`fkunidade01` )
    REFERENCES `sircoc`.`unidade` (`idunidade01` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ocorrencia_endereco1`
    FOREIGN KEY (`fkidendereco13` )
    REFERENCES `sircoc`.`endereco` (`idendereco13` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ocorrencia_tipodeocorrencia1`
    FOREIGN KEY (`fkidtipodeocorrencia07` )
    REFERENCES `sircoc`.`tipodeocorrencia` (`idtipodeocorrencia07` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`relacaocoamando`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`relacaocoamando` (
  `idrelacaocomando12` INT NOT NULL ,
  `fkunidade01` INT NOT NULL ,
  `idcomandada12` INT NULL ,
  PRIMARY KEY (`idrelacaocomando12`) ,
  INDEX `fk_relacaocoamando_unidade1_idx` (`fkunidade01` ASC) ,
  CONSTRAINT `fk_relacaocoamando_unidade1`
    FOREIGN KEY (`fkunidade01` )
    REFERENCES `sircoc`.`unidade` (`idunidade01` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`senha`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`senha` (
  `idsenha06` INT NOT NULL ,
  `fkmilitar03` INT NOT NULL ,
  `senha06` VARCHAR(45) NULL ,
  PRIMARY KEY (`idsenha06`) ,
  INDEX `fk_senha_militar1_idx` (`fkmilitar03` ASC) ,
  CONSTRAINT `fk_senha_militar1`
    FOREIGN KEY (`fkmilitar03` )
    REFERENCES `sircoc`.`militar` (`idmilitar03` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`procedimentolocal`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`procedimentolocal` (
  `idprocedimentolocal08` INT NOT NULL ,
  `fkunidade01` INT NOT NULL ,
  PRIMARY KEY (`idprocedimentolocal08`) ,
  INDEX `fk_procedimentolocal_unidade1_idx` (`fkunidade01` ASC) ,
  CONSTRAINT `fk_procedimentolocal_unidade1`
    FOREIGN KEY (`fkunidade01` )
    REFERENCES `sircoc`.`unidade` (`idunidade01` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`procedimentopadrao`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`procedimentopadrao` (
  `idprocedimentopadrao09` INT NOT NULL ,
  PRIMARY KEY (`idprocedimentopadrao09`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`telefone`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`telefone` (
  `idtelefone20` INT NOT NULL ,
  `numero20` VARCHAR(45) NULL ,
  `tipo20` VARCHAR(45) NULL ,
  PRIMARY KEY (`idtelefone20`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`viaturaocorrencia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`viaturaocorrencia` (
  `idviaturaocorrencia05` INT NOT NULL ,
  `fkidviatura02` INT NOT NULL ,
  `fkidocorrencia04` INT NOT NULL ,
  PRIMARY KEY (`idviaturaocorrencia05`) ,
  INDEX `fk_viaturaocorrencia_viatura1_idx` (`fkidviatura02` ASC) ,
  INDEX `fk_viaturaocorrencia_ocorrencia1_idx` (`fkidocorrencia04` ASC) ,
  CONSTRAINT `fk_viaturaocorrencia_viatura1`
    FOREIGN KEY (`fkidviatura02` )
    REFERENCES `sircoc`.`viatura` (`idviatura02` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_viaturaocorrencia_ocorrencia1`
    FOREIGN KEY (`fkidocorrencia04` )
    REFERENCES `sircoc`.`ocorrencia` (`idocorrencia04` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`proclocaltipoocor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`proclocaltipoocor` (
  `idproclocaltipoocor10` INT NOT NULL ,
  `fkprocedimentolocal08` INT NOT NULL ,
  `fktipodeocorrencia07` INT NOT NULL ,
  PRIMARY KEY (`idproclocaltipoocor10`) ,
  INDEX `fk_proclocaltipoocor_procedimentolocal1_idx` (`fkprocedimentolocal08` ASC) ,
  INDEX `fk_proclocaltipoocor_tipodeocorrencia1_idx` (`fktipodeocorrencia07` ASC) ,
  CONSTRAINT `fk_proclocaltipoocor_procedimentolocal1`
    FOREIGN KEY (`fkprocedimentolocal08` )
    REFERENCES `sircoc`.`procedimentolocal` (`idprocedimentolocal08` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proclocaltipoocor_tipodeocorrencia1`
    FOREIGN KEY (`fktipodeocorrencia07` )
    REFERENCES `sircoc`.`tipodeocorrencia` (`idtipodeocorrencia07` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`procpadraotipoocor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`procpadraotipoocor` (
  `idprocpadraotipoocor11` INT NOT NULL ,
  `fk11tipodeocorrencia07` INT NOT NULL ,
  `fkprocedimentopadrao09` INT NOT NULL ,
  PRIMARY KEY (`idprocpadraotipoocor11`) ,
  INDEX `fk_procpadraotipoocor_tipodeocorrencia1_idx` (`fk11tipodeocorrencia07` ASC) ,
  INDEX `fk_procpadraotipoocor_procedimentopadrao1_idx` (`fkprocedimentopadrao09` ASC) ,
  CONSTRAINT `fk_procpadraotipoocor_tipodeocorrencia1`
    FOREIGN KEY (`fk11tipodeocorrencia07` )
    REFERENCES `sircoc`.`tipodeocorrencia` (`idtipodeocorrencia07` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_procpadraotipoocor_procedimentopadrao1`
    FOREIGN KEY (`fkprocedimentopadrao09` )
    REFERENCES `sircoc`.`procedimentopadrao` (`idprocedimentopadrao09` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`ocorrenciamilitar`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`ocorrenciamilitar` (
  `idocorrenciamilitar21` INT NOT NULL ,
  `fkocorrencia04` INT NOT NULL ,
  `fkmilitar03` INT NOT NULL ,
  PRIMARY KEY (`idocorrenciamilitar21`) ,
  INDEX `fk_ocorrenciamilitar_ocorrencia1_idx` (`fkocorrencia04` ASC) ,
  INDEX `fk_ocorrenciamilitar_militar1_idx` (`fkmilitar03` ASC) ,
  CONSTRAINT `fk_ocorrenciamilitar_ocorrencia1`
    FOREIGN KEY (`fkocorrencia04` )
    REFERENCES `sircoc`.`ocorrencia` (`idocorrencia04` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ocorrenciamilitar_militar1`
    FOREIGN KEY (`fkmilitar03` )
    REFERENCES `sircoc`.`militar` (`idmilitar03` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`unidadeemail`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`unidadeemail` (
  `idunidadeemail22` INT NOT NULL ,
  `fkemail19` INT NOT NULL ,
  `fkunidade01` INT NOT NULL ,
  PRIMARY KEY (`idunidadeemail22`) ,
  INDEX `fk_unidadeemail_email1_idx` (`fkemail19` ASC) ,
  INDEX `fk_unidadeemail_unidade1_idx` (`fkunidade01` ASC) ,
  CONSTRAINT `fk_unidadeemail_email1`
    FOREIGN KEY (`fkemail19` )
    REFERENCES `sircoc`.`email` (`idemail19` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_unidadeemail_unidade1`
    FOREIGN KEY (`fkunidade01` )
    REFERENCES `sircoc`.`unidade` (`idunidade01` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`unidadetelefone`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`unidadetelefone` (
  `idunidadetelefone23` INT NOT NULL ,
  `fkunidade01` INT NOT NULL ,
  `fktelefone20` INT NOT NULL ,
  PRIMARY KEY (`idunidadetelefone23`) ,
  INDEX `fk_unidadetelefone_unidade1_idx` (`fkunidade01` ASC) ,
  INDEX `fk_unidadetelefone_telefone1_idx` (`fktelefone20` ASC) ,
  CONSTRAINT `fk_unidadetelefone_unidade1`
    FOREIGN KEY (`fkunidade01` )
    REFERENCES `sircoc`.`unidade` (`idunidade01` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_unidadetelefone_telefone1`
    FOREIGN KEY (`fktelefone20` )
    REFERENCES `sircoc`.`telefone` (`idtelefone20` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`militartelefone`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`militartelefone` (
  `idmilitartelefone24` INT NOT NULL ,
  `fkmilitar03` INT NOT NULL ,
  `fktelefone20` INT NOT NULL ,
  PRIMARY KEY (`idmilitartelefone24`) ,
  INDEX `fk_militartelefone_militar1_idx` (`fkmilitar03` ASC) ,
  INDEX `fk_militartelefone_telefone1_idx` (`fktelefone20` ASC) ,
  CONSTRAINT `fk_militartelefone_militar1`
    FOREIGN KEY (`fkmilitar03` )
    REFERENCES `sircoc`.`militar` (`idmilitar03` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_militartelefone_telefone1`
    FOREIGN KEY (`fktelefone20` )
    REFERENCES `sircoc`.`telefone` (`idtelefone20` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`subtipoocor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`subtipoocor` (
  `idsubtipoocor26` INT NOT NULL ,
  `fkidtipodeocorrencia07` INT NOT NULL ,
  `descricao26` VARCHAR(45) NULL ,
  PRIMARY KEY (`idsubtipoocor26`) ,
  INDEX `fk_subtipoocor_tipodeocorrencia1_idx` (`fkidtipodeocorrencia07` ASC) ,
  CONSTRAINT `fk_subtipoocor_tipodeocorrencia1`
    FOREIGN KEY (`fkidtipodeocorrencia07` )
    REFERENCES `sircoc`.`tipodeocorrencia` (`idtipodeocorrencia07` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`militarocorrencia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`militarocorrencia` (
  `idmilitarocorrencia27` INT NOT NULL ,
  `fkidocorrencia04` INT NOT NULL ,
  `fkidmilitar03` INT NOT NULL ,
  PRIMARY KEY (`idmilitarocorrencia27`) ,
  INDEX `fk_militarocorrencia_ocorrencia1_idx` (`fkidocorrencia04` ASC) ,
  INDEX `fk_militarocorrencia_militar1_idx` (`fkidmilitar03` ASC) ,
  CONSTRAINT `fk_militarocorrencia_ocorrencia1`
    FOREIGN KEY (`fkidocorrencia04` )
    REFERENCES `sircoc`.`ocorrencia` (`idocorrencia04` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_militarocorrencia_militar1`
    FOREIGN KEY (`fkidmilitar03` )
    REFERENCES `sircoc`.`militar` (`idmilitar03` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`vitimas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`vitimas` (
  `idvitimas28` INT NOT NULL ,
  `fkidocorrencia04` INT NOT NULL ,
  `sexo28` TINYINT(1) NULL ,
  `e28` VARCHAR(45) NULL ,
  `c28` VARCHAR(45) NULL ,
  `o28` VARCHAR(45) NULL ,
  `idade28` INT NULL ,
  `a28` VARCHAR(45) NULL ,
  `p28` VARCHAR(45) NULL ,
  `nome28` VARCHAR(45) NULL ,
  `dn28` VARCHAR(45) NULL ,
  `fatal28` TINYINT(1) NULL ,
  `observacao28` VARCHAR(45) NULL ,
  PRIMARY KEY (`idvitimas28`) ,
  INDEX `fk_vitimas_ocorrencia1_idx` (`fkidocorrencia04` ASC) ,
  CONSTRAINT `fk_vitimas_ocorrencia1`
    FOREIGN KEY (`fkidocorrencia04` )
    REFERENCES `sircoc`.`ocorrencia` (`idocorrencia04` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`veiculos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`veiculos` (
  `idveiculos29` INT NOT NULL ,
  `fkidocorrencia04` INT NOT NULL ,
  `ano29` INT NULL ,
  `marca29` VARCHAR(45) NULL ,
  `modelo29` VARCHAR(45) NULL ,
  `uf29` VARCHAR(2) NULL ,
  `placa29` VARCHAR(7) NULL ,
  `cor29` VARCHAR(45) NULL ,
  `al29` VARCHAR(45) NULL ,
  `tl29` VARCHAR(45) NULL ,
  `observacoes29` VARCHAR(45) NULL ,
  PRIMARY KEY (`idveiculos29`) ,
  INDEX `fk_veiculos_ocorrencia1_idx` (`fkidocorrencia04` ASC) ,
  CONSTRAINT `fk_veiculos_ocorrencia1`
    FOREIGN KEY (`fkidocorrencia04` )
    REFERENCES `sircoc`.`ocorrencia` (`idocorrencia04` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
