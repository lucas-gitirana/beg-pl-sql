declare
begin
    DEBUGGER.enable('DEBUGGER.SQL');
    DEBUGGER.set_text('DEBUGGER.SQL','before the loop');
    for i in 1..10 loop
        DEBUGGER.set_text('DEBUGGER.SQL', 'loop '||to_char(i)||' before the sleep');
        SYS.DBMS_SESSION.sleep(3);
        DEBUGGER.set_text('DEBUGGER.SQL', 'loop '||to_char(i)||' after the sleep');
    end loop;
    DEBUGGER.set_text('DEBUGGER.SQL','after the loop');

    DEBUGGER.disable('DEBUGGER.SQL');
    DEBUGGER.set_text('DEBUGGER.SQL','before the loop');
    for i in 1..10 loop
        DEBUGGER.set_text('DEBUGGER.SQL', 'loop '||to_char(i)||' before the sleep');
        SYS.DBMS_SESSION.sleep(3);
        DEBUGGER.set_text('DEBUGGER.SQL', 'loop '||to_char(i)||' after the sleep');
    end loop;
    DEBUGGER.set_text('DEBUGGER.SQL','after the loop');
end;
