--EJERCICIO 7



IF object_id('empleados', 'U') is null
BEGIN

CREATE TABLE empleados (
idempleado INT NOT NULL,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
nroDocumento VARCHAR(11) NOT NULL,
fechaCreacion DATETIME NOT NULL,
edad TINYINT NOT NULL
)
BEGIN