set serveroutput on size 1000000;

declare
    n_id WORKERS.id%TYPE;
    n_worker_type_id WORKERS.worker_type_id%TYPE;
    v_external_id WORKERS.external_id%TYPE;
    n_gender_type_id WORKERS.gender_type_id%TYPE;

    n_count number;

begin 

    -- getting all ID's

    begin
        select id into n_worker_type_id
        from WORKER_TYPES
        where code = 'C';
    exception
        when OTHERS then
            raise_application_error(-20002, SQLERRM||' on select WORKER_TYPES'||' in filename insert.sql');
    end;

    begin
        select id into n_gender_type_id
        from GENDER_TYPES
        where code = 'M';
    exception
        when OTHERS then
        raise_application_error(-20004, SQLERRM ||' on select GENDER_TYPES'||' in filename insert.sql');        
    end;

    begin
        select WORKERS_ID.nextval
        into n_id
        from SYS.DUAL;
    exception
        when OTHERS then
        raise_application_error(-20001, SQLERRM || 'on select WORKERS_ID.nextval' || ' in filename insert.sql');        
    end;

    begin
        select lpad(to_char(EXTERNAL_ID_SEQ.nextval), 9, '0')
        into v_external_id
        from SYS.DUAL;
    exception
        when OTHERS then
        raise_application_error(-20003, SQLERRM || 'on select EXTERNAL_ID_SEQ.nextval' || ' in filename insert.sql');                
    end;


    -- inserting a row
    begin
        insert into WORKERS(
            id,
            worker_type_id,
            external_id,
            first_name,
            middle_name,
            last_name,
            name,
            birth_date,
            gender_type_id
        ) values(
            n_id,
            n_worker_type_id,
            v_external_id,
            'JOHN',
            'J.',
            'DOE',
            'DOE, JOHN J.',
            to_date('19800101', 'YYYYMMDD'),
            n_gender_type_id
        );

        n_count := sql%rowcount;    
    
    exception
        when DUP_VAL_ON_INDEX then
            n_count := 0;
            SYS.DBMS_OUTPUT.put_line('Caught a DUP_VAL_ON_INDEX exception');

        when OTHERS then
            raise_application_error(-20005, SQLERRM || ' on insert WORKERS' || ' in filename insert_with_handled_exception.sql');            
    
    end;

    SYS.DBMS_OUTPUT.put_line(to_char(n_count)||' row(s) inserted.');

end;
/

commit;