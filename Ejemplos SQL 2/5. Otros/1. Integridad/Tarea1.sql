--CHRISTIAN MONTOLIO 2017-4934
--SQL SERVER
--NOTA: BLOQUE TRANSACCIONAL SE ENCUENTRA AL FINAL

create database Empresa_Transporte
use Empresa_Transporte

--CREACION DE TABLA "CHOFER"--
create table chofer
(
	id_chofer int not null,
	nombre varchar(30),
	apellido varchar(30),
	sexo char(1),
	licencia char(13) not null,
	constraint pk_chofer primary key(id_chofer),
	constraint ck_chofer_sex check(sexo in('f','m'))

)
create unique index idx_un_chofer on chofer(licencia)


--CREACION DE TABLA "VEHICULO"--
create table vehiculo
(
	id_vehiculo int not null,
	marca varchar(20),
	modelo varchar(30),
	matricula char(7) not null
	constraint pk_vehiculo primary key(id_vehiculo)
)
create unique index idx_un_vehiculo on vehiculo(matricula)


--CREACION DE TABLA "EMPAREJADOR"--
create table emparejador
(
	id_chofer int not null,
	id_vehiculo int not null,
	fecha_inicio date,
	fecha_fin date,
	hora_inicio time,
	hora_fin time,
	comentario varchar(150),
	constraint fk_emparejador1 foreign key(id_chofer) references chofer(id_chofer),
	constraint fk_emparejador2 foreign key(id_vehiculo) references vehiculo(id_vehiculo)
)
alter table emparejador add constraint
pk_emparejador primary key(id_chofer, id_vehiculo)
create unique index idx_un_emparejador on emparejador(id_vehiculo, fecha_inicio, fecha_fin, hora_inicio, hora_fin)


--INTRODUCCION DE DATOS-

insert into chofer
values(4231,'juan jose','perez ogando','m', '001-1452578-5'),
	  (3245, 'pedro arismendy', 'fernandez', 'm', '001-1445278-4'),
	  (4335, 'christian', 'montolio','m','402-7845296-5'),
	  (1543, 'laura','montolio','f','409-1465725-9'),
	  (5321, 'giselle', 'perez', 'f', '784-6795483-6'),
	  (9548,'juan','martinez','m','978-6485734-5'),
	  (3645,'veronica','jimenez','f','354-5487614-7'),
	  (9991,'federico','portorreal','m','645-7853654-5')

insert into vehiculo
values(101,'Hyundai','Sonata Y20','A547834'),
	  (102,'Toyota','Corolla 2010','Y453416'),
	  (103,'Toyota','Hilux 2016','G359714'),
	  (104,'Daihatsu','Delta 2008','F549129'),
	  (105,'Mack','GRANITE GU713','Z146784')

insert into emparejador
values(5321,102,GETDATE(),GETDATE(),'8:00','15:00',''),
	  (9548,103,GETDATE(),'2018-09-28','8:00','15:00',''),
	  (3645,102,GETDATE(),GETDATE(),'16:00','18:00',''),
	  (3245,102,GETDATE(),GETDATE(),'18:01','22:00',''),
	  (1543,101,GETDATE(),GETDATE(),'8:00','12:00',''),
	  (4335,104,'2018-10-04','2018-10-05','6:00','22:00','llevar electrodomesticos a santiago'),
	  (9991,105,'2018-10-01','2018-10-03','8:00','0:00','recoger contenedor en haina y hacer entrega de paquetes')

select c.nombre, c.apellido, v.marca, v.modelo, e.fecha_inicio, e.fecha_fin, e.hora_inicio, e.hora_fin, e.comentario 
from chofer c join emparejador e on(c.id_chofer= e.id_chofer)
join vehiculo v on(e.id_vehiculo= v.id_vehiculo) order by fecha_inicio

	 
---TRANSACCION--

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
Begin try
	Begin tran
		Update emparejador set id_chofer=9991, fecha_inicio='2018-10-02', fecha_fin='2018-10-02',
		hora_inicio='13:00', hora_fin='17:00', comentario='llevar a cabo mudanza, sto. dgo. este' 
		where id_vehiculo=104

		Update emparejador set id_chofer=4335 where id_vehiculo=105
		print'Datos Actualizados'
	commit
end try
begin catch
		rollback
		print'Error al actualizar: '+ERROR_MESSAGE()
end catch

select c.nombre, c.apellido, v.marca, v.modelo, e.fecha_inicio, e.fecha_fin, e.hora_inicio, e.hora_fin, e.comentario 
from chofer c join emparejador e on(c.id_chofer= e.id_chofer)
join vehiculo v on(e.id_vehiculo= v.id_vehiculo) order by fecha_inicio
