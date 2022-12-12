--SQL
USE master;
GO
IF DB_ID (N'ControlHospitalizacion') IS NOT NULL
DROP DATABASE ControlHospitalizacion;
GO
CREATE DATABASE ControlHospitalizacion
ON 
(NAME = ControlHospitalizacion_dat,
FILENAME = 'D:\BD\ControlHospitalizacion.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME = ControlHospitalizacion_log,
FILENAME = 'D:\BD\ControlHospitalizacion.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE ControlHospitalizacion;
GO

--Tablas--

CREATE TABLE CAMA
(
idCama int not null,
nombre varchar(50) not null,
idPaciente int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE DIAGNOSTICO
(
idDiagnostico int not null,
codigodiagnostico int not null,
descripcion varchar(50) not null,
idPaciente int not null,
estatus bit default 1 not null,
);
GO


CREATE TABLE MEDICO
(
idMedico int not null,
nombre varchar(50) not null,
apellidopaterno varchar(50) not null,
apellidomaterno varchar(50) not null,
numerofichamedico int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE PACIENTE
(
idPaciente int not null,
nombre varchar(50) not null,
apellidopaterno varchar(50) not null,
apellidmaterno varchar(50) not null,
rfc varchar(50) not null,
numerosegurosocial varchar(50) not null,
fechanacimiento datetime not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE PLANTA
(
idPlanta int not null,
numeroplanta int not null,
nombre varchar(50) not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE PASE
(
idPase int not null,
numeropase int not null,
horainicio datetime not null,
horafinal datetime not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE VISITA
(
idVisita int not null,
fehca datetime not null,
idPciente int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE PACIENTECAMA
(
idPacienteCama int not null,
idPaciente int not null,
idCama int not null,
fechaasignada datetime not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE VISITAMEDICO
(
idVisitaMedico int not null,
idVisita int not null,
idMedico int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE MEDICODIAGNOSTICO
(
idMedicoDiagnostico int not null,
idMedico int not null,
idDiagnostico int not null,
estatus bit default 1 not null,
);
GO
--Llaves primarias
ALTER TABLE Cama ADD CONSTRAINT PK_Cama PRIMARY KEY (idCama)
ALTER TABLE Diagnostico ADD CONSTRAINT PK_Diagnostico PRIMARY KEY (idDiagnostico)
ALTER TABLE Medico ADD CONSTRAINT PK_Medico PRIMARY KEY (idMedico)
ALTER TABLE Paciente ADD CONSTRAINT PK_Paciente PRIMARY KEY (idPaciente)
ALTER TABLE Planta ADD CONSTRAINT PK_Planta PRIMARY KEY (idPlanta)
ALTER TABLE Pase ADD CONSTRAINT PK_Pase PRIMARY KEY (idPase)
ALTER TABLE Visita ADD CONSTRAINT PK_Visita PRIMARY KEY (idVisita)
ALTER TABLE PacienteCama ADD CONSTRAINT PK_PacienteCama PRIMARY KEY (idPacienteCama)
ALTER TABLE VisitaMedico ADD CONSTRAINT PK_VisitaMedico PRIMARY KEY (idVisitaMedico)
ALTER TABLE MedicoDiagnostico ADD CONSTRAINT PK_MedicoDiangnostico PRIMARY KEY (idMedicoDiagnostico)

--Llaves Foraneas
--Diagnostico

ALTER TABLE Diagnostico ADD CONSTRAINT FK_DiagnosticoPaciente FOREIGN KEY (idPaciente) REFERENCES 
Paciente(idPaciente)


--Paciente Cama

ALTER TABLE PacienteCama ADD CONSTRAINT FK_PacienteCamaPaciente FOREIGN KEY (idPaciente) REFERENCES 
Paciente(idPaciente)
ALTER TABLE PacienteCama ADD CONSTRAINT FK_PacienteCamaCama FOREIGN KEY (idCama) REFERENCES 
Cama(idCama)

--VentaOpcion

ALTER TABLE VisitaMedico ADD CONSTRAINT FK_VisitaMedicoVisita FOREIGN KEY (idVisita) REFERENCES 
Visita(idVisita)
ALTER TABLE VisitaMedico ADD CONSTRAINT FK_VisitaMedicoMedico FOREIGN KEY (idMedico) REFERENCES 
Medico(idMedico)

--INDICES--

CREATE INDEX IX_Cama ON Cama(idCama)
CREATE INDEX IX_Diagnostico ON Diagnostico(idDiagnostico)
CREATE INDEX IX_Medico ON Medico(idMedico)
CREATE INDEX IX_Paciente ON Paciente(idPaciente)
CREATE INDEX IX_Planta ON Planta(idPlanta)
CREATE INDEX IX_Pase ON Pase (idPase)
CREATE INDEX IX_Visita ON Visita(idVisita)
CREATE INDEX IX_PacienteCama ON PacienteCama(idPacienteCama)
CREATE INDEX IX_VisitaMedico ON VisitaMedico(idVisitaMedico)
CREATE INDEX IX_MedicoDiagnostico ON MedicoDiagnostico(idMedicoDiagnostico)
