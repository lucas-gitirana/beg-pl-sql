create or replace procedure wait(ain_seconds IN number)is
begin
  SYS.DBMS_LOCK.sleep(ain_seconds);
end wait;
/