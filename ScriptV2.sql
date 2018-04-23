CREATE TABLE Usuarios
(
	Usuario_ID           INTEGER NOT NULL,
	usuario              VARCHAR(20) NOT NULL,
	password             VARCHAR(20) NOT NULL,
	puesto               VARCHAR(20) NOT NULL,
	nivel                VARCHAR(20) NOT NULL,
	PRIMARY KEY (Usuario_ID)
);

CREATE TABLE Proveedores
(
	Proveedores_ID       INTEGER NOT NULL,
	proveedor            VARCHAR(20) NOT NULL,
	Nombre               VARCHAR(20) NOT NULL,
	Direccion            VARCHAR(20) NOT NULL,
	Telefono             VARCHAR(20) NOT NULL,
	FormaPago            VARCHAR(20) NOT NULL,
	RFC                  VARCHAR(20) NOT NULL,
	Estado               VARCHAR(20) NOT NULL,
	PRIMARY KEY (Proveedores_ID)
);

CREATE TABLE Requisiciones
(
	Requisicion_ID       INTEGER NOT NULL,
	Usuario_ID           INTEGER NOT NULL,
	Proveedores_ID       INTEGER NOT NULL,
	Monto                INTEGER NOT NULL,
	FechaRequisicion     DATE NOT NULL,
	DetalleRequisicion   VARCHAR(20) NULL,
	Estado               VARCHAR(20) NOT NULL,
	PRIMARY KEY (Requisicion_ID,Usuario_ID),
	FOREIGN KEY (Usuario_ID) REFERENCES Usuarios (Usuario_ID),
	FOREIGN KEY (Proveedores_ID) REFERENCES Proveedores (Proveedores_ID)
);

CREATE TABLE Productos
(
	Producto_ID          INTEGER NOT NULL,
	nombre               VARCHAR(20) NOT NULL,
	descripcion          VARCHAR(20) NOT NULL,
	precio               FLOAT NOT NULL,
	UnidadMedida         DOUBLE NOT NULL,
	Categoria            VARCHAR(20) NOT NULL,
	PRIMARY KEY (Producto_ID)
);

CREATE TABLE ProductosRequisiciones
(
	Requisicion_ID       INTEGER NOT NULL,
	Usuario_ID           INTEGER NOT NULL,
	Producto_ID          INTEGER NOT NULL,
	Cantidad             INTEGER NOT NULL,
	TotalArticulo        INTEGER NOT NULL,
	PRIMARY KEY (Requisicion_ID,Usuario_ID,Producto_ID),
	FOREIGN KEY (Requisicion_ID, Usuario_ID) REFERENCES Requisiciones (Requisicion_ID, Usuario_ID),
	FOREIGN KEY (Producto_ID) REFERENCES Productos (Producto_ID)
);

INSERT INTO Usuarios ( usuario, password , puesto, nivel) VALUES('AMartinez', 'requi1234', 'Requisitor', '4');