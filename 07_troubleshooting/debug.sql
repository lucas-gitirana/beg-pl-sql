set serveroutput on size 1000000;

declare
begin
    DEBUG.set_text('DEBUG.SQL','before the loop');
    for i in 1..10 loop
        DEBUG.set_text('DEBUG.SQL', 'loop '||to_char(i)||' before sleep');
        sys.dbms_session.sleep(3);
        DEBUG.set_text('DEBUG.SQL', 'loop ' ||to_char(i)||' after sleep');
    end loop;
    DEBUG.set_text('DEBUG.SQL', 'after the loop');
end;