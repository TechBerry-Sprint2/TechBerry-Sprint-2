CREATE DATABASE TechBerry;
USE TechBerry;

CREATE TABLE cliente(
    idCliente INT PRIMARY KEY auto_increment,
    nomeCliente VARCHAR(45) NOT NULL,
    CNPJ CHAR(18) NOT NULL UNIQUE,
    telefoneCliente CHAR(15) NOT NULL UNIQUE,
    emailCliente CHAR(45) NOT NULL UNIQUE,
    senha VARCHAR(45) NOT NULL
);

CREATE TABLE estufa(
    idEstufa INT PRIMARY KEY auto_increment,
    apelidoEstufa VARCHAR(45) NOT NULL,
    enderecoEstufa VARCHAR(96) NOT NULL,
    idCliente INT NOT NULL,
    FOREIGN KEY(idCliente) REFERENCES cliente(idCliente)
) auto_increment = 5000;

CREATE TABLE sensor(
    idSensor INT PRIMARY KEY auto_increment,
    modelo VARCHAR(45) NOT NULL,
    serialNumber VARCHAR(45) NOT NULL,
    idEstufa INT NOT NULL,
    FOREIGN KEY(idEstufa) REFERENCES estufa(idEstufa)
)auto_increment = 2000;

CREATE TABLE medida(
    idMedida INT PRIMARY KEY auto_increment,
    temperaturaRegistrada FLOAT NOT NULL,
    umidadeRegistrada FLOAT CHECK(umidadeRegistrada < 101 AND umidadeRegistrada > -1) NOT NULL,
    horarioRegistro DATETIME NOT NULL,
    idSensor INT NOT NULL,
    FOREIGN KEY(idSensor) REFERENCES sensor(idSensor)
) auto_increment = 10000;

																		
