select * from cuenta 

begin transaction

delete from cuenta
update cuenta set balance = 10000
where idcuenta = 2


rollback