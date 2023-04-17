set serveroutput 1000000;

/* Use whatever PL/SQL insert technique you want to code a script to insert rows 
into the WORKERS table for four workers: JANE J. DOE, her husband JOHN J. DOE, 
her daughter JANIE E. DOE, and her son JOHNNIE E. DOE. */

declare    

    n_count number := 0;  

    FUNCTION add_worker(
        aiv_first_name WORKERS.first_name%TYPE,
        aiv_middle_name WORKERS.middle_name%TYPE,
        aiv_last_name WORKERS.last_name%TYPE,        
        aid_birth_date WORKERS.birth_date%TYPE,
        aiv_gender_code GENDER_TYPES.code%TYPE,
        aiv_worker_type_code WORKER_TYPES.code%TYPE
    )
    return number is
    
        v_name WORKERS.name%TYPE;

    begin

            v_name := rtrim(aiv_last_name || ', ' || aiv_first_name || ' ' || aiv_middle_name);

            begin
                insert into WORKERS (
                    id,
                    worker_type_id,
                    external_id,
                    first_name,
                    middle_name,
                    last_name,
                    name,
                    birth_date,
                    gender_type_id)
                select WORKERS_ID.nextval,
                    c1.id,
                    lpad(to_char(EXTERNAL_ID_SEQ.nextval), 9, '0'),
                    aiv_first_name,
                    aiv_middle_name,
                    aiv_last_name,
                    v_name,
                    aid_birth_date,
                    c2.id                
                from WORKER_TYPES c1, GENDER_TYPES c2
                where c1.code = aiv_worker_type_code 
                and c2.code = aiv_gender_code
                and not exists(
                    select 1  
                    from WORKERS x
                    where x.name = v_name
                    and x.birth_date = aid_birth_date
                    and x.gender_type_id = c2.id 
                );

                return sql%rowcount;           
            
            exception
                when OTHERS then
                    raise_application_error(-20002, SQLERRM||' on insert worker'||' in filename');
                
            end;
    
    end add_worker;

begin

    /* JANE J. DOE, her husband JOHN J. DOE, her daughter JANIE E. DOE, and her son JOHNNIE E. DOE. */

    n_count := n_count + add_worker('JANE', 'J.', 'DOE', to_date('19800101', 'YYYYMMDD'),'F','C');
    n_count := n_count + add_worker('JOHN', 'J.', 'DOE', to_date('19800101', 'YYYYMMDD'),'M','E');
    n_count := n_count + add_worker('JANIE', 'E.', 'DOE', to_date('19980101', 'YYYYMMDD'),'F','E');
    n_count := n_count + add_worker('JOHNNIE', 'E.', 'DOE', to_date('19980101', 'YYYYMMDD'),'M','E');

    SYS.DBMS_OUTPUT.put_line(to_char(n_count)||' row(s) inserted.');

end;
/

commmit;