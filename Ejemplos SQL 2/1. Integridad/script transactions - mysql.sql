use base1
;

delimiter //

 
CREATE PROCEDURE pp() 
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION,SQLWARNING BEGIN
   ROLLBACK;
      RESIGNAL;/* RELANZAR LA EXCEPTION */ 
  END;

  START TRANSACTION;

   Update cuenta set balance=50 where id=1;
   Update cuenta set balance=50 where id=3; 
   
   COMMIT;

end
//
delimiter ;

call pp();



/* para configurar el isolation level: */

SET Transaction isolation level read uncommitted;