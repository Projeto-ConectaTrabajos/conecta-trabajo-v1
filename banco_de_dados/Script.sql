CREATE DATABASE Conecta_Trabajos;
USE Conecta_Trabajos;

CREATE TABLE if not exists  Login_Usuario (
    ID_LoginUsuario INT PRIMARY KEY,
    Email_Usuario VARCHAR(188) UNIQUE,
    Senha VARCHAR(20)
);

CREATE TABLE if not exists Login_Empresa (
    ID_LoginEmpresa INT PRIMARY KEY,
    EmailEmpresa VARCHAR(188) UNIQUE,
    Senha VARCHAR(20)
);

CREATE TABLE if not exists Cadastro_Usuario (
    CPF VARCHAR(20) PRIMARY KEY,
    RNE VARCHAR(20),
    Email_Usuario VARCHAR(100),
    Data_Nascimento DATE,
    Nome_Usuario VARCHAR(100),
    senha VARCHAR(20)
);

CREATE TABLE if not exists Cadastro_Empresa (
    CNPJ INT PRIMARY KEY,
    Email_Empresa VARCHAR(100),
    senha varchar(20)
);

CREATE TABLE if not exists Dados_Usuario (
    ID_Usuario INT PRIMARY KEY,
    CPF VARCHAR(20),
    FOREIGN KEY (CPF) REFERENCES Cadastro_Usuario(CPF)
);

CREATE TABLE if not exists Dados_Empresa (
    ID_Empresa INT PRIMARY KEY,
    CNPJ INT,
    ID_LoginEmpresa INT,
    FOREIGN KEY (CNPJ) REFERENCES Cadastro_Empresa(CNPJ),
    FOREIGN KEY (ID_LoginEmpresa) REFERENCES Login_Empresa(ID_LoginEmpresa)
);

CREATE TABLE if not exists Endereco (
    id_Endereco INT AUTO_INCREMENT PRIMARY KEY,
    rua VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(50),
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep CHAR(8) NOT NULL,
    ID_Empresa INT,
    ID_Usuario INT,
    FOREIGN KEY (ID_Empresa) REFERENCES Dados_Empresa(ID_Empresa),
    FOREIGN KEY (ID_Usuario) REFERENCES Dados_Usuario(ID_Usuario)
);

CREATE TABLE Candidatura (
    ID_Candidatura INT PRIMARY KEY,
    ID_Usuario INT,
    ID_Usuario INT,
    FOREIGN KEY (ID_Usuario) REFERENCES Dados_Usuario(ID_Usuario)
);

CREATE TABLE Vaga (
    ID_Vaga INT PRIMARY KEY,
    Titulo VARCHAR(100),
    Localizacao VARCHAR(255),
    Competencias TEXT,
    DataPublicacao DATETIME,
    Modalidade VARCHAR(58),
    Requisitos TEXT,
    Beneficios TEXT,
    Responsabilidade TEXT,
    DescricaoEmpresa TEXT,
    Descricao TEXT,
    Salario DECIMAL(10, 2),
    ID_Empresa INT,
    ID_Candidatura INT,
    FOREIGN KEY (ID_Empresa) REFERENCES Dados_Empresa(ID_Empresa),
    FOREIGN KEY (ID_Candidatura) REFERENCES Candidatura(ID_Candidatura)
);

/* Login_Usuario */
ALTER TABLE Login_Usuario
	ADD COLUMN ID_Usuario INT,
    add FOREIGN KEY (ID_Usuario) REFERENCES Dados_Usuario(ID_Usuario);

/* Login_Empresa */
ALTER TABLE Login_Empresa
	ADD COLUMN ID_Empresa INT,
    add FOREIGN KEY (ID_Empresa) REFERENCES Dados_Empresa(ID_Empresa);
    
/* Cadastro_Usuario */
ALTER TABLE Cadastro_Usuario
	ADD COLUMN ID_Usuario INT,
    add FOREIGN KEY (ID_Usuario) REFERENCES Dados_Usuario(ID_Usuario);
 
/* Cadastro_Empresa */
ALTER TABLE Cadastro_Empresa
	ADD COLUMN ID_Empresa INT,
    add FOREIGN KEY (ID_Empresa) REFERENCES Dados_Empresa(ID_Empresa);
    
/* endereco */
ALTER TABLE Dados_Usuario
	ADD COLUMN ID_Endereco INT,
    add FOREIGN KEY (ID_Endereco) REFERENCES Endereco(ID_Endereco);
ALTER TABLE Dados_Empresa
	ADD COLUMN ID_Endereco INT,
    add FOREIGN KEY (ID_Endereco) REFERENCES Endereco(ID_Endereco);
    
/* Dados_Candidatura */
ALTER TABLE Candidatura
	ADD COLUMN ID_Vaga INT,
    add FOREIGN KEY (ID_Vaga) REFERENCES Vaga(ID_Vaga);