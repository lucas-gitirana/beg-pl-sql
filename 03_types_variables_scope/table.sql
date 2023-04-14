declare
    TYPE name_table IS TABLE OF WORKERS.name%TYPE INDEX BY BINARY_INTEGER;
    t_name name_table;
    n_name binary_integer;
begin
    t_name(1) := 'DOE, JOHN';
    t_name(10) := 'DOE, JANE';

    SYS.DBMS_OUTPUT.put_line(t_name(1));
    SYS.DBMS_OUTPUT.put_line(t_name(10));
    SYS.DBMS_OUTPUT.put_line('There are '||t_name.count()||' elements.');
    n_name := t_name.first();
    SYS.DBMS_OUTPUT.put_line('The first element is '||n_name||'. ');
    n_name := t_name.next(n_name);
    SYS.DBMS_OUTPUT.put_line('The next element is '||n_name||'. ');
    n_name := t_name.last();
    SYS.DBMS_OUTPUT.put_line('The last element is '||n_name||'.');
    n_name := t_name.prior(n_name);
    SYS.DBMS_OUTPUT.put_line('The prior element is '||n_name||'');

    if t_name.exists(1) then
        SYS.DBMS_OUTPUT.put_line('Element 1 exists');
    end if;

    SYS.DBMS_OUTPUT.put_line('I am deleting element 10');
    t_name.delete(10);
    SYS.DBMS_OUTPUT.put_line('There are '||t_name.count()||' elements.');

    if not t_name.exists(10) then
        SYS.DBMS_OUTPUT.put_line('Element 10 no longer exists. ');
    end if;

    SYS.DBMS_OUTPUT.put_line('There are '||t_name.count()||' elements.');
    SYS.DBMS_OUTPUT.put_line('I am deleting all elements. ');
    t_name.delete();
    SYS.DBMS_OUTPUT.put_line('There are '||t_name.count()||' elements');    

end;
/