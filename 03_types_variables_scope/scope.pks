create or replace package SCOPE as 
    gv_scope varchar2(80) := 'I am a global (or package spec) variable';

    FUNCTION my_scope_is_global return varchar2;

    PROCEDURE my_scope_is_global;

    end SCOPE;
/