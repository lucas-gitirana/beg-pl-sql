set serveroutput 1000000;

declare
    n_count number;
    v_code GENDER_TYPES.code%TYPE := 'M';
begin
    begin
        delete from WORKERS d 
        where d.name = 'DOE, JOHN J.'
        and d.birth_date = to_date('19800101','YYYYMMDD')
        and d.gender_type_id = (
            select c.id
            from GENDER_TYPES c
            where c.code = v_code
        );

        n_count := sql%rowcount;

        exception
            when OTHERS then
                raise_application_error(-20001, SQLERRM ||' on delete WORKERS'||' in filename delete.sql' );           

    end;

    SYS.DBMS_OUTPUT.put_line(to_char(n_count)||' row(s) deleted.');

end;
/

