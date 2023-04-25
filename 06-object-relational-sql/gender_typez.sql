set serveroutput on size 1000000;
declare
    o_gender_type GENDER_TYPE;
    r_gender_type GENDER_TYPES%ROWTYPE;
begin 
    insert into GENDER_TYPEZ
    values (GENDER_TYPE('T','Test'));

    update GENDER_TYPEZ
    set inactive_date = SYSDATE
    where code = 'T';

    select value(g)
    into o_gender_type
    from GENDER_TYPEZ g
    where code = 'T';

    SYS.DBMS_OUTPUT.put_line('o_gender_type.id = '||o_gender_type.id);
    SYS.DBMS_OUTPUT.put_line('o_gender_type.code = '||o_gender_type.code);
    SYS.DBMS_OUTPUT.put_line('o_gender_type.description = '||o_gender_type.description);
    SYS.DBMS_OUTPUT.put_line('o_gender_type.active_date = '||o_gender_type.active_date);
    SYS.DBMS_OUTPUT.put_line('o_gender_type.inactive_date = '||o_gender_type.inactive_date);

    delete GENDER_TYPEZ where code = 'T';

    insert into GENDER_TYPEZ
    values(o_gender_type);

    select *
    into r_gender_type
    from GENDER_TYPES
    where code = 'T';

    SYS.DBMS_OUTPUT.put_line('r_gender_type.id = '||r_gender_type.id);
    SYS.DBMS_OUTPUT.put_line('r_gender_type.code = '||r_gender_type.code);
    SYS.DBMS_OUTPUT.put_line('r_gender_type.description = '||r_gender_type.description);
    SYS.DBMS_OUTPUT.put_line('r_gender_type.active_date = '||r_gender_type.active_date);
    SYS.DBMS_OUTPUT.put_line('r_gender_type.inactive_date = '||r_gender_type.inactive_date);

    delete GENDER_TYPES
    where code = 'T';

    commit;

    SYS.DBMS_OUTPUT.put_line('Test completed successfully.');
end;
/