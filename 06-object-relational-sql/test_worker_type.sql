set serveroutput on size 1000000;

declare
    o_worker_type WORKER_TYPE;
begin
    o_worker_type := new WORKER_TYPE(NULL,'H','A hard worker',SYSDATE, NULL);
    
    -- allocating a new ID
    o_worker_type.id := o_worker_type.get_id();

    SYS.DBMS_OUTPUT.put_line('OLÁ');
    SYS.DBMS_OUTPUT.put_line('o_worker_type.id = '||o_worker_type.id);
    SYS.DBMS_OUTPUT.put_line('o_worker_type.code = '||o_worker_type.code);
    SYS.DBMS_OUTPUT.put_line('o_worker_type.description = '||o_worker_type.description);
    SYS.DBMS_OUTPUT.put_line('o_worker_type.active_date = '||o_worker_type.active_date);
    SYS.DBMS_OUTPUT.put_line('o_worker_type.inactive_date = '||o_worker_type.inactive_date);

end;
/