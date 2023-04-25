set serveroutput on size 1000000;
declare
    o_worker_type WORKER_TYPE;
    r_worker_type WORKER_TYPES%ROWTYPE;
begin 
    insert into WORKER_TYPEZ 
    values (WORKER_TYPE('H', 'Hard worker'));

    update WORKER_TYPEZ
    set inactive_date = SYSDATE
    where code = 'H';

    select value(w)
    into o_worker_type
    from WORKER_TYPEZ w
    where code = 'H';

    SYS.DBMS_OUTPUT.put_line('o_worker_type.id = '||o_worker_type.id);
    SYS.DBMS_OUTPUT.put_line('o_worker_type.code = '||o_worker_type.code);
    SYS.DBMS_OUTPUT.put_line('o_worker_type.description = '||o_worker_type.description);
    SYS.DBMS_OUTPUT.put_line('o_worker_type.active_date = '||o_worker_type.active_date);
    SYS.DBMS_OUTPUT.put_line('o_worker_type.inactive_date = '||o_worker_type.inactive_date);

    delete WORKER_TYPEZ where code = 'H';

    insert into WORKER_TYPEZ
    values(o_worker_type);

    select *
    into r_worker_type
    from WORKER_TYPES
    where code = 'H';

    SYS.DBMS_OUTPUT.put_line('r_worker_type.id = '||r_worker_type.id);
    SYS.DBMS_OUTPUT.put_line('r_worker_type.code = '||r_worker_type.code);
    SYS.DBMS_OUTPUT.put_line('r_worker_type.description = '||r_worker_type.description);
    SYS.DBMS_OUTPUT.put_line('r_worker_type.active_date = '||r_worker_type.active_date);
    SYS.DBMS_OUTPUT.put_line('r_worker_type.inactive_date = '||r_worker_type.inactive_date);

    delete WORKER_TYPES
    where code = 'H';

    commit;
    SYS.DBMS_OUTPUT.put_line('Test completed successfully.');
end;
/