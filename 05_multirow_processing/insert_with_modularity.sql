set serveroutput on size 1000000;

declare
    r_worker WORKERS%ROWTYPE;
    n_count number := 0;
begin
    /*=============== Getting the name ===============*/
    r_worker.first_name := 'JOHN';
    r_worker.middle_name := 'J.';
    r_worker.last_name := 'DOE';
    r_worker.name := WORKER.get_unformatted_name(r_worker.first_name, r_worker.middle_name, r_worker.last_name);
    r_worker.birth_date := to_date('19800101','YYYYMMDD');

    /*=============== Getting the worker_type_id ===============*/
    begin
        r_worker.worker_type_id := WORKER_TYPE.get_id('C');
    exception
        when OTHERS then
            raise_application_error(-20001, SQLERRM || 'on call WORKER_TYPE.get_id(''C'')');
    end;

    /*=============== Getting the gender_type_id ===============*/
    begin
        r_worker.gender_type_id := GENDER_TYPE.get_id('M');
    exception
        when OTHERS then
            raise_application_error(-20001, SQLERRM || 'on call GENDER_TYPE.get_id(''M'')');
    end;

    /*=============== Detecting duplicated rows ===============*/
    if not WORKER.is_duplicate(r_worker.name, r_worker.birth_date, r_worker.gender_type_id) then
        
        /*=== Getting the ID ===*/
        r_worker.id := WORKER.get_id;
        
        /*=== Getting the EXTERNAL ID ===*/
        r_worker.external_id := WORKER.get_external_id;

        /*=== Inserting a row ===*/
        begin
            insert into WORKERS values r_worker;

            n_count := sql%rowcount;
        
        exception
            when OTHERS then
                raise_application_error(-20001, SQLERRM || 'on insert WORKERS');
        end;        
    end if;

    SYS.DBMS_OUTPUT.put_line(to_char(n_count)||' row(s) inserted.');

end;
/