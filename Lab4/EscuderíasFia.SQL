CREATE TABLE Fabricante
(
  Códgio_fabricante Varchar(30) NOT NULL,
  Marca Varchar(30) NOT NULL,
  PRIMARY KEY (Códgio_fabricante)
);

CREATE TABLE Motor
(
  Rendiimiento Number NOT NULL,
  Velocidad_nominal Number NOT NULL,
  Potencia Number NOT NULL,
  Estabilidad Number NOT NULL,
  Fabricante Varchar(30) NOT NULL,
  Código_único Varchar(30) NOT NULL,
  Códgio_fabricante Varchar(30) NOT NULL,
  PRIMARY KEY (Código_único),
  FOREIGN KEY (Códgio_fabricante) REFERENCES Fabricante(Códgio_fabricante)
);

CREATE TABLE Eléctrico
(
  Autonomía Number NOT NULL,
  Código_único Varchar(30) NOT NULL,
  PRIMARY KEY (Código_único),
  FOREIGN KEY (Código_único) REFERENCES Motor(Código_único)
);

CREATE TABLE Térmico
(
  Consumo_100km Number NOT NULL,
  Código_único Varchar(30) NOT NULL,
  PRIMARY KEY (Código_único),
  FOREIGN KEY (Código_único) REFERENCES Motor(Código_único)
);

CREATE TABLE Híbrido
(
  Consumo_100km Number NOT NULL,
  Autonomía Number NOT NULL,
  Código_único Varchar(30) NOT NULL,
  PRIMARY KEY (Código_único),
  FOREIGN KEY (Código_único) REFERENCES Motor(Código_único)
);

CREATE TABLE Escudería
(
  Código_escudería Number NOT NULL,
  Patrimonio Number NOT NULL,
  Códgio_fabricante Varchar(30) NOT NULL,
  PRIMARY KEY (Código_escudería),
  FOREIGN KEY (Códgio_fabricante) REFERENCES Fabricante(Códgio_fabricante)
);

CREATE TABLE Modelo
(
  Piezas_patente Varchar(30) NOT NULL,
  Código_modelo Number NOT NULL,
  Código_único Varchar(30) NOT NULL,
  Código_escudería Number NOT NULL,
  PRIMARY KEY (Código_modelo),
  FOREIGN KEY (Código_único) REFERENCES Motor(Código_único),
  FOREIGN KEY (Código_escudería) REFERENCES Escudería(Código_escudería)
);

CREATE TABLE Vehículo
(
  Fabricante Varchar(30) NOT NULL,
  Número_único Varchar(30) NOT NULL,
  Código_único Varchar(30) NOT NULL,
  Código_escudería Number NOT NULL,
  PRIMARY KEY (Número_único),
  FOREIGN KEY (Código_único) REFERENCES Motor(Código_único),
  FOREIGN KEY (Código_escudería) REFERENCES Escudería(Código_escudería)
);