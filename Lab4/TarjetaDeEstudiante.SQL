CREATE TABLE Tarjeta_de_estudiante
(
  Curso Varchar2(30) NOT NULL,
  NumEstudiante Number NOT NULL,
  PRIMARY KEY (NumEstudiante)
);

CREATE TABLE Cuenta_bancaria
(
  Saldo Number NOT NULL,
  NumCuenta Varchar2(30) NOT NULL,
  Nombre Varchar2(30) NOT NULL,
  Apellido_1 Varchar2(30) NOT NULL,
  Apellido_2 Varchar2(30) NOT NULL,
  PRIMARY KEY (NumCuenta)
);

CREATE TABLE Alumno
(
  Nombre Varchar2(30) NOT NULL,
  Apellido_1 Varchar2(30) NOT NULL,
  Apellido2 Varchar2(30) NOT NULL,
  DNI Varchar2(30) NOT NULL,
  Sexo Varchar2(30) NOT NULL,
  Fecha_Nac DATE NOT NULL,
  NumEstudiante Number NOT NULL,
  PRIMARY KEY (DNI),
  FOREIGN KEY (NumEstudiante) REFERENCES Tarjeta_de_estudiante(NumEstudiante)
);

CREATE TABLE Matrícula_
(
  Código_único Varchar2(30) NOT NULL,
  Nombre Varchar2(30) NOT NULL,
  DNI Varchar2(30) NOT NULL,
  NumCuenta Varchar2(30) NOT NULL,
  PRIMARY KEY (Código_único),
  FOREIGN KEY (DNI) REFERENCES Alumno(DNI),
  FOREIGN KEY (NumCuenta) REFERENCES Cuenta_bancaria(NumCuenta)
);

CREATE TABLE Teléfono
(
  DNI Varchar2(30) NOT NULL,
  FOREIGN KEY (DNI) REFERENCES Alumno(DNI)
);