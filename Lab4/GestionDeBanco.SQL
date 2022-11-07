CREATE TABLE Sucursales
(
  Nombre_Unic Varchar(30) NOT NULL,
  Ciudad Varchar(30) NOT NULL,
  Activos Number NOT NULL,
  PRIMARY KEY (Nombre_Unic)
);

CREATE TABLE Cuentas
(
  Num_Unic Number NOT NULL,
  Saldo Number NOT NULL,
  Fecha_última_de_acceso DATE NOT NULL,
  PRIMARY KEY (Num_Unic)
);

CREATE TABLE Préstamos
(
  Num_Unic Number NOT NULL,
  Registro_importe Number NOT NULL,
  Nombre_Unic Varchar(30) NOT NULL,
  PRIMARY KEY (Num_Unic),
  FOREIGN KEY (Nombre_Unic) REFERENCES Sucursales(Nombre_Unic)
);

CREATE TABLE Cuenta_corriente
(
  Descubierto Number NOT NULL,
  Num_Unic Number NOT NULL,
  PRIMARY KEY (Num_Unic),
  FOREIGN KEY (Num_Unic) REFERENCES Cuentas(Num_Unic)
);

CREATE TABLE Cuenta_de_ahorros
(
  Tipo_de_interés Number NOT NULL,
  Num_Unic Number NOT NULL,
  PRIMARY KEY (Num_Unic),
  FOREIGN KEY (Num_Unic) REFERENCES Cuentas(Num_Unic)
);

CREATE TABLE Administración
(
  Nombre Varchar(30) NOT NULL,
  Apellido_1 Varchar(30) NOT NULL,
  Apellido_2 Varchar(30) NOT NULL,
  Código_administración Number NOT NULL,
  PRIMARY KEY (Código_administración),
  UNIQUE (Nombre, Apellido_1, Apellido_2)
);

CREATE TABLE Pagos
(
  Fecha DATE NOT NULL,
  Importe Number NOT NULL,
  Código_pago Number NOT NULL,
  Num_Unic Number NOT NULL,
  PRIMARY KEY (Código_pago),
  FOREIGN KEY (Num_Unic) REFERENCES Préstamos(Num_Unic)
);

CREATE TABLE Teléfono
(
  Número Number NOT NULL,
  Código_administración Number NOT NULL,
  PRIMARY KEY (Número),
  FOREIGN KEY (Código_administración) REFERENCES Administración(Código_administración)
);

CREATE TABLE Clientes
(
  ID_cliente Number NOT NULL,
  Nombre Varchar(30) NOT NULL,
  Apellido_1 Varchar(30) NOT NULL,
  Apellido_2 Varchar(30) NOT NULL,
  Nombre_Calle Varchar(30) NOT NULL,
  Número_Calle Varchar(30) NOT NULL,
  Ciudad Varchar(30) NOT NULL,
  ID_empleado Varchar(30) NOT NULL,
  PRIMARY KEY (ID_cliente),
  FOREIGN KEY (ID_empleado) REFERENCES Banquero_particular(ID_empleado),
  UNIQUE (Nombre, Apellido_1, Apellido_2),
  UNIQUE (Nombre_Calle, Número_Calle, Ciudad)
);

CREATE TABLE Empleados
(
  ID_empleado Varchar(30) NOT NULL,
  Fecha_contrato DATE NOT NULL,
  Código_administración Number NOT NULL,
  Ser_jefe_ID_empleado Varchar(30) NOT NULL,
  PRIMARY KEY (ID_empleado),
  FOREIGN KEY (Código_administración) REFERENCES Administración(Código_administración),
  FOREIGN KEY (Ser_jefe_ID_empleado) REFERENCES Empleados(ID_empleado)
);

CREATE TABLE Banquero_particular
(
  ID_empleado Varchar(30) NOT NULL,
  PRIMARY KEY (ID_empleado),
  FOREIGN KEY (ID_empleado) REFERENCES Empleados(ID_empleado)
);

CREATE TABLE Banquero_personal
(
  ID_empleado Varchar(30) NOT NULL,
  PRIMARY KEY (ID_empleado),
  FOREIGN KEY (ID_empleado) REFERENCES Banquero_particular(ID_empleado)
);

CREATE TABLE Responsable_de_préstamos
(
  ID_empleado Varchar(30) NOT NULL,
  PRIMARY KEY (ID_empleado),
  FOREIGN KEY (ID_empleado) REFERENCES Banquero_particular(ID_empleado)
);

CREATE TABLE Subordinados
(
  ID_empleado Varchar(30) NOT NULL,
  PRIMARY KEY (ID_empleado),
  FOREIGN KEY (ID_empleado) REFERENCES Empleados(ID_empleado)
);

CREATE TABLE Tener
(
  ID_cliente Number NOT NULL,
  Num_Unic Number NOT NULL,
  PRIMARY KEY (ID_cliente, Num_Unic),
  FOREIGN KEY (ID_cliente) REFERENCES Clientes(ID_cliente),
  FOREIGN KEY (Num_Unic) REFERENCES Cuentas(Num_Unic)
);

CREATE TABLE Pedir
(
  ID_cliente Number NOT NULL,
  Num_Unic Number NOT NULL,
  PRIMARY KEY (ID_cliente, Num_Unic),
  FOREIGN KEY (ID_cliente) REFERENCES Clientes(ID_cliente),
  FOREIGN KEY (Num_Unic) REFERENCES Préstamos(Num_Unic)
);