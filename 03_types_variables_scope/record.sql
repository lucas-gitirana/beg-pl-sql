declare
    TYPE name_record is record(
        first_name      WORKERS.first_name%TYPE,
        middle_name     WORKERS.middle_name%TYPE,
        last_name       WORKERS.last_name%TYPE);

    TYPE name_table is table of name_record index by binary_integer;

    t_name name_table;

begin
    t_name(1).first_name := 'JOHN';
    t_name(1).last_name := 'DOE';
    t_name(2).first_name := 'JANE';
    t_name(2).last_name := 'DOE';
    
    t_name(3).first_name := 'Lucas';
    t_name(3).middle_name := 'Emanoel';
    t_name(3).last_name := 'Gitirana';

    SYS.DBMS_OUTPUT.put_line(t_name(1).last_name||', '||t_name(1).first_name);
    SYS.DBMS_OUTPUT.put_line(t_name(2).last_name||', '||t_name(2).first_name);

    SYS.DBMS_OUTPUT.put_line(t_name(3).last_name||', '||t_name(3).first_name||' '||t_name(3).middle_name);

end;
/