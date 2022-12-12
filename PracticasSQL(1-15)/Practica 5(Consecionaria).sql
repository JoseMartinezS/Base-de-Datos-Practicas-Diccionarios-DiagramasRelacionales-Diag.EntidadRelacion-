--SQL
USE master;
GO
IF DB_ID (N'Consecionaria') IS NOT NULL
DROP DATABASE Consecionaria;
GO
CREATE DATABASE Consecionaria
ON 
(NAME = Consecionaria_dat,
FILENAME = 'D:\BD\Consecionaria.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME = Consecionaria_log,
FILENAME = 'D:\BD\Consecionaria.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE Consecionaria;
GO

--Tablas--

CREATE TABLE CLIENTE
(
idCliente int not null,
nombre varchar(50) not null,
apellidopaterno varchar (50) not null,
apellidomaterno varchar (50) not null,
rfc varchar (50) not null,
calle varchar (50) not null,
numero int not null,
ciudad varchar (50) not null,
telefono int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE OPCION
(
idOpcion int not null,
nombre varchar(50) not null,
descripcion varchar(50) not null,
estatus bit default 1 not null,
);
GO


CREATE TABLE USADO
(
idUsado int not null,
marca varchar(50) not null,
matricula varchar (50) not null,
modelo varchar (50) not null,
precio int not null,
idCliente int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE VEHICULO
(
idVehiculo int not null,
marca varchar(50) not null,
modelo varchar(50) not null,
cilindros varchar(50) not null,
prcio int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE VENDEDOR
(
idVendedor int not null,
nombre varchar(50) not null,
apellidopaterno varchar(50) not null,
apellidomaterno varchar(50) not null,
rfc varchar(50) not null,
calle varchar(50) not null,
numero int not null,
ciudad varchar(50) not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE VENTA
(
idVenta int not null,
fecha datetime not null,
matricula varchar(50) not null,
idCliente int not null,
idVendedor int not null,
idVehiculo int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE VEHICULOOPCION
(
idVehiculoOpcion int not null,
idVehiculo int not null,
idOpcion int not null,
precio int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE VENTAOPCION
(
idVentaOpcion int not null,
idVenta int not null,
idOpcion int not null,
precio int not null,
estatus bit default 1 not null,
);
GO

--Llaves primarias
ALTER TABLE Cliente ADD CONSTRAINT PK_Cliente PRIMARY KEY (idCliente)
ALTER TABLE Opcion ADD CONSTRAINT PK_Opcion PRIMARY KEY (idOpcion)
ALTER TABLE Usado ADD CONSTRAINT PK_Usado PRIMARY KEY (idUsado)
ALTER TABLE Vehiculo ADD CONSTRAINT PK_Vehiculo PRIMARY KEY (idVehiculo)
ALTER TABLE Vendedor ADD CONSTRAINT PK_Vendedor PRIMARY KEY (idVendedor)
ALTER TABLE Venta ADD CONSTRAINT PK_Venta PRIMARY KEY (idVenta)
ALTER TABLE VehiculoOpcion ADD CONSTRAINT PK_VehiculoOpcion PRIMARY KEY (idVehiculoOpcion)
ALTER TABLE VentaOpcion ADD CONSTRAINT PK_VentaOpcion PRIMARY KEY (idVentaOpcion)

--Llaves Foraneas
--Usado

ALTER TABLE Usado ADD CONSTRAINT FK_UsadoCliente FOREIGN KEY (idCliente) REFERENCES 
Cliente(idCliente)

--VehiculoOpcion

ALTER TABLE VehiculoOpcion ADD CONSTRAINT FK_VehiculoOpcionVehiculo FOREIGN KEY (idVehiculo) REFERENCES 
Vehiculo(idVehiculo)
ALTER TABLE VehiculoOpcion ADD CONSTRAINT FK_VehiculoOpcionOpcion FOREIGN KEY (idOpcion) REFERENCES 
Opcion(idOpcion)

--VentaOpcion

ALTER TABLE VentaOpcion ADD CONSTRAINT FK_VentaOpcionVenta FOREIGN KEY (idVenta) REFERENCES 
Venta(idVenta)
ALTER TABLE VentaOpcion ADD CONSTRAINT FK_VentaOpcionOpcion FOREIGN KEY (idOpcion) REFERENCES 
Opcion(idOpcion)

--INDICES--

CREATE INDEX IX_Cliente ON Cliente(idCliente)
CREATE INDEX IX_Opcion ON Opcion(idOpcion)
CREATE INDEX IX_Usado ON Usado(idUsado)
CREATE INDEX IX_Vehiculo ON Vehiculo(idVehiculo)
CREATE INDEX IX_Vendedor ON Vendedor(idVendedor)
CREATE INDEX IX_Venta ON Venta(idVenta)
CREATE INDEX IX_VehiculoOpcion ON VehiculoOpcion(idVehiculoOpcion)
CREATE INDEX IX_VentaOpcion ON VentaOpcion(idVentaOpcion)

