--SQL
USE master;
GO
IF DB_ID (N'Vivienda') IS NOT NULL
DROP DATABASE Vivienda;

GO
CREATE DATABASE Vivienda
ON 
(NAME = Vivienda_dat,
FILENAME = 'D:\BD\Vivienda.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 

(NAME = Vivienda_log,
FILENAME = 'D:\BD\Vivienda.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);

GO
USE Vivienda
GO

--TABLAS
CREATE TABLE MUNICIPIO 
(
idMunicipio int not null,
nombre varchar (50) not null,
estado varchar (50) not null,
estatus bit default 1 not null,
);
GO


CREATE TABLE PERSONA
(
idPersona int not null,
nombre varchar (50) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
rfc varchar (50) not null,
idVivienda int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE VIVIENDA 
(
idVivienda int not null,
calle varchar (50) not null,
numero int not null,
ciudad varchar (50) not null,
idPersona int not null,
estatus bit default 1 not null,
);
GO

--Llaves primarias
ALTER TABLE Municipio ADD CONSTRAINT PK_Municipio PRIMARY KEY (idMunicipio)
ALTER TABLE Persona ADD CONSTRAINT PK_Persona PRIMARY KEY (idPersona)
ALTER TABLE Vivienda ADD CONSTRAINT PK_Vivienda PRIMARY KEY (idVivienda)

ALTER TABLE Persona ADD CONSTRAINT FK_PersonaVivienda FOREIGN KEY (idVivienda) REFERENCES 
Vivienda(idVivienda)
ALTER TABLE Vivienda ADD CONSTRAINT FK_ViviendaPersona FOREIGN KEY (idPersona) REFERENCES 
Persona(idPersona)



--INDEX
CREATE INDEX IX_Municipio ON Municipio(idMunicipio)

CREATE INDEX IX_Persona ON Persona(idPersona)
GO

CREATE INDEX IX_Vivienda ON Vivienda(idVivienda)



