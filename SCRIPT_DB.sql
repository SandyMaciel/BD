CREATE DATABASE IPTU;

CREATE TABLE IPTU(
	N_PARCELAS INT NOT NULL,
    VALOR_PARCELA VARCHAR(45),
    DESCONTO VARCHAR(45),
    DT_VENCIMENTO DATE,
    DT_PAGAMENTNO DATE,
    PRIMARY KEY (N_PARCELAS));

CREATE TABLE AUTUACAO(
	IMOVEL_AUTUADO boolean NOT NULL,
    DESC_OCORRENCIA VARCHAR (45),
    DT_COMPARECIMENTO DATE,
    PRIMARY KEY (IMOVEL_AUTUADO));
    
CREATE TABLE BAIRRO(
	NOME INT NOT NULL,
    REPRESENTANTE VARCHAR(45),
    TEL_CONTATO VARCHAR(45),
    PRIMARY KEY(NOME));
    
CREATE TABLE PROPRIETARIO(
	CPF VARCHAR(45) NOT NULL,
    NOME INT,
    ENDERECO VARCHAR(45),
    SEXO VARCHAR(1),
    DT_NASCIMENTO DATE,
    PROPRIETARIOCOL VARCHAR(45),
    primary key (CPF));

CREATE TABLE OS(
   ANO DATE NOT NULL,
   ID_SEQUENCIA VARCHAR(45) NOT NULL,
   DT_INICIAL DATE,	
   DT_FINAL DATE,
   IMOVEL_AUTUADO boolean NOT NULL,
   primary key(ANO,ID_SEQUENCIA,IMOVEL_AUTUADO),
   foreign key(IMOVEL_AUTUADO) references AUTUACAO(IMOVEL_AUTUADO)
   );
   
CREATE TABLE FISCAL(
	MATRICULA INT NOT NULL,
    NOME VARCHAR(45),
    DT_NASCIMENTO DATE,
    DT_ADMISSAO DATE,
    ENDERECO VARCHAR(45),
    SEXO BOOLEAN NOT NULL,
    ANO DATE NOT NULL,
    ID_SEQUENCIA VARCHAR(45) NOT NULL,
    IMOVEL_AUTUADO BOOLEAN NOT NULL,
    PRIMARY KEY(MATRICULA,ANO,ID_SEQUENCIA,IMOVEL_AUTUADO),
    foreign key(ANO,ID_SEQUENCIA,IMOVEL_AUTUADO)
    references OS(ANO,ID_SEQUENCIA,IMOVEL_AUTUADO)
);

CREATE TABLE IMOVEL(
	INSCRICAO INT NOT NULL,
    ENDERECO varchar(45),
    AREA_EDIFICADA varchar(45),
    AREA_DO_TERRENO varchar(45),
    PROPRIETARIO varchar(45),
    VALOR varchar(45),
    TIPO_IMOVEL varchar(45),
    BAIRRO_NOME int,
    ANO DATE NOT NULL,
    ID_SEQUENCIA VARCHAR(45) NOT NULL,
    IMOVEL_AUTUADO BOOLEAN NOT NULL, 
    primary key (INSCRICAO,BAIRRO_NOME,ANO,ID_SEQUENCIA,IMOVEL_AUTUADO),
    foreign key(BAIRRO_NOME)
    references BAIRRO (NOME),
    foreign key (ANO,ID_SEQUENCIA,IMOVEL_AUTUADO)
    references OS (ANO,ID_SEQUENCIA,IMOVEL_AUTUADO));

CREATE TABLE `IPTU_has_IMOVEL` (
  `IPTU_N_PARCELAS` INT NOT NULL COMMENT '',
  `IMOVEL_INSCRICAO` INT NOT NULL COMMENT '',
  PRIMARY KEY (`IPTU_N_PARCELAS`, `IMOVEL_INSCRICAO`)  COMMENT '',
  INDEX `fk_IPTU_has_IMOVEL_IMOVEL1_idx` (`IMOVEL_INSCRICAO` ASC)  COMMENT '',
  INDEX `fk_IPTU_has_IMOVEL_IPTU1_idx` (`IPTU_N_PARCELAS` ASC)  COMMENT '',
  CONSTRAINT `fk_IPTU_has_IMOVEL_IPTU1`
    FOREIGN KEY (`IPTU_N_PARCELAS`)
    REFERENCES  `IPTU` (`N_PARCELAS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_IPTU_has_IMOVEL_IMOVEL1`
    FOREIGN KEY (`IMOVEL_INSCRICAO`)
    REFERENCES `IMOVEL` (`INSCRICAO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE  `PROPRIETARIO_has_IMOVEL` (
  `CPF` VARCHAR(45) NOT NULL COMMENT '',
  `INSCRICAO` INT NOT NULL COMMENT '',
  PRIMARY KEY (`CPF`, `INSCRICAO`)  COMMENT '',
  INDEX `fk_PROPRIETARIO_has_IMOVEL_IMOVEL1_idx` (`INSCRICAO` ASC)  COMMENT '',
  INDEX `fk_PROPRIETARIO_has_IMOVEL_PROPRIETARIO1_idx` (`CPF` ASC)  COMMENT '',
  CONSTRAINT `fk_PROPRIETARIO_has_IMOVEL_PROPRIETARIO1`
    FOREIGN KEY (`CPF`)
    REFERENCES  `PROPRIETARIO` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PROPRIETARIO_has_IMOVEL_IMOVEL1`
     FOREIGN KEY (`INSCRICAO`)
    REFERENCES `IMOVEL` (`INSCRICAO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

    
   
   