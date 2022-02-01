CREATE DATABASE TEST_PROPIETARIA;
USE TEST_PROPIETARIA;


CREATE TABLE ESTUDIANTES
	(ID_EST INT NOT NULL,
	 NOMBRE VARCHAR(30),
	 APELLIDO VARCHAR(30),
	 MATRICULA INT NOT NULL,
	 ASIGNATURA VARCHAR(30),
	 NOTA INT NOT NULL,
	 CONSTRAINT PK_EST PRIMARY KEY(ID_EST)
	)

select * from ESTUDIANTES
delete from ESTUDIANTES

insert into ESTUDIANTES values
(1,'Christian','Montolio',20200401,'Propietaria I',91),
(2,'Chelis','Hernandez',20200502,'Open Source I',86),
(3,'Juan','Perez',20206548,'Calculo I',76),
(4,'Carmen','Cruz',20200114,'Contabilidad',86),
(5,'Juana','Mendez',20195478,'Propietaria I',82),
(6,'Aristocratico','Perez',20191265,'Fisica II',98),
(7,'Ana','Perez',20195841,'Administracion',100)


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


