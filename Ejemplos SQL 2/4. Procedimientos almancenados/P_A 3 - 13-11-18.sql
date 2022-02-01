create database prueba_programacion
use prueba_programacion

create table descuentos
(
iddesc int not null primary key,
nombre varchar(40),
porciento decimal(13,2)
)

insert into descuentos values 
(1, 'ISR', 10),
(2, 'OTROS', 8)

create table empleado
(
idemp int not null primary key,
nombre varchar(40),
iddesc int not null,
sueldo decimal (13,2)
)

insert into empleado values
(1,'carlos',1,1000),
(2,'pedro',1,2000),
(3,'juan',2,300)


create procedure p1
as
	begin
	select * from descuentos
	end

exec p1

create procedure p2
as
	begin
	create table #resultado
	(id int, nombre varchar(40))
	
		insert into #resultado values
		(1,'porque')
		select * from #resultado
	end

exec p2


create procedure p3(@sql varchar(500))
as 
	begin
		exec(@sql)
	end

exec p3 'select * from empleado'



create procedure p4
as
	begin
	declare @id int
	declare @nombre varchar(30)
	declare @desc decimal(13,2)
	declare @neto decimal(13,2)
	declare @sueldo decimal(13,2)
	
	select @nombre=e.nombre,
	@id=e.iddesc,
	@sueldo=e.sueldo,
	@desc=d.porciento
	from empleado e inner join descuentos d on d.iddesc=e.iddesc

	declare c_datos cursor for 
	select e.idemp, e.nombre, e.sueldo, d.porciento from empleado e
		INNER JOIN descuentos d on (e.iddesc = d.iddesc)
	
	open c_datos
	while 1=1
	begin
		fetch next from c_datos into @id,@nombre,@sueldo
		if @@FETCH_STATUS <>0
		begin 
			break
		end
		set @neto = @sueldo - @desc
		print concat('Nombre:' ,' ', @nombre,': ',' Sueldo:' ,' ', @sueldo, ' Neto:' ,' ',': ',@neto)
	end
	close c_datos
	deallocate c_datos
	end
exec p4

drop procedure p4
