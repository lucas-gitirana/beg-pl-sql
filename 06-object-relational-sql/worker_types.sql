set serveroutput on size 1000000;
declare
    o_worker_type WORKER_TYPE;   
begin 
    insert into WORKER_TYPES
    values (WORKER_TYPE('T', 'Test'));

    update WORKER_TYPES
    set inactive_date = SYSDATE
    where code = 'T';

    select value(g)
    into o_worker_type
    from WORKER_TYPES g
    where code = 'T';

    SYS.DBMS_OUTPUT.put_line('o_worker_type.id = '||o_worker_type.id);
    SYS.DBMS_OUTPUT.put_line('o_worker_type.code = '||o_worker_type.code);
    SYS.DBMS_OUTPUT.put_line('o_worker_type.description = '||o_worker_type.description);
    SYS.DBMS_OUTPUT.put_line('o_worker_type.active_date = '||o_worker_type.active_date);
    SYS.DBMS_OUTPUT.put_line('o_worker_type.inactive_date = '||o_worker_type.inactive_date);

    delete WORKER_TYPES where code = 'T';

    insert into WORKER_TYPES
    values(o_worker_type);  

    delete WORKER_TYPES
    where code = 'T';

    commit;
    SYS.DBMS_OUTPUT.put_line('Test completed successfully.');
end;
/