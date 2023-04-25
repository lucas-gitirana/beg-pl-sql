set serveroutput on size 1000000;

declare
    r_worker WORKERS%ROWTYPE;
    n_inserted number := 0;

    TYPE first_n is table of TOP_100_FIRST_NAMES%ROWTYPE index by binary_integer;
    t_firsts first_n;

    TYPE last_n is table of  TOP_100_LAST_NAMES%ROWTYPE index by binary_integer;
    t_lasts last_n;

    TYPE middle_n is table of A_THRU_Z%TYPES index by binary integer;
    t_middles middle_n;

    n_G_MASC GENDER_TYPES.id%TYPE := GENDER_TYPE.get_id('M');
    n_G_FEM GENDER_TYPES.id%TYPE := GENDER_TYPE.get_id('F');
    n_WT_CON WORKER_TYPES.id%TYPE := WORKER_TYPE.get_id('C');
    n_WT_EMP WORKER_TYPES.id%TYPE := WORKER_TYPE.get_id('E');

begin


    SELECT * 
    BULK COLLECT
    INTO t_firsts
    FROM TOP_100_FIRST_NAMES;

    SELECT *
    BULK COLLECT
    INTO t_lasts
    FROM  TOP_100_LAST_NAMES;

    SELECT *
    BULK COLLECT
    INTO t_middles
    FROM A_THRU_Z;

    for f in t_firsts.first..t_firsts.last loop 
        for l in t_lasts.first..t_lasts.last loop
            for m in t_middles.first..t_middles.last loop
                
                r_worker.id := WORKER.get_id();
                r_worker.external_id := WORKER.get_external_id();
                r_worker.first_name := t_firsts(f).first_name;
                r_worker.middle_name := t_middles(m).letter||'.';
                r_worker.last_n := t_lasts(l).last_name;
                r_worker.name := WORKER.get_unformatted_name(r_worker.first_name, r_worker.middle_name, r_worker.last_name);
                r_worker.birth_date := to_date('19800101','YYYYMMDD');

                if t_firsts(f).gender_code = 'F' then
                    r_worker.gender_type_id := n_G_FEM;
                else
                    r_worker.gender_type_id := n_G_MASC;
                end if;

                if r_worker.worker_type_id = n_WT_CON then
                    r_worker.worker_type_id := n_WT_EMP;
                else
                    r_worker.worker_type_id := n_WT_CON;
                end if;

                insert into WORKERS values r_worker;
                n_count := n_count + sql%rowcount;

            end loop;
            commit;
        end loop ;
    end loop;
    SYS.DBMS_OUTPUT.put_line(to_char(n_count)||' row(s) inserted.')
end;