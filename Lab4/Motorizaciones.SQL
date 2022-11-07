CREATE TABLE Modelo
(
  Nombre_modelo Varchar2(10) NOT NULL,
  PRIMARY KEY (Nombre_modelo)
);

CREATE TABLE Motorizaciones
(
  Nombre_motorización Varchar2(30) NOT NULL,
  Nombre_modelo Varchar2(10) NOT NULL,
  PRIMARY KEY (Nombre_motorización),
  FOREIGN KEY (Nombre_modelo) REFERENCES Modelo(Nombre_modelo)
);

CREATE TABLE Gasolina
(
  Nombre_motorización Varchar2(30) NOT NULL,
  PRIMARY KEY (Nombre_motorización),
  FOREIGN KEY (Nombre_motorización) REFERENCES Motorizaciones(Nombre_motorización)
);

CREATE TABLE Eléctrico
(
  Nombre_motorización Varchar2(30) NOT NULL,
  PRIMARY KEY (Nombre_motorización),
  FOREIGN KEY (Nombre_motorización) REFERENCES Motorizaciones(Nombre_motorización)
);

CREATE TABLE Gas
(
  Nombre_motorización Varchar2(30) NOT NULL,
  PRIMARY KEY (Nombre_motorización),
  FOREIGN KEY (Nombre_motorización) REFERENCES Motorizaciones(Nombre_motorización)
);

CREATE TABLE Diésel
(
  Nombre_motorización Varchar2(30) NOT NULL,
  PRIMARY KEY (Nombre_motorización),
  FOREIGN KEY (Nombre_motorización) REFERENCES Motorizaciones(Nombre_motorización)
);

CREATE TABLE Hidrógeno
(
  Nombre_motorización Varchar2(30) NOT NULL,
  PRIMARY KEY (Nombre_motorización),
  FOREIGN KEY (Nombre_motorización) REFERENCES Motorizaciones(Nombre_motorización)
);

CREATE TABLE Otros
(
  Nombre_motorización Varchar2(30) NOT NULL,
  PRIMARY KEY (Nombre_motorización),
  FOREIGN KEY (Nombre_motorización) REFERENCES Motorizaciones(Nombre_motorización)
);