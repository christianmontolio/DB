create database base1
go
use base1
go
------------------------ Primary key, 
------------------------ Unique Index
------------------------ Check 
------------------------ Foreign key
create table Cliente
(
	IdCliente int not null primary key,
	Nombre varchar(40),
	Cedula char(20) not null
)
go
drop table cliente 
go

create table Cliente
(
	IdCliente int not null,
	Nombre varchar(40),
	Cedula char(20) not null,
	constraint pk_cliente primary key(IdCliente)
)
go
alter table cliente drop constraint pk_cliente
go
alter table cliente add constraint pk_cliente
    primary key(IdCliente)

go
create unique index idx_cliente on cliente(cedula)
go
create table Cuenta
(
   IdCuenta int not null,
   IdCliente int not null,
   Balance decimal(13,2),
   Estado int

)
go
alter table cuenta add constraint
 pk_cuenta primary key(idcuenta)
go
alter table cuenta add constraint
ck_cuenta_estado check( estado in(0,1))
go
alter table cuenta add constraint 
 fk_cuenta_cliente foreign key(idcliente)
 references cliente(idcliente)
go
insert into cliente 
values(2,'carlos','01')

insert into cuenta 
values(2,1,0,1)


select * from cuenta


begin transaction

update cuenta set balance = 1000
 where IdCuenta = 2

delete from cuenta 



rollback










 



go
 