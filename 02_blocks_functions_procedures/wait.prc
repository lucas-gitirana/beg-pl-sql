<<<<<<< HEAD
CREATE OR REPLACE PROCEDURE wait(ain_seconds IN number) is
begin 
	SYS.DBMS_LOCK.sleep(ain_seconds);
end wait;
/

@pe.sql wait
=======
CREATE OR REPLACE PROCEDURE wait(ain_seconds IN number) is
begin 
	SYS.DBMS_LOCK.sleep(ain_seconds);
end wait;
/

@pe.sql wait
>>>>>>> ddee3f76b3597226b427908a40eade43cbc9e549
