CREATE DATABASE TEST_PROPIETARIA;
USE TEST_PROPIETARIA;


CREATE TABLE USUARIO
	(ID_EMP VARCHAR(5),
	 NOMBRE VARCHAR(30),
	 APELLIDO VARCHAR(30),
	 PUESTO VARCHAR(20),
	 SALARIO VARCHAR(30),
	 USUARIO VARCHAR(30),
	 CONTRASENA VARCHAR(30),
	 TIPO_ACCESO VARCHAR(1),
	 CONSTRAINT PK_USER PRIMARY KEY(ID_EMP)
	)

select * from usuario
delete from usuario

insert into usuario values
(001,'Christian','Montolio','Gerente de Tec',125000,'chmontolio','123456',1),
(002,'Chelis','Hernandez','Gerente de RH',150000,'chernandez','654321',2),
(003,'Juan','Perez','Analista de Tec',45000,'juperez','tehicereir',2),
(004,'Carmen','Cruz','Analista de RH',42000,'cacruz','asmereir',2),
(005,'Juana','Mendez','Soporte de Tec',25000,'jumendez','123456',2),
(006,'Aristocratico','Velez','Analista de Tec',56000,'arvelez','654321',2),
(007,'Ana','Perez','Gerente General',256000,'anperez','soyelfinal',1)


SELECT NOMBRE, APELLIDO, TIPO_ACCESO FROM USUARIO WHERE USUARIO='chmontolio' OR TIPO_ACCESO=2 OR TIPO_ACCESO=1

UPDATE USUARIO SET NOMBRE='Chelis', APELLIDO='Hernandez', PUESTO='Gerente de RH', SALARIO='150000', USUARIO='chernandez', CONTRASENA='654321', TIPO_ACCESO='2' WHERE ID_EMP='" + id + "';"



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


