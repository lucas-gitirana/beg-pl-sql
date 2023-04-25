set serveroutput on size 1000000;

declare
    cursor c_workers(
        aiv_last_name in WORKERS.last_name%TYPE
    )is 
        select first_name 
        from WORKERS
        where last_name like aiv_last_name||'%'
        order by id;
begin 
    for r_worker in c_workers('DOE') loop
        SYS.DBMS_OUTPUT.put_line(r_worker.first_name);
    end loop;
end;
/