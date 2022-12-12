--SQL
USE master;
GO
IF DB_ID (N'GestionExamenes') IS NOT NULL
DROP DATABASE GestionExamenes;
GO
CREATE DATABASE GestionExamenes
ON 
(NAME = GestionExamenes_dat,
FILENAME = 'D:\BD\GestionExamenes.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME = GestionExamenes_log,
FILENAME = 'D:\BD\GestionExamenes.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE GestionExamenes;
GO
-------TABLAS------
CREATE TABLE Alumno
(
idAlumno int IDENTITY (1,1),
nombre varchar (50) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
seccionGrupo char (5) not null,
estatus bit default 1 not null,
);
GO
CREATE TABLE Examen
(
idExamen int IDENTITY (1,1),
numero char (10) not null,
numPreguntas char (10) not null,
Fecha varchar (15) not null,
estatus bit default 1 not null,
);
GO
CREATE TABLE Profesor
(
idProfesor int IDENTITY (1,1),
nombre varchar (50) not null,
apellidoPaterno varchar (50) not null,
apellidoMaterno varchar (50) not null,
CURP char (30) not null,
matricula char (15) not null,
codigoPostal char (6) not null,
numCasa char (10) not null,
calle varchar (20) not null,
estatus bit default 1 not null,
);
GO
CREATE TABLE Practica
(
idPractica int IDENTITY (1,1),
codigo char (15) not null,
gradodificultad varchar (15) not null,
nombre varchar (50) not null,
calificacion char (4) not null,
estatus bit default 1 not null,
);
GO
CREATE TABLE AlumnoExamen
(
idAlumnoExamen int IDENTITY (1,1),
idAlumno int null,
idExamen int null,
notaAlumno char (4) not null,
estatus bit default 1 not null,
);
GO
CREATE TABLE AlumnoPractica
(
idAlumnoPractica int IDENTITY (1,1),
idAlumno int null,
idPractica int null,
notaAlumno char (4) not null,
Fecha datetime not null,
estatus bit default 1 not null,
);
GO
CREATE TABLE ProfesorPractica
(
idProfesorPractica int IDENTITY (1,1),
idProfesor int null,
idPractica int null,
Fecha datetime not null,
estatus bit default 1 not null,
);
GO
--------------------------------LLAVES PRIMARIAS-------------------
ALTER TABLE Alumno ADD CONSTRAINT PK_Alumno PRIMARY KEY (idAlumno)
ALTER TABLE Examen ADD CONSTRAINT PK_Examen PRIMARY KEY (idExamen)
ALTER TABLE Profesor ADD CONSTRAINT PK_Profesor PRIMARY KEY (idProfesor)
ALTER TABLE Practica ADD CONSTRAINT PK_Practica PRIMARY KEY (idPractica)

-------------------------------LLAVES FORANEAS----------------------
ALTER TABLE AlumnoExamen 
ADD CONSTRAINT FK_AlumnoExamenAlumno 
FOREIGN KEY (idAlumno) REFERENCES Alumno(idAlumno)

ALTER TABLE AlumnoExamen 
ADD CONSTRAINT FK_AlumnoExamenExamen 
FOREIGN KEY (idExamen) REFERENCES Examen(idExamen)

ALTER TABLE AlumnoPractica
ADD CONSTRAINT FK_AlumnoPracticaAlumno 
FOREIGN KEY (idAlumno) REFERENCES Alumno(idAlumno)

ALTER TABLE AlumnoPractica
ADD CONSTRAINT FK_AlumnoPracticaPractica
FOREIGN KEY (idPractica) REFERENCES Practica(idPractica)

ALTER TABLE ProfesorPractica
ADD CONSTRAINT FK_ProfesorPracticaProfesor 
FOREIGN KEY (idProfesor) REFERENCES Profesor(idProfesor)

ALTER TABLE ProfesorPractica
ADD CONSTRAINT FK_ProfesorPracticaPractica
FOREIGN KEY (idPractica) REFERENCES Practica(idPractica)
--------------------------------INDEX------------------------------
CREATE INDEX IX_Alumno ON Alumno(idAlumno)
CREATE INDEX IX_Examen ON Examen(idExamen)
CREATE INDEX IX_Profesor ON Profesor(idProfesor)
CREATE INDEX IX_Practica ON Practica(idPractica)
CREATE INDEX IX_AlumnoExamen ON AlumnoExamen(idAlumnoExamen)
CREATE INDEX IX_AlumnoPractica ON AlumnoPractica(idAlumnoPractica)
CREATE INDEX IX_ProfesorPractica ON ProfesorPractica(idProfesorPractica)
