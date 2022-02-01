CREATE DATABASE TEST_PROPIETARIA;
USE TEST_PROPIETARIA;


CREATE TABLE USUARIO
	(ID_EMP INT NOT NULL,
	 NOMBRE VARCHAR(30),
	 APELLIDO VARCHAR(30),
	 PUESTO VARCHAR(20),
	 USUARIO VARCHAR(30),
	 CONTRASENA VARCHAR(30),
	 TIPO_ACCESO INT NOT NULL,
	 CONSTRAINT PK_USER PRIMARY KEY(ID_EMP)
	)

select * from usuario

insert into usuario values
(001,'Christian','Montolio','Gerente de Tec','chmontolio','123456',1),
(002,'Chelis','Hernandez','Gerente de RH','chernandez','654321',2)


SELECT NOMBRE, APELLIDO, TIPO_ACCESO FROM USUARIO WHERE USUARIO='chmontolio' AND CONTRASENA='123456'


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


