create table Cliente
(   IdCliente int not null primary key,
	Nombre varchar(40),
	Cedula char(20) not null)
    
describe cliente;

drop table cliente;

create table Cliente
(
	IdCliente int not null,
	Nombre varchar(40),
	Cedula char(20) not null,
	constraint pk_cliente primary key(IdCliente) 
);

alter table cliente drop constraint pk_cliente;

alter table cliente add constraint pk_cliente
	primary key(IdCliente);
    
create unique index idx_cliente on cliente(cedula);

create table Cuenta
(
   IdCuenta int not null,
   IdCliente int not null,
   Balance decimal(13,2),
   Estado int
);