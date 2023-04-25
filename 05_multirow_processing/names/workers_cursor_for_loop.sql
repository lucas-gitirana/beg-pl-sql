set serveroutput on size 1000000;

declare
    cursor c_first_names is 
        select first_name, gender_code
        from TOP_100_FIRST_NAMES;

    cursor c_last_names is 
        select last_name
        from TOP_100_LAST_NAMES;

    cursor c_middle_names is
        select letter
        from A_THRU_Z;

    -- Book Correction 01 :)
    -- Pseudo constats to keep the gender and worker types IDs without repeat this process every loop
    n_start number := to_number(to_char(SYSDATE, 'SSSSS'));    
    n_G_FEMALE GENDER_TYPES.id%TYPE;
    n_G_MALE GENDER_TYPES.id%TYPE;
    n_WT_CONTRACTOR WORKER_TYPES.id%TYPE;
    n_WT_EMPLOYEE WORKER_TYPES.id%TYPE;

    n_count number := 0;
    r_worker WORKERS%ROWTYPE;

begin

    -- Book Correction 02 :)
    -- Get the ID values for the which code 
    n_G_FEMALE := GENDER_TYPE.get_id('F');
    n_G_MALE := GENDER_TYPE.get_id('M');
    n_WT_CONTRACTOR := WORKER_TYPE.get_id('C');
    n_WT_EMPLOYEE := WORKER_TYPE.get_id('E');
    

    ---------- Getting all first names ---------- 
    for r_fn in c_first_names loop                              
        
        ---------- Getting all middle names ----------
        for r_mn in c_middle_names loop            

            ---------- Getting all last names ---------- 
            for r_ln in c_last_names loop                    
                
                ------------- ASSIGNING data -------------
                
                ---------- Worker ID ---------- 
                r_worker.id := WORKER.get_id();                                                
                
                ---------- Worker Type ID ----------                 
                if r_worker.worker_type_id = n_WT_CONTRACTOR then
                    r_worker.worker_type_id := n_WT_EMPLOYEE;
                else
                    r_worker.worker_type_id := n_WT_CONTRACTOR;
                end if;                                
                
                ---------- Worker EXTERNAL ID ----------                 
                r_worker.external_id := WORKER.get_external_id();                
                
                ---------- Worker names ----------                
                r_worker.first_name := r_fn.first_name;                    
                r_worker.middle_name := r_mn.letter||'.';
                r_worker.last_name := r_ln.last_name;
                r_worker.name := WORKER.get_unformatted_name(r_worker.first_name, r_worker.middle_name, r_worker.last_name);

                ---------- TODO Worker Birth date ----------                                 
                r_worker.birth_date := SYSDATE-30;

                ---------- Gender type id ---------- 
                if r_fn.gender_code = 'F' then
                    r_worker.gender_type_id := n_G_FEMALE;
                else
                    r_worker.gender_type_id := n_G_MALE;
                end if;

                --======================= INSERTING data =======================                
                insert into WORKERS values r_worker;
                n_count := n_count + sql%rowcount;

            end loop;
            commit;

        end loop;        

    end loop;     

    SYS.DBMS_OUTPUT.put_line(to_char(n_count)||' row(s) inserted in '|| to_char(to_number(SYSDATE, 'SSSSS')) - n_start || ' seconds.');
end;
/