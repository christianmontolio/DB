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

drop index idx_empleado;
drop index idx2_empleado;

/* no existe en oracle igual que en mysql, basta con el primary key
create clustered index idx_empleado 
   on empleado(id)
 */
create unique  index idx_empleado 
   on empleado(id)
 

------------------------------------------

insert into empleado  values
(1,'Carlos','Caraballo', current_date);
 
declare
   n int;
begin
  n := 50000;
  while n > 1 
  loop
     insert into empleado  values
       (n+4, n || 'c' || n , 'apel' || n ,current_Date);
       n := n -1;
  end loop;
end;
----------------------------------------------

--- Busquedas.

explain plan for

select * from empleado
  where apellido ='apel20392';
 
select plan_table_output from table(dbms_xplan.display('plan01',null,'BASIC'));
 
-- a) sin ind
explain plan set statement_id = 'plan01' for

select * from empleado
  where apellido ='apel20392';

select plan_table_output from table(dbms_xplan.display(null,'plan01','BASIC'));

--b) crea idx no cluster y repite el punto a

  create index idx1_empleado on empleado(apellido)

--b.1) Borra ind
  drop index idx1_empleado

 