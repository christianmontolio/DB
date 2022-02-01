create database Establecimiento_Compra
use Establecimiento_Compra

Create table Producto
(
  IdProducto int not null primary key,
  Nombre varchar(60),
  Tipo int ,
  Precio decimal(13,2)
)
go
insert into producto
values(1,'Agua',1,100)
insert into producto
values(2,'Pollo',1,100)
insert into producto
values(3,'Clavo',1,300)

go
Create table Cliente
(
   IdCliente int not null primary key,
   Nombre varchar(60)
)
go
insert into cliente 
 values(1,'Carlos')
insert into cliente 
values(2,'Maria')
Insert into Cliente 
values(3,'Eika')

go
Create table Compra
(
   IdCompra int not null primary key,
   Fecha date ,
   Tipo int,
   Idcliente int not null
)
go
insert into compra 
(fecha,tipo,idCliente, IdCompra)
values('20170207',1,1,1)
insert into compra 
(fecha,tipo,idCliente, IdCompra)
values('20170207',1,1,2)
insert into compra 
(fecha,tipo,idCliente, IdCompra)
values('20170205',1,2,3)

insert into compra 
(fecha,tipo,idCliente,IdCompra)
values('20170205',1,6,4)

go
create table DetalleCompra
(
   IdCompra int not null,
   idProducto int not null,
   Precio decimal(13,2),
   Cantidad int,
   primary key(idCompra,idProducto)
)
go

insert into DetalleCompra
values(1,3,310,2),
	  (3,2,120,1)

select *, case
			when tipo=1 then
				'caro'
			when tipo=2 then
				'barato'
			end as 'El valor de tipo'
from Producto

select * from cliente 
select * from compra

						--TIPOS DE JOIN
--INNER JOIN--
select compra.*, cliente.Nombre from compra join cliente 
on compra.Idcliente=cliente.IdCliente

--OUTER JOIN--
--Left outer join
select compra.*, cliente.Nombre from compra left outer join cliente 
on compra.Idcliente=cliente.IdCliente

--Right outer join
select compra.*, cliente.Nombre from compra right outer join cliente 
on compra.Idcliente=cliente.IdCliente


						--SUBCONSULTA--
select compra.*,
	   (select cliente.Nombre
			from cliente
		where cliente.IdCliente=compra.Idcliente)
		as 'Nombre Cliente'
from compra

select compra.*
from compra
	where compra.Idcliente
		in(select cliente.IdCliente
					from cliente)


--a) total comprado por cliente
--b) los productos que compra cada cliente

select * from DetalleCompra

select * from compra
select * from cliente

select cliente.Nombre, producto.nombre, DetalleCompra.precio, DetalleCompra.Cantidad, sum(DetalleCompra.precio*DetalleCompra.cantidad) as total from cliente join compra 
on cliente.IdCliente=compra.Idcliente join DetalleCompra 
on compra.IdCompra=DetalleCompra.IdCompra join Producto on DetalleCompra.idProducto=Producto.IdProducto
Group by cliente.Nombre, producto.nombre, DetalleCompra.precio, DetalleCompra.Cantidad


select precio, cantidad, sum(precio*cantidad) as total from DetalleCompra
group by precio, cantidad

