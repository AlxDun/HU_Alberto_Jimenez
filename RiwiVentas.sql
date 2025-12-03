-- 1. Format tables
DROP TABLE IF EXISTS Venta CASCADE;
DROP TABLE IF EXISTS Ciudad CASCADE;
DROP TABLE IF EXISTS Producto CASCADE;
DROP TABLE IF EXISTS Tipo_Venta CASCADE;
DROP TABLE IF EXISTS Tipo_Cliente CASCADE;

-- 2. Create dimension tables
CREATE TABLE Ciudad (
    ID_Ciudad SERIAL PRIMARY KEY,
    Ciudad VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Producto (
    ID_Producto SERIAL PRIMARY KEY,
    Producto VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Tipo_Venta (
    ID_Tipo_Venta SERIAL PRIMARY KEY,
    Tipo_Venta VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Tipo_Cliente (
    ID_Tipo_Cliente SERIAL PRIMARY KEY,
    Tipo_Cliente VARCHAR(255) NOT NULL UNIQUE
);

-- 3. Create the sales fact table
CREATE TABLE Venta (
    ID_Venta SERIAL PRIMARY KEY,

    ID_Tipo_Cliente INT NOT NULL REFERENCES Tipo_Cliente(ID_Tipo_Cliente),
    ID_Tipo_Venta INT NOT NULL REFERENCES Tipo_Venta(ID_Tipo_Venta),
    ID_Producto INT NOT NULL REFERENCES Producto(ID_Producto),
	ID_Ciudad INT NOT NULL REFERENCES Ciudad(ID_Ciudad),
    
    Fecha DATE NOT NULL,
    Tipo_Producto VARCHAR(255),
    Cantidad NUMERIC NOT NULL,
    Precio_Unitario NUMERIC NOT NULL,
    Descuento NUMERIC,
    Costo_Envio NUMERIC,
    Total NUMERIC NOT NULL
);
