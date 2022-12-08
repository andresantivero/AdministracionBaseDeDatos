CREATE DATABASE Laboratorio

-- EJERCICIO 1

CREATE TABLE Prueba (
idCodigo CHAR(4) NOT NULL,
nombre VARCHAR(30) NOT NULL,
precio DECIMAL(10,2) NOT NULL,
edad INT NOT NULL
);

--EJERCICIO 2

CREATE TABLE Operador (
codigo_operador CHAR(10) NOT NULL,
nombre VARCHAR(40) NOT NULL,
fecha_ingreso DATE NOT NULL,
edad INT NOT NULL,
);
ALTER TABLE Operador ADD telefono VARCHAR(20);

-- EJERCICIO 3

CREATE TABLE Facturas (
letra CHAR(1),
numero INT,
cliente_id INT NOT NULL,
articulo_id INT NOT NULL,
fecha_factura DATE NOT NULL,
monto DECIMAL(10,2) NOT NULL,
PRIMARY KEY(letra, numero)
);

--EJERCICIO 4

CREATE TABLE Articulos (
articulos_id INT PRIMARY KEY IDENTITY(1,1),
nombre VARCHAR(50) NOT NULL,
precio	DECIMAL NOT NULL,
stock INT NOT NULL
);

--EJERCICIO 5

CREATE TABLE Clientes (
cliente_id INT PRIMARY KEY IDENTITY(1,1),
nombre	VARCHAR(25) NOT NULL,
apellido VARCHAR(25) NOT NULL,
cuit CHAR(16) NOT NULL,
direccion VARCHAR(50) NOT NULL,
comentarios VARCHAR(50)
);

--EJERCICIO 6.1

ALTER TABLE Facturas ADD observaciones VARCHAR(100);

--EJERCICIO 6.2

ALTER TABLE Facturas ALTER COLUMN observaciones VARCHAR(200) NOT NULL;
 
--EJERCICIO 6.3
 