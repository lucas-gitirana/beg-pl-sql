create or replace PACKAGE BODY WORKER as
    
    /* ============= CORRECT =============*/
    FUNCTION get_id
    return WORKERS.id%TYPE is 

    n_id WORKERS.id%TYPE;

    begin
        select WORKERS_ID.nextval
        into n_id
        from SYS.DUAL;

        return n_id;
    end get_id;

    /* ============= CORRECT =============*/
    FUNCTION get_external_id
    return WORKERS.external_id%TYPE is 

        v_external_id WORKERS.external_id%TYPE;

    begin
        select lpad(to_char(EXTERNAL_ID_SEQ.nextval), 9, '0')
        into v_external_id
        from SYS.DUAL;

        return v_external_id;
    end get_external_id;

    /* ============= CORRECT =============*/
    FUNCTION get_unformatted_name(
        aiv_first_name in WORKERS.first_name%TYPE, 
        aiv_middle_name in WORKERS.middle_name%TYPE,
        aiv_last_name in WORKERS.last_name%TYPE
    )return WORKERS.name%TYPE is 
    
    begin
        return rtrim(aiv_last_name||', '||aiv_first_name||' '||aiv_middle_name);        
    end get_unformatted_name;

    /* ============= incorrect =============*/
    FUNCTION is_duplicate(
        aiv_name in WORKERS.name%TYPE,
        aid_birth_date in WORKERS.birth_date%TYPE,
        ain_gender_type_id in WORKERS.gender_type_id%TYPE
    )return boolean is 

        v_name WORKERS.name%TYPE;
        d_birth_date WORKERS.birth_date%TYPE;
        n_gender_type_id WORKERS.gender_type_id%TYPE;

    begin
        select name, birth_date, gender_type_id
        into v_name, d_birth_date, n_gender_type_id
        from WORKERS
        where name like aiv_name||'%'
        and birth_date = aid_birth_date
        and gender_type_id = ain_gender_type_id;

        return true;
    
    exception
        when NO_DATA_FOUND then
            return false;

    end is_duplicate;

end WORKER;
/

/* =============== TEST UNIT =================== */

declare
    value boolean;
    name WORKERS.name%TYPE;
    birth_date WORKERS.birth_date%TYPE;
    gender_type_id GENDER_TYPES.id%TYPE;
begin
    
    name := WORKER.get_unformatted_name('JOHN','J.','DOE');
    birth_date := to_date('19800101', 'YYYYMMDD');
    gender_type_id := GENDER_TYPE.get_id('M');


    SYS.DBMS_OUTPUT.put_line('============ get_id ============');
    SYS.DBMS_OUTPUT.put_line(WORKER.get_id());

    SYS.DBMS_OUTPUT.put_line('============ get_external_id ============');
    SYS.DBMS_OUTPUT.put_line(WORKER.get_external_id());

    SYS.DBMS_OUTPUT.put_line('============ get_unformatted_name ============');
    SYS.DBMS_OUTPUT.put_line(WORKER.get_unformatted_name('JOHN','J.','DOE'));

    SYS.DBMS_OUTPUT.put_line('============ get gender type id ============');
    SYS.DBMS_OUTPUT.put_line('ID for M: '||GENDER_TYPE.get_id('M'));    

    SYS.DBMS_OUTPUT.put_line('============ is_duplicate ============');
    if (WORKER.is_duplicate(name,birth_date,gender_type_id))then
        SYS.DBMS_OUTPUT.put_line('Duplicated');
    
    else
        SYS.DBMS_OUTPUT.put_line('Not duplicated');

    end if; 
end;
/





