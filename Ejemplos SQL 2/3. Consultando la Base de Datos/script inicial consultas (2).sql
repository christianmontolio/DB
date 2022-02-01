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
(fecha,tipo,idCliente)
values('20170207',1,1)
insert into compra 
(fecha,tipo,idCliente)
values('20170207',1,1)
insert into compra 
(fecha,tipo,idCliente)
values('20170205',1,2)

insert into compra 
(fecha,tipo,idCliente)
values('20170205',1,6)

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

select * from cliente 
select * from compra 

 
