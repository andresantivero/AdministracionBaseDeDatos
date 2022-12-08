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
)END--ALTER TABLE empleados--	ADD CONSTRAINT pk_empleados_idempleado PRIMARY KEY(idempleado);--ALTER TABLE empleados--	ADD CONSTRAINT uq_empleados_nroDocumento UNIQUE(nroDocumento);--ALTER TABLE empleados--	ADD CONSTRAINT ck_empleados_edad CHECK(edad >= 0);--ALTER TABLE empleados--	ADD CONSTRAINT df_empleados_fechaCreacion DEFAULT getdate() for fechaCreacion;--ALTER TABLE	empleados--	DROP CONSTRAINT ck_empleados_edad;--EJERCICIO 8--ALTER TABLE factura--	ADD CONSTRAINT fk_factura_clientes_cliente_id FOREIGN KEY(cliente_id) REFERENCES clientes(cliente_id);--ALTER TABLE factura--	ADD CONSTRAINT fk_factura_articulo_articulo_id FOREIGN KEY(articulo_id) REFERENCES articulo(articulo_id);--EJERCICIO 9IF object_id('usuarios', 'U') is null
BEGINCREATE TABLE usuarios (clave VARCHAR(10) NOT NULL,nombre VARCHAR(30) NOT NULL)ENDALTER TABLE usuarios	ADD CONSTRAINT pk_usuarios_nombre PRIMARY KEY(nombre);