rem pl.sql
rem by Lucas Emanoel Gitirana


declare 
	v_max_line varchar2(32767);
begin
	-- inicialize v_max_line with 32767 spaces
	for i in 1..32767 loop
		v_max_line := v_max_line || ' ';
	end loop;
	
	pl('Test a line of text');
	
	pl('')
	
	
end 