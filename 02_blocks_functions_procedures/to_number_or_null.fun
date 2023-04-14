set serveroutput on size 10000001
begin
	SYS.DBMS_OUTPUT.put_line('Hi there genius!');
end;
/

/*======================================================================================*/

-- CRIAÇÃO DA FUNÇÃO DE CONVERSÃO DE VARCHAR PARA NUMBER OU NULL
CREATE OR REPLACE FUNCTION to_number_or_null(aiv_number IN varchar2) return number is
begin 
	return to_number(aiv_number);
exception 
	when OTHERS then
		return null;
end to_number_or_null;
/

fe@.sql to_number_or_null;

-- EXECUÇÃO DA FUNÇÃO CRIADA ACIMA
select to_number_or_null('A') from dual;

select to_number_or_null('12') from dual;
