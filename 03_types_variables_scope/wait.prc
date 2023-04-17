<<<<<<< HEAD
create or replace procedure wait(ain_seconds IN number)is
begin
  SYS.DBMS_LOCK.sleep(ain_seconds);
end wait;
=======
create or replace procedure wait(ain_seconds IN number)is
begin
  SYS.DBMS_LOCK.sleep(ain_seconds);
end wait;
>>>>>>> ddee3f76b3597226b427908a40eade43cbc9e549
/