/*   */


declare @a int
declare @b int
declare @c int 

SET @a = 2
SET @b = 2
SET @c = @a + @b

print @c

/* ---------------  */


 
create procedure suma(@a int, @b int)
as
begin
    declare @c int

    SET @c = @a + @b

    print @c

    SET @x = 2322
    print concat('El valor es',@x)

    select * from empleado

   
end
go
exec suma 2,2
go
---Debe generar la tabla que se le indique en el param, si pongo
-- 2 debe generar la tabla de 2
exec generartabla 2


2 * 1 = 2
2 * 2 = 4
 


crear una func que permite retornar el nombre del cliente pasando el id 
como param, debo utilizarla en un select de auditoria, eje:
select idcliente, dbo.mifunc(idcliente) from auditoria

create function dbo.suma(@a int, @b int) returns int
as
begin
     declare @c int
     SET @c = @a + @b
     return @c
end
go
select dbo.suma(2,2), getdate()
select @x = dbo.suma(2,2) 
go
cliente(codigo,nombre, balance)
Auditoria( idcliente, usuario,fecha, balancenuevo, balanceantes)

Crear un trigger que vigile el balance en la tabla cliente,
si se cambia el balance que se guarde en la tabla auditoria el usuario,
el cliente, la fecha en la que se hizo y el balance nuevo y viejo
system_user, getdate()

create trigger trg_ins on cliente
after insert,update 
as
begin
     declare @nombre varchar(40)
     declare @nombrea varchar(40)

     select @nombre = nombre from inserted 

     select @nombrea = nombre from deleted 
     if @nombre <> @nombrea 
     begin
           --hizo cambio en nombre
     end

     print 'El nombre insertado es: ' + @nombre 

    
end 
go
 print  cast(@x as varchar(10)) +'x ' + cast(@t as varchar(10)) + 

go
update cliente set nombre = "pepe"
insert into cliente values(1,'carlos')

---Debe generar la tabla que se le indique en el param, si pongo
-- 2 debe generar la tabla de 2
exec generartabla 2


2 * 1 = 2
2 * 2 = 4
print concat(@n,'*',@x)