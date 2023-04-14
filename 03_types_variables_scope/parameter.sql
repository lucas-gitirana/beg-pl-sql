declare
    v_in varchar2(30) := 'IN';
    v_out varchar2(30) := 'Na na, you can''t see me!';
    v_inout varchar2(30) := 'But you can see me!';
    v_return varchar2(30);
begin
    SYS.DBMS_OUTPUT.put_line('Before calling the function...');
    SYS.DBMS_OUTPUT.put_line('Inside test unit parameter v_in = '||v_in);
    SYS.DBMS_OUTPUT.put_line('Inside test unit parameter v_out = '||v_out);
    SYS.DBMS_OUTPUT.put_line('Inside test unit parameter v_inout = '||v_inout);

    SYS.DBMS_OUTPUT.put_line('Test function PARAMETER.in_out_inout(v_in, v_out, v_inout).');
    v_return := PARAMETER.in_out_inout(v_in, v_out, v_inout);
    SYS.DBMS_OUTPUT.put_line(v_return);

    SYS.DBMS_OUTPUT.put_line('After calling the function...');
    SYS.DBMS_OUTPUT.put_line('Inside test unit parameter v_in = '||v_in);
    SYS.DBMS_OUTPUT.put_line('Inside test unit parameter v_out = '||v_out);
    SYS.DBMS_OUTPUT.put_line('Inside test unit parameter v_inout = '||v_inout);

    SYS.DBMS_OUTPUT.put_line('Resetting initial values...');
    v_out := 'Na na, you can''t see me!';
    v_inout := 'But you can see me!';

    SYS.DBMS_OUTPUT.put_line('Before calling the procedure...');
    SYS.DBMS_OUTPUT.put_line('Inside test unit parameter v_in = '||v_in);
    SYS.DBMS_OUTPUT.put_line('Inside test unit parameter v_out = '||v_out);
    SYS.DBMS_OUTPUT.put_line('Inside test unit parameter v_inout = '||v_inout);

    SYS.DBMS_OUTPUT.put_line('Test procedure PARAMETER.in_out_inout(v_in, v_out, v_inout).');
    PARAMETER.in_out_inout(v_in, v_out, v_inout);
    SYS.DBMS_OUTPUT.put_line('OK');

    SYS.DBMS_OUTPUT.put_line('After calling the procedure...');
    SYS.DBMS_OUTPUT.put_line('Inside test unit parameter v_in = '||v_in);
    SYS.DBMS_OUTPUT.put_line('Inside test unit parameter v_out = '||v_out);
    SYS.DBMS_OUTPUT.put_line('Inside test unit parameter v_inout = '||v_inout);
end;
/