--SQL
USE master;
GO
IF DB_ID(N'GestionTrabajoFinCarrera') IS NOT NULL
	DROP DATABASE GestionTrabajoFinCarrera;
GO
CREATE DATABASE GestionTrabajoFinCarrera
ON
(NAME = GestionTrabajoFinCarrera_dat,
	FILENAME = 'D:\BD\TFC.mdf',
	SIZE = 10,
	MAXSIZE = 50,
	FILEGROWTH = 5)
LOG ON
(NAME = GestionTrabajoFinCarrera_log,
	FILENAME = 'D:\BD\TFC.log',
	SIZE = 5MB,
	MAXSIZE = 25MB,
	FILEGROWTH = 5MB);
GO
USE GestionTrabajoFinCarrera;
GO
--TABLAS--
CREATE TABLE ALUMNO
(
idAlumno int not null,
nombre varchar (50) not null,
aPaterno varchar (50) not null,
aMaterno varchar (50) not null,
rfc varchar (50) not null,
idTFC int not null,
estatus bit default 1 not null,
);
GO
CREATE TABLE GRUPO
(
idGrupo int not null,
nombre varchar (50) not null,
numComponentes int not null,
numGrupo int not null,
estatus bit default 1 not null
);
GO
CREATE TABLE Profesor
(
idProfesor int not null,
nombre varchar (50) not null,
aPaterno varchar (50) not null,
aMaterno varchar (50) not null,
calle varchar (50) not null,
numero int not null,
colonia varchar (50) not null,
codigoPostal int not null,
rfc varchar (50) not null,
estatus bit default 1 not null,
);
GO
CREATE TABLE TFC
(
idTfc int not null,
fecha datetime not null,
numOrden int not null,
tema varchar (50) not null,
idTribunal int not null,
estatus bit default 1 not null,
);
GO
CREATE TABLE TRIBUNAL
(
idTribunal int not null,
numComponentes int not null,
numTribunal int not null,
lugarExamen varchar (50) not null,
estatus bit default 1 not null,
);
GO
CREATE TABLE ALUMNOPROFESOR
(
idAlumnoProfesor int not null,
idAlumno int not null,
idProfesor int not null,
estatus bit default 1 not null,
);
GO
CREATE TABLE PROFESORTRIBUNAL
(
idProfesorTribunal int not null,
idTribunal int not null,
idProfesor int not null,
fecha datetime not null,
estatus bit default 1 not null,
);
GO

----LLAVES PRIMARIAS----
ALTER TABLE Alumno ADD CONSTRAINT PK_Alumno PRIMARY KEY (idAlumno)
ALTER TABLE Grupo ADD CONSTRAINT PK_Grupo PRIMARY KEY (idGrupo)
ALTER TABLE Profesor ADD CONSTRAINT PK_Profesor PRIMARY KEY (idProfesor)
ALTER TABLE Tfc ADD CONSTRAINT PK_tfc PRIMARY KEY (idtfc)
ALTER TABLE Tribunal ADD CONSTRAINT PK_Tribunal PRIMARY KEY (idTribunal)
ALTER TABLE AlumnoProfesor ADD CONSTRAINT PK_AlumnoProfesor PRIMARY KEY (idAlumnoProfesor)
ALTER TABLE ProfesorTribunal ADD CONSTRAINT PK_ProfesorTribunal PRIMARY KEY (idProfesorTribunal)
----LLAVES FORANEAS----
--AlumnoProfesor
ALTER TABLE AlumnoProfesor ADD CONSTRAINT FK_AlumnoProfesorAlumno FOREIGN KEY (idAlumno) REFERENCES Alumno (idAlumno)
ALTER TABLE AlumnoProfesor ADD CONSTRAINT FK_AlumnoProfesorProfesor FOREIGN KEY (idProfesor) REFERENCES Profesor (idProfesor)
--ProfesorTribunal
ALTER TABLE ProfesorTribunal ADD CONSTRAINT FK_ProfesorTribunalTribunal FOREIGN KEY (idTribunal) REFERENCES Tribunal(idTribunal)
ALTER TABLE ProfesorTribunal ADD CONSTRAINT FK_ProfesorTribunalProfesor FOREIGN KEY (idProfesor) REFERENCES Profesor(idProfesor)

----INDEX----
CREATE INDEX IX_Alumno ON Alumno(idAlumno)

CREATE INDEX IX_Grupo ON Grupo(idGrupo)

CREATE INDEX IX_Profesor ON Profesor(idProfesor)

CREATE INDEX IX_Tfc ON Tfc(idTfc)

CREATE INDEX IX_Tribunal ON Tribunal(idTribunal)

CREATE INDEX IX_AlumnoProfesor ON AlumnoProfesor(idAlumnoProfesor)

CREATE INDEX IX_ProfesorTribunal ON ProfesorTribunal(idProfesorTribunal)