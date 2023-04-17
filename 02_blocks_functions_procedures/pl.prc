<<<<<<< HEAD
CREATE OR REPLACE PROCEDURE pl(aiv_text IN varchar2) IS
begin
	SYS.DBMS_OUTPUT.put_line(aiv_text);
end pl;
/
@pe.sql pl 

=======
CREATE OR REPLACE PROCEDURE pl(aiv_text IN varchar2) IS
begin
	SYS.DBMS_OUTPUT.put_line(aiv_text);
end pl;
/
@pe.sql pl 

>>>>>>> ddee3f76b3597226b427908a40eade43cbc9e549
pl('Hello, World!')