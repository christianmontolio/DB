use prueba_programacion

create table prestamo
	(idprestamo int not null primary key,
	nombre varchar(40),
	monto decimal(13,2))

create table prestamosriesgosos
	(idprestamo int not null primary key,
	monto decimal(13,2))

create table cartera
	(idcartera int not null primary key,
	totalprestado decimal(13,2),
	totalenriesfo decimal(13,2))

select * from prestamo

create trigger trg_check on prestamo
after insert
as
	begin 
	declare @monto decimal(13,2)
	declare @id int

	select @id=idprestamo,
	@monto=monto
	from prestamo

	if @monto>100000
		 begin
			insert into prestamosriesgosos
			values(@id, @monto) 
			
			if exists(select * from cartera)
			begin 
				update cartera set idcartera=1,
				totalprestado=(select sum(monto) from prestamo),
				totalenriesfo=(select sum(monto) from prestamosriesgosos)
				where idcartera=1
			end
			else 
			insert into cartera values
			(1, (select sum(monto) from prestamo), (select sum(monto) from prestamosriesgosos))
		 end
	end

insert into prestamo values
(1, 'Joselin', 110000),
(2, 'Pedro', 500),
(3, 'Maria', 100),
(4, 'Jose', 240000)

select * from prestamosriesgosos
select * from cartera

drop trigger trg_check
delete prestamosriesgosos where idprestamo=4
delete prestamo where idprestamo=4
delete cartera where idcartera=1

select * from prestamo