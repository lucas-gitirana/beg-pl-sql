set serveroutput on size 1000000;
declare
    n_start number := to_number(to_char(SYSDATE,'SSSSS'));
    n_G_MALE GENDER_TYPES.id%TYPE;
    n_G_FEMALE GENDER_TYPES.id%TYPE;
    n_WT_CONTRACTOR WORKER_TYPES.id%TYPE;
    n_WT_EMPLOYEE WORKER_TYPES.id%TYPE;
    n_inserted number := 0;

    o_worker WORKER;
begin
    n_G_MALE := GENDER_TYPE.get_id('M');
    n_G_FEMALE := GENDER_TYPE.get_id('F');
    n_WT_CONTRACTOR := WORKER_TYPE.get_id('C');
    n_WT_EMPLOYEE := WORKER_TYPE.get_id('E');

    insert into WORKERS
        select WORKER(
        WORKERS_ID.nextval, 
        n_WT_CONTRACTOR, 
        lpad(to_char(EXTERNAL_ID_SEQ.nextval), 9, '0'),
        first_name,
        letter||'.',
        last_name,
        WORKER.get_formatted_name(first_name, letter||'.', last_name),
        to_date('20230424','YYYYMMDD'),
        n_G_FEMALE)
    from RPS.TOP_100_LAST_NAMES, RPS.TOP_100_FIRST_NAMES, RPS.A_THRU_Z;
    

    n_inserted := n_inserted + sql%rowcount;


    SYS.DBMS_OUTPUT.put_line(to_char(n_inserted)||' rows inserted'||(to_number(to_char(SYSDATE,'SSSSS'))-n_start)||' seconds.');

end;
/