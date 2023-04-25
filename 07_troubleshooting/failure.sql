set serveroutput on size 1000000;

declare
    n_v1 number := 2;
    v_v2 varchar2(30) := 'two';
begin
    SYS.DBMS_OUTPUT.put_line('n_v1 + v_v2 = '||to_char(n_v1 + to_number(v_v2)));

exception
    when OTHERS then
        SYS.DBMS_OUTPUT.put_line('Value of n_v1 = '||n_v1);
        SYS.DBMS_OUTPUT.put_line('Value of  v_v2 = '||v_v2);
        raise_application_error(-20001, SQLERRM||' on adding n_v1 to v_v2');
        
end;
/