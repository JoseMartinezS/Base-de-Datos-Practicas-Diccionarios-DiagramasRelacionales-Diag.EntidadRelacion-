--SQL
USE master;
GO
IF DB_ID (N'AgenciaViajes') IS NOT NULL
DROP DATABASE AgenciaViajes;
GO
CREATE DATABASE AgenciaViajes
ON 
(NAME = AgenciaViajes_dat,
FILENAME = 'D:\BD\AgenciaViajes.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME = AgenciaViajes_log,
FILENAME = 'D:\BD\AgenciaViajes.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE AgenciaViajes;
GO

--Tablas--

CREATE TABLE HOTEL
(
idHotel int not null,
nombre varchar(50) not null,
calle varchar (50) not null,
numero int not null,
ciudad varchar (50) not null,
telefono int not null,
codigohotel varchar(50) not null,
plazadisponible int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE SUCURSAL
(
idSucursal int not null,
telefono int not null,
codigosucursal int not null,
calle varchar (50) not null,
numero int not null,
ciudad varchar (50) not null,
estatus bit default 1 not null,
);
GO


CREATE TABLE TURISTA
(
idTurista int not null,
codgiturista int not null,
nombre varchar (50) not null,
apeliidopaterno varchar (50) not null,
apellidomaterno varchar (50) not null,
telefono int not null,
calle varchar (50) not null,
numero int not null,
ciudad varchar (50) not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE VUELO
(
idVuelo int not null,
numerovuelo int not null,
plazastotales int not null,
plazasdisponibles int not null,
calle varchar (50) not null,
origen varchar(50) not null,
fechahora datetime not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE VIAJE
(
idViaje int not null,
idTurista int not null,
idSucursal int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE VIAJEHOTEL
(
idViajeHotel int not null,
idViaje int not null,
idHotel int not null,
fechallegada datetime not null,
fechasalida datetime not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE VIAJEVUELO
(
idViajeVuelo int not null,
idViaje int not null,
idVuelo int not null,
clase varchar(50) not null,
estatus bit default 1 not null,
);
GO

--Llaves primarias
ALTER TABLE Hotel ADD CONSTRAINT PK_Hotel PRIMARY KEY (idHotel)
ALTER TABLE Sucursal ADD CONSTRAINT PK_Sucursal PRIMARY KEY (idSucursal)
ALTER TABLE Turista ADD CONSTRAINT PK_Turista PRIMARY KEY (idTurista)
ALTER TABLE Vuelo ADD CONSTRAINT PK_Vuelo PRIMARY KEY (idVuelo)
ALTER TABLE Viaje ADD CONSTRAINT PK_Viaje PRIMARY KEY (idViaje)
ALTER TABLE ViajeHotel ADD CONSTRAINT PK_ViajeHotel PRIMARY KEY (idViajeHotel)
ALTER TABLE ViajeVuelo ADD CONSTRAINT PK_ViajeVuelo PRIMARY KEY (idViajeVuelo)

--Llaves Foraneas
--Viaje

ALTER TABLE Viaje ADD CONSTRAINT FK_ViajeTurista FOREIGN KEY (idTurista) REFERENCES 
Turista(idTurista)
ALTER TABLE Viaje ADD CONSTRAINT FK_ViajeSucursal FOREIGN KEY (idSucursal) REFERENCES 
Sucursal(idSucursal)

--ViajeHotel

ALTER TABLE ViajeHotel ADD CONSTRAINT FK_ViajeHotelViaje FOREIGN KEY (idViaje) REFERENCES 
Viaje(idViaje)
ALTER TABLE ViajeHotel ADD CONSTRAINT FK_ViajeHotelHotel FOREIGN KEY (idHotel) REFERENCES 
Hotel(idHotel)

--ViajeVuelo

ALTER TABLE ViajeVuelo ADD CONSTRAINT FK_ViajeVueloViaje FOREIGN KEY (idViaje) REFERENCES 
Viaje(idViaje)
ALTER TABLE ViajeVuelo ADD CONSTRAINT FK_ViajeVueloVuelo FOREIGN KEY (idVuelo) REFERENCES 
Vuelo(idVuelo)

--INDICES--

CREATE INDEX IX_Hotel ON Hotel(idHotel)
CREATE INDEX IX_Sucursal ON Sucursal(idSucursal)
CREATE INDEX IX_Turista ON Turista(idTurista)
CREATE INDEX IX_Vuelo ON Vuelo(idVuelo)
CREATE INDEX IX_Viaje ON Viaje(idViaje)
CREATE INDEX IX_ViajeHotel ON ViajeHotel(idViajeHotel)
CREATE INDEX IX_ViajeVuelo ON ViajeVuelo(idViajeVuelo)

