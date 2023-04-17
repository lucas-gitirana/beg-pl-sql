/* Your assignment is to write an anonymous procedure that displays the first name of each of the Doe family 
members from the WORKERS table—remember, the ones you added in the previous exercise? To that end, 
follow these steps. */
set serveroutput 1000000;

declare    
    v_first_name WORKERS.first_name%TYPE;
    n_id WORKERS.id%TYPE;

    FUNCTION get_first_name(
        aion_id in out WORKERS.id%TYPE,
        aiv_last_name in WORKERS.last_name%TYPE)
    return WORKERS.first_name%TYPE is

    v_first_name WORKERS.first_name%TYPE; 

    begin  
        select id, 
               first_name
        into aion_id, 
             v_first_name 
        from WORKERS
        where id > aion_id
        and last_name like aiv_last_name||'%'
        and rownum = 1;

        return v_first_name;
        
    exception
        when NO_DATA_FOUND then
            return v_first_name;
        when OTHERS then
            raise_application_error(-20000, SQLERRM ||' on select workers'||' in filename.');            
        
    end get_first_name;    

begin
    n_id := 0;

    loop
        v_first_name := get_first_name(n_id,'DOE');

        if v_first_name is NULL then
            exit;
        end if;

        SYS.DBMS_OUTPUT.put_line(v_first_name);
    end loop;
end;
/
