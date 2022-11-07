CREATE TABLE Terreno
(
  Nombre_único Varchar2(30) NOT NULL,
  PRIMARY KEY (Nombre_único)
);

CREATE TABLE Aéreos
(
  Nombre_único Varchar2(30) NOT NULL,
  PRIMARY KEY (Nombre_único),
  FOREIGN KEY (Nombre_único) REFERENCES Terreno(Nombre_único)
);

CREATE TABLE Terrestres
(
  Nombre_único Varchar2(30) NOT NULL,
  PRIMARY KEY (Nombre_único),
  FOREIGN KEY (Nombre_único) REFERENCES Terreno(Nombre_único)
);

CREATE TABLE Acuáticos
(
  Nombre_único Varchar2(30) NOT NULL,
  PRIMARY KEY (Nombre_único),
  FOREIGN KEY (Nombre_único) REFERENCES Terreno(Nombre_único)
);

CREATE TABLE Anfibios
(
  Nombre_único Varchar2(30) NOT NULL,
  PRIMARY KEY (Nombre_único),
  FOREIGN KEY (Nombre_único) REFERENCES Terreno(Nombre_único)
);

CREATE TABLE Aéreo_terrestres
(
  Nombre_único Varchar2(30) NOT NULL,
  PRIMARY KEY (Nombre_único),
  FOREIGN KEY (Nombre_único) REFERENCES Terreno(Nombre_único)
);

CREATE TABLE Vehículos
(
  Código_vehículo Number NOT NULL,
  Motor Varchar2(10) NOT NULL,
  Potencia Number NOT NULL,
  Par Number NOT NULL,
  Cilindrada Number NOT NULL,
  PRIMARY KEY (Código_vehículo)
);

CREATE TABLE Desplazarse
(
  Código_vehículo Number NOT NULL,
  Nombre_único Varchar2(30) NOT NULL,
  PRIMARY KEY (Código_vehículo, Nombre_único),
  FOREIGN KEY (Código_vehículo) REFERENCES Vehículos(Código_vehículo),
  FOREIGN KEY (Nombre_único) REFERENCES Terreno(Nombre_único)
);