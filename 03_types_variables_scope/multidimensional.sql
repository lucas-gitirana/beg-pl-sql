<<<<<<< HEAD
declare
    TYPE name_table is table of WORKERS.name%TYPE
    index by binary_integer;

    TYPE name_record is record(
        dim2 name_table
    );

    TYPE dim1 is table of name_record 
    index by binary_integer;

    t_dim1 dim1;

begin
    t_dim1(1).dim2(1) := 'DOE, JOHN';
    t_dim1(1).dim2(2) := 'DOE, JANE';

    t_dim1(2).dim2(1) := 'DOUGH, JAYNE';
    t_dim1(2).dim2(2) := 'DOUGH, JON';

    SYS.DBMS_OUTPUT.put_line(t_dim1(1).dim2(1));
    SYS.DBMS_OUTPUT.put_line(t_dim1(1).dim2(2));
    SYS.DBMS_OUTPUT.put_line(t_dim1(2).dim2(1));
    SYS.DBMS_OUTPUT.put_line(t_dim1(2).dim2(2));
end;
=======
declare
    TYPE name_table is table of WORKERS.name%TYPE
    index by binary_integer;

    TYPE name_record is record(
        dim2 name_table
    );

    TYPE dim1 is table of name_record 
    index by binary_integer;

    t_dim1 dim1;

begin
    t_dim1(1).dim2(1) := 'DOE, JOHN';
    t_dim1(1).dim2(2) := 'DOE, JANE';

    t_dim1(2).dim2(1) := 'DOUGH, JAYNE';
    t_dim1(2).dim2(2) := 'DOUGH, JON';

    SYS.DBMS_OUTPUT.put_line(t_dim1(1).dim2(1));
    SYS.DBMS_OUTPUT.put_line(t_dim1(1).dim2(2));
    SYS.DBMS_OUTPUT.put_line(t_dim1(2).dim2(1));
    SYS.DBMS_OUTPUT.put_line(t_dim1(2).dim2(2));
end;
>>>>>>> ddee3f76b3597226b427908a40eade43cbc9e549
/