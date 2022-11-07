CREATE TABLE Conflicto
(
  Causa Varchar(30) NOT NULL,
  Zona Varchar(30) NOT NULL,
  Nombre_Único Varchar(30) NOT NULL,
  Número_de_muertos Number NOT NULL,
  Número_de_heridos Number NOT NULL,
  Código_númerico Number NOT NULL,
  PRIMARY KEY (Código_númerico)
);

CREATE TABLE Económicos
(
  Materias_primas_disputadas Varchar(30) NOT NULL,
  Código_númerico Number NOT NULL,
  PRIMARY KEY (Código_númerico),
  FOREIGN KEY (Código_númerico) REFERENCES Conflicto(Código_númerico)
);

CREATE TABLE Religiosos
(
  Religiones_Afectadas Varchar(30) NOT NULL,
  Código_númerico Number NOT NULL,
  PRIMARY KEY (Código_númerico),
  FOREIGN KEY (Código_númerico) REFERENCES Conflicto(Código_númerico)
);

CREATE TABLE Raciales
(
  Etnias_enfrentadas Varchar(30) NOT NULL,
  Código_númerico Number NOT NULL,
  PRIMARY KEY (Código_númerico),
  FOREIGN KEY (Código_númerico) REFERENCES Conflicto(Código_númerico)
);

CREATE TABLE Territoriales
(
  Regiones_afectadas Varchar(30) NOT NULL,
  Código_númerico Number NOT NULL,
  PRIMARY KEY (Código_númerico),
  FOREIGN KEY (Código_númerico) REFERENCES Conflicto(Código_númerico)
);

CREATE TABLE División
(
  Número_división Varchar(30) NOT NULL,
  PRIMARY KEY (Número_división)
);

CREATE TABLE Registro
(
  Número_de_barcos Number NOT NULL,
  Número_de_tanques Number NOT NULL,
  Número_de_aviones Number NOT NULL,
  Número_de_hombres Number NOT NULL,
  Número_de_bajas Number NOT NULL,
  Código_único Number NOT NULL,
  Número_división Varchar(30) NOT NULL,
  PRIMARY KEY (Código_único),
  FOREIGN KEY (Número_división) REFERENCES División(Número_división)
);

CREATE TABLE Persona
(
  Apellido_1 Varchar(30) NOT NULL,
  Apellido_2 Varchar(30) NOT NULL,
  Nombre Varchar(30) NOT NULL,
  DNI Varchar(30) NOT NULL,
  PRIMARY KEY (DNI),
  UNIQUE (Apellido_1, Apellido_2, Nombre)
);

CREATE TABLE Político
(
  Código_grupo_armado Varchar(30) NOT NULL,
  Descripción_apoyos Varchar(30) NOT NULL,
  DNI Varchar(30) NOT NULL,
  PRIMARY KEY (DNI),
  FOREIGN KEY (DNI) REFERENCES Persona(DNI),
  UNIQUE (Código_grupo_armado)
);

CREATE TABLE Traficante_de_armas
(
  Cantidad Number NOT NULL,
  Peligrosidad Number NOT NULL,
  DNI Varchar(30) NOT NULL,
  PRIMARY KEY (DNI),
  FOREIGN KEY (DNI) REFERENCES Persona(DNI),
  UNIQUE (Cantidad)
);

CREATE TABLE Armas
(
  Nombre Varchar(30) NOT NULL,
  Indicador_de_capacidad_destructiva Varchar(30) NOT NULL,
  Número_de_serie Varchar(30) NOT NULL,
  DNI Varchar(30) NOT NULL,
  PRIMARY KEY (Número_de_serie),
  FOREIGN KEY (DNI) REFERENCES Traficante_de_armas(DNI)
);

CREATE TABLE Jefes_militares
(
  Código Varchar(30) NOT NULL,
  Rango Varchar(30) NOT NULL,
  DNI Varchar(30) NOT NULL,
  Número_división Varchar(30) NOT NULL,
  DNI_político Varchar(30) NOT NULL,
  PRIMARY KEY (DNI),
  FOREIGN KEY (DNI) REFERENCES Persona(DNI),
  FOREIGN KEY (Número_división) REFERENCES División(Número_división),
  FOREIGN KEY (DNI_político) REFERENCES Político(DNI),
  UNIQUE (Código)
);

CREATE TABLE Tipo
(
  Código_ayuda Varchar(30) NOT NULL,
  Denominación Varchar(30) NOT NULL,
  PRIMARY KEY (Código_ayuda)
);

CREATE TABLE No_gubernamental
(
  Código_ayuda Varchar(30) NOT NULL,
  PRIMARY KEY (Código_ayuda),
  FOREIGN KEY (Código_ayuda) REFERENCES Tipo(Código_ayuda)
);

CREATE TABLE Gubernamental
(
  Código_ayuda Varchar(30) NOT NULL,
  PRIMARY KEY (Código_ayuda),
  FOREIGN KEY (Código_ayuda) REFERENCES Tipo(Código_ayuda)
);

CREATE TABLE Internacional
(
  Código_ayuda Varchar(30) NOT NULL,
  PRIMARY KEY (Código_ayuda),
  FOREIGN KEY (Código_ayuda) REFERENCES Tipo(Código_ayuda)
);

CREATE TABLE Tipo_de_ayuda
(
  Código Varchar(30) NOT NULL,
  PRIMARY KEY (Código)
);

CREATE TABLE Diplomática
(
  Código Varchar(30) NOT NULL,
  PRIMARY KEY (Código),
  FOREIGN KEY (Código) REFERENCES Tipo_de_ayuda(Código)
);

CREATE TABLE Médica
(
  Código Varchar(30) NOT NULL,
  PRIMARY KEY (Código),
  FOREIGN KEY (Código) REFERENCES Tipo_de_ayuda(Código)
);

CREATE TABLE Presencial
(
  Código Varchar(30) NOT NULL,
  PRIMARY KEY (Código),
  FOREIGN KEY (Código) REFERENCES Tipo_de_ayuda(Código)
);

CREATE TABLE Países
(
  Código_País Number NOT NULL,
  Nombre Varchar(30) NOT NULL,
  Código_númerico Number NOT NULL,
  PRIMARY KEY (Código_País),
  FOREIGN KEY (Código_númerico) REFERENCES Conflicto(Código_númerico)
);

CREATE TABLE Organizaciones
(
  Código_organización Number NOT NULL,
  DNI Varchar(30) NOT NULL,
  Código_númerico Number NOT NULL,
  PRIMARY KEY (Código_organización),
  FOREIGN KEY (DNI) REFERENCES Político(DNI),
  FOREIGN KEY (Código_númerico) REFERENCES Conflicto(Código_númerico)
);

CREATE TABLE Organizaciones_mediadoras
(
  Nombre Varchar(30) NOT NULL,
  Número_personas Number NOT NULL,
  Código_organización Number NOT NULL,
  Código_ayuda Varchar(30) NOT NULL,
  Código Varchar(30) NOT NULL,
  DependeCódigo_organización Number NOT NULL,
  PRIMARY KEY (Código_organización),
  FOREIGN KEY (Código_organización) REFERENCES Organizaciones(Código_organización),
  FOREIGN KEY (Código_ayuda) REFERENCES Tipo(Código_ayuda),
  FOREIGN KEY (Código) REFERENCES Tipo_de_ayuda(Código),
  FOREIGN KEY (DependeCódigo_organización) REFERENCES Organizaciones(Código_organización)
);

CREATE TABLE Grupos_armados
(
  Nombre Varchar(30) NOT NULL,
  Número_de_bajas_total Number NOT NULL,
  Número_total_de_armas Number NOT NULL,
  Código_organización Number NOT NULL,
  Número_división Varchar(30) NOT NULL,
  PRIMARY KEY (Código_organización),
  FOREIGN KEY (Código_organización) REFERENCES Organizaciones(Código_organización),
  FOREIGN KEY (Número_división) REFERENCES División(Número_división),
  UNIQUE (Nombre)
);

CREATE TABLE Dirigidas_a
(
  Código_organización Number NOT NULL,
  Número_de_serie Varchar(30) NOT NULL,
  PRIMARY KEY (Código_organización, Número_de_serie),
  FOREIGN KEY (Código_organización) REFERENCES Grupos_armados(Código_organización),
  FOREIGN KEY (Número_de_serie) REFERENCES Armas(Número_de_serie)
);

CREATE TABLE Intervienen_2
(
  Código_númerico Number NOT NULL,
  Código_organización Number NOT NULL,
  PRIMARY KEY (Código_númerico, Código_organización),
  FOREIGN KEY (Código_númerico) REFERENCES Conflicto(Código_númerico),
  FOREIGN KEY (Código_organización) REFERENCES Grupos_armados(Código_organización)
);

CREATE TABLE Intervienen_1
(
  Código_númerico Number NOT NULL,
  Código_organización Number NOT NULL,
  PRIMARY KEY (Código_númerico, Código_organización),
  FOREIGN KEY (Código_númerico) REFERENCES Conflicto(Código_númerico),
  FOREIGN KEY (Código_organización) REFERENCES Organizaciones_mediadoras(Código_organización)
);