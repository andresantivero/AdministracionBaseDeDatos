/*
Laboratorio BETWEEN
1) Mostrar todos los productos cuyo precio de lista esté entre 200 y 300.
SQL tabla: Production.Product
MySQL tabla: product
campos: ListPrice
*/

select 
		ListPrice 
from 
		Production.Product
where 
		ListPrice between 200 and 300

/*
2) Mostrar todos los empleados que nacieron entre 1970 y 1985.
SQL tabla: HumanResources.Employee
MySQL tabla: employee
campos: BirthDate
*/

select 
		BirthDate
from 
		HumanResources.Employee
where 
		year(BirthDate) between 1970 and 1985

/*
3) Mostrar el la fecha,numero de version y subtotal de las ventas efectuadas en los años
2000 y 2006.
SQL tabla:Sales.SalesOrderHeader
MySQL tabla: SalesOrderHeader
campos: OrderDate, AccountNumber, SubTotal
*/

select 
		OrderDate,
		AccountNumber, 
		SubTotal
from 
		Sales.SalesOrderHeader
where 
		year(OrderDate) between 2011 and 2014

/*
4) Mostrar todos los productos cuyo precio de lista no esté entre 50 y 70.
SQL tabla: Production.Product
MySQL tabla: product
campos: ListPrice
*/

select 
		ListPrice
from 
		Production.Product
where 
		ListPrice not between 50 and 70

/*
Laboratorio IN
1) Mostrar los códigos de venta y producto, cantidad de venta y precio unitario de los
artículos 750, 753 y 770.
SQL tablas: Sales.SalesOrderDetail
MySQL tabla: SalesOrderDetail
campos: SalesOrderID, ProductID, OrderQty, UnitPrice
*/

select 
		SalesOrderID, 
		ProductID, 
		OrderQty, 
		UnitPrice
from 
		Sales.SalesOrderDetail
where 
		ProductID in (750, 753, 770)

/*
2) Mostrar todos los productos cuyo color no sea verde, blanco y azul.
SQL tabla: Production.Product
MySQL tabla: product
campos: Color
*/

select 
		Color 
from 
		Production.Product
where 
		Color not in ('Green', 'White', 'Blue')

/*
Laboratorio NULL
1) Mostrar los representantes de ventas (vendedores) que no tienen definido el número
de territorio.
SQL tablas: Sales.SalesPerson
MySQL tabla: SalesPerson
campos: BusinessEntityID, TerritoryID
*/

select 
		BusinessEntityID, 
		TerritoryID
from 
		Sales.SalesPerson
where	
		TerritoryID is null

/*
2) Mostrar el peso de todos los artículos. si el peso no estuviese definido, reemplazar
por cero.
SQL tabla: Production.Product
MySQL tabla: product
campos: Weight
*/

select 
		isnull(Weight, 0) peso
from 
		Production.Product


/*
Laboratorio Funciones de Agregado

1) Mostrar la fecha más reciente de venta
SQL Tabla: Sales.SalesOrderHeader
MySQL Tabla: SalesOrderHeader
Campos: OrderDate
*/

select top 1 
		OrderDate FechaDeVenta
from	
		Sales.SalesOrderHeader
Order by 
		OrderDate desc

		
/*
2) Mostrar el precio más barato de todas las bicicletas
SQL Tabla: Production.Product
MySQL Tabla: Product
Campos: ListPrice, Name
*/

select top 1
		ListPrice PrecioLista,
		Name Nombre
from		
		Production.Product
where	
		Name like ('%bike%')
order by
		ListPrice

/*
3) Mostrar la fecha de nacimiento del empleado más joven
SQL Tabla: HumanResources.Employee
MySQL Tabla: Employee
Campos: BirthDate
*/

select top 1
		BirthDate FechaDeNacimiento
from
		HumanResources.Employee
order by 
		BirthDate desc

/*
4) Mostrar el promedio del listado de precios de productos
SQL Tabla: Production.Product
MySQL Tabla: Product
Campos: ListPrice
*/

select
	avg(ListPrice) PrecioPromedio
from 
	Production.Product

/*
5) Mostrar la cantidad y el total vendido por productos
SQL Tabla: Sales.SalesOrderDetail
MySQL Tabla: SalesOrderDetail
Campos: LineTotal, OrderQty
*/

select * from
	Sales.SalesOrderDetail

select
	ProductID Producto,
	sum(LineTotal) TotalVendido,
	sum(OrderQty) CantidadVendida
from
	Sales.SalesOrderDetail
group by 
	ProductID 

/*
AGRUPAMIENTO
1) Mostrar el código de subcategoría y el precio del producto más barato de cada una
de ellas
SQL Tabla: Production.Product
MySQL Tabla: Product
Campos: ProductSubcategoryID, ListPrice
*/

select 
	ProductSubcategoryID as CodigoSubcategoria, 
	min(ListPrice) as PrecioMinimo
from
	Production.Product
group by
	ProductSubcategoryID 

/*
2) Mostrar los productos y la cantidad total vendida de cada uno de ellos
SQL Tabla: Sales.SalesOrderDetail
MySQL Tabla: SalesOrderDetail
Campos: ProductID, OrderQty
*/

select
	ProductID as CodigoProducto, 
	sum(OrderQty) as CantidadTotalVendida
from
	Sales.SalesOrderDetail
group by
	ProductID
order by
	ProductID 

/*
3)Mostrar los productos y el total vendido de cada uno de ellos, ordenarlos por el total
vendido
SQL Tabla: Sales.SalesOrderDetail
MySQL Tabla: SalesOrderDetail
Campos: ProductID, LineTotal
*/

select
	ProductID CodigoProducto,
	sum(LineTotal) PrecioTotal
from
	Sales.SalesOrderDetail
group by 
	ProductID
order by
	ProductID

/*
4) Mostrar el promedio vendido por factura.
SQL Tabla: Sales.SalesOrderDetail
MySQL Tabla: SalesOrderDetail
Campos: SalesOrderID, LineTotal
*/

select 
	SalesOrderID as NumeroFactura,
	avg(LineTotal) as PromedioPorFactura
from
	Sales.SalesOrderDetail
group by
	SalesOrderID
order by
	PromedioPorFactura


/*
5) Trabajamos con la tabla "libros" de una librería
Creamos la tabla:
*/

drop table libros

create table libros(
 codigo int identity,
 titulo varchar(40),
 autor varchar(30),
 editorial varchar(15),
 precio decimal(5,2),
 cantidad tinyint,
 constraint pk_codigo_libros primary key(codigo)
);

/*
Ingresamos algunos registros:
*/

insert into libros values('El aleph','Borges','Planeta',15,null);
insert into libros values('Martin Fierro','Jose Hernandez','Emece',22.20,200);
insert into libros values('Antologia poetica','J.L. Borges','Planeta',null,150);
insert into libros values('Aprenda PHP','Mario Molina','Emece',18.20,null);
insert into libros values('Cervantes y el quijote','Bioy Casares- J.L.
Borges','Paidos',null,100);
insert into libros values('Manual de PHP', 'J.C. Paez', 'Siglo XXI',31.80,120);
insert into libros values('Harry Potter y la piedra filosofal','J.K.
Rowling',default,45.00,90);
insert into libros values('Harry Potter y la camara secreta','J.K.
Rowling','Emece',null,100);
insert into libros values('Alicia en el pais de las maravillas','Lewis
Carroll','Paidos',22.50,200);
insert into libros values('PHP de la A a la Z',null,null,null,0);

/*
5.1) Obtener la cantidad de libros de cada editorial
*/


select * from libros

select
	isnull(editorial, 'sin editorial') as editoriales,
	count(titulo) as cantidadLibros
from		
	libros
group by
	editorial

select 
	isnull(editorial, 'desconocido') as editoriales,
	count(codigo) as CantidadLibros
from
	libros
group by
	editorial

/*
5.2) Conocer el total en dinero de los libros agrupados por editorial
*/

select * from libros

select 
	isnull(editorial, 'desconocido') as editoriales,
	sum(isnull(precio, 0)) as PrecioTotal
from 
	libros
group by 
	editorial

select	
	isnull(editorial, 'edit. desc.') editoriales,
	sum(precio) PrecioTotalLibros
from
	libros
 
group by editorial

/*
5.3) Obtenemos el máximo y mínimo valor de los libros agrupados por editorial
*/


select 
	isnull(editorial, 'edit. desc.') editoriales,
	min(precio) precioMin,
	max(precio) precioMax
from
	libros
group by 
	editorial


select
	isnull(editorial, 'edit. desc.') Editoriales,
	min(precio) PrecioMinimo,
	max(precio) PrecioMaximo
from
	libros
group by 
	editorial

/*
5.4) Calcular el promedio del valor de los libros agrupados por editorial
*/

select
	isnull(editorial, 'edit. desc.') Editoriales,
	avg(precio) PromedioLibros
from
	libros
group by
	editorial

/*
5.5) Contar y agrupar por editorial considerando solamente los libros cuyo precio es
menor a 30 pesos
*/

select
	isnull(editorial, 'edit. desc.') Editoriales,
	count(titulo) CantidadDeLibrosPorEditorial	
from 
	libros
where 
	precio < 30
group by
	editorial

	

/*
HAVING
1) Mostrar todas las facturas realizadas y el total facturado de cada una de ellas
ordenado por número de factura pero sólo de aquellas órdenes superen un total de
$10.000
SQL Tabla: Sales.SalesOrderDetail
MySQL Tabla: SalesOrderDetail
Campos: SalesOrderID, LineTotal
*/

select
	SalesOrderID Facturas, 
	sum(LineTotal) Total
from	
	Sales.SalesOrderDetail
group by
	SalesOrderID
having 
	sum(LineTotal) > 10000
order by
	Total

/*
2) Mostrar la cantidad de facturas que vendieron más de 20 unidades
SQL Tabla: Sales.SalesOrderDetail
MySQL Tabla: SalesOrderDetail
Campos: SalesOrderID, OrderQty
*/

select
	SalesOrderID CantidadFacturasMayoresVeinte,
	sum(OrderQty) VentaMAyorVeinte
from
	Sales.SalesOrderDetail
group by 
	SalesOrderID
having
	sum(OrderQty) > 20

/*
3) Mostrar las subcategorías de los productos que tienen dos o más productos que
cuestan menos de $150
SQL Tabla: Production.Product
MySQL Tabla: Product
Campos: ProductSubcategoryID, ListPrice
*/

select 
	count(ProductSubcategoryID) subcategorias, 
	sum(ListPrice) precioLista
from
	Production.Product
group by
	ProductSubcategoryID
having
	count(ProductSubcategoryID) >= 2 and sum(ListPrice) > 150
	


/*
4) Mostrar todos los códigos de categorías existentes junto con la cantidad de
productos y el precio de lista promedio por cada uno de aquellos productos que
cuestan más de $ 70 y el precio promedio es mayor a $ 300.
SQL Tabla: Production.Product
MySQL Tabla: Product
Campos: ProductSubcategoryID, ListPrice
*/

select 
	ProductSubcategoryID SubcategoriaProductoID,
	avg(ListPrice) PrecioLista
from 
	Production.Product
group by 
	ListPrice
having
	ListPrice > 70 and avg(ListPrice) > 300


/*Laboratorio Like
1) Mostrar el nombre, precio y color de los accesorios para asientos (Seat) de las
bicicletas cuyo precio sea mayor a 100 pesos.
SQL tabla: Production.Product
MySQL tabla: Product
campos: Name, ListPrice, Color*/

select
	Name as Nombre,
	ListPrice as PrecioLista,
	Color as Color
from
	Production.Product
where
	Name like ('%Seat%') and ListPrice > 100

/*2) Mostrar los nombre de los productos que tengan cualquier combinación de
'mountain bike'.
SQL tabla: Production.Product
MySQL tabla: Product
campos: Name*/

select 
	Name as Nombre
from
	Production.Product
where
	Name like ('%mountain bike%')

/*3) Mostrar las personas que su nombre empiece con la letra 'y'.
SQL tabla:Person.Person
MySQL tabla: contact
campos: FirstName*/

select
	FirstName as Nombre
from
	Person.Person
where
	FirstName like ('y%')

/*4) Mostrar las personas que la segunda letra de su apellido es una s.
SQL tabla:Person.Person
MySQL tabla: contact
campos: LastName*/

select
	LastName
from
	Person.Person
where
	LastName like ('_s%')

/*5) Mostrar el nombre concatenado con el apellido de las personas cuyo apellido tengan
terminación española (ez).
SQL tabla:Person.Person
MySQL tabla: contact
campos: FirstName,LastName*/

select 
	concat(FirstName, ' ', LastName) as NombreApellido
from
	Person.Person
where
	LastName like ('%ez')

/*6) Mostrar los nombres de los productos que terminen en un número.
SQL tabla: Production.Product
MySQL tabla: Product
campos: Name*/

select
	Name as Nombre
from	
	Production.Product
where
	Name like ('%[0-9]')

/*7) Mostrar las personas cuyo nombre tenga una C o c como primer carácter, cualquier
otro como segundo carácter, ni d ni e ni f ni g como tercer carácter, cualquiera entre j y
r o entre s y w como cuarto carácter y el resto sin restricciones.
SQL tabla:Person.Person
MySQL tabla: contact
campos: FirstName*/

select
	FirstName as Nombre
from
	Person.Person
where
	FirstName like ('c_[^d-g][j-w]%')


/*Laboratorio OPERADORES
1) Mostrar los empleados que tienen más de 90 horas de vacaciones.
SQL tabla: HumanResources.Employee
MySQL tabla: Employee
campos: VacationHours*/

select
	BusinessEntityID as CodigoEmpleado,
	VacationHours as HorasVacaciones	
from
	HumanResources.Employee
where
	VacationHours > 90

/*2) Mostrar el nombre, precio y precio con iva de los productos con precio distinto de
cero.
SQL tabla: Production.Product
MySQL tabla: product
campos: Name, ListPrice*/

select
	Name as NombreProducto, 
	ListPrice as PrecioLista,
	(ListPrice * 1.21) as PrecioConIva
from
	Production.Product

/*3) Mostrar precio y nombre de los productos 776, 777, 778.
SQL tabla: Production.Product
MySQL tabla: product
campos: ProductID, Name, ListPrice*/

select
	ProductID as CodigoProducto, 
	Name as NombreProducto,
	ListPrice as PrecioProducto
from
	Production.Product
where
	ProductID >= 776 and ProductID <= 778


/*4) Mostrar el nombre concatenado con el apellido de las personas cuyo apellido sea
johnson.
SQL tabla: Person.Person
MySQL tabla: contact
campos: FirstName, LastName*/

select
	concat(FirstName, ' ', LastName) as NombreApellidoJohnson
from
	Person.Person
where
	LastName = 'johnson'

/*5) Mostrar todos los productos cuyo precio sea inferior a 150$ de color rojo o cuyo
precio sea mayor a 500$ de color negro.
SQL tabla: Production.Product
MySQL tabla: product
campos: ListPrice, Color*/

select
	ListPrice as PrecioLista,
	Color as Color
from
	Production.Product
where
	(ListPrice < 150 and Color = 'Red') or (ListPrice > 500 and Color = 'Black')

/*6) Mostrar el código, fecha de ingreso y horas de vacaciones de los empleados
ingresaron a partir del año 2000.
SQL tabla: HumanResources.Employee
MySQL tabla: Employee
campos: BusinessEntityID, HireDate, VacationHours*/

select
	BusinessEntityID as CodigoEmpleado,
	HireDate as FechaContratacion,
	VacationHours as HorasVacaciones
from	
	HumanResources.Employee
where
	year(HireDate) > 2000 

select
	BusinessEntityID as CodigoEmpleado,
	HireDate as FechaContratacion,
	VacationHours as HorasVacaciones
from	
	HumanResources.Employee
where
	HireDate >= '2000-01-01'

/*7) Mostrar el nombre, número de producto, precio de lista y el precio de lista
incrementado en un 10% de los productos cuya fecha de fin de venta sea anterior al día
de hoy.
SQL tabla: Production.Product
MySQL tabla: product
campos: Name, ProductNumber, ListPrice, SellStartDate*/

select
	Name as NombreProducto,
	ProductNumber as NumeroProducto, 
	ListPrice as PrecioLista,
	(ListPrice * 1.1) as PrecioListaAumentado,
	SellStartDate as Fecha
from	
	Production.Product
where
	SellStartDate < '2012-11-21'

/*Laboratorio ORDER BY
1) Mostrar las personas ordenadas primero por su apellido y luego por su nombre
SQL Tabla: Person.Person
MySQL Tabla: contact
Campos: Firstname, Lastname*/

select
	Lastname as Apellido,
	Firstname as Nombre	
from
	Person.Person
order by
	Lastname, Firstname 

/*2) Mostrar cinco productos más caros y su nombre ordenado en forma alfabética
SQL Tabla: Production.Product
MySQL Tabla: Product
Campos: Name, ListPrice*/

select top 5
	ListPrice as PrecioLista,
	Name as NombreProducto
from
	Production.Product
order by
	ListPrice desc

/*3) Trabajamos con la tabla "libros" de una librería.
 Eliminamos la tabla si existe
Creamos la tabla:*/

drop table if exists libros

create table libros(
codigo int identity,
titulo varchar(40) not null,
autor varchar(20) default 'Desconocido',
editorial varchar(20),
precio decimal(6,2),
primary key (codigo)
);

/*Ingresamos algunos registros:*/

insert into libros (titulo,autor,editorial,precio) values('El aleph','Borges','Emece',25.33);
insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI',50.65);
insert into libros (titulo,autor,editorial,precio) values('Alicia en el pais de las
maravillas','Lewis Carroll','Emece',19.95);
insert into libros (titulo,autor,editorial,precio) values('Alicia en el pais de las
maravillas','Lewis Carroll','Planeta',15)

/*3.1) Recuperamos los registros ordenados por el título*/

select * from libros
order by titulo

/*3.2) Ordenamos los registros por el campo "precio"*/

select * from libros
order by precio

3.3) Los ordenamos por "editorial", de mayor a menor empleando

select * from libros
order by editorial desc

3.4) Ordenamos por dos campos, titulo en forma alfabetica y editorial en forma
descendente.*/

select * from libros
order by titulo, editorial desc


/*Laboratorio DISTINCT, UNION, CASE
1) Mostrar los diferentes productos vendidos
SQL Tabla: Sales.SalesOrderDetail
MySQL Tabla: SalesOrderDetail
Campos: ProductID*/

select distinct
	ProductID as CodigoProducto
from	
	Sales.SalesOrderDetail

/*UNION
2) Mostrar todos los productos vendidos y ordenados
SQL Tablas: Sales.SalesOrderDetail, Production.WorkOrder
MySQL Tablas: SalesOrderDetail, WorkOrder
Campos: ProductID*/

select
	ProductID
from
	Sales.SalesOrderDetail
union all
select
	ProductID
from
	Production.WorkOrder


/*3) Mostrar los diferentes productos vendidos y ordenados
SQL Tablas: Sales.SalesOrderDetail, Production.WorkOrder
MySQL Tablas: SalesOrderDetail, WorkOrder
Campos: ProductID*/

select
	ProductID
from
	Sales.SalesOrderDetail
union
select
	ProductID
from
	Production.WorkOrder

/*CASE
4) Obtener el id y una columna denominada sexo cuyo valores disponibles sean
“Masculino” y ”Femenino”
SQL Tabla: HumanResources.Employee
MySQL Tabla: Employee
Campos: BusinessEntityID, Gender*/

select	
	BusinessEntityID as CodigoEmpleado,
	Genero = case Gender
				when 'f' then 'Femenino'
				when 'm' then 'Masculino'
			 end
from	
	HumanResources.Employee

select
	LastName,
	TerritoryName,
	CountryRegionName
from
	Sales.vSalesPerson
where
	TerritoryName is not null
order by
	case CountryRegionName when 'United States' then TerritoryName
	else CountryRegionName 
	end

/*5) Mostrar el id de los empleados si tiene salario deberá mostrarse descendente de
lo contrario ascendente
SQL Tabla: HumanResources.Employee
MySQL Tabla: Employee
Campos: BusinessEntityID, SalariedFlag
*/

select 
	BusinessEntityID,	
	SalariedFlag
from
	HumanResources.Employee
order by
	case SalariedFlag when 1 then BusinessEntityID end desc,
	case SalariedFlag when 0 then BusinessEntityID end

/*6) Trabajamos con la tabla "libros" de una librería.
 Eliminamos la tabla si existe
Creamos la tabla:*/

drop table if exists libros

create table libros(
 codigo int identity,
 titulo varchar(40),
 autor varchar(30),
 editorial varchar(15),
 primary key(codigo)
);

/*Ingresamos alguos registros:*/

insert into libros values ('El aleph','Borges','Planeta');
insert into libros values ('Martin Fierro','Jose Hernandez','Emece');
insert into libros values ('Martin Fierro','Jose Hernandez','Planeta');
insert into libros values('Antologia poetica','Borges','Planeta');
insert into libros values('Aprenda PHP','Mario Molina','Emece');
insert into libros values('Aprenda PHP','Lopez','Emece');
insert into libros values('Manual de PHP', 'J. Paez', null);
insert into libros values('Cervantes y el quijote',null,'Paidos');
insert into libros values('Harry Potter y la piedra filosofal','J.K. Rowling','Emece');
insert into libros values('Harry Potter y la camara secreta','J.K. Rowling','Emece');
insert into libros values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos');
insert into libros values('Alicia en el pais de las maravillas','Lewis Carroll','Planeta');
insert into libros values('PHP de la A a la Z',null,null);
insert into libros values('Uno','Richard Bach','Planeta');

/*6.1) obtener la lista de autores sin repetición*/

select distinct
	autor
from	
	libros

/*6.2) obtener los nombres de las editoriales sin repetir*/

select distinct
	editorial
from	
	libros

/*6.3) obtener los distintos autores de la editorial "Planeta"*/


select distinct
	autor
from 
	libros
where
	editorial = 'Planeta'


/*6.4) Mostrar los títulos y editoriales de los libros sin repetir títulos ni editoriales,
ordenados por titulos.*/

select distinct
	titulo,
	editorial
from 
	libros


