create database dbg4
go
use dbg4
go
drop table empleado

create table empleado
(
   id int not null  ,
   nombre varchar(20),
   apellido varchar(20),
   fecha date
)

alter table empleado add constraint
  pk_Empleado primary key( id)

alter table empleado 
   drop constraint pk_empleado

create index idx_empleado on empleado(id)
create index idx2_empleado on empleado(nombre)

drop index empleado.idx_empleado
drop index empleado.idx2_empleado

create clustered index idx_empleado 
   on empleado(id)
 
create unique clustered index idx_empleado 
   on empleado(id)

create index idx2_empleado on 
  empleado ( nombre ) where id > 0

------------------------------------------

insert into empleado  values
(1,'Carlos','Caraballo',getdate()),
(3,'Maria','Ana',getdate()),
(2,'Benito','Gabriel',getdate())

declare @n int 
SET @n = 50000
while ( @n > 1 )
begin
insert into empleado  values
 (@n+4,cast(@n as varchar(10)) 
 + 'c'+ cast(@n as varchar(20) ),
 'apel'+ cast(@n as varchar(10)),getdate())
 SET @n = @n -1
end

----------------------------------------------

--- Busquedas.
--- 
-- a) sin ind
SET STATISTICS io ON

select * from empleado
  where apellido ='apel20392'

SET STATISTICS io off

--b) crea idx no cluster y repite el punto a

  create index idx1_empleado on empleado(apellido)

--b.1) Borra ind
  drop index empleado.idx1_empleado

  
  select * from empleado
  where id=400
  
  
  alter table empleado add constraint
  pk_empleado primary key (id)

--c) Crear idx cluster y repite el punto a

create clustered index idx1_empleado on empleado(apellido)

---------------------------------------------
-- Con el plan de ejec

--a) Table Scan

    Select * from empleado 
  
--b) Crea un ind non cluster por nombre

 create index idx1_empleado on empleado(apellido)

  select * from empleado
    where apellido ='apel20392'

--c) Crea un pk por id y repite el punto b

alter table empleado add constraint
  pk_Empleado primary key( id)



--d ) busqueda por el cluster
   select * from empleado 
     where id = 200

 
    