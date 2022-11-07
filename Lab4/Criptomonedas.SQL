CREATE TABLE Algoritmo
(
  Código_Algoritmo Varchar(30) NOT NULL,
  Nombre Varchar(30) NOT NULL,
  PRIMARY KEY (Código_Algoritmo)
);

CREATE TABLE Sistema_defi
(
  Código_Defi Varchar(30) NOT NULL,
  Capital Number NOT NULL,
  PRIMARY KEY (Código_Defi)
);

CREATE TABLE Criptomenda
(
  Código_criptomoneda Varchar(30) NOT NULL,
  Nombre Number NOT NULL,
  Código_Defi Varchar(30) NOT NULL,
  Código_Algoritmo Varchar(30) NOT NULL,
  PRIMARY KEY (Código_criptomoneda),
  FOREIGN KEY (Código_Defi) REFERENCES Sistema_defi(Código_Defi),
  FOREIGN KEY (Código_Algoritmo) REFERENCES Algoritmo(Código_Algoritmo)
);

CREATE TABLE Transacciones
(
  Código_único Number NOT NULL,
  Descripción Varchar(30) NOT NULL,
  Código_Algoritmo Varchar(30) NOT NULL,
  Código_Defi Varchar(30) NOT NULL,
  PRIMARY KEY (Código_único),
  FOREIGN KEY (Código_Algoritmo) REFERENCES Algoritmo(Código_Algoritmo),
  FOREIGN KEY (Código_Defi) REFERENCES Sistema_defi(Código_Defi)
);

CREATE TABLE Ingresos
(
  Código_único Number NOT NULL,
  PRIMARY KEY (Código_único),
  FOREIGN KEY (Código_único) REFERENCES Transacciones(Código_único)
);

CREATE TABLE Pagos
(
  Código_único Number NOT NULL,
  PRIMARY KEY (Código_único),
  FOREIGN KEY (Código_único) REFERENCES Transacciones(Código_único)
);

CREATE TABLE Intercambios_de_monedas
(
  Código_único Number NOT NULL,
  PRIMARY KEY (Código_único),
  FOREIGN KEY (Código_único) REFERENCES Transacciones(Código_único)
);

CREATE TABLE Usuario
(
  Día Number NOT NULL,
  Mes Number NOT NULL,
  Año Number NOT NULL,
  DNI Varchar(30) NOT NULL,
  Nombre Varchar(30) NOT NULL,
  Sexo Varchar(30) NOT NULL,
  Código_criptomoneda Varchar(30) NOT NULL,
  PRIMARY KEY (DNI),
  FOREIGN KEY (Código_criptomoneda) REFERENCES Criptomenda(Código_criptomoneda),
  UNIQUE (Día, Mes, Año)
);

CREATE TABLE Wallet
(
  Clave_privada Varchar(30) NOT NULL,
  Clave_pública Varchar(30) NOT NULL,
  DNI Varchar(30) NOT NULL,
  PRIMARY KEY (Clave_pública),
  FOREIGN KEY (DNI) REFERENCES Usuario(DNI)
);

CREATE TABLE Red
(
  Código_red Varchar(30) NOT NULL,
  Latencia Number NOT NULL,
  Clave_pública Varchar(30) NOT NULL,
  PRIMARY KEY (Código_red),
  FOREIGN KEY (Clave_pública) REFERENCES Wallet(Clave_pública)
);