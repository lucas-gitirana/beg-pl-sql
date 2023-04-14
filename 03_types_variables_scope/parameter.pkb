create or replace package body PARAMETER as

    FUNCTION in_out_inout(
        aiv_in in varchar2,
        aov_out out varchar2,
        aiov_inout in out varchar2
    ) return varchar2 is 

        begin
            SYS.DBMS_OUTPUT.put_line(chr(9)||'Before assignments...');
            SYS.DBMS_OUTPUT.put_line(chr(9)||'Inside function in_out_inout, aiv_in = '||aiv_in);
            SYS.DBMS_OUTPUT.put_line(chr(9)||'Inside function in_out_inout, aov_out = '||aov_out);
            SYS.DBMS_OUTPUT.put_line(chr(9)||'Inside function in_out_inout, aiov_inout = '||aiov_inout);

            -- You can only ASSIGN a value (write) to an OUT parameter, YOU CAN'T READ IT
            aov_out := 'OUT';

            -- You can only read an IN parameter
            aiov_inout := aiv_in;

            -- You can read and write an IN OUT parameter
            aiov_inout := aiov_inout||'OUT';

            SYS.DBMS_OUTPUT.put_line(chr(9)||'After assignments...');
            SYS.DBMS_OUTPUT.put_line(chr(9)||'Inside function in_out_inout, aiv_in = '||aiv_in);
            SYS.DBMS_OUTPUT.put_line(chr(9)||'Inside function in_out_inout, aov_out = '||aov_out);
            SYS.DBMS_OUTPUT.put_line(chr(9)||'Inside function in_out_inout, aiov_inout = '||aiov_inout);
            
            return 'OK'; -- a function must return something :)

        end in_out_inout;


    PROCEDURE in_out_inout(
        aiv_in in varchar2,
        aov_out out varchar2,
        aiov_inout in out varchar2        
    )is 

        begin
            SYS.DBMS_OUTPUT.put_line(chr(9)||'Before assignments...');
            SYS.DBMS_OUTPUT.put_line(chr(9)||'Inside procedure in_out_inout, aiv_in = '||aiv_in);
            SYS.DBMS_OUTPUT.put_line(chr(9)||'Inside procedure in_out_inout, aov_out = '||aov_out);
            SYS.DBMS_OUTPUT.put_line(chr(9)||'Inside procedure in_out_inout, aiov_inout = '||aiov_inout);

            -- you can ONLY WRITE a value to an OUT parameter. YOU CAN'T READ IT
            aov_out := 'OUT';

            -- you can ONLY READ an IN paramenter
            aiov_inout := aiv_in;

            -- you can read and write an IN OUT parameter
            aiov_inout := aiov_inout||'OUT';

            SYS.DBMS_OUTPUT.put_line(chr(9)||'After assignments...');
            SYS.DBMS_OUTPUT.put_line(chr(9)||'Inside procedure in_out_inout, aiv_in = '||aiv_in);
            SYS.DBMS_OUTPUT.put_line(chr(9)||'Inside procedure in_out_inout, aov_out = '||aov_out);
            SYS.DBMS_OUTPUT.put_line(chr(9)||'Inside procedure in_out_inout, aiov_inout = '||aiov_inout);

        end in_out_inout;

end PARAMETER;
/