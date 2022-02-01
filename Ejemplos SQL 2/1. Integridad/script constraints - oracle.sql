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
;
drop table cliente 
;

create table Cliente
(
	IdCliente int not null,
	Nombre varchar(40),
	Cedula char(20) not null,
	constraint pk_cliente primary key(IdCliente)
)
;
alter table cliente drop primary key  
;
alter table cliente add constraint pk_cliente
    primary key(IdCliente)

;
create unique index idx_cliente on cliente(cedula)
;
drop table cuenta
;
create table Cuenta
(
   IdCuenta int not null,
   IdCliente int not null,
   Balance decimal(13,2),
   Estado int

)
;
alter table cuenta add constraint
 pk_cuenta primary key(idcuenta)
;
alter table cuenta add constraint
ck_cuenta_estado check( estado in(0,1))
;
alter table cuenta add constraint 
 fk_cuenta_cliente foreign key(idcliente)
 references cliente(idcliente)
;
insert into cliente 
values(2,'carlos','01')
;
insert into cuenta 
values(2,1,0,1)
;
alter table cuenta drop  constraint fk_cuenta_cliente
;
 
  


