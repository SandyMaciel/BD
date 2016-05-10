


CREATE TABLE imovel (
  inscricao INT(11) NOT NULL,
  endereco VARCHAR(100) NOT NULL,
  areaEdificada INT(11) NOT NULL,
  areaTerreno INT(11) NOT NULL,
  CPFproprietario INT(11) NOT NULL,
  valorImovel INT(11) NULL DEFAULT NULL,
  idTipoImovel INT(11) NOT NULL,
  tipoImovel_idTipoImovel INT(11) NOT NULL,
  nome_bairro VARCHAR(100) NOT NULL,
  PRIMARY KEY (inscricao),
 
    FOREIGN KEY (tipoImovel_idTipoImovel)
    REFERENCES tipoImovel (idTipoImovel)
   
    FOREIGN KEY (nome_bairro)
    REFERENCES bairro (nome_bairro)
  


CREATE TABLE bairro (
  nome_bairro VARCHAR(100) NOT NULL,
  representante VARCHAR(100) NULL DEFAULT NULL,
  telefone INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (nome_bairro))

CREATE TABLE proprietario (
  CPF_proprietario INT(11) NOT NULL,
  nome VARCHAR(100) NOT NULL,
  end_imovel_reside VARCHAR(100) NOT NULL,
  sexo VARCHAR(1) NOT NULL,
  dt_nascimento DATE NOT NULL,
  PRIMARY KEY (CPF_proprietario))


CREATE TABLE iptu(
  imovel_inscricao` INT(11) NOT NULL,
  ano INT(11) NOT NULL,
  n_parcela`INT(11) NOT NULL,
  dt_vencimento DATE NOT NULL,
  valorParcela INT(11) NOT NULL,
  valorDesconto INT(11) NULL DEFAULT NULL,
  dt_pagamentoRealizado INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (imovel_inscricao, ano, n_parcela),
  
    FOREIGN KEY (imovel_inscricao)
    REFERENCES imovel (inscricao)
    )


CREATE TABLE os (
  ano INT(11) NOT NULL,
  idSequencia INT(11) NOT NULL,
  dt_inicio DATE NOT NULL,
  dt_final DATE NOT NULL,
  fiscal1_matricula INT(11) NOT NULL,
  fiscal2_matricula INT(11) NOT NULL,
  PRIMARY KEY (ano, idSequencia),
  
    FOREIGN KEY (fiscal1_matricula)
    REFERENCES fiscal (matricula)
    
    FOREIGN KEY (fiscal2_matricula)
    REFERENCES fiscal (matricula)
   )


CREATE TABLE fiscal (
  matricula INT(11) NOT NULL,
  nome VARCHAR(45) NOT NULL,
  dt_nascimento DATE NOT NULL,
  dt_admissao DATE NOT NULL,
  sexo VARCHAR(1) NOT NULL,
  endereco VARCHAR(45) NOT NULL,
  PRIMARY KEY (matricula))


CREATE TABLE tipoImovel (
  idTipoImovel INT(11) NOT NULL AUTO_INCREMENT,
  tipoImovel VARCHAR(50) NOT NULL,
  PRIMARY KEY (idTipoImovel`),
  UNIQUE  (idTipoImovel))


CREATE TABLE autuacao (
  imovel_inscricao` INT(11) NOT NULL,
  os_idSequencia INT(11) NOT NULL,
  os_ano INT(11) NOT NULL,
  incricaoImovel VARCHAR(45) NOT NULL,
  descricao INT(11) NULL DEFAULT NULL,
  dt_comparecimento VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (imovel_inscricao, os_idSequencia, os_ano),
  
    FOREIGN KEY (imovel_inscricao , os_ano , os_idSequencia)
    REFERENCES imovel_has_os (imovel_inscricao , os_ano , os_idSequencia)
    )


CREATE TABLE imovel_has_proprietario (
  inscricao INT(11) NOT NULL,
  CPF_proprietario INT(11) NOT NULL,
  PRIMARY KEY (inscricao, CPF_proprietario),
  
    FOREIGN KEY (inscricao)
    REFERENCES imovel (inscricao)
   
    FOREIGN KEY (CPF_proprietario)
    REFERENCES proprietario(CPF_proprietario)
   )

CREATE TABLE imovel_has_os(
  imovel_inscricao INT(11) NOT NULL,
  os_ano INT(11) NOT NULL,
  os_idSequencia INT(11) NOT NULL,
  PRIMARY KEY (imovel_inscricao, os_ano, os_idSequencia),
  
    FOREIGN KEY (imovel_inscricao)
    REFERENCES imovel (inscricao)
    
    FOREIGN KEY (os_ano , os_idSequencia)
    REFERENCES os (ano , idSequencia)
   )




