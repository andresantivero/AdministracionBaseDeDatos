-- EJERCICIOS JOINS

/*
1) Mostrar los empleados que también son vendedores
SQL tablas: HumanResources.Employee, Sales.SalesPerson
MySQL tablas: Employee, SalesPerson
SQL campos: BusinessEntityID
MySQL campos: salespersonid , employeeid
*/

SELECT
	he.BusinessEntityID
FROM 
	HumanResources.Employee he inner join Sales.SalesPerson ss
	ON he.BusinessEntityID = ss.BusinessEntityID

/*
2) Mostrar los empleados ordenados alfabéticamente por apellido y por nombre
SQL tablas: HumanResources.Employee, Person.Person
MySQL tablas: employee, contact
SQL campos: BusinessEntityID, LastName, FirstName
MySQL campos: employeeid, contactid
*/

SELECT 
	pp.LastName,
	pp.FirstName
FROM
	HumanResources.Employee hr INNER JOIN Person.Person pp
	ON hr.BusinessEntityID = pp.BusinessEntityID
order by pp.LastName, pp.FirstName 

/*
3)Mostrar el código de logueo, número de territorio y sueldo básico de los vendedores
SQL tablas: HumanResources.Employee, Sales.SalesPerson
MySQL tablas: Employee, SalesPerson
campos: e.LoginID, TerritoryID, Bonus, BusinessEntityID
*/

select 
	hr.LoginID NumeroLogin, 
	s.TerritoryID Territorio, 
	s.Bonus Sueldo

from
	HumanResources.Employee hr inner join Sales.SalesPerson s
	on hr.BusinessEntityID = s.BusinessEntityID

/*
4)Mostrar los productos que sean ruedas
SQL tablas: Production.Product, Production.ProductSubcategory
MySQL tablas: Product, ProductSubcategory
campos: Name, ProductSubcategoryID
*/

select * from Production.Product


select 
	p.Name Nombre
from 
	Production.Product p inner join	Production.ProductSubcategory ps
	on p.ProductSubcategoryID = ps.ProductSubcategoryID
where p.Name like '%wheel%'


/*
5)Mostrar los nombres de los productos que no son bicicletas
SQL tablas: Production.Product, Production.ProductSubcategory
MySQL tablas: Product, ProductSubcategory
campos: Name, ProductSubcategoryID
*/

select 
	p.Name,
	ps.Name,
	p.ProductSubcategoryID
from 
	Production.Product p left join	Production.ProductSubcategory ps
	on p.ProductSubcategoryID = ps.ProductSubcategoryID
where p.Name not like '%bikes%' --and ps.Name not like '%bike%'


SELECT 
	pps.Name as ppsNAME,
	pp.Name as ppNAME,
	pp.ProductSubcategoryID

FROM Production.Product PP inner JOIN  Production.ProductSubcategory PPS
	ON (PP.ProductSubcategoryID = PPS.ProductSubcategoryID)
WHERE PPS.Name NOT LIKE('%bike%') and pps.Name NOT LIKE('%bike%')
ORDER BY pp.ProductSubcategoryID ASC

/*
6)Mostrar los precios de venta de aquellos productos donde el precio de venta sea
inferior al precio de lista recomendado para ese producto ordenados por nombre de
producto
SQL tablas: Sales.SalesOrderDetail, Production.Product
MySQL tablas: SalesOrderDetail, Product
campos: ProductID, Name, ListPrice, UnitPrice
*/

select distinct
	p.ProductID NumeroProducto, 
	p.Name Nombre, 
	p.ListPrice Preciolista, 
	sd.UnitPrice Precioventa
from 
	Sales.SalesOrderDetail sd inner join Production.Product p
	on sd.ProductID = p.ProductID
where sd.UnitPrice <  p.ListPrice
order by Nombre

/*
7)Mostrar el nombre de los productos y de los proveedores cuya subcategoría es 13
ordenados por nombre de proveedor
SQL tablas: Production.Product, Purchasing.ProductVendor, Purchasing.Vendor
MySQL tablas: Product, ProductVendor, Vendor
campos: Name ,ProductID, BusinessEntityID, ProductSubcategoryID
*/

select 
	pp.Name ,
	pp.ProductID , 
	pp.ProductSubcategoryID, 
	pv.Name
from 
	Production.Product pp inner join Purchasing.ProductVendor ppv
	on pp.ProductID = ppv.ProductID
	inner join Purchasing.Vendor pv
	on ppv.BusinessEntityID = pv.BusinessEntityID
where pp.ProductSubcategoryID = 13

/*
8)Mostrar todas las personas (nombre y apellido) y en el caso que sean empleados
mostrar también el login id, sino mostrar null
SQL tablas: Person.Person, HumanResources.Employee
MySQL tablas: contact, Employee
campos: FirstName, LastName, LoginID, BusinessEntityID
*/

select * from Person.Person
select * from HumanResources.Employee


select 
	concat(pp.FirstName , ' ', pp.LastName) NombreApellido,
	hre.LoginID IdentificacionLogin,
	pp.BusinessEntityID Identificacion
from 
	Person.Person pp left join HumanResources.Employee hre
	on pp.BusinessEntityID = hre.BusinessEntityID


/*
9) Una librería almacena la información de sus libros para la venta en dos tablas,
"libros" y "editoriales".

Creamos las tablas:

create table libros(
 codigo int identity,
 titulo varchar(40),
 autor varchar(30) default 'Desconocido',
 codigoeditorial tinyint not null,
 precio decimal(5,2)
);
create table editoriales(
 codigo tinyint identity,
 nombre varchar(20),
 primary key (codigo)
);
Ingresamos algunos registros en ambas tablas:

insert into editoriales values('Planeta');
insert into editoriales values('Emece');
insert into editoriales values('Siglo XXI');
insert into libros values('El aleph','Borges',2,20);
insert into libros values('Martin Fierro','Jose Hernandez',1,30);
insert into libros values('Aprenda PHP','Mario Molina',3,50);
insert into libros values('Java en 10 minutos',default,3,45);

*/

drop table libro

create table libros (

 codigo int identity,
 titulo varchar(40),
 autor varchar(30) default 'Desconocido',
 codigoeditorial tinyint not null,
 precio decimal(5,2),
 primary key (codigo)

);

create table editoriales(
 codigo tinyint identity,
 nombre varchar(20),
 primary key (codigo)
);

insert into editoriales values('Planeta');
insert into editoriales values('Emece');
insert into editoriales values('Siglo XXI');
insert into libros values('El aleph','Borges',2,20);
insert into libros values('Martin Fierro','Jose Hernandez',1,30);
insert into libros values('Aprenda PHP','Mario Molina',3,50);
insert into libros values('Java en 10 minutos',default,3,45);


/*
9.1) Realizar un join para obtener datos de ambas tablas (titulo, autor y nombre de la
editorial)
*/

select
		l.titulo tituloLibro, 
		l.autor autorLibro,
		e.nombre nombreEditorial
from	
		libros l inner join editoriales e
		on l.codigoeditorial = e.codigo
order by l.titulo

/*
9.2) Mostrar el código del libro, título, autor, nombre de la editorial y el precio
realizando un join y empleando alias
*/

select
		l.titulo tituloLibro, 
		l.autor autorLibro,
		e.nombre nombreEditorial
from	
		libros l inner join editoriales e
		on l.codigoeditorial = e.codigo
order by l.titulo




/*
9.3) Realizar la misma consulta anterior pero solamente para obtener los libros de la
editorial "Siglo XXI"
*/

select
		l.codigo codigoLibro,
		l.titulo tituloLibro, 
		l.autor autorLibro,
		l.precio precioLibro,
		e.nombre nombreEditorial
from	
		libros l inner join editoriales e
		on l.codigoeditorial = e.codigo
where e.nombre like ('Siglo XXI')
order by l.autor

/*
9.4) Obtener título, autor y nombre de la editorial, ordenados por título
*/

select
		l.titulo tituloLibro, 
		l.autor autorLibro,
		e.nombre nombreEditorial
from	
		libros l inner join editoriales e
		on l.codigoeditorial = e.codigo
order by l.titulo

/*
10.1) Contar la cantidad de libros de cada editorial consultando ambas tablas
*/

select 
	count(l.titulo) cantidadLibros,
	e.nombre nombreEditorial

from	
	libros l inner join editoriales e
	on l.codigoeditorial = e.codigo
group by e.nombre



/*
10.2) Obtener el libro más costoso de cada editorial
*/

select
	max(l.precio) libroCaro,
	e.nombre nombreEditorial

from	
	libros l inner join editoriales e
	on l.codigoeditorial = e.codigo
group by e.nombre
order by libroCaro desc

/*
Laboratorio Tablas Temporales
1)Clonar estructura y datos de los campos nombre, color y precio de lista de la
tabla production.product en una tabla llamada #Productos
SQL tablas:Production.Product
MySQL Product
campos: Name, ListPrice, Color
*/

select
	Name nombre, 
	ListPrice precioLista, 
	Color
into #Productos
from 
	Production.Product

select * from #Productos
 
 /*
 2)Clonar solo estructura de los campos identificador, nombre y apellido de la tabla
person.person en una tabla llamada #Personas
SQL tablas: Person.Person
MySQL tablas: contact
campos: BusinessEntityID, FirstName, LastName
*/

select
	BusinessEntityID identificador, 
	FirstName nombre, 
	LastName apellido
into #Personas
from 
	Person.Person


/*
ej 3
*/

select * from #Personas

drop table if exists #Productos 

/*
Laboratorio SUBCONSULTA
1) Listar todos los productos cuyo precio sea inferior al precio promedio de todos los
productos
SQL tabla: Production.Product // MySQL tabla: Product
campos: Name, ListPrice
*/


select 
	Name nombreProducto,
	ListPrice precioProducto
from Production.Product
where ListPrice < (select avg(ListPrice) from Production.Product)


/*
2) Listar el nombre, precio de lista, precio promedio y diferencia de precios entre cada
producto y el valor promedio general
SQL tabla: Production.Product // MySQL tabla: Product
campos: Name, ListPrice
*/

select	
	Name Nombre,
	ListPrice PrecioProducto,
	(select
			avg(ListPrice)
	 from
			Production.Product) Promedio,
	(ListPrice -(select
			avg(ListPrice)
	 from
			Production.Product)) diferencia	
from Production.Product


/*
3) Mostrar el o los códigos del producto mas caro
SQL tabla: Production.Product // MySQL tabla: Product
campos: ProductID,ListPrice
*/



select
	ProductID codigoProducto,
	ListPrice precioCaro
from 
	Production.Product
where ListPrice = (select
						max(ListPrice) 
					from 
						Production.Product
					)

/*
4) Mostrar el producto más barato de cada subcategoría. mostrar subcategoría, código
de producto y el precio de lista más barato ordenado por subcategoría
SQL tabla: Production.Product // MySQL tabla: Product
campos: ProductSubcategoryID, ProductID, ListPrice
*/

select
	ProductSubcategoryID subCategoria,
	ProductID codigoProducto,
	ListPrice precioBajo
from 
	Production.Product
where ListPrice = (select
						min(ListPrice)
					from 
						Production.Product
					) 

/*
Laboratorio SUBCONSULTA con EXISTS – NOT EXISTS
Administración de Bases de Datos
Información Privada Administración de Bases de Datos |Instituto de Formación Técnica Superior Nro. 11 3
1) Mostrar los nombres de todos los productos presentes en la subcategoría de
ruedas
SQL tablas:Production.Product, Production.ProductSubcategory
MySQL tablas: Product, ProductSubcategory
campos: ProductSubcategoryID, Name
*/

select
	Name Nombre,
	ProductSubcategoryID CodigoSubCategoria
from 
	Production.Product  pp
where exists
			(select
					Name
			from	
				Production.ProductSubcategory pps
			where pp.ProductSubcategoryID = pps.ProductSubcategoryID and Name like('wheels')
			)



/*
2) Mostrar todos los productos que no fueron vendidos
SQL tablas:Production.Product, Sales.SalesOrderDetail
MySQL tablas: Product, SalesOrderDetail
campos: Name, ProductID
*/

select
		Name Nombre
from 
	Production.Product pp
where not exists (select	
						ProductID	
				  from
						Sales.SalesOrderDetail sso
					where pp.ProductID = sso.ProductID	)

/*
3) Mostrar la cantidad de personas que no son vendedores
SQL tablas: Person.Person, Sales.SalesPerson
MySQL tablas: contact, SalesPerson
campos: BusinessEntityID
*/

select
	count(BusinessEntityID) CantidadDeNoVendedores
from	
	Person.Person pp
where not exists (select
						BusinessEntityID
				  from Sales.SalesPerson ssp
				  where ssp.BusinessEntityID = pp.BusinessEntityID)


/*
4) Mostrar todos los vendedores (nombre y apellido) que no tengan asignado un
territorio de ventas
SQL tablas: Person.Person, Sales.SalesPerson
MySQL tablas: contact, SalesPerson
campos: BusinessEntityID, TerritoryID, LastName, FirstName
*/

select
	concat(FirstName, ' ', LastName) NombreApellido
from
	Person.Person pp	
where not exists (select
						TerritoryID
				  from
						Sales.SalesPerson ssp
			where ssp.BusinessEntityID = pp.BusinessEntityID)

/*Laboratorio SUBCONSULTA con IN Y NOT IN
1) Mostrar las órdenes de venta que se hayan facturado en territorio de estado
unidos únicamente 'us'
SQL tablas: Sales.SalesOrderHeader, Sales.SalesTerritory
campos: CountryRegionCode, TerritoryID*/

select * from Sales.SalesOrderHeader
select * from Sales.SalesTerritory

select 
	SalesOrderID ordenVenta	
from 
	Sales.SalesOrderHeader 
where 
	TerritoryID in (select
						TerritoryID
					from
						Sales.SalesTerritory 
					where 
						CountryRegionCode like ('%us%'))



/*2) Al ejercicio anterior agregar ordenes de Francia e Inglaterra
SQL tablas: Sales.SalesOrderHeader, Sales.SalesTerritory
campos: CountryRegionCode, TerritoryID*/

select 
	SalesOrderID ordenVenta,
	TerritoryID
from 
	Sales.SalesOrderHeader 
where 
	TerritoryID in (select
						TerritoryID
					from
						Sales.SalesTerritory sst
					where 
						CountryRegionCode = 'us' or CountryRegionCode = 'fr' or CountryRegionCode = 'gb')

/*3) Mostrar los nombres de los diez productos más caros
SQL tablas:Production.Product 
campos:		ListPrice*/

select 
	ListPrice
from	
	Production.Product 
where 
	ListPrice in (select top 10
						ListPrice
					from	
						Production.Product
					order by 
						ListPrice desc) 



/*4) Mostrar aquellos productos cuya cantidad de pedidos de venta sea igual o
superior a 20
SQL tablas:Production.Product, Sales.SalesOrderDetail
MySQL tablas: Product, SalesOrderDetail*/

/*Laboratorio INSERT, UPDATE Y DELETE
1) Clonar estructura y datos de los campos id, nombre, color y precio de lista de la tabla
production.product en una tabla llamada Productos
SQL tablas: Production.Product 
campos: Name, Color, ListPrice*/

select Name, Color, ListPrice
into #Productos
from Production.Product 

/*2) Aumentar un 20% el precio de lista de todos los productos
tablas: Produccion
campos: ListPrice*/

select * from #Productos

update #Productos set ListPrice = ListPrice *1.2

3) Aumentar un 20% el precio de lista de los productos del proveedor 1540
SQL tablas: Productos, Purchasing.ProductVendor
campos: ProductID, ListPrice, BusinessEntityID

select
	ListPrice 
from 	Purchasing.ProductVendor
	
	BusinessEntityID

4) Eliminar los productos cuyo precio es igual a cero
tablas: Productos
campos: ListPrice
5) Insertar un producto dentro de la tabla productos.
tener en cuenta los siguientes datos.
el color de producto debe ser rojo, el nombre debe ser "bicicleta mountain bike"
y el precio de lista debe ser de 4000 pesos.
tablas:productos
campos: Color,Name, ListPrice
6) Aumentar en un 15% el precio de los pedales de bicicleta
tablas: productos
campos: Name, ListPrice
7) Eliminar de las productos cuyo nombre empiece con la letra m
tablas: productos
campos: Name
Administración de Bases de Datos
Información Privada Administración de Bases de Datos |Instituto de Formación Técnica Superior Nro. 11 6
8) Borrar todo el contenido de la tabla productos sin utilizar la instrucción delete.
tablas: productos
9) Eliminar tabla productos
tablas: productos
10) Trabajamos con la tabla "libros" de una librería
Eliminamos la tabla, si existe y la creamos:
create table libros(
 codigo int identity,
 titulo varchar(40),
 autor varchar(30),
 editorial varchar(20),
 precio decimal(5,2)
);
Ingresamos los siguientes registros:
insert into libros values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',20.00);
insert into libros values('Alicia en el pais de las maravillas','Lewis Carroll','Plaza',35.00);
insert into libros values('Aprenda PHP','Mario Molina','Siglo XXI',40.00);
insert into libros values('El aleph','Borges','Emece',10.00);
insert into libros values('Ilusiones','Richard Bach','Planeta',15.00);
insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI',50.00);
insert into libros values('Martin Fierro','Jose Hernandez','Planeta',20.00);
Administración de Bases de Datos
Información Privada Administración de Bases de Datos |Instituto de Formación Técnica Superior Nro. 11 7
insert into libros values('Martin Fierro','Jose Hernandez','Emece',30.00);
insert into libros values('Uno','Richard Bach','Planeta',10.00);
10.1) Obtener el título, precio de un libro específico y la diferencia entre su precio y el
máximo valor
10.2) Mostrar el título y precio del libro más costoso
10.3) Actualizar un 20% el precio del libro con máximo valor
10.4) Eliminamos los libros con precio menor

