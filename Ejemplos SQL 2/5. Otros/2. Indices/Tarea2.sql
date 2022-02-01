--CHRISTIAN MONTOLIO 2017-4934
--SQL SERVER
--NOTA: INDICES SE ENCUENTRAN AL FINAL


--CREACION DE BASE DE DATOS Y TABLAS PARA EL TRABAJO POSTERIOR DE LOS INDICES
create database tarea_2
use tarea_2

create table empleados
(id int, 
nombre varchar(20), 
apellido varchar(20),
cedula varchar(15)
)
insert into empleados values
	(1,'Maria','Anders','030-0074321-8'),
	(2,'Ana','Trujillo','254-5554729-4'),
	(3,'Antonio','Moreno','694-5139321-4'),
	(4,'Thomas','Hardy','(271-9555778-8'),
	(5,'Christina','Berglund','092-1123465-4'),
	(6,'Hanna','Moos','062-9108460-0'),
	(7,'Frédérique','Citeaux','885-6015311-1'),
	(8,'Martín','Sommer','859-1555228-2'),
	(9,'Laurence','Lebihan','912-4455404-8'),
	(10,'Elizabeth','Lincoln','604-5554729-9'),
	(11,'Victoria','Ashworth','171-3451212-7'),
	(12,'Patricio','Simpson','541-1358765-4'),
	(13,'Francisco','Chang','457-3392731-9'),
	(14,'Yang','Wang','045-2076545-8'),
	(15,'Pedro','Alfonso','911-7545857-6'),
	(16,'Elizabeth','Brown','171-9585628-2'),
	(17,'Steven','Ottlieb','024-1039123-7'),
	(18,'Janine','Labrune','409-6788588-9'),
	(19,'Ann','Devon','171-5152502-7'),
	(20,'juan','perez','001-4578945-9')


--TIPOS DE BUSQUEDAS

	--TABLE SCAN--
	select * from empleados

	--INDEX SCAN--
	create index idx_empleados on empleados(id)

	select id from empleados

	--INDEX SEEK--	
	select id from empleados
	where id=2

		drop index empleados.idx_empleados

	--CLUSTERED INDEX SCAN--

	Create clustered index idx_c_empleados on empleados(cedula)

	select * from empleados

		drop index empleados.idx_c_empleados