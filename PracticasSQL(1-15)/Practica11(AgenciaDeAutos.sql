USE master;
GO
IF DB_ID (N'AgenciaDeAutos') IS NOT NULL
	Drop DATABASE AgenciaDeAutos;
	GO
CREATE DATABASE AgenciaDeAutos

ON   
( NAME = AgenciaDeAutos_dat,  
    FILENAME = 'D:\BD\AgenciaDeAutos.mdf',  
    SIZE = 10,  
    MAXSIZE = 50,  
    FILEGROWTH = 5 )  
LOG ON  
( NAME = Sales_log,  
    FILENAME = 'D:\BD\AgenciaDeAutos.ldf',  
    SIZE = 5MB,  
    MAXSIZE = 25MB,  
    FILEGROWTH = 5MB );  
GO
USE AgenciaDeAutos;
GO

--TABLAS
CREATE TABLE AGENCIA
(
idAgencia int not null,
nombre varchar(50) not null,
calle int not null,
ciudad varchar(50) not null,
telefono int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE AUTOMOVIL 
(
idAutomovil int not null,
marca varchar(50) not null,
modelo varchar (50) not null,
cilindros varchar(50) not null,
precio int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE CLIENTE
(
idCliente int not null,
nombre varchar(50) not null,
apellidoPaterno varchar(50) not null,
apellidoMaterno varchar(50) not null,
calle int not null,
ciudad varchar(50) not null,
telefono int not null,
estatus bit default 1 not null,
);
GO 

CREATE TABLE GARAGE 
(
idGarage int not null,
numeroGarage int not null,
calle int not null,
ciudad varchar(50) not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE RESERVA 
(
idReserva int not null,
fechaInicial datetime not null,
fechaFinal datetime not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE RESERVAAUTOMOVIL 
(
idReservaAutomovil int not null,
idReserva int not null,
idAutomovil int not null,
estatus bit default 1 not null,
);
GO


--LLAVES PRIMARIAS
ALTER TABLE Agencia ADD CONSTRAINT PK_Agencia PRIMARY KEY (idAgencia)
ALTER TABLE Automovil ADD CONSTRAINT PK_Automovil PRIMARY KEY (idAutomovil)
ALTER TABLE Cliente ADD CONSTRAINT PK_Cliente PRIMARY KEY (idCliente)
ALTER TABLE Garage ADD CONSTRAINT PK_Garage PRIMARY KEY (idGarage)
ALTER TABLE Reserva ADD CONSTRAINT PK_Reserva PRIMARY KEY (idReserva)
ALTER TABLE ReservaAutomovil ADD CONSTRAINT PK_ReservaAutomovil PRIMARY KEY (idReservaAutomovil)


--LLAVES FORANEAS
ALTER TABLE ReservaAutomovil ADD CONSTRAINT FK_ReservaAutomovilReserva FOREIGN KEY (idReserva) REFERENCES 
Reserva(idReserva)
ALTER TABLE ReservaAutomovil ADD CONSTRAINT FK_AutomovilReservaAutomovil FOREIGN KEY (idAutomovil) REFERENCES 
Automovil(idAutomovil)


--INDEX 
CREATE INDEX IX_Agencia ON Agencia(idAgencia)
CREATE INDEX IX_Automovil ON Automovil(idAutomovil)
CREATE INDEX IX_Cliente ON Cliente(idCliente)
CREATE INDEX IX_Garage ON Garage(idGarage)
CREATE INDEX IX_Reserva ON Reserva(idReserva)
CREATE INDEX IX_ReservaAutomovil ON ReservaAutomovil(idReservaAutomovil)

