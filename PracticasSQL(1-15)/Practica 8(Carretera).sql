--SQL
USE master;
GO
IF DB_ID (N'Carretera') IS NOT NULL
DROP DATABASE Carretera;
GO
CREATE DATABASE Carretera
ON 
(NAME = Carretera_dat,
FILENAME = 'D:\BD\Carretera.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME = Carretera_log,
FILENAME = 'D:\BD\Carretera.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE Carretera;
GO

--------------TABLAS------
CREATE TABLE  CARRETERA
( 
idCarretera int not null,
nombre varchar (50) not null,
estatus bit default 1 not null,
);
GO

CREATE  TABLE TRAMO
(
idTramo int not null,
numeroTramo int not null,
Descripcion varchar (50) not null,
idCarretera int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE MUNICIPIO
(
idMunicipio int not null,
nombre varchar (50) not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE MUNICIPIOTRAMO
(
idMunicipioTramo int not null,
kmEntrada int not null,
kmSalida int not null,
idMunicipio int not null,
idTramo int not null,
estatus bit default 1 not null,
);
GO

--------------------------------LLAVES PRIMARIAS-------------------
ALTER TABLE Carretera ADD CONSTRAINT PK_Carretera PRIMARY KEY (idCarretera)
ALTER TABLE Tramo ADD CONSTRAINT PK_Tramo PRIMARY KEY (idTramo)
ALTER TABLE Municipio ADD CONSTRAINT PK_Municipio PRIMARY KEY (idMunicipio)
ALTER TABLE MunicipioTramo ADD CONSTRAINT PK_MunicipioTramo PRIMARY KEY (idMunicipioTramo)




-------------------------------LLAVES FORANEAS----------------------
ALTER TABLE Tramo ADD CONSTRAINT FK_TramoCarretera FOREIGN KEY (idCarretera) REFERENCES Carretera (idCarretera)

ALTER TABLE MunicipioTramo ADD CONSTRAINT FK_MunicipioTramoMunicipio FOREIGN KEY (idMunicipio) REFERENCES Municipio (idMunicipio)

ALTER TABLE MunicipioTramo ADD CONSTRAINT FK_MunicipioTramoTramo FOREIGN KEY (idTramo) REFERENCES Tramo(idTramo)


--------------------------------INDEX------------------------------

CREATE INDEX IX_Carretera ON Carretera(idCarretera)

CREATE INDEX IX_Tramo ON Tramo(idTramo)

CREATE INDEX IX_Municipio ON Municipio(idMunicipio)

CREATE INDEX IX_MunicipioTramo ON MunicipioTramo(idMunicipioTramo)

