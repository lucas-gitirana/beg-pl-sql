declare
    v_program_unit varchar2(30) := 'debug.sql';
begin
    DEBUG.enable(v_program_unit);
    DEBUG.set_text(v_program_unit,'before the loop');
    for i in 1..10 loop
        DEBUG.set_text(v_program_unit, 'loop '||to_char(i)||' before the sleep');
        SYS.DBMS_SESSION.sleep(3);
        DEBUG.set_text(v_program_unit, 'loop '||to_char(i)||' after the sleep');
    end loop;
    DEBUG.set_text(v_program_unit,'after the loop');

    DEBUG.disable(v_program_unit);
    DEBUG.set_text(v_program_unit,'before the loop');
    for i in 1..10 loop
        DEBUG.set_text(v_program_unit, 'loop '||to_char(i)||' before the sleep');
        SYS.DBMS_SESSION.sleep(3);
        DEBUG.set_text(v_program_unit, 'loop '||to_char(i)||' after the sleep');
    end loop;
    DEBUG.set_text(v_program_unit,'after the loop');
end;
/