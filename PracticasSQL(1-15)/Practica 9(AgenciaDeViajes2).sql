--SQL
USE master;
GO
IF DB_ID(N'AgenciaViajes2') IS NOT NULL
	DROP DATABASE AgenciaViajes2;
GO
CREATE DATABASE AgenciaViajes2
ON
(NAME = AgenciaViajes2_dat,
	FILENAME = 'D:\BD\AgenciaViajes2.mdf',
	SIZE = 10,
	MAXSIZE = 50,
	FILEGROWTH = 5)
LOG ON
(NAME = AgenciaViajes2_log,
	FILENAME = 'D:\BD\AgenciaViajes2.log',
	SIZE = 5MB,
	MAXSIZE = 25MB,
	FILEGROWTH = 5MB);
GO
USE AgenciaViajes2;
GO
--TABLAS--


CREATE TABLE TOUR
(
idTour int not null,
idTipotour int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE RUTA
(
idRuta int not null,
idTipoRuta int not null,
estatus bit default 1 not null,
);
GO




CREATE TABLE HOTEL
(
idHotel int identity (1,1),
nombre varchar (50) not null,
calle varchar (50) not null,
ciudad varchar (50) not null,
cp char(5) not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE CLIENTE
(
idCliente int not null,
nombre varchar (50) not null,
apellidopaterno varchar (50) not null,
appelidomaterno varchar (50) not null,
telefono int not null,
estatus bit default 1 not null
);
GO

CREATE TABLE TIPOTOUR
(
idTipoTour int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE TIPORUTA
(
idTipoRuta int not null,
Estancia bit default 1 not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE TOURCLIENTE
(
idTourCliente int not null,
idTour int not null,
idCliente int not null,
estatus bit default 1 not null,
);
GO



CREATE TABLE CLIENTEHOTEL
(
idClienteHotel int not null,
idCliente int not null,
idHotel int not null,
fecha datetime not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE TOURRUTA
(
idTourRuta int not null,
idTour int not null,
idRuta int not null,
estatus bit default 1 not null,
);
GO

----LLAVES PRIMARIAS----
ALTER TABLE Tour ADD CONSTRAINT PK_Tour PRIMARY KEY (idTour)
ALTER TABLE Ruta ADD CONSTRAINT PK_Ruta PRIMARY KEY (idRuta)
ALTER TABLE Hotel ADD CONSTRAINT PK_Hotel PRIMARY KEY (idHotel)
ALTER TABLE Cliente ADD CONSTRAINT PK_Cliente PRIMARY KEY (idCliente)
ALTER TABLE TipoTour ADD CONSTRAINT PK_TipoTour PRIMARY KEY (idTipoTour)
ALTER TABLE TipoRuta ADD CONSTRAINT PK_TipoRuta PRIMARY KEY (idTipoRuta)
ALTER TABLE TourCliente ADD CONSTRAINT PK_TourCliente PRIMARY KEY (idTourCliente)
ALTER TABLE ClienteHotel ADD CONSTRAINT PK_ClienteHotel PRIMARY KEY (idClienteHotel)
ALTER TABLE TourRuta ADD CONSTRAINT PK_TourRuta PRIMARY KEY (idTourRuta)

----LLAVES FORANEAS----

--Ruta
ALTER TABLE Ruta ADD CONSTRAINT FK_RutaTipoRuta FOREIGN KEY (idTipoRuta) REFERENCES TipoRuta (idTipoRuta)

--TourCliente
ALTER TABLE TourCliente ADD CONSTRAINT FK_TourClienteTour FOREIGN KEY (idTour) REFERENCES Tour(idTour)

ALTER TABLE TourCliente ADD CONSTRAINT FK_TourClienteCliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)

--ClienteHotel
ALTER TABLE ClienteHotel ADD CONSTRAINT FK_ClienteHotelCliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)

ALTER TABLE ClienteHotel ADD CONSTRAINT FK_ClienteHotelHotel FOREIGN KEY (idHotel) REFERENCES Hotel(idHotel)

--TourRuta
ALTER TABLE TourRuta ADD CONSTRAINT FK_TourRutaTour FOREIGN KEY (idTour) REFERENCES Tour(idTour)

ALTER TABLE TourRuta ADD CONSTRAINT FK_TourRutaRuta FOREIGN KEY (idRuta) REFERENCES Ruta(idRuta)

----INDEX----
CREATE INDEX IX_Tour ON Tour(idTour)

CREATE INDEX IX_Hotel ON Hotel(idHotel)

CREATE INDEX IX_Cliente ON Cliente(idCliente)

CREATE INDEX IX_Ruta ON Ruta(idRuta)

CREATE INDEX IX_TipoTour ON TipoTour(idTipoTour)

CREATE INDEX IX_TipoRuta ON TipoRuta(idTipoRuta)

CREATE INDEX IX_TourCliente ON TourCliente(idTourCliente)

CREATE INDEX IX_TourRuta ON TourRuta(idTourRuta)

CREATE INDEX IX_ClienteHotel ON ClienteHotel(idClienteHotel)

INSERT INTO Hotel (nombre, calle, ciudad, cp) values('Rivera', 'Presidente', 'Monclova', '25680')
GO
UPDATE HOTEL SET cp = '25690' WHERE idHotel = 1
GO
DELETE FROM HOTEL WHERE idHotel = 1
--SIN EL WHERE SE BORRA TODO
GO
SELECT *FROM HOTEL 