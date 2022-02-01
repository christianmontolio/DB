CREATE DATABASE TEST_PROPIETARIA;
USE TEST_PROPIETARIA;

drop table asignaturas
CREATE TABLE ASIGNATURAS
	(ID VARCHAR(4),
	 CODIGO VARCHAR(10),
	 NOMBRE VARCHAR(60),
	 CREDITOS VARCHAR(2),
	 CUPOS VARCHAR(3),
	 CONSTRAINT PK_ASIG PRIMARY KEY(ID)
	)

select * from ASIGNATURAS
delete from ASIGNATURAS

insert into ASIGNATURAS values
('1','ADM120','LIDERAZGO Y TECNICAS DE SUPERVISION','3','25'),
('2','ING702','FISICA II Y LABORATORIO','5','35'),
('3','ISO600','ADMINISTRACION DE CONFIGURACION','3','30'),
('4','ISO605','DESARROLLO DE SOFTWARE CON TECNOLOGIA PROPIETARIA I','3','35'),
('5','ISO610','DESARROLLO DE SOFTWARE CON TECNOLOGIA OPEN SOURCE I','3','15'),
('6','ISO700','GESTION DE SITIOS WEB','3','30'),
('7','MAT131','CALCULO Y GEOMETRIA ANALITICA I','5','35')

/*
SELECT NOMBRE, APELLIDO, TIPO_ACCESO FROM USUARIO WHERE USUARIO='chmontolio' OR TIPO_ACCESO=2 OR TIPO_ACCESO=1

UPDATE USUARIO SET NOMBRE='Chelis', APELLIDO='Hernandez', PUESTO='Gerente de RH', SALARIO='150000', USUARIO='chernandez', CONTRASENA='654321', TIPO_ACCESO='2' WHERE ID_EMP='" + id + "';



 select * from empleado
 
 insert into RECLUTAMIENTO values
 (1,'Juan','Perez','001-0054877-8','En espera'),
 (2,'Carmen','Cruz','009-4578942-8','En espera')

 select * from RECLUTAMIENTO

 select r.id_candidato as 'ID', r.nombre_c as 'NOMBRE',r.apellido_c as 'APELLIDO', 
 r.cedula_c as 'CEDULA', e.id_empleado as 'ID SUPERVISOR',e.nombre+' '+e.apellido as 'SUPERVISOR INMEDIATO' 
 from reclutamiento r join empleado e on(r.id_supervisor=e.id_empleado)

 insert into usuario values
 (1,'chris','1234',1),
 (2,'anny','anny',1)
 select * from usuario


 select * from reclutamiento where nombre_c=juan

 select r.id_candidato as 'ID', r.nombre_c as 'NOMBRE',r.apellido_c as 'APELLIDO', 
 r.cedula_c as 'CEDULA', e.id_empleado as 'ID SUPERVISOR',e.nombre+' '+e.apellido as 'SUPERVISOR INMEDIATO' 
 from reclutamiento r join empleado e on(r.id_supervisor=e.id_empleado) where r.NOMBRE_C='juan'

 update reclutamiento set where ID_CANDIDATO=1 


 */