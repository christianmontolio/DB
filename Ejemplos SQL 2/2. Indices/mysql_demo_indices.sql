use jueves_g3

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

/* para borrar el constraint primary key */
alter table empleado 
   drop primary key  
   
/* si es un foregin key:
alter table empleado drop  foreing key fk_nombre
*/

create index idx_empleado on empleado(id)
create index idx2_empleado on empleado(nombre)

drop index idx_empleado on empleado
drop index idx2_empleado on empleado

/* No existe en MYSQL, el clustered index es el primary key y es todo: 
create clustered index idx_empleado 
   on empleado(id)
 */
 
create unique  index idx_empleado 
   on empleado(id)

/* no existe:
create index idx2_empleado on 
  empleado ( nombre ) where id > 0
*/
------------------------------------------

insert into empleado  values
(1,'Carlos','Caraballo',curdate());
 

/* mysql no permite crear estructuras como while/do sin store procedure: */
/* Otra cosa importante es que en mysql las variables declaradas con @ valen
   a nivel de la session, son como globales*/
DELIMITER //  /*se cambia el delimite para que se entienda que no debe ejecutar hasta que encuentre un delimiter asi
                esto es para que incluya el cuerpo completo del procecure */

create procedure inserta_mucho()
begin

	declare n int default 0 ;
   
	set n = 50000;
  	while  n > 1 do 
     	insert into empleado  values
		 (n+4,concat(n,'c',n ),concat('apel',n ),curdate());
		 SET n = n -1;
	end while;
  
end
//
DELIMITER ;

call inserta_mucho();

drop procedure inserta_mucho;
----------------------------------------------

--- Busquedas.
--- 
-- a) sin ind
explain extended                     /*explain permite incluir informacion del plan de ejecucion, dice cuales index usa:*/
 select * from empleado
  where apellido ='apel20392';

 show profiles;
 select * from empleado
  where apellido ='apel20392';
 
 