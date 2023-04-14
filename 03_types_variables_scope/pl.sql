declare
    v_max_line varchar2(32767);
begin
  for i in 1..32767 loop
    v_max_line := v_max_line || ' ';
  end loop

select pl('Test a line of text.') from dual;

pl('Test a number, such as 1?');
pl(1);

pl('Test a date, such as 01/01/1980?');
pl(to_date('19800101','YYYYMMDD'));

pl('Test a line <= 32767');
pl(v_max_line);

pl('Test a line > 32767');
pl(v_max_line||' ');

end;
/