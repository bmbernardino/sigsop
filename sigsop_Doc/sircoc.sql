SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `sircoc` DEFAULT CHARACTER SET latin1 ;
USE `sircoc` ;

-- -----------------------------------------------------
-- Table `sircoc`.`rua`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`rua` (
  `id16rua` INT NOT NULL ,
  `16descricao` VARCHAR(45) NULL ,
  PRIMARY KEY (`id16rua`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`bairro`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`bairro` (
  `id15bairro` INT NOT NULL ,
  `15descricao` VARCHAR(45) NULL ,
  PRIMARY KEY (`id15bairro`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`cidade`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`cidade` (
  `id14cidade` INT NOT NULL ,
  `14descricao` VARCHAR(45) NULL ,
  PRIMARY KEY (`id14cidade`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`estado`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`estado` (
  `id17estado` INT NOT NULL ,
  `17descricao` VARCHAR(45) NULL ,
  `17sigla` VARCHAR(2) NULL ,
  PRIMARY KEY (`id17estado`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`cep`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`cep` (
  `id18cep` INT NOT NULL ,
  `18numero` VARCHAR(45) NULL ,
  PRIMARY KEY (`id18cep`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`endereco`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`endereco` (
  `id13endereco` INT NOT NULL ,
  `fk16rua` INT NOT NULL ,
  `fk15bairro` INT NOT NULL ,
  `fk14cidade` INT NOT NULL ,
  `fk17estado` INT NOT NULL ,
  `fk18cep` INT NOT NULL ,
  PRIMARY KEY (`id13endereco`) ,
  INDEX `fk_endereco_rua1_idx` (`fk16rua` ASC) ,
  INDEX `fk_endereco_bairro1_idx` (`fk15bairro` ASC) ,
  INDEX `fk_endereco_cidade1_idx` (`fk14cidade` ASC) ,
  INDEX `fk_endereco_estado1_idx` (`fk17estado` ASC) ,
  INDEX `fk_endereco_cep1_idx` (`fk18cep` ASC) ,
  CONSTRAINT `fk_endereco_rua1`
    FOREIGN KEY (`fk16rua` )
    REFERENCES `sircoc`.`rua` (`id16rua` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_endereco_bairro1`
    FOREIGN KEY (`fk15bairro` )
    REFERENCES `sircoc`.`bairro` (`id15bairro` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_endereco_cidade1`
    FOREIGN KEY (`fk14cidade` )
    REFERENCES `sircoc`.`cidade` (`id14cidade` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_endereco_estado1`
    FOREIGN KEY (`fk17estado` )
    REFERENCES `sircoc`.`estado` (`id17estado` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_endereco_cep1`
    FOREIGN KEY (`fk18cep` )
    REFERENCES `sircoc`.`cep` (`id18cep` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`unidade`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`unidade` (
  `id01unidade` INT NOT NULL ,
  `fk13endereco` INT NOT NULL ,
  `01nome` VARCHAR(45) NULL ,
  `01nomefantasia` VARCHAR(45) NULL ,
  `01numerounidade` INT NULL ,
  `01tipo` VARCHAR(45) NULL ,
  PRIMARY KEY (`id01unidade`) ,
  INDEX `fk_unidade_endereco1_idx` (`fk13endereco` ASC) ,
  CONSTRAINT `fk_unidade_endereco1`
    FOREIGN KEY (`fk13endereco` )
    REFERENCES `sircoc`.`endereco` (`id13endereco` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`viatura`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`viatura` (
  `id02viatura` INT NOT NULL ,
  `fk02unidade` INT NOT NULL ,
  `02perfixo` VARCHAR(45) NULL ,
  `02placa` VARCHAR(45) NULL ,
  `02marca` VARCHAR(45) NULL ,
  `02modelo` VARCHAR(45) NULL ,
  `02hodometro` VARCHAR(45) NULL ,
  `02status` VARCHAR(45) NULL ,
  `02combustivel` VARCHAR(45) NULL ,
  `02ano` INT NULL ,
  `02chassi` VARCHAR(45) NULL ,
  `02renavam` INT NULL ,
  `02diferencial` VARCHAR(45) NULL ,
  `02bateria` VARCHAR(45) NULL ,
  `02caixademarcha` VARCHAR(45) NULL ,
  `02pneu` VARCHAR(45) NULL ,
  `02recebemos` VARCHAR(45) NULL ,
  `02inventario` VARCHAR(45) NULL ,
  PRIMARY KEY (`id02viatura`) ,
  INDEX `fk_viatura_unidade1_idx` (`fk02unidade` ASC) ,
  CONSTRAINT `fk_viatura_unidade1`
    FOREIGN KEY (`fk02unidade` )
    REFERENCES `sircoc`.`unidade` (`id01unidade` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`email`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`email` (
  `id19email` INT NOT NULL ,
  `19email` VARCHAR(45) NULL ,
  PRIMARY KEY (`id19email`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`militar`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`militar` (
  `id03militar` INT NOT NULL ,
  `fk01unidade` INT NOT NULL ,
  `fk19email` INT NOT NULL ,
  `fk13endereco` INT NOT NULL ,
  `03nome` VARCHAR(45) NULL ,
  `03nomedeguerra` VARCHAR(45) NULL ,
  `03cpf` INT NULL ,
  `03rgcivil` INT NULL ,
  `03rgmilitar` VARCHAR(45) NULL ,
  `03fatorrh` VARCHAR(45) NULL ,
  `03postograduacao` VARCHAR(45) NULL ,
  `03anoinclusao` VARCHAR(45) NULL ,
  PRIMARY KEY (`id03militar`) ,
  INDEX `fk_militar_unidade1_idx` (`fk01unidade` ASC) ,
  INDEX `fk_militar_email1_idx` (`fk19email` ASC) ,
  INDEX `fk_militar_endereco1_idx` (`fk13endereco` ASC) ,
  CONSTRAINT `fk_militar_unidade1`
    FOREIGN KEY (`fk01unidade` )
    REFERENCES `sircoc`.`unidade` (`id01unidade` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_militar_email1`
    FOREIGN KEY (`fk19email` )
    REFERENCES `sircoc`.`email` (`id19email` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_militar_endereco1`
    FOREIGN KEY (`fk13endereco` )
    REFERENCES `sircoc`.`endereco` (`id13endereco` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`tipodeocorrencia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`tipodeocorrencia` (
  `id07tipodeocorrencia` INT NOT NULL ,
  `07descrição` VARCHAR(45) NULL ,
  PRIMARY KEY (`id07tipodeocorrencia`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`ocorrencia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`ocorrencia` (
  `ocorrenciacol` VARCHAR(45) NULL ,
  `id04ocorrencia` INT NOT NULL ,
  `fk04unidade` INT NOT NULL ,
  `fkid07tipodeocorrencia` INT NOT NULL ,
  `04numeroevento` INT NULL ,
  `04data` DATE NULL ,
  `04numvitimas` INT NULL COMMENT '0 ou muitas' ,
  `04fatais` TINYINT(1) NULL COMMENT 'sim ou não' ,
  `04comandanteobm` VARCHAR(45) NULL ,
  `04comandantesocorro` VARCHAR(45) NULL ,
  `04comoavisado` VARCHAR(45) NULL ,
  `04recebimentoaviso` DATETIME NULL ,
  `04saidaobm` DATETIME NULL ,
  `04chegadacena` DATETIME NULL ,
  `04saidalocalevento` DATETIME NULL ,
  `04retornoobm` DATETIME NULL ,
  `fkid13endereco` INT NOT NULL ,
  `04areaobm` TINYINT(1) NULL ,
  `04dpresponsavel` VARCHAR(45) NULL ,
  `04socorroprimeiro` VARCHAR(45) NULL ,
  `04outrossocorros` VARCHAR(45) NULL ,
  `04especiodobem` VARCHAR(45) NULL ,
  `04ondeocorreuevento` VARCHAR(45) NULL COMMENT 'Pode ser retirado de outra tabela via chave estrangeira ou via código' ,
  `04qtocontinente` VARCHAR(45) NULL COMMENT 'Responsabilidade pelos bens' ,
  `04qtoconteudo` VARCHAR(45) NULL COMMENT 'Responsabilidade pelos bens' ,
  `04nomeposicaotripulantes` VARCHAR(45) NULL COMMENT 'Tripulação' ,
  `04comooriginou` VARCHAR(45) NULL COMMENT 'Provavél causa do evento' ,
  `04ondeoriginou` VARCHAR(45) NULL COMMENT 'Provavél causa do evento' ,
  `04situacaoevento` VARCHAR(45) NULL COMMENT 'Ação de socorro' ,
  `04estabelecidomaterial` VARCHAR(45) NULL COMMENT 'Ação de socorro' ,
  `04houvesalvamento` TINYINT(1) NULL ,
  `04salvoporquem` VARCHAR(45) NULL ,
  `04salvomeios` VARCHAR(45) NULL ,
  `04retiradacadaver` TINYINT(1) NULL ,
  `04retiradaporquem` VARCHAR(45) NULL ,
  `04retiradameios` VARCHAR(45) NULL ,
  `04protecaobens` TINYINT(1) NULL ,
  `04protecaoporquem` VARCHAR(45) NULL ,
  `04protecaomeios` VARCHAR(45) NULL ,
  `04iluminacao` TINYINT(1) NULL ,
  `04iluminacaoporquem` VARCHAR(45) NULL ,
  `04iluminacaomeios` VARCHAR(45) NULL ,
  `04arrombamento` TINYINT(1) NULL ,
  `04arrombadoporquem` VARCHAR(45) NULL ,
  `04arrobadomeios` VARCHAR(45) NULL ,
  `04moveisimoveisatingidos` VARCHAR(45) NULL ,
  `04prejizocontinente` VARCHAR(45) NULL COMMENT 'Nulo insignificante parcial total' ,
  `04prejuizoconteudo` VARCHAR(45) NULL COMMENT 'Nulo insignificante parcial total' ,
  `04matempregadocorpo` VARCHAR(45) NULL ,
  `04matempregadooutros` VARCHAR(45) NULL ,
  `04matcorpodestruido` VARCHAR(45) NULL ,
  `04recolhimentovalores` TINYINT(1) NULL ,
  `04guiarecolhimento` VARCHAR(45) NULL COMMENT 'Numero da guia' ,
  `04aquemconfiados` VARCHAR(100) NULL ,
  `04suprimentodeagua` TINYINT(1) NULL ,
  `04meiosusados` VARCHAR(45) NULL COMMENT 'Viatura/Hidrante/ Outros meios' ,
  `04outrosacidentes` TINYINT(1) NULL ,
  `04envolvidos` VARCHAR(100) NULL COMMENT 'Pessoal / material envolvido' ,
  `04socorromedico` TINYINT(1) NULL ,
  `04chefeequipe` VARCHAR(45) NULL ,
  `04viaturas` VARCHAR(45) NULL ,
  `04vitimas` VARCHAR(100) NULL COMMENT 'Nome / destino' ,
  `04auxiliosestranhos` VARCHAR(45) NULL ,
  `04pessoalenvolvido` VARCHAR(200) NULL COMMENT 'Nomes/RGs dos officiais e praças envolvidos' ,
  `04autoridadesnolocal` VARCHAR(100) NULL COMMENT 'Nomes / Cargos das autoridades que compareceram no local' ,
  `04laudoexigencias` INT NULL COMMENT 'Não / Sim / N.F.P.A.' ,
  `04certificadoaprovacao` INT NULL COMMENT 'Não / Sim / N.F.P.A.' ,
  `04certificadodespacho` INT NULL COMMENT 'Não / Sim / N.F.P.A.' ,
  `04aparelhagempreventiva` VARCHAR(45) NULL ,
  `04entreguelocalevento` VARCHAR(100) NULL ,
  `04pessoalempregado` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção' ,
  `04qtdeextintores` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção' ,
  `04qtdeesguicho` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção' ,
  `04qtdemangotinhos` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção\\nMangotinhos e linhas de 1 1/2' ,
  `04qtdelinhas` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção\\nLinhas 2 1/2' ,
  `04extratoexpuma` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção\\nLitros' ,
  `04qtdeviaturas` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção\\nViaturas e equipamentos' ,
  `04consumoagua` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção\\nLitros' ,
  `04tempoextincao` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção\\nHoras' ,
  `04temporescaldo` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção\\nHoras' ,
  `04condicaoevento` VARCHAR(45) NULL COMMENT 'Dados para classificação do incendio quanto a proporção' ,
  `04condicaoumidade` VARCHAR(45) NULL COMMENT 'Dados para classificação do incendio quanto a proporção' ,
  `04condicaochuva` VARCHAR(45) NULL COMMENT 'Dados para classificação do incendio quanto a proporção' ,
  `04condicaotemperatura` VARCHAR(45) NULL COMMENT 'Dados para classificação do incendio quanto a proporção' ,
  `04areasinistrada` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção\\nMetros quadrados' ,
  `04perigopropagacao` VARCHAR(45) NULL COMMENT 'Dados para classificação do incendio quanto a proporção' ,
  `04qtdevitimasincendio` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção' ,
  `04classeincendio` VARCHAR(45) NULL COMMENT 'Dados para classificação do incendio quanto a proporção' ,
  `04qtdeembarcacao` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção\\nQuantidade de embarcações usadas' ,
  `04qdtdeaeronaves` INT NULL COMMENT 'Dados para classificação do incendio quanto a proporção\\nQuantidades de aeronaves usadas' ,
  `04infcomplementar` VARCHAR(400) NULL ,
  `04responsaveform` VARCHAR(45) NULL ,
  `04detalhelocal` VARCHAR(150) NULL COMMENT 'Evento' ,
  `04avisolocal` VARCHAR(150) NULL COMMENT 'Evento' ,
  `04bmsmortos` INT NULL COMMENT 'Eventos\\nEfetivo' ,
  `04bmsferidos` INT NULL COMMENT 'Eventos\\nEfetivo' ,
  `04dp` VARCHAR(45) NULL COMMENT 'Eventos' ,
  `04rapref` VARCHAR(45) NULL COMMENT 'Eventos' ,
  `04areadestedificada` INT NULL COMMENT 'Eventos' ,
  `04areadestnaoedificada` INT NULL COMMENT 'Eventos' ,
  `04prejuizo` INT NULL COMMENT 'Eventos' ,
  PRIMARY KEY (`id04ocorrencia`) ,
  INDEX `fk_ocorrencia_unidade1_idx` (`fk04unidade` ASC) ,
  INDEX `fk_ocorrencia_endereco1_idx` (`fkid13endereco` ASC) ,
  INDEX `fk_ocorrencia_tipodeocorrencia1_idx` (`fkid07tipodeocorrencia` ASC) ,
  CONSTRAINT `fk_ocorrencia_unidade1`
    FOREIGN KEY (`fk04unidade` )
    REFERENCES `sircoc`.`unidade` (`id01unidade` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ocorrencia_endereco1`
    FOREIGN KEY (`fkid13endereco` )
    REFERENCES `sircoc`.`endereco` (`id13endereco` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ocorrencia_tipodeocorrencia1`
    FOREIGN KEY (`fkid07tipodeocorrencia` )
    REFERENCES `sircoc`.`tipodeocorrencia` (`id07tipodeocorrencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`relacaocoamando`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`relacaocoamando` (
  `id12relacaocomando` INT NOT NULL ,
  `fk12unidade` INT NOT NULL ,
  `12idcomandada` INT NULL ,
  PRIMARY KEY (`id12relacaocomando`) ,
  INDEX `fk_relacaocoamando_unidade1_idx` (`fk12unidade` ASC) ,
  CONSTRAINT `fk_relacaocoamando_unidade1`
    FOREIGN KEY (`fk12unidade` )
    REFERENCES `sircoc`.`unidade` (`id01unidade` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`senha`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`senha` (
  `id06senha` INT NOT NULL ,
  `fk03militar` INT NOT NULL ,
  `06senha` VARCHAR(45) NULL ,
  PRIMARY KEY (`id06senha`) ,
  INDEX `fk_senha_militar1_idx` (`fk03militar` ASC) ,
  CONSTRAINT `fk_senha_militar1`
    FOREIGN KEY (`fk03militar` )
    REFERENCES `sircoc`.`militar` (`id03militar` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`procedimentolocal`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`procedimentolocal` (
  `id08procedimentolocal` INT NOT NULL ,
  `fk08unidade` INT NOT NULL ,
  PRIMARY KEY (`id08procedimentolocal`) ,
  INDEX `fk_procedimentolocal_unidade1_idx` (`fk08unidade` ASC) ,
  CONSTRAINT `fk_procedimentolocal_unidade1`
    FOREIGN KEY (`fk08unidade` )
    REFERENCES `sircoc`.`unidade` (`id01unidade` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`procedimentopadrao`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`procedimentopadrao` (
  `id09procedimentopadrao` INT NOT NULL ,
  PRIMARY KEY (`id09procedimentopadrao`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`telefone`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`telefone` (
  `id20telefone` INT NOT NULL ,
  `20numero` VARCHAR(45) NULL ,
  `20tipo` VARCHAR(45) NULL ,
  PRIMARY KEY (`id20telefone`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`viaturaocorrencia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`viaturaocorrencia` (
  `id05viaturaocorrencia` INT NOT NULL ,
  `fk05viatura` INT NOT NULL ,
  `fk05ocorrencia` INT NOT NULL ,
  PRIMARY KEY (`id05viaturaocorrencia`) ,
  INDEX `fk_viaturaocorrencia_viatura1_idx` (`fk05viatura` ASC) ,
  INDEX `fk_viaturaocorrencia_ocorrencia1_idx` (`fk05ocorrencia` ASC) ,
  CONSTRAINT `fk_viaturaocorrencia_viatura1`
    FOREIGN KEY (`fk05viatura` )
    REFERENCES `sircoc`.`viatura` (`id02viatura` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_viaturaocorrencia_ocorrencia1`
    FOREIGN KEY (`fk05ocorrencia` )
    REFERENCES `sircoc`.`ocorrencia` (`id04ocorrencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`proclocaltipoocor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`proclocaltipoocor` (
  `id10proclocaltipoocor` INT NOT NULL ,
  `fk10procedimentolocal` INT NOT NULL ,
  `fk10tipodeocorrencia` INT NOT NULL ,
  PRIMARY KEY (`id10proclocaltipoocor`) ,
  INDEX `fk_proclocaltipoocor_procedimentolocal1_idx` (`fk10procedimentolocal` ASC) ,
  INDEX `fk_proclocaltipoocor_tipodeocorrencia1_idx` (`fk10tipodeocorrencia` ASC) ,
  CONSTRAINT `fk_proclocaltipoocor_procedimentolocal1`
    FOREIGN KEY (`fk10procedimentolocal` )
    REFERENCES `sircoc`.`procedimentolocal` (`id08procedimentolocal` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proclocaltipoocor_tipodeocorrencia1`
    FOREIGN KEY (`fk10tipodeocorrencia` )
    REFERENCES `sircoc`.`tipodeocorrencia` (`id07tipodeocorrencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`procpadraotipoocor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`procpadraotipoocor` (
  `id11procpadraotipoocor` INT NOT NULL ,
  `fk11tipodeocorrencia` INT NOT NULL ,
  `fk11procedimentopadrao` INT NOT NULL ,
  PRIMARY KEY (`id11procpadraotipoocor`) ,
  INDEX `fk_procpadraotipoocor_tipodeocorrencia1_idx` (`fk11tipodeocorrencia` ASC) ,
  INDEX `fk_procpadraotipoocor_procedimentopadrao1_idx` (`fk11procedimentopadrao` ASC) ,
  CONSTRAINT `fk_procpadraotipoocor_tipodeocorrencia1`
    FOREIGN KEY (`fk11tipodeocorrencia` )
    REFERENCES `sircoc`.`tipodeocorrencia` (`id07tipodeocorrencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_procpadraotipoocor_procedimentopadrao1`
    FOREIGN KEY (`fk11procedimentopadrao` )
    REFERENCES `sircoc`.`procedimentopadrao` (`id09procedimentopadrao` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`ocorrenciamilitar`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`ocorrenciamilitar` (
  `id21ocorrenciamilitar` INT NOT NULL ,
  `fk04ocorrencia` INT NOT NULL ,
  `fk03militar` INT NOT NULL ,
  PRIMARY KEY (`id21ocorrenciamilitar`) ,
  INDEX `fk_ocorrenciamilitar_ocorrencia1_idx` (`fk04ocorrencia` ASC) ,
  INDEX `fk_ocorrenciamilitar_militar1_idx` (`fk03militar` ASC) ,
  CONSTRAINT `fk_ocorrenciamilitar_ocorrencia1`
    FOREIGN KEY (`fk04ocorrencia` )
    REFERENCES `sircoc`.`ocorrencia` (`id04ocorrencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ocorrenciamilitar_militar1`
    FOREIGN KEY (`fk03militar` )
    REFERENCES `sircoc`.`militar` (`id03militar` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`unidadeemail`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`unidadeemail` (
  `id22unidadeemail` INT NOT NULL ,
  `fk19email` INT NOT NULL ,
  `fk01unidade` INT NOT NULL ,
  PRIMARY KEY (`id22unidadeemail`) ,
  INDEX `fk_unidadeemail_email1_idx` (`fk19email` ASC) ,
  INDEX `fk_unidadeemail_unidade1_idx` (`fk01unidade` ASC) ,
  CONSTRAINT `fk_unidadeemail_email1`
    FOREIGN KEY (`fk19email` )
    REFERENCES `sircoc`.`email` (`id19email` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_unidadeemail_unidade1`
    FOREIGN KEY (`fk01unidade` )
    REFERENCES `sircoc`.`unidade` (`id01unidade` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`unidadetelefone`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`unidadetelefone` (
  `id23unidadetelefone` INT NOT NULL ,
  `fk01unidade` INT NOT NULL ,
  `fk20telefone` INT NOT NULL ,
  PRIMARY KEY (`id23unidadetelefone`) ,
  INDEX `fk_unidadetelefone_unidade1_idx` (`fk01unidade` ASC) ,
  INDEX `fk_unidadetelefone_telefone1_idx` (`fk20telefone` ASC) ,
  CONSTRAINT `fk_unidadetelefone_unidade1`
    FOREIGN KEY (`fk01unidade` )
    REFERENCES `sircoc`.`unidade` (`id01unidade` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_unidadetelefone_telefone1`
    FOREIGN KEY (`fk20telefone` )
    REFERENCES `sircoc`.`telefone` (`id20telefone` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`militartelefone`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`militartelefone` (
  `id24militartelefone` INT NOT NULL ,
  `fk03militar` INT NOT NULL ,
  `fk20telefone` INT NOT NULL ,
  PRIMARY KEY (`id24militartelefone`) ,
  INDEX `fk_militartelefone_militar1_idx` (`fk03militar` ASC) ,
  INDEX `fk_militartelefone_telefone1_idx` (`fk20telefone` ASC) ,
  CONSTRAINT `fk_militartelefone_militar1`
    FOREIGN KEY (`fk03militar` )
    REFERENCES `sircoc`.`militar` (`id03militar` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_militartelefone_telefone1`
    FOREIGN KEY (`fk20telefone` )
    REFERENCES `sircoc`.`telefone` (`id20telefone` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`subtipoocor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`subtipoocor` (
  `id26subtipoocor` INT NOT NULL ,
  `fkid07tipodeocorrencia` INT NOT NULL ,
  `26descricao` VARCHAR(45) NULL ,
  PRIMARY KEY (`id26subtipoocor`) ,
  INDEX `fk_subtipoocor_tipodeocorrencia1_idx` (`fkid07tipodeocorrencia` ASC) ,
  CONSTRAINT `fk_subtipoocor_tipodeocorrencia1`
    FOREIGN KEY (`fkid07tipodeocorrencia` )
    REFERENCES `sircoc`.`tipodeocorrencia` (`id07tipodeocorrencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`militarocorrencia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`militarocorrencia` (
  `id27militarocorrencia` INT NOT NULL ,
  `fkid04ocorrencia` INT NOT NULL ,
  `fkid03militar` INT NOT NULL ,
  PRIMARY KEY (`id27militarocorrencia`) ,
  INDEX `fk_militarocorrencia_ocorrencia1_idx` (`fkid04ocorrencia` ASC) ,
  INDEX `fk_militarocorrencia_militar1_idx` (`fkid03militar` ASC) ,
  CONSTRAINT `fk_militarocorrencia_ocorrencia1`
    FOREIGN KEY (`fkid04ocorrencia` )
    REFERENCES `sircoc`.`ocorrencia` (`id04ocorrencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_militarocorrencia_militar1`
    FOREIGN KEY (`fkid03militar` )
    REFERENCES `sircoc`.`militar` (`id03militar` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`vitimas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`vitimas` (
  `id28vitimas` INT NOT NULL ,
  `fkid04ocorrencia` INT NOT NULL ,
  `28sexo` TINYINT(1) NULL ,
  `28e` VARCHAR(45) NULL ,
  `28c` VARCHAR(45) NULL ,
  `28o` VARCHAR(45) NULL ,
  `28idade` INT NULL ,
  `28a` VARCHAR(45) NULL ,
  `28p` VARCHAR(45) NULL ,
  `28nome` VARCHAR(45) NULL ,
  `28dn` VARCHAR(45) NULL ,
  `28fatal` TINYINT(1) NULL ,
  `28observacao` VARCHAR(45) NULL ,
  PRIMARY KEY (`id28vitimas`) ,
  INDEX `fk_vitimas_ocorrencia1_idx` (`fkid04ocorrencia` ASC) ,
  CONSTRAINT `fk_vitimas_ocorrencia1`
    FOREIGN KEY (`fkid04ocorrencia` )
    REFERENCES `sircoc`.`ocorrencia` (`id04ocorrencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sircoc`.`veiculos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sircoc`.`veiculos` (
  `id29veiculos` INT NOT NULL ,
  `fkid04ocorrencia` INT NOT NULL ,
  `29ano` INT NULL ,
  `29marca` VARCHAR(45) NULL ,
  `29modelo` VARCHAR(45) NULL ,
  `29uf` VARCHAR(2) NULL ,
  `29placa` VARCHAR(7) NULL ,
  `29cor` VARCHAR(45) NULL ,
  `29al` VARCHAR(45) NULL ,
  `29tl` VARCHAR(45) NULL ,
  `29observacoes` VARCHAR(45) NULL ,
  PRIMARY KEY (`id29veiculos`) ,
  INDEX `fk_veiculos_ocorrencia1_idx` (`fkid04ocorrencia` ASC) ,
  CONSTRAINT `fk_veiculos_ocorrencia1`
    FOREIGN KEY (`fkid04ocorrencia` )
    REFERENCES `sircoc`.`ocorrencia` (`id04ocorrencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
