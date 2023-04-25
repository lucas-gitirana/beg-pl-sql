define script='&1';

set verify off;

declare
    n_run_number number;
begin
    DBMS_PROFILER.start_profiler('&script'||' on '||to_char(SYSDATE, 'YYYYMMDD'), n_run_number);

    SYS.DBMS_OUTPUT.put_line('DBMS_PROFILER run_number : '||to_char(n_run_number));
end;
/