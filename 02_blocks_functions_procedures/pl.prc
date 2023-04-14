CREATE OR REPLACE PROCEDURE pl(aiv_text IN varchar2) IS
begin
	SYS.DBMS_OUTPUT.put_line(aiv_text);
end pl;
/
@pe.sql pl 

pl('Hello, World!')