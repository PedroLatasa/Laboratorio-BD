CREATE TABLE Personas
(
  NIF Varchar2(30) NOT NULL,
  Fecha_Nac DATE NOT NULL,
  Sexo Varchar2(30) NOT NULL,
  Nombre Varchar2(30) NOT NULL,
  Apellido_1 Varchar2(30) NOT NULL,
  Apellido_2 Varchar2(30) NOT NULL,
  PRIMARY KEY (NIF),
  UNIQUE (Nombre, Apellido_1, Apellido_2)
);

CREATE TABLE Alumnos
(
  NIF Varchar2(30) NOT NULL,
  PRIMARY KEY (NIF),
  FOREIGN KEY (NIF) REFERENCES Personas(NIF)
);

CREATE TABLE Profesores
(
  Número_hijos Number NOT NULL,
  Salario Number NOT NULL,
  Acreditación Varchar2(30) NOT NULL,
  NIF Varchar2(30) NOT NULL,
  PRIMARY KEY (NIF),
  FOREIGN KEY (NIF) REFERENCES Personas(NIF)
);

CREATE TABLE Nacionalidad
(
  Código_nacionalidad Number NOT NULL,
  Bandera Varchar2(30) NOT NULL,
  NIF Varchar2(30) NOT NULL,
  PRIMARY KEY (Código_nacionalidad),
  FOREIGN KEY (NIF) REFERENCES Personas(NIF)
);

CREATE TABLE Curso
(
  Cód_Curso Varchar2(30) NOT NULL,
  Denominación Varchar2(30) NOT NULL,
  Descripción Varchar2(30) NOT NULL,
  Número_horas Number NOT NULL,
  Coste Number NOT NULL,
  Prerequisito Varchar2(30) NOT NULL,
  PRIMARY KEY (Cód_Curso),
  FOREIGN KEY (Prerequisito) REFERENCES Curso(Cód_Curso)
);

CREATE TABLE Ediciones
(
  Lugares Varchar2(30) NOT NULL,
  Formatos Varchar2(30) NOT NULL,
  Horarios DATE NOT NULL,
  Número_horas Number NOT NULL,
  Código_edición Number NOT NULL,
  Cód_Curso Varchar2(30) NOT NULL,
  PRIMARY KEY (Código_edición),
  FOREIGN KEY (Cód_Curso) REFERENCES Curso(Cód_Curso)
);

CREATE TABLE Fecha
(
  Día Number NOT NULL,
  Mes Number NOT NULL,
  Año Number NOT NULL,
  Hora_exacta Number NOT NULL,
  Código_edición Number NOT NULL,
  PRIMARY KEY (Hora_exacta),
  FOREIGN KEY (Código_edición) REFERENCES Ediciones(Código_edición),
  UNIQUE (Día, Mes, Año)
);

CREATE TABLE Impartidos
(
  Cód_Curso Varchar2(30) NOT NULL,
  NIF Varchar2(30) NOT NULL,
  PRIMARY KEY (Cód_Curso, NIF),
  FOREIGN KEY (Cód_Curso) REFERENCES Curso(Cód_Curso),
  FOREIGN KEY (NIF) REFERENCES Profesores(NIF)
);