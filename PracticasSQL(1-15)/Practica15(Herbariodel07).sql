--SQL SERVER
USE master;
GO

IF DB_ID(N' Herbario') IS NOT NULL
	DROP DATABASE Herbario;
	GO

CREATE DATABASE Herbario

ON
(Name = Hebraio_dat,
	Filename = 'D:\BD\Herbario.mdf',
	SIZE = 10,
	MAXSIZE = 50,
	FILEGROWTH = 5)
LOG ON
( NAME = Sales_log,
	FILENAME = 'D:\BD\Herbario.ldf',
	SIZE = 5MB,
	MAXSIZE = 25MB,
	FILEGROWTH = 5MB) ;
GO
USE Herbario;
GO


CREATE TABLE Compra
(
	idCompra int NOT NULL,
	cantidad int NOT NULL,
	fecha datetime NOT NULL,
	estatus bit default 1 NOT NULL
);
GO

CREATE TABLE Consulta
(
	idConsulta int NOT NULL,
	fecha datetime NOT NULL,
	precio int NOT NULL,
	estatus bit default 1 NOT NULL
);
GO

CREATE TABLE Empleado
(
	idEmpleado int NOT NULL,
	puesto varchar(50) NOT NULL,
	sueldo int NOT NULL,
	nombre varchar(50) NOT NULL,
	apellidop varchar(50) NOT NULL,
	apellidom varchar(50) NOT NULL,
	calle varchar(50) NOT NULL,
	numero int NOT NULL,
	ciudad varchar(50) NOT NULL,
	estatus bit default 1 NOT NULL
);
GO

CREATE TABLE Factura
(
	idFactura int NOT NULL,
	fecha datetime NOT NULL,
	remitente varchar(50) NOT NULL,
	cantidad int NOT NULL,
	estatus bit default 1 NOT NULL
);
GO

CREATE TABLE Medicamento
(
	idMedicamento int NOT NULL,
	existencia int NOT NULL,
	salida int NOT NULL,
	estatus bit default 1 NOT NULL
);
GO

CREATE TABLE Representante
(
	idRepresentante int NOT NULL,
	nombre varchar(50) NOT NULL,
	apellidop varchar(50) NOT NULL,
	apellidom varchar(50) NOT NULL,
	calle varchar(50) NOT NULL,
	numero int NOT NULL,
	ciudad varchar(50) NOT NULL,
	telefono int NOT NULL,
	estatus bit default 1 NOT NULL
);
GO

CREATE TABLE Producto
(
	idProducto int NOT NULL,
	nombre varchar(50) NOT NULL,
	precio int NOT NULL,
	cantidad int NOT NULL,
	idFactura int NOT NULL,
	estatus bit default 1 NOT NULL
);
GO

CREATE TABLE Provedor
(
	idProvedor int NOT NULL,
	nombre varchar(50) NOT NULL,
	apellidop varchar(50) NOT NULL,
	apellidom varchar(50) NOT NULL,
	calle varchar(50) NOT NULL,
	numero int NOT NULL,
	ciudad varchar(50) NOT NULL,
	telefono int NOT NULL,
	idCompra int NOT NULL,
	idRepresentante int NOT NULL,
	estatus bit default 1 NOT NULL
);
GO

CREATE TABLE Paciente
(
	idPaciente int NOT NULL,
	nombre varchar(50) NOT NULL,
	apellidop varchar(50) NOT NULL,
	apellidom varchar(50) NOT NULL,
	calle varchar(50) NOT NULL,
	numero int NOT NULL,
	ciudad varchar(50) NOT NULL,
	telefono int NOT NULL,
	idCompra int NOT NULL,
	idRepresentante int NOT NULL,
	estatus bit default 1 NOT NULL
);
GO

CREATE TABLE Venta
(
	idVenta int NOT NULL,
	cantidad int NOT NULL,
	fecha datetime NOT NULL,
	idConsulta int NOT NULL,
	idMedicamento int NOT NULL,
	estatus bit default 1 NOT NULL
);
GO

CREATE TABLE ConsultaPaciente
(
	idConsultaPaciente int NOT NULL,
	idConsulta int NOT NULL,
	idPaciente int NOT NULL,
	estatus bit default 1 NOT NULL
);
GO 

CREATE TABLE VentaProducto
(
	idVentaProducto int NOT NULL,
	idVenta int NOT NULL,
	idProducto int NOT NULL,
	estatus bit default 1 NOT NULL
);
GO

CREATE TABLE CompraProducto
(
	idCompraProducto int NOT NULL,
	idCompra int NOT NULL,
	idProdcuto int NOT NULL,
	estatus bit default 1 NOT NULL
);
GO

--Llaves primarias
ALTER TABLE Compra ADD CONSTRAINT PK_Compra PRIMARY KEY (idCompra)
ALTER TABLE Consulta ADD CONSTRAINT PK_Consulta PRIMARY KEY (idConsulta)
ALTER TABLE Empleado ADD CONSTRAINT PK_Empleado PRIMARY KEY (idEmpleado)
ALTER TABLE Factura ADD CONSTRAINT PK_Factura PRIMARY KEY (idFactura)
ALTER TABLE Medicamento ADD CONSTRAINT PK_Medicamento PRIMARY KEY (idMedicamento)
ALTER TABLE Representante ADD CONSTRAINT PK_Representante PRIMARY KEY (idRepresentante)
ALTER TABLE Producto ADD CONSTRAINT PK_Producto PRIMARY KEY (idProducto)
ALTER TABLE Provedor ADD CONSTRAINT PK_Provedor PRIMARY KEY (idProvedor)
ALTER TABLE Paciente ADD CONSTRAINT PK_Paciente PRIMARY KEY (idPaciente)
ALTER TABLE Venta ADD CONSTRAINT PK_Venta PRIMARY KEY (idVenta)
ALTER TABLE ConsultaPaciente ADD CONSTRAINT PK_ConsultaPaciente PRIMARY KEY (idConsultaPaciente)
ALTER TABLE VentaProducto ADD CONSTRAINT PK_VentaProducto PRIMARY KEY (idVentaProducto)
ALTER TABLE CompraProducto ADD CONSTRAINT PK_CompraProducto PRIMARY KEY (idCompraProducto)

--Llaves Foraneas
--Producto

ALTER TABLE Producto ADD CONSTRAINT PK_ProductoFactura FOREIGN KEY (idFactura) REFERENCES
Factura(idFactura)

--Provedor

ALTER Table Provedor ADD CONSTRAINT PK_ProvedorCompra FOREIGN KEY (idCompra) REFERENCES
Compra(idCompra)
ALTER TABLE Provedor ADD CONSTRAINT PK_ProvedorRepresentante FOREIGN KEY (idRepresentante) REFERENCES
Representante(idRepresentante)

--Venta

ALTER TABLE Venta ADD CONSTRAINT PK_VentaConsulta FOREIGN KEY (idConsulta) REFERENCES
Consulta(idConsulta)
ALTER TABLE Venta ADD CONSTRAINT PK_VentaMedicamento FOREIGN KEY (idMedicamento) REFERENCES
Medicamento(idMedicamento)

--ConsultaPaciente

ALTER TABLE ConsultaPaciente ADD CONSTRAINT PK_ConsultaPacienteConsulta FOREIGN KEY (idConsulta) REFERENCES
Consulta(idConsulta)
ALTER TABLE ConsultaPaciente ADD CONSTRAINT PK_ConsultaPacientePaciente FOREIGN KEY (idPaciente) REFERENCES
Paciente(idPaciente)

--VentaProducto

ALTER TABLE VentaProducto ADD CONSTRAINT PK_VentaProductoVenta FOREIGN KEY (idVenta) REFERENCES
Venta(ideVenta)
ALTER TABLE VentaProducto ADD CONSTRAINT PK_VentaProductoProducto FOREIGN KEY (idProducto) REFERENCES
Producto(idProducto)

--CompraProducto

ALTER TABLE CompraProducto ADD CONSTRAINT PK_CompraProductoCompra FOREIGN KEY (idCompra) REFERENCES
Compra(idCompra)
ALTER TABLE CompraProducto ADD CONSTRAINT PK_CompraProductoProducto FOREIGN KEY (idProducto) REFERENCES
Producto(idProducto)

--INDEX

CREATE INDEX IX_Compra ON Compra(idCompra)
CREATE INDEX IX_Consulta ON Consulta(idConsulta)
CREATE INDEX IX_Empleado ON Empleado(idEmpleado)
CREATE INDEX IX_Factura ON Factura(idFactura)
CREATE INDEX IX_Medicamento ON Medicamento(idMedicamento)
CREATE INDEX IX_Representante ON Representante(idRepresentante)
CREATE INDEX IX_Producto ON Producto (idProducto)
CREATE INDEX IX_Provedor ON Provedor(idProvedor)
CREATE INDEX IX_Paciente ON Paciente (idPaciente)
CREATE INDEX IX_Venta ON Venta (idVenta)
CREATE INDEX IX_ConsultaPaciente ON ConsultaPaciente(idConsultaPaciente)
CREATE INDEX IX_VentaProducto ON VentaProducto(idVentaProducto)
CREATE INDEX IX_CompraPructo ON CompraProducto(idCompraProducto)
