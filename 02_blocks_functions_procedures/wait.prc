CREATE OR REPLACE PROCEDURE wait(ain_seconds IN number) is
begin 
	SYS.DBMS_LOCK.sleep(ain_seconds);
end wait;
/

@pe.sql wait
