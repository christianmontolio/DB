
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
(fecha,tipo,idCliente,IdCompra)
values('20170207',1,1,1)
insert into compra 
(fecha,tipo,idCliente,IdCompra)
values('20170207',1,1,2)
insert into compra 
(fecha,tipo,idCliente,IdCompra)
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

select * from producto 


select * , case 
             when tipo = 1 then 
			    'Caro'
			when tipo = 2 then 
			    'barato'
		   end as 'Tipo Producto'
  from Producto 

select * from cliente 
select * from compra 

-- inner / outer
select compra.* ,cliente.Nombre
  from compra 
 inner join cliente 
     on compra.Idcliente = cliente.IdCliente

select compra.* ,cliente.Nombre
  from compra 
 left outer join cliente 
     on compra.Idcliente = cliente.IdCliente
 
select compra.*,
  (select cliente.nombre 
      from cliente 
	  where cliente.IdCliente = compra.Idcliente )
	   as 'cliente'
  from compra 
  
select compra.*
  from compra 
  where compra.Idcliente 
        in (select cliente.IdCliente 
	              from cliente )
				   