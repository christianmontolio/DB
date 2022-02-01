create table cliente(
   idCliente int not null primary key,
   nombre varchar(30),
   cedula char(11)  
 )
 ;
 
 /* en oracle hasta la version 11 no existia un equilvante del tipo identity o autonumber,lo que se hacia para 
    igualar la funcionalidad era hacer una combinacion de triggers y objetos sequences, pero para la version 12 se
    agrega el tipo "generated as identity", este tipo hace lo mismo que el identity de sql server y al parecer tiene
    muchas opciones que lo hacen mas poderoso, Eje:
    
     create table Cuenta(
    idCuenta number generated always as identity,
	idCliente int not null,
	balance decimal(13,2)
 )
 ;
 */
  
 create table Cuenta(
    idCuenta int not null primary key,
	idCliente int not null,
	balance decimal(13,2)
 )
 ;
 insert into cliente 
    values(1,'Carlos','01');
 insert into cliente(idCliente , nombre , cedula) 
    values(2,'Maria','02');

 create unique index idx_cliente on cliente(cedula);

 alter table cuenta add constraint 
   fk_cuenta_cleinte foreign key(idcliente)
     references cliente;

insert into cuenta(idcuenta,idCliente , balance )
  values(1, 1,100);
insert into cuenta(idcuenta,idCliente , balance )
  values(2, 1,400);
insert into cuenta(idcuenta,idCliente , balance )
  values(3, 2,200)

 ;
 select * from cuenta
 
   SAVEPOINT t1;
   update cuenta set balance = 800
	 where idCuenta = 2;

   update cuenta set balance = 300
	 where idCuenta = 1;
 
   rollback
   /* commit */
 
 /* si algo no hay error el begin/end data commit de lo contrario da
    rollback. Si se maneja la exception ya hay que ser directo y aplicar el
    rollback o commit. */
 begin  
  delete from cuenta 
  --select * from cuenta 
 end;
 
 
 __________________________________
 
 set serveroutput on;
 
 BEGIN
  SAVEPOINT t1;

	update cuenta set balance = 700
	where idCuenta = 2;

	update cuenta set idCliente = 4
	where idCuenta = 3;

  commit;
EXCEPTION
  WHEN OTHERS THEN
    dbms_output.put_line('ERRORES');
    ROLLBACK TO t1;
    RAISE;
END;
  
  
  -------------------------------
  
  set auto commit
  
  commit
  
  rollback
  
  
 select * from cuenta 

 ___________________________
 
 
 /* para lo de los niveles de aislamiento. TODO: Estas lineas estan fallando en developer pero trabajan bien sqlplus */
 
 /*para toda la session: */
 alter session set isolation_level read committed;
 
  /* para la transaccion actual. */   
    set transaction isolation level read committed;
  
  