create database Laboratorio

/*
1) Crear la tabla llamada prueba, dentro de la Base de datos Laborario
Campos
idCodido alfanumerico de longitud fija de 4 caracteres que no admite nulos
nombre alfanumerico de longitud variable de 30 caracteres que no admite nulos
precio decimal con dos decimales que no admite nulos.
edad numero que no adminte nulos.
*/

create table Prueba (

idCodigo Char(4) not null,
nombre varchar(30) not null,
precio decimal(2) not null,
edad tinyint not null

);

/*
2) Crear una tabla llamado operador que contenga los siguientes campos
codigo_operador alfanumerico de longitud fija de 10 caracteres no admite nulos
nombre alfanumerico de longitud variable de 40 caracteres no admite nulos
fecha_ingreso de tipo fecha no admite nulos
edad numero no admite nulos
Luego de creada añadir una columna llamada telefono alfanumerico de longitud
variable de 20 caracteres
*/


create table Operador (

codigo_operador char(10) not null,
nombre varchar(40) not null,
fecha_ingreso date not null,
edad tinyint not null

);

alter table Operador 
	add telefono varchar(20);

/*
3) Crear la tabla facturas dentro de la base de datos con el siguiente detalle:
letra alfanumerico de longitud fija 1 caracter y PK
numero numérico entero y PK
cliente_id numérico entero que no admite nulos
articulo_id numérico entero que no admite nulos
fecha_factura de tipo fecha no admite nulos
monto decimal de dos caracteres que no admite nulos
*/

create table Facturas (

letra char(1) not null,
numero int not null,
cliente_id int not null,
articulo_id int not null,
fecha_factura date not null,
monto decimal(2) not null

constraint PK_letra_numero primary key(letra, numero)
)

/*
4) Crear la tabla articulos dentro de la base de datos con el siguiente detalle:
articulo_id numérico entero y PK auto incrementeal que comience en 1
nombre alfanumerico de longitud variable de 50 caracteres que no admite nulos
precio decimal no admite nulos
stock numérico entero que no admite nulos.
*/
drop table articulos;

create table Articulos(

articulo_id int identity primary key,
nombre varchar(50) not null,
precio decimal(2) not null,
stock int not null,

)


/*
5) Crear la tabla clientes dentro de la base de datos con el siguiente detalle
cliente_id tipo de dato entero y PK auto incrementeal que comience en 1
nombre alfanumerico de longitud variable de 25 caracteres no admite nulos
apellido alfanumerico de longitud variable de 25 caracteres no admite nulos
cuit alfanumerico de longitud fija de 16 caracteres no adminte nulos
direccion alfanumerico de longitud variable de 50 caracteres admite nulos
comentarios alfanumerico de longitud variable de 50 caracteres admite nulos
*/

create table Clientes (

cliente_id int primary key identity(1,1),
nombre varchar(25) not null,
apellido varchar(25) not null,
cuit char(16) not null,
direccion varchar(50),
comentarios varchar(50)
)

/*
6) A la tabla facturas
6.1) agregar un campo observacion alfanumerico de longitud variable de 100 caracteres
que admite nulos.
*/

alter table Facturas 
	add observacion varchar(100);


/*
6.2) modificar el tipo de dato a alfanumerico de longitud variable de 200 caracteres que
no admite nulos.
*/

alter table Facturas 
	alter column observacion varchar(200) not null;

/*
6.3) eliminar el campo observacion
*/

alter table Facturas 
	drop column observacion;

/*
7) Dada la tabla empleados
*/

drop table empleados;

CREATE TABLE Empleados (
idempleado INT NOT NULL,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
nroDocumento VARCHAR(11) NOT NULL,
fechaCreacion DATETIME NOT NULL,
edad TINYINT NOT NULL
)

/*
7.1) Crear una restriccion de clave primaria para el campo idempleado
*/

alter table Empleados add constraint PK_idempleado primary key(idempleado) 

/*
7.2) Crear una restriccion unique al campo nroDocumento
*/
alter table Empleados drop constraint UQ__Empleado__A0EE94AFCFDEF821

alter table Empleados add constraint UQ_nroDocumento unique(nroDocumento)

/*
7.3) Crear una restriccion check para que la edad no sea negativa
*/

alter table Empleados add constraint CK_edad check(edad >= 0)

/*
7.4) Crear una restriccion default para el campo fechaCreacion que sea la fecha del
servidor (SQL → GETDATE(), MySQL →CURDATE())
*/
 
alter table Empleados add constraint DF_fechaCreacion default getdate() for fechaCreacion

/*
7.5) Deshabilitar las restricciones creadas para edad
*/

alter table Empleados nocheck constraint CK_edad;

/*
8) A la tabla de facturas crear las restriccion FK para los campos cliente_id y articulo_id
*/

alter table Facturas 
	add constraint FK_cliente_id foreign key (cliente_id) references Clientes(cliente_id)

alter table Facturas 
	add constraint FK_articulo_id foreign key (articulo_id) references Articulos(articulo_id)


/*
9) Crear la tabla usuarios que contengá los siguientes campos:
- clave: alfanumerico de 10 caracteres de longitud variable.
- nombre: alfanumerico de 30 caracteres de longitud variable,
Definir el campo "nombre" como clave primaria.
*/

create table Usuarios (

clave varchar(10),
nombre varchar(30),

constraint PK_nombre_Usuarios primary key(nombre)
)

/*
10) Crear la tabla libros con la siguiente estructura
Creamos la tabla especificando que el campo "codigo" genere valores secuenciales
comenzando en 1 e incrementándose en 1 automáticamente y que sea PK.
codigo numero,
titulo alfanumerico de 50 caracteres no nulo,
autor alfanumerico de 30 caracteres no nulo,
editorial alfanumerico de 20 caracteres no nulo,
precio decimal no nulo.
*/

create table Libros (

codigo int identity(1,1),
titulo varchar(50) not null,
autor varchar(30) not null,
editorial varchar(20) not null,
precio decimal not null

)

/*
10.1) Al campo autor setearle por defecto el valor “Desconocido”
*/

alter table Libros add Constraint DF_autor default ('desconocido') for autor

/*
10.2) Al campo precio setearlo una restricción check que su valor sea positivo
*/

alter table Libros add constraint CK_precio check(precio >= 0)

/*
10.3) Escribir la sintaxis para deshabilitar la restricción check sobre el campo precio
*/

alter table Libros nocheck constraint CK_precio

/*
11) Escribir la sintaxis para eliminar las tablas creadas.
*/

alter table Clientes drop Constraint PK__Clientes__47E34D64B21791D7
drop table  Articulos,
			Clientes,		
			Empleados, 
			Facturas, 
			Libros, 
			Operador, 
			Prueba, 
			Usuarios

/*
12) Escribir la sintaxis para eliminar la base de dato.
*/

drop database if exists comercioIT


