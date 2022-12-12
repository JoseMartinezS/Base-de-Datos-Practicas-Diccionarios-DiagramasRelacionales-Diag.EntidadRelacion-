--Sql
USE master;
GO
IF DB_ID (N'ServicioMilitar') IS NOT NULL
	Drop DATABASE ServicioMilitar;
	GO
CREATE DATABASE ServicioMilitar

ON   
( NAME = ServicioMilitar_dat,  
    FILENAME = 'D:\BD\ServicioMilitar.mdf',  
    SIZE = 10,  
    MAXSIZE = 50,  
    FILEGROWTH = 5 )  
LOG ON  
( NAME = Sales_log,  
    FILENAME = 'D:\BD\ServicioMilitar.ldf',  
    SIZE = 5MB,  
    MAXSIZE = 25MB,  
    FILEGROWTH = 5MB );  
GO
USE ServicioMilitar;
GO


CREATE TABLE Compania
(
	idCompania int identity(1,1),
	actividad varchar(50) not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Cuartel
(
	idCuartel int NOT NULL,
	codigo varchar(10) not null,
	direccion varchar(50) not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Cuerpo
(
	idCuerpo int NOT NULL,
	denominacion varchar(10) not null,
	estatus bit default 1 not null
);
GO


CREATE TABLE Servicio
(
	idServicio int NOT NULL,
	codigo varchar(50) NOT NULL,
	descripcion varchar(50) not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE Soldado
(
	idSoldado int NOT NULL,
	nombre varchar(50) NOT NULL,
	apellidopaterno varchar(50) not null,
	apellidomaterno varchar(50) not null,
	graduacion varchar(50) not null,
	codigo int not null,
	idCompania int not null,
	idCuerpo int not null,
	idCuartel int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE CompaniaCuartel
(
	idCompaniaCuartel int NOT NULL,
	idCompania int NOT NULL,
	idCuartel int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE ServicioSoldado
(
	idServicioSoldado int NOT NULL,
	idServicio int NOT NULL,
	idSoldado int not null,
	fehcarealizar datetime not null,
	estatus bit default 1 not null
);
GO

--Llaves primarias
ALTER TABLE Compania ADD CONSTRAINT PK_Compania PRIMARY KEY (idCompania)
ALTER TABLE Cuartel ADD CONSTRAINT PK_Cuartel PRIMARY KEY (idCuartel)
ALTER TABLE Cuerpo ADD CONSTRAINT PK_Cuerpo PRIMARY KEY (idCuerpo)
ALTER TABLE Servicio ADD CONSTRAINT PK_Servicio PRIMARY KEY (idServicio)
ALTER TABLE Soldado ADD CONSTRAINT PK_Soldado PRIMARY KEY (idSoldado)
ALTER TABLE CompaniaCuartel ADD CONSTRAINT PK_CompaniaCuartel PRIMARY KEY (idCompaniaCuartel)
ALTER TABLE ServicioSoldado ADD CONSTRAINT PK_ServicioSoldado PRIMARY KEY (idServicioSoldado)



--Llaves Foraneas
--Soldado

ALTER TABLE Soldado ADD CONSTRAINT FK_SoldadoCompania FOREIGN KEY (idCompania) REFERENCES 
Compania(idCompania)
ALTER TABLE Soldado ADD CONSTRAINT FK_SoldadoCuartel FOREIGN KEY (idCuartel) REFERENCES 
Cuartel(idCuartel)
ALTER TABLE Soldado ADD CONSTRAINT FK_SoldadoCuerpo FOREIGN KEY (idCuerpo) REFERENCES 
Cuerpo(idCuerpo)

--CompaniaCuartel

ALTER TABLE CompaniaCuartel ADD CONSTRAINT FK_CompaniaCuartelCòmpania FOREIGN KEY (idCompania) REFERENCES 
Compania(idCompania)
ALTER TABLE CompaniaCuartel ADD CONSTRAINT FK_CompaniaCuartelCuartel FOREIGN KEY (idCuartel) REFERENCES 
Cuartel(idCuartel)

--ServicioSoldado

ALTER TABLE ServicioSoldado ADD CONSTRAINT FK_ServiciSoldadoServicio FOREIGN KEY (idServicio) REFERENCES 
Servicio(idServicio)
ALTER TABLE ServicioSoldado ADD CONSTRAINT FK_ServicioSoldadoSoldado FOREIGN KEY (idSoldado) REFERENCES 
Soldado(idSoldado)

--Indices

CREATE INDEX IX_Compania ON Compania(idCompania)
CREATE INDEX IX_Cuartel ON Cuartel(idCuartel)
CREATE INDEX IX_Cuerpo ON Cuerpo(idCuerpo)
CREATE INDEX IX_Servicio ON Servicio(idServicio)
CREATE INDEX IX_Soldado ON Soldado(idSoldado)
CREATE INDEX IX_CompaniaCuartel ON CompaniaCuartel(idCompaniaCuartel)
CREATE INDEX IX_ServicioSoldado ON ServicioSoldado(idServicioSoldado)

INSERT INTO Compania (actividad) values('Hola')
GO
SELECT *FROM Compania
GO
DELETE FROM Compania WHERE idCompania = 1
GO
SELECT *FROM Compania

