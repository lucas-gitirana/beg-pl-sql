declare
    n_id WORKERS.id%TYPE;
    v_name WORKERS.name%TYPE;
    d_birth_date WORKERS.birth_date%TYPE;
    n_gender_type_id WORKERS.gender_type_id%TYPE;

    n_selected number := 0;

    v_gender GENDER_TYPES.code%TYPE;

begin
    v_name := 'GITIRANA, LUCAS E.';
    d_birth_date := to_date(20031110, 'YYYYMMDD');    
    v_gender := 'M';

    begin
        select id
        into n_id
        from WORKERS
        /* where name = v_name
        and birth_date = d_birth_date
        and gender_type_id = (
            select id             
            from GENDER_TYPES x
            where x.code = v_gender
        ) */;

    exception
        when no_data_found then
            n_selected := sql%rowcount;
            SYS.DBMS_OUTPUT.put_line('Caught raised exception NO_DATA_FOUND');
        
        when TOO_MANY_ROWS then
            n_selected := sql%rowcount;
            SYS.DBMS_OUTPUT.put_line('Caught raised exception TOO_MANY_ROWS');

        when OTHERS then 
            raise_application_error(-20002, SQLERRM||' on select WORKERS'||' in filename');        
    end;
end;
/